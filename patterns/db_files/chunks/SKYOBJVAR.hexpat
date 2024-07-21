#pragma once

#include "lgtypes.hexpat"

struct SkyObjVar {
    bool enable_new_sky;
    padding[3];
    bool enable_fog;
    padding[3];
    float atmosphere_radius;
    float earth_radius;
    s32 num_latitude_points;
    s32 num_longitude_points;
    float horizon_dip_angle;
    Vec3<float> pole_color;
    Vec3<float> degree_45_color;
    Vec3<float> degree_70_color;
    Vec3<float> horizon_color;
    Vec3<float> horizon_dip_color;
    Vec3<float> glow_color;
    float glow_latitude;
    float glow_longitude;
    float glow_angle;
    float glow_scale;
    ColorMethod glow_method;
    float clip_latitude;
};