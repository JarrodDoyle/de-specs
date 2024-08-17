#pragma once

#include "Common.hexpat"

enum SunlightMode : s32 {
    SingleUnshadowed = 0x0,
    QuadObjcastShadows = 0x1,
    QuadUnshadowed = 0x2,
    SingleObjcastShadows = 0x3,
};

struct RendParams {
    char palette_res[16];
    Vec3<float> ambient_light;
    s32 sunlight;
    SunlightMode sunlight_mode;
    Vec3<float> sunlight_direction;
    float sunlight_hue;
    float sunlight_saturation;
    float sunlight_brightness;
    padding[24];
    float view_distance;
    padding[12];
    Vec3<float> ambient_light_zones[8];
    float global_ai_vis_bias;
    float ambient_zone_ai_vis_biases[8];
};
