#pragma once

struct TexturePatch {
    s32 key;
    s32 value;
};

struct TexturePatchDatabase {
    s32 count;
    TexturePatch patches[count];
};