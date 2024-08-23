#pragma once

#include "Common.hexpat"

struct ObjectProperty {
    s32 obj_id;
    u32 data_size;
    u8 data[data_size];
};

struct PropertyMap {
    u32 max = parent.parent.data_end;
    ObjectProperty props[while($ < max)];
};
