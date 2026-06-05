#pragma once

#include "MGLContext.h"
#include "MGLRenderer.h"

typedef struct {
    void* (*createGLMContext)(GLenum format, GLenum type, GLenum depth_format, GLenum depth_type, GLenum stencil_format, GLenum stencil_type);
    void* (*MGLgetCurrentContext)(void);
    void (*MGLsetCurrentContext)(void* ctx);
    void (*MGLswapBuffers)(void* ctx);
} mgl_library;

typedef struct {
    void *context;
} mgl_render_window_t;

void set_mgl_bridge_tbl();