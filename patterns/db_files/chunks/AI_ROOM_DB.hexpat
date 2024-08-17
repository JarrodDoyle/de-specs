#pragma once

#include "Common.hexpat"

namespace AiRoomDb {
    struct Cell {
        s32 size;
        u32 cell_ids[size];
    };

    struct PathEdge {
        u32 cell;
        u32 vertex_a;
        u32 vertex_b;
    };

    struct Path {
        s32 path_version;
        Vec3<float> final_destination; // unsure about this type
        s32 current_edge;
        bool active;
        padding[3];
        s32 size;
        PathEdge edges[size];
    };

    struct PortalPath {
        u64 cost;
        bool has_path;
        padding[3];
        if (has_path) {
            Path path;
        }
    };

    struct ChunkData {
        bool database_empty;
        padding[3];
        s32 valid_cell_count;
        s32 cell_count;
        Cell cells[cell_count];
        // Seems like ROOM_PATHS isn't defined :)
        if (0) {
            Table<Table<Table<PortalPath>>> portal_ai_paths;
            s32 portal_hint_count;
            s32 portal_hints[portal_hint_count];
        }  
    };
}