#pragma once

#include "Common.hexpat"

// TODO: All these types should be enums lol

struct Object {
    char name[8];
    u8 type;
    s32 parameter;
    float min_range;
    float max_range;
    Transform transform;
    s16 child; // ID, -1 if no child
    s16 next; // ID, -1 if no next
    u16 vhot_start;
    u16 vhot_count;
    u16 point_start;
    u16 point_count;
    u16 light_start;
    u16 light_count;
    u16 norm_start;
    u16 norm_count;
    u16 node_start;
    u16 node_count;
};

struct Material {
    char name[16];
    u8 type;
    u8 slot;
    u32 handle; // Or RGBA depending on type
    float uv; // Or inverse palette lookup?
};

struct AuxMaterialInfo {
    float transparency;
    float self_illumination;
    if (parent.aux_material_size == 16) {
        Vec2<float> max_texel_size;
    }
};

struct VHot {
    u32 id;
    Vec3<float> location;
};

struct Light {
    u16 material;
    u16 vertex;
    u32 normal; // This is the actual normal compacted down
};

struct Polygon {
    u16 index;
    u16 data; // Either color or material index based on type
    u8 type;
    u8 vertex_count;
    u16 normal;
    float d;
    u16 vertex_indices[vertex_count];
    u16 light_indices[vertex_count];
    if (type == 0x1B) {
        u16 uv_indices[vertex_count];
    }
    if (parent.version == 4) {
        u8 material;
    }
};

struct Model {
    char signature[4]; // Always "LGMD"
    s32 version;
    char name[8];
    float radius;
    float max_polygon_radius;
    Vec3<float> max_bounds;
    Vec3<float> min_bounds;
    Vec3<float> center;

    // Counts
    u16 polygon_count;
    u16 vertex_count;
    u16 parameter_count;
    u8 material_count;
    u8 vcall_count;
    u8 vhot_count;
    u8 object_count;

    // Offsets
    u32 object_offset;
    u32 material_offset;
    u32 uv_offset;
    u32 vhot_offset;
    u32 vertex_offset;
    u32 light_offset;
    u32 normal_offset;
    u32 polygon_offset;
    u32 node_offset;

    u32 model_size;

    if (version == 4) {
        u32 aux_material_flags;
        u32 aux_material_offset;
        u32 aux_material_size;
    }

    Object objects[object_count] @ object_offset;
    Material materials[material_count] @ material_offset;
    u32 uv_count = (vhot_offset - uv_offset) / 8;
    Vec2<float> uvs[uv_count] @ uv_offset;
    VHot vhots[vhot_count] @ vhot_offset;
    Vec3<float> vertices[vertex_count] @ vertex_offset;
    Light lights[polygon_count] @ light_offset;
    u32 normal_count = (polygon_offset - normal_offset) / 12;
    Vec3<float> normals[normal_count] @ normal_offset;
    Polygon polygons[polygon_count] @ polygon_offset;
    // TODO: BSP nodes
    if (version == 4) {
        AuxMaterialInfo aux_material_infos[material_count] @ aux_material_offset;
    }
};

Model model @ 0;