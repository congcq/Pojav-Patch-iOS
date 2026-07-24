logLevel = LOG_INFO;
let detachAfterFirstBr = false;

// brk 0x69: to work without introducing breaking change
legacyCommands[0x69] = function(brkResponse) {
    // char* BreakGetJITMapping(size_t bytes) { JIT26PrepareRegion(NULL, bytes); }
    x1 = x0;
    x0 = 0;
    JIT26PrepareRegion(brkResponse);
    if (detachAfterFirstBr) {
        JIT26Detach();
    }
};

// JIT26SetDetachAfterFirstBr(BOOL)
commands[3] = function(brkResponse) {
    detachAfterFirstBr = x0 != 0;
    log(`JIT26SetDetachAfterFirstBr(${detachAfterFirstBr}) called`);
};

// JIT26PrepareRegionForPatching(void *addr, size_t len)
commands[4] = function(brkResponse) {
    let x0str = x0.toString(16);
    let x1str = x1.toString(16);
    let bytes = send_command(`m${x0str},${x1str}`);
    send_command(`M${x0str},${x1str}:${bytes}`);
};