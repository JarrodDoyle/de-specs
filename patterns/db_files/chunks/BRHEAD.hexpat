#pragma once

struct BrHead {
    char user[16];
    char creator[16];
    char fullname[64]; // I don't think this is actually ever used
    s32 ambient;
    s32 grid_pow2;
    s32 brush_pos;
    s32 color_state;
    s32 vbrush_info;
    bool use_grid;
    bool hots_state;
    padding[2];
    s32 edit_time; // Milliseconds
};