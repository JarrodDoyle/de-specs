#pragma once

#include "lgtypes.hexpat"

using ColorSettings;

struct CloudObjVar {
    bool enable_cloud_deck;
    padding[3];
    bool enable_fog;
    padding[3];
    bool is_alpha_texture;
    padding[3];
    char texture_path[256];
    float alpha;
    float height;
    float tile_size;
    s32 num_tiles_per_side;
    s32 num_sub_tiles;
    Vec3<float> wind_velocity;
    Vec3<float> overall_color;
    ColorSettings east;
    ColorSettings west;
    float east_west_rotation;
    s32 sub_tile_alpha_start;
    ColorSettings glow;
    float glow_latitude;
    float glow_longitude;
    float glow_angle;
    s32 glow_tiles;
};

struct ColorSettings {
    Vec3<float> color;
    ColorMethod color_method;
    float scale;
};