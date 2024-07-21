#pragma once

enum Precipitation : u32 {
    Snow = 0x0,
    Rain = 0x1,
};

struct WeatherVar {
    Precipitation precipitation;
    float frequency;
    float fall_speed;
    float visible_distance;
    float render_radius;
    float alpha;
    float brightness;
    float snow_jitter;
    float rain_length;
    float splash_requency;
    float splash_radius;
    float splash_height;
    float splash_duration;
    char texture[32];
    Vec3<float> wind;
};