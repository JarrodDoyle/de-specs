#pragma once

#include "Common.hexpat"

struct RGBA {
    Vec3<u8> rgb;
    padding[1];
    float a;
};

struct WaterBanks {
    RGBA banks[4];
};