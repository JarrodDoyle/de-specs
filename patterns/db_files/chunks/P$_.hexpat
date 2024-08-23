#pragma once

#include "Common.hexpat"

struct ObjectProperty {
    s32 obj_id;
    u32 data_size;
    u8 data[data_size];
};

struct PropertyMap {
    u32 max = get_end(toc, parent.header.name);
    ObjectProperty props[while($ < max)];
};
