#pragma once

struct MotionSurface {
    s16 texture_above;
    s16 texture_below;
    char texture_name_base[16];
    padding[12];
};

struct FlowTex {
    MotionSurface motion_surfaces[256];
};