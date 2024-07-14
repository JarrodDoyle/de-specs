#pragma once

using Vec3;
using NameNum;
using NameNumTag;

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

struct Vec3<T> {
    T x;
    T y;
    T z;
};

struct Vec4<T> {
    T x;
    T y;
    T z;
    T w;
};

struct NameNum {
    // This header section is actually a tag too, but for namings sake I'll leave it like this
    s32 max_names;
    s32 sys_name_len;
    char sys_name[sys_name_len];
    NameNumTag tags[max_names];
};

struct NameNumTag {
    s32 value;
    if (value != -1) {
        s32 name_len;
        if (name_len != -1) {
           char name[name_len];
        }
    }
};

enum ColorMethod : s32 {
    Sum = 0x0,
    Interpolate = 0x1,
};