#pragma once

struct AcuitySet {
    float lighting;
    float movement;
    float exposure;
};

struct AiAcuitySets {
    AcuitySet normal;
    AcuitySet peripheral;
    AcuitySet omni;
    AcuitySet light_only;
    AcuitySet movement_only;
    AcuitySet low_light;
};