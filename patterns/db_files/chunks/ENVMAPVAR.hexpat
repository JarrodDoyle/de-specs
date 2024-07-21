#pragma once

struct EnvMap {
    char path[64];
};

struct EnvMapVar {
    padding[4];
    EnvMap global;
    EnvMap regions[64];
};