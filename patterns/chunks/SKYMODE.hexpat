#pragma once

enum SkyRenderingMode : s32 {
    Textures = 0x0,
    Stars = 0x1,
};

struct SkyMode {
    SkyRenderingMode mode;
};