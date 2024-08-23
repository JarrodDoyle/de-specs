#pragma once

#include "db_files/chunks/L$_.hexpat"

struct LinkData {
    LinkId id;
    u8 data[parent.real_data_size];
};

struct LinkDataChunk {
    s32 data_size;
    // I have no idea why there are these exceptions
    match (parent.parent.name) {
        ("LD$arSrcDes"): s32 real_data_size = 108;
        ("LD$Receptro"): s32 real_data_size = 88;
        (_): s32 real_data_size = data_size;
    }
    u32 max = parent.parent.data_end;
    LinkData data[while($ < max)];
};
