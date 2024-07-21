#pragma once

bitfield FileTypeFlags {
    padding: 8;
    ObjPartConcrete: 1;
    ObjPartAbstract: 1;
    ObjPartBriefcase: 1;
    ObjPartTerrain: 1;
    ObjPartMission: 1;
    padding: 3;
    Mission: 1;
    Map: 1;
    GameSys: 1;
    padding: 13;
};

struct FileType {
    FileTypeFlags file_type;
};
