#pragma once

#include <std/bit.pat>
#include <std/math.pat>
#include <std/core.pat>
#include <std/io.pat>
#include "FileBase.hexpat"

using WrHeader;
using WrCell;
using WrCellHeader;
using WrPoly;
using WrRenderPoly;
using WrPlane;
using WrLightMapInfo;
using WrLightMap;
using WrLightMapLayer;
using WrLightMapDataPixel;
using WrBspTree;
using WrBspTreeNode;
using WrBspTreeCellPlane;
using WrLightTable;
using WrLightTableData;
using WrLightTableAnimLight;
using WrCsgCellTable;
using WrCsgCellBrFaceTable;
using WrCsgCellBspPlaneTable;
using WrCsgCellRefTable;
using WrCsgCellSurfaceRef;

struct WrExt {
    WrHeader header;
    WrCell cells[header.cell_count];
    WrBspTree bsp_tree;
    padding[header.cell_count]; // This is suspicious. Fog? SEE VFIGS MISSDEEDS!!
    WrLightTable lights;
    WrCsgCellTable csg_cell_table;
};

struct WrExtHeader {
    s32 size;
    s32 version;
    s32 flags; // Need to bitmask this
    u32 lightmap_format;
    s32 lightmap_scale;
};

struct WrHeader {
    WrExtHeader ext_header;    
    u32 data_size;
    u32 cell_count;

    u32 major = parent.parent.header.version.major;
    u32 minor = parent.parent.header.version.minor;
    u32 bytes_per_pixel = 0;
    if (major == 0 && minor == 23) {
        bytes_per_pixel = 1;
    } else if (major == 0 && minor == 24) {
        bytes_per_pixel = 2;
    } else if (major == 0 && minor == 30) {
        if (ext_header.lightmap_format == 0) {
            bytes_per_pixel = 2;
        } else {
            bytes_per_pixel = 4;
        }
    }
};

struct WrCell {
    WrCellHeader header;
    Vec3<float> p_vertices[header.vertex_count];
    WrPoly p_polys[header.poly_count];
    WrRenderPoly p_render_polys[header.render_poly_count];
    u32 index_count;
    u8 p_index_list[index_count];
    WrPlane p_plane_list[header.plane_count];
    u16 p_anim_lights[header.anim_light_count];
    WrLightMapInfo p_light_list[header.render_poly_count];
    WrLightMap lightmaps[header.render_poly_count];
    s32 light_index_count;
    u16 p_light_indices[light_index_count];
};

struct WrCellHeader {
    u8 vertex_count;
    u8 poly_count;
    u8 render_poly_count;
    u8 portal_poly_count;
    u8 plane_count;
    u8 medium;
    u8 flags;
    s32 portal_vertex_list;
    u16 num_v_list;
    u8 anim_light_count;
    u8 motion_index;
    Vec3<float> sphere_center;
    float sphere_radius;
};

struct WrPoly {
    u8 flags;
    u8 vertex_count;
    u8 plane_id;
    u8 clut_id;
    u16 destination;
    u8 motion_index;
    padding[1];
};

struct WrRenderPoly {
    Vec3<float> tex_u;
    Vec3<float> tex_v;
    float base_u;
    float base_v;
    u16 texture_id;
    u16 cached_surface;
    float texture_mag;
    Vec3<float> center;
};

struct WrPlane {
    Vec3<float> normal;
    float distance;
};

// TODO: Right now we're assuming a certain LM format because I don't know how to pass
// that info from the WrHeader :)
struct WrLightMapInfo {
    s16 base_u;
    s16 base_v;
    s16 padded_width;
    u8 height;
    u8 width;
    u32 data_ptr;
    u32 dynamic_light_ptr;
    u32 anim_light_bitmask;
};

struct WrLightMap {
    s32 i = std::core::array_index();

    // There seems to be an ImHex bug to work around here. Doing this sets every member of the struct
    // to the first value. Accessing it directly rather than using a local variable works.
    //WrLightMapInfo info = parent.p_light_list[i];
    u8 width = parent.p_light_list[i].width;
    u8 height = parent.p_light_list[i].height;

    u32 count = 1 + std::bit::popcount(parent.p_light_list[i].anim_light_bitmask);
    u32 bytes_per_pixel = parent.parent.header.bytes_per_pixel;
    WrLightMapLayer layers[count];
};

struct WrLightMapLayer {
    WrLightMapDataPixel data[parent.width * parent.height];
};

struct WrLightMapDataPixel {
    u8 bytes[parent.parent.bytes_per_pixel];
};

struct WrBspTree {
    u32 plane_list_count;
    Plane plane_list[plane_list_count];
    u32 bsp_tree_size;
    WrBspTreeNode bsp_tree[bsp_tree_size];
};

struct WrBspTreeNode {
    s24 parent_index;
    u8 flags;
    WrBspTreeCellPlane cellplane;
    u32 inside_index;
    u32 outside_index;
};

struct WrBspTreeCellPlane {
    s32 cell_id;
    s32 plane_id;
};

struct WrLightTable {
    s32 light_count;
    s32 dynamic_light_count;
    // Newdark doesn't pad out with non-used lights!!
    //WrLightTableData light_data[768]; // Looks like 2016 in newdark?
    //WrLightTableData light_this[32];
    WrLightTableData lights[light_count + dynamic_light_count];
    WrLightTableData scratchpad_lights[32];

    s32 anim_light_count;
    WrLightTableAnimLight anim_lights[anim_light_count];
};

struct WrLightTableData {
    Vec3<float> location;
    Vec3<float> direction;
    Vec3<float> colour; // only vec3 in wrrgb and wrext
    float inner;
    float outer;
    float radius;
};

struct WrLightTableAnimLight {
    u16 cell_index;
    u8 pos_in_palette;
    padding[1];
};

// TODO: My actual understanding of this is basically none :)
struct WrCsgCellTable {
    s32 cell_count;
    WrCsgCellBrFaceTable br_faces[cell_count];
    s32 num_brushes;
    s32 num_brush_faces[num_brushes];
    WrCsgCellBspPlaneTable bsp_planes[num_brushes];
    s32 ref_counts[num_brushes];
    WrCsgCellRefTable refs[num_brushes];
};

struct WrCsgCellBrFaceTable {
    s32 i = std::core::array_index();

    s32 face_ptr[parent.parent.cells[i].header.render_poly_count];
};

struct WrCsgCellBspPlaneTable {
    s32 i = std::core::array_index();

    DPlane planes[parent.num_brush_faces[i]];
};

struct WrCsgCellRefTable {
    s32 i = std::core::array_index();

    if (parent.ref_counts[i] > 0) {
        WrCsgCellSurfaceRef refs[parent.ref_counts[i]];
    }
};

struct WrCsgCellSurfaceRef {
    s32 cell;
    u8 surface;
    u8 brush_face;
    s16 vertex;
};