#pragma once

#include <std/io.pat>

namespace ScrModules {

    struct Name {
        char name[128];
    };

    struct ChunkData {
        Name names[while($ < scrmodules_toc.offset + scrmodules_toc.size)];
    };
}