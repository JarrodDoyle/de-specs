#pragma once

struct TextureListToken {
    char name[16];
};

struct TextureListData {
    char tokens[4];
    char name[15];
    char reserved;
};

struct TxList {
    s32 block_size;
    s32 count;
    s32 token_count;
    TextureListToken tokens[token_count];
    TextureListData data[count];
};