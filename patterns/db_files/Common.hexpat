#pragma once

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