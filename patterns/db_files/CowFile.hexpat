#pragma once

#include <std/string.pat>
#include <std/io.pat>

#include "db_files/FileBase.pat"
#include "db_files/Common.hexpat"
#include "db_files/AllChunks.pat"

FileHeader file_header @ 0x0;
TableOfContents toc @ file_header.toc_offset;

TOCEntry brlist_toc = get_toc_entry(toc, "BRLIST");
TOCEntry scrmodules_toc = get_toc_entry(toc, "ScrModules");

Chunk<AiRoomDb::ChunkData> ai_room_db @ get_offset(toc, "AI_ROOM_DB");
Chunk<AiAcuitySets> ai_acuity_sets @ get_offset(toc, "AIACS");
Chunk<AiConverse> ai_conversations @ get_offset(toc, "AICONVERSE");
Chunk<AiCreatureSizes> ai_creature_sizes @ get_offset(toc, "AICRTSZ");
Chunk<AiGamesysPathOptions> ai_gamesys_path_options @ get_offset(toc, "AIGPTHVAR");
Chunk<AiHearStat> ai_hear_stat @ get_offset(toc, "AIHearStat");
Chunk<AiPathVar> ai_path_var @ get_offset(toc, "AIPATHVAR");
Chunk<AiSndTwk> ai_sound_tweaks @ get_offset(toc, "AISNDTWK");
Chunk<Ambient> ambient @ get_offset(toc, "AMBIENT");
Chunk<Bash> bash @ get_offset(toc, "BASH");
Chunk<BrHead> br_head @ get_offset(toc, "BRHEAD");
Chunk<BrList> br_list @ get_offset(toc, "BRLIST");
Chunk<BrushVersion> brush_version @ get_offset(toc, "BRVER");
Chunk<CellMotion> cell_motion @ get_offset(toc, "CELL_MOTION");
Chunk<CelObjVar> celestial_object_var_1 @ get_offset(toc, "CELOBJVAR1");
Chunk<CelObjVar> celestial_object_var_2 @ get_offset(toc, "CELOBJVAR2");
Chunk<CelObjVar> celestial_object_var_3 @ get_offset(toc, "CELOBJVAR3");
Chunk<CloudObjVar> cloud_object_var @ get_offset(toc, "CLOUDOBJVAR");
Chunk<DarkCombat> dark_combat @ get_offset(toc, "DARKCOMBAT");
Chunk<DarkMiss> dark_miss @ get_offset(toc, "DARKMISS");
Chunk<DistantArtVar> distant_art_var @ get_offset(toc, "DISTOBJVAR");
Chunk<DarkSettings> dark_settings @ get_offset(toc, "DRKSET");
Chunk<EnvMapVar> env_map_var @ get_offset(toc, "ENVMAPVAR");
Chunk<Family> family @ get_offset(toc, "FAMILY");
Chunk<FileType> file_type @ get_offset(toc, "FILE_TYPE");
Chunk<FlowTex> flow_tex @ get_offset(toc, "FLOW_TEX");
Chunk<FogZoneVar> fog_zone_var @ get_offset(toc, "FOGZONEVAR");
Chunk<AccousticsProperty> gamesys_eax @ get_offset(toc, "GameSysEAX");
Chunk<NameNum::Table> hot_regions @ get_offset(toc, "HotRegions");
Chunk<MapISrc> map_i_src @ get_offset(toc, "MAPISRC");
Chunk<AccousticsProperty> mission_eax @ get_offset(toc, "MissionEAX");
Chunk<NameNum::Table> multibrush @ get_offset(toc, "MultiBrush");
Chunk<RendParams> rend_params @ get_offset(toc, "RENDPARAMS");
Chunk<RoomDb> room_db @ get_offset(toc, "ROOM_DB");
Chunk<RoomEax> room_eax @ get_offset(toc, "ROOM_EAX");
Chunk<ScrModules::ChunkData> script_modules @ get_offset(toc, "ScrModules");
Chunk<SkyMode> sky_mode @ get_offset(toc, "SKYMODE");
Chunk<SkyObjVar> sky_object_var @ get_offset(toc, "SKYOBJVAR");
Chunk<MissionSongParams> mision_song_params @ get_offset(toc, "SONGPARAMS");
Chunk<StarObjVar> star_object_var @ get_offset(toc, "STAROBJVAR");
Chunk<TiList> ti_list @ get_offset(toc, "TILIST");
Chunk<TxList> texture_list @ get_offset(toc, "TXLIST");
Chunk<TexturePatchDatabase> texture_patch_database @ get_offset(toc, "TXTPAT_DB");
Chunk<WaterBanks> water_banks @ get_offset(toc, "WATERBANKS");
Chunk<WeatherVar> weather_var @ get_offset(toc, "WEATHERVAR");
Chunk<WrExt> world_rep @ get_offset(toc, "WREXT");