#pragma once

#include "Common.hexpat"

using Br;
using Grid;
using TexInfo;
using BrMedia;
using BrType;

struct BrList {
    u32 max = get_end(toc, parent.header.name);
    Br brushes[while($ < max)];
};

// There's one core struct here, but fields are used differently for non-terrain brushes
// Lights:
// - primal_id -> Object Handle (ID + 1?)
// - size -> (Brightness, Hue, Saturation)
// - num_faces -> Type (omni/spotlight) (Spotlight doesn't actually seem to be used by the engine)
//
// Areas:
// - texture_id -> Bitfield (Active = 1, MeOnly = 2) (these can both be true)
//
// Objects:
// - primal_id -> Object ID
// - num_faces -> This is always 255/-1, not sure what it means
//
// Flow:
// - texture_id -> Flow Group ID
//
// Rooms:
// - primal_id -> Concrete room ID (shared between all rooms using the same archetype)
// - texture_id -> Secondary room ID (unique to every room brush)
struct Br {
    s16 brush_id;
    s16 timestamp;
    BrType primal_id;
    s16 texture_id;
    BrMedia media;
    s8 flags; // potential bitfield
    Vec3<float> position; // Brush center
    Vec3<float> size; // Brush extents (dimensions)
    Vec3<u16> angle;
    s16 current_face_index;
    Grid grid_settings;
    u8 num_faces;
    // The next 4 values are selection/multibrush related
    s8 edge;
    s8 point;
    s8 use_flag;
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
