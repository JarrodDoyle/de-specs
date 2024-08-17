#pragma once

#include "Common.hexpat"

struct CellMotionPortal {
    Vec3<float> center;
    u16 angle;
    bool in_motion;
    padding[3];
    u8 major_axis;
    padding[2];
};

struct CellMotionMedium {
    Vec3<float> center;
    u16 angle_change;
};

struct CellMotion {
    CellMotionPortal portal_motions[256];
    CellMotionMedium medium_motions[256];
    s32 unknown;
};

