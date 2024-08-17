#pragma once

#include "Common.hexpat"

struct CelObjVar {
    bool enable_object;
    padding[3];
    bool enable_fog;
    padding[3];
    bool is_alpha_texture;
    padding[3];
    char texture[256];
    float alpha;
    float celestial_offset;
    float angular_size;
    float latitude;
    float longitude;
    float rotation;
    Vec3<float> color;
};