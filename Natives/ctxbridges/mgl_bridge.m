#import <Foundation/Foundation.h>
#import "SurfaceViewController.h"

#include <dlfcn.h>
#include "bridge_tbl.h"
#include "environ.h"
#include "mgl_bridge.h"
#include "utils.h"

static mgl_library handle;

void dlsym_MGL() {
    void* dl_handle = dlopen("@rpath/libmgl_core.dylib", RTLD_GLOBAL);
    assert(dl_handle);
    handle.createGLMContext = dlsym(dl_handle, "createGLMContext");
    handle.MGLgetCurrentContext = dlsym(dl_handle, "MGLgetCurrentContext");
    handle.MGLsetCurrentContext = dlsym(dl_handle, "MGLsetCurrentContext");
    handle.MGLswapBuffers = dlsym(dl_handle, "MGLswapBuffers");
}

static bool mgl_init() {
    dlsym_MGL();
    return true;
}

static mgl_render_window_t* mgl_init_context(mgl_render_window_t* share) {
    mgl_render_window_t* bundle = calloc(1, sizeof(mgl_render_window_t));

    Class MGLRenderer_class = NSClassFromString(@"MGLRenderer");
    static MGLRenderer *renderer;
    if (!renderer) {
        renderer = [[MGLRenderer_class alloc] init];
    }

    bundle->context = handle.createGLMContext(
        GL_BGRA,
        GL_UNSIGNED_INT_8_8_8_8_REV,
        GL_DEPTH_COMPONENT,
        GL_FLOAT,
        0,
        0
    );

    if (!bundle->context) {
        free(bundle);
        return NULL;
    }

    handle.MGLsetCurrentContext(bundle->context);
    [renderer createMGLRendererAndBindToContext:bundle->context view:SurfaceViewController.surface];

    return bundle;
}

static void mgl_make_current(mgl_render_window_t* bundle) {
    if (!bundle) {
        currentBundle = NULL;
        handle.MGLsetCurrentContext(NULL);
        return;
    }

    currentBundle = (basic_render_window_t*)bundle;
    handle.MGLsetCurrentContext(bundle->context);
    Class MGLRenderer_class = NSClassFromString(@"MGLRenderer");
    static MGLRenderer *renderer;

    if (!renderer) {
        renderer = [[MGLRenderer_class alloc] init];
    }

    [renderer createMGLRendererAndBindToContext:bundle->context view:SurfaceViewController.surface];
}

void mgl_swap_buffers() {
    if (!currentBundle) return;

    handle.MGLswapBuffers(currentBundle->mgl.context);
}

static void mgl_terminate() {
    free(currentBundle);
    currentBundle = NULL;
}

void set_mgl_bridge_tbl() {
    br_init = mgl_init;
    br_init_context = (br_init_context_t) mgl_init_context;
    br_make_current = (br_make_current_t) mgl_make_current;
    br_swap_buffers = mgl_swap_buffers;
    br_swap_interval = NULL;
    br_terminate = mgl_terminate;
}
