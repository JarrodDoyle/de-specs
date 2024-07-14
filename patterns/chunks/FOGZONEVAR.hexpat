#pragma once

#include "lgtypes.hexpat"

struct FogZone {
    padding[1];
    Vec3<u8> color;
    float dist;
};

struct FogZoneVar {
    FogZone global;
    FogZone regional[8];
};