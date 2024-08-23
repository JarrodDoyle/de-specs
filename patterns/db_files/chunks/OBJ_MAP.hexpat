#pragma once

struct ObjMapElement {
    s32 value;
    s32 name_len;
    if (name_len != -1) {
        char name[name_len];
    }
};

struct ObjMap {
    ObjMapElement objects[while($ < objmap_toc.offset + objmap_toc.size)];
};