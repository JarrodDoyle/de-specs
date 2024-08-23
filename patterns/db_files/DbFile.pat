#pragma once
#pragma pattern_limit 262144

#include <std/string.pat>
#include <std/io.pat>

#include "db_files/AllChunks.pat"

struct Version {
    u32 major;
    u32 minor;
};

struct ChunkHeader {
    char name[12];
    Version version;
    padding[4];
};

struct Chunk<T> {
    ChunkHeader header;
    T data;
};

struct FileHeader {
    u32 toc_offset;
    Version version;
    padding[256];
    u32 deadbeef;
};

struct TOCEntry {
    char name[while($[$] != 0x00)];
    $ = $ + 12 - std::string::length(name);
    u32 offset;
    u32 size;
    u32 data_end = offset + size + 24;

    match (name) {
        ("AI_ROOM_DB"): Chunk<AiRoomDb::ChunkData> ai_room_db @ offset;
        ("AIACS"): Chunk<AiAcuitySets> ai_acuity_sets @ offset;
        ("AICONVERSE"): Chunk<AiConverse> ai_conversations @ offset;
        ("AICRTSZ"): Chunk<AiCreatureSizes> ai_creature_sizes @ offset;
        ("AIGPTHVAR"): Chunk<AiGamesysPathOptions> ai_gamesys_path_options @ offset;
        ("AIHearStat"): Chunk<AiHearStat> ai_hear_stat @ offset;
        ("AIPATHVAR"): Chunk<AiPathVar> ai_path_var @ offset;
        ("AISNDTWK"): Chunk<AiSndTwk> ai_sound_tweaks @ offset;
        ("AMBIENT"): Chunk<Ambient> ambient @ offset;
        ("BASH"): Chunk<Bash> bash @ offset;
        ("BRHEAD"): Chunk<BrHead> br_head @ offset;
        ("BRLIST"): Chunk<BrList> br_list @ offset;
        ("BRVER"): Chunk<BrushVersion> brush_version @ offset;
        ("CELL_MOTION"): Chunk<CellMotion> cell_motion @ offset;
        ("CELOBJVAR1"): Chunk<CelObjVar> celestial_object_var_1 @ offset;
        ("CELOBJVAR2"): Chunk<CelObjVar> celestial_object_var_2 @ offset;
        ("CELOBJVAR3"): Chunk<CelObjVar> celestial_object_var_3 @ offset;
        ("CLOUDOBJVAR"): Chunk<CloudObjVar> cloud_object_var @ offset;
        ("DARKCOMBAT"): Chunk<DarkCombat> dark_combat @ offset;
        ("DARKMISS"): Chunk<DarkMiss> dark_miss @ offset;
        ("DISTOBJVAR"): Chunk<DistantArtVar> distant_art_var @ offset;
        ("DRKSET"): Chunk<DarkSettings> dark_settings @ offset;
        ("ENVMAPVAR"): Chunk<EnvMapVar> env_map_var @ offset;
        ("FAMILY"): Chunk<Family> family @ offset;
        ("FILE_TYPE"): Chunk<FileType> file_type @ offset;
        ("FLOW_TEX"): Chunk<FlowTex> flow_tex @ offset;
        ("FOGZONEVAR"): Chunk<FogZoneVar> fog_zone_var @ offset;
        ("GameSysEAX"): Chunk<AccousticsProperty> gamesys_eax @ offset;
        ("HotRegions"): Chunk<HotRegions> hot_regions @ offset;
        ("MAPISRC"): Chunk<MapISrc> map_i_src @ offset;
        ("MissionEAX"): Chunk<AccousticsProperty> mission_eax @ offset;
        ("MultiBrush"): Chunk<MultiBrush> multibrush @ offset;
        ("OBJ_MAP"): Chunk<ObjMap> obj_map @ offset;
        ("RENDPARAMS"): Chunk<RendParams> rend_params @ offset;
        ("ROOM_DB"): Chunk<RoomDb> room_db @ offset;
        ("ROOM_EAX"): Chunk<RoomEax> room_eax @ offset;
        ("ScrModules"): Chunk<ScrModules::ChunkData> script_modules @ offset;
        ("SKYMODE"): Chunk<SkyMode> sky_mode @ offset;
        ("SKYOBJVAR"): Chunk<SkyObjVar> sky_object_var @ offset;
        ("SONGPARAMS"): Chunk<MissionSongParams> mision_song_params @ offset;
        ("STAROBJVAR"): Chunk<StarObjVar> star_object_var @ offset;
        ("TILIST"): Chunk<TiList> ti_list @ offset;
        ("TXLIST"): Chunk<TxList> texture_list @ offset;
        ("TXTPAT_DB"): Chunk<TexturePatchDatabase> texture_patch_database @ offset;
        ("WATERBANKS"): Chunk<WaterBanks> water_banks @ offset;
        ("WEATHERVAR"): Chunk<WeatherVar> weather_var @ offset;
        ("WREXT"): Chunk<WrExt> world_rep @ offset;
        (_): {
            if (std::string::starts_with(name, "P$")) {
                Chunk<PropertyMap> property_chunk @ offset [[name(name)]];
            }
            // if (std::string::starts_with(name, "LD$")) {
            //     std::print("LD: {}", name);
            // }
            if (std::string::starts_with(name, "L$")) {
                Chunk<LinkMap> link_chunk @ offset [[name(name)]];
                // std::print("L: {}", name);
            }
        }
    }
};

struct TableOfContents {
    u32 item_count;
    TOCEntry items[item_count];
};

FileHeader file_header @ 0x0;
TableOfContents toc @ file_header.toc_offset;