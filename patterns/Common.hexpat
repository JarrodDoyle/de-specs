#pragma once

struct Table<T> {
    s32 size;
    T data;
};

struct Vec2<T> {
    T x;
    T y;
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

struct Mat3<T> {
    Vec3<T> v[3];
};

struct Transform {
    Mat3<float> mat;
    Vec3<float> vec;
};

struct Sphere {
    Vec3<float> center;
    float radius;
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