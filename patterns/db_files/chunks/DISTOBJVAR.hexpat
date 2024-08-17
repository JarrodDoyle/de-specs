#pragma once

#include "Common.hexpat"

struct DistantArtVar {
    bool enable_distant_art;
    padding[3];
    bool enable_fog;
    padding[3];
    char texture_1[256];
    char texture_2[256];
    Vec3<float> color;
    float distance;
    float top_latitude;
    float bottom_latitude;
    s32 num_panels;
    s32 num_texture_panels;
    float alpha;
};