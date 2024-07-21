#pragma once

struct Version {
    u32 major;
    u32 minor;
};

struct FileHeader {
    u32 toc_offset;
    Version version;
    padding[256];
    u32 deadbeef;
};

struct TOCEntry {
    char name[12];
    u32 offset;
    u32 size;
};

struct TableOfContents {
    u32 item_count;
    TOCEntry items[item_count];
};

struct ChunkHeader {
    char name[12];
    Version version;
    padding[4];
};

struct Chunk<T> {
    ChunkHeader header;
    T data;
};

struct Plane {
    float x;
    float y;
    float z;
    float d;
};

struct DPlane {
    double x;
    double y;
    double z;
    double d;
};

namespace NameNum {
    struct Tag {
        s32 value;
        if (value != -1) {
            s32 name_len;
            if (name_len != -1) {
            char name[name_len];
            }
        }
    };

    struct Table {
        // This header section is actually a tag too, but for namings sake I'll leave it like this
        s32 max_names;
        s32 sys_name_len;
        char sys_name[sys_name_len];
        Tag tags[max_names];
    };
}

enum ColorMethod : s32 {
    Sum = 0x0,
    Interpolate = 0x1,
};