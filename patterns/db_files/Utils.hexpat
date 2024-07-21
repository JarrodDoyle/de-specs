#pragma once

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