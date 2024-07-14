#pragma once

enum TiAlignmentMode : s32 {
    AlignNorm = 0x0,
    AlignBr = 0x1,
    AlignExt = 0x2,
};

struct TiScale {
    s16 fractional; // decimal = fractional / 2^16
    s16 integer;
};

struct TiItem {
    TiAlignmentMode p1;
    TiScale scale_x;
    TiScale scale_y;
};

struct TiList {
    s32 count;
    TiItem items[count];
};