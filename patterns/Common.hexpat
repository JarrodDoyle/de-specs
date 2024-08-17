#pragma once

struct Table<T> {
    s32 size;
    T data;
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