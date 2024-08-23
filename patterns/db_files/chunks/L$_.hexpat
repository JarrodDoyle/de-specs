#pragma once

#include "Common.hexpat"

bitfield LinkId {
    id: 16;
    concrete: 4;
    relation: 12; 
};

struct Link {
    LinkId id;
    s32 source;
    s32 destination;
    u16 relation;
    // if (source > 0 || destination > 0) {
    //     std::print("Link: {}, Id: {}, Src: {}, Dest: {}, Flavor: {}", parent.parent.parent.name, id, source, destination, relation);
    // }
};

struct LinkMap {
    u32 max = parent.parent.data_end;
    Link links[while($ < max)];
};
