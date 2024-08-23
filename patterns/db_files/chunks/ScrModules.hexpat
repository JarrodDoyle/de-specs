#pragma once

#include <std/io.pat>

namespace ScrModules {

    struct Name {
        char name[128];
    };

    struct ChunkData {
        u32 max = get_end(toc, parent.header.name);
        Name names[while($ < max)];
    };
}