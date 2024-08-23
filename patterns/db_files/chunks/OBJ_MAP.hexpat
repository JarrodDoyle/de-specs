#pragma once

struct ObjMapElement {
    s32 value;
    s32 name_len;
    if (name_len != -1) {
        char name[name_len];
    }
};

struct ObjMap {
    u32 max = parent.parent.data_end;
    ObjMapElement objects[while($ < max)];
};