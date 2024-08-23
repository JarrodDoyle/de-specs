#pragma once

#include <std/io.pat>

struct RelationString {
    char name[];
    $ = $ + 32 - std::string::length(name);
};

struct Relations {
    u32 max = parent.parent.data_end;
    RelationString relations[while($ < max)];
};