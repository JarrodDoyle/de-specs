#pragma once

struct ObjVec {
    s32 min_id;
    s32 max_id;
    s32 byte_count = (max_id - min_id) / 8;
    u8 bitmap[byte_count] [[comment("Each bit indicates whether that ID is being used.")]];
};