#pragma once

#include <std/io.pat>

namespace ScrModules {

    struct Name {
        char name[128];
    };

    struct ChunkData {
        u32 max = parent.parent.data_end;
        Name names[while($ < max)];
    };
}