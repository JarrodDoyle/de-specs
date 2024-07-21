#pragma once

struct FamilyName {
    char name[parent.name_len];
};

struct Family {
    u32 name_len;
    u32 count;
    FamilyName names[count];
};
