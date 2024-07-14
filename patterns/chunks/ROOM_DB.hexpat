#pragma once

#include "lgtypes.hexpat"

struct RoomPortal {
    s32 id;
    s32 index;
    Plane plane;
    s32 edge_plane_count;
    Plane edge_planes[edge_plane_count];
    s32 far_room_id;
    s32 near_room_id;
    Vec3<float> center;
    s32 far_portal_id;
};

struct WatchListItem {
    s32 count;
    s32 watch_values[count];
};

struct PortalDistancesCol {
    float distances[parent.portal_count];
};

struct Room {
    s32 object_id;
    s16 room_id;
    Vec3<float> center;
    Plane planes[6];
    s32 portal_count;
    RoomPortal portals[portal_count];
    PortalDistancesCol portal_distances[portal_count];
    s32 watch_list_size;
    WatchListItem watch_list[watch_list_size];
};

struct RoomDb {
    bool has_rooms;
    padding[3];
    if (has_rooms) {
        s32 count;
        Room rooms[count];
    }
};