#pragma once

using TOCEntry;

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

struct TableOfContents {
    u32 item_count;
    TOCEntry items[item_count];
};

struct TOCEntry {
    char name[12];
    u32 offset;
    u32 size;
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

fn get_toc_entry(TableOfContents toc, str entry_name) {
    for (u32 i = 0, i < toc.item_count, i = i + 1) {
        if (std::string::starts_with(toc.items[i].name, entry_name)) {
           return toc.items[i];
        }
    }
};

fn get_offset(TableOfContents toc, str entry_name) {
    TOCEntry entry = get_toc_entry(toc, entry_name);
    return entry.offset;
};