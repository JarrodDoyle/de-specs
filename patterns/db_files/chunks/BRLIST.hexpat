#pragma once

#include "Common.hexpat"

using Br;
using Grid;
using TexInfo;
using BrMedia;
using BrType;

struct BrList {
    Br brushes[while($ < brlist_toc.offset + brlist_toc.size)];
};

// Potentially rename fields depending on the media type?
struct Br {
    s16 br_id;
    s16 timestamp;
    BrType primal_id;
    s16 tx_id;
    BrMedia media;
    s8 flags; // potential bitfield
    Vec3<float> pos; // Brush center
    Vec3<float> sz; // Brush extents (dimensions)
    Vec3<u16> ang;
    s16 cur_face;
    Grid grid;
    u8 num_faces;
    s8 edge;
    s8 point;
    s8 use_flg;
    s8 group_id;
    padding[4];
    // We have to do a double cast here because otherwise the s8 for non-terrain brushes is just wrong??
    if (s8(u8(media)) >= 0) {
        TexInfo txs[num_faces];
    }
};

struct Grid {
    float line_spacing;
    Vec3<float> phase_shift;
    Vec3<u16> orientation;
    bool grid_enabled;
};

struct TexInfo {
    s16 id;
    u16 rot;
    s16 scale;
    u16 x;
    u16 y;
};

enum BrMedia : s8 {
    Room = 0xFB,
    Flow = 0xFC,
    Object = 0xFD,
    Area = 0xFE,
    Light = 0xFF,
    FillSolid = 0x00,
    FillAir = 0x01,
    FillWater = 0x02,
    Flood = 0x03,
    Evaporate = 0x04,
    SolidToWater = 0x05,
    SolidToAir = 0x06,
    AirToSolid = 0x07,
    WaterToSolid = 0x08,
    Blockable = 0x09,
};

enum BrPrimType : u8 {
    Special = 0x0,
    Cylinder = 0x1,
    Pyramid = 0x2,
    CornerPyr = 0x3,
};

enum BrAligned : u8 {
    Vertex = 0x0,
    Side = 0x1,
};

// If we're a "special" brush side_info says what type we are, otherwise it's
// side count - 3
bitfield BrType {
    side_info: 8; 
    side_aligned: 1;
    BrPrimType prim_type: 23;
};
