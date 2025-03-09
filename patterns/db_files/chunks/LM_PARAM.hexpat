#pragma once

#include "Common.hexpat"

struct LmParams {
    u32 unknown1; // I think this is struct size (seemingly always 36)
    float attenuation;
    float saturation;
    u32 shadow_type; // TODO: Enum
    u32 softness; // TODO: Enum
    float center_weight;
    u32 depth_mode; // TODO: Enum (16, 32, 32-2x)
    bool lightmapped_water;
    padding[3];
    s32 lightmap_scale;
    u32 animlight_cutoff;
};