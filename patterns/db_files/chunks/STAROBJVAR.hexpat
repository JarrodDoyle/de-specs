#pragma once

struct StarObjVar {
    bool enable_stars;
    padding[3];
    bool enable_fog;
    padding[3];
    float density;
    float star_offset;
    float max_intensity;
    float global_transparency;
};