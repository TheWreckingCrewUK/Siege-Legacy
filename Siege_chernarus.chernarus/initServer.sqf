//This file defines all of the units used. To change to a new map you mostly only have to change this file.

/*
Known other changes occur in:
server\sys_cache\cacheLoadout.sqf
server\sys_vehicles\VBIED.sqf
*/

//Enable or Disable Debug
twc_serverDebug = false;

twc_surrenderVote = false;

/*
* Denotes the style of building to be used, for dynamic compositions.
* For example: the IED factory.
*
* Known Types:
* "Med" - Mediterranean
* "MidEast" - Middle East
* "IRA" - Irish
*/
TWC_Building_Style = "Med";

twc_difficulty = 0.2;
publicVariable "twc_difficulty";

sirenlist = [idfalarm];
publicvariable "sirenlist";

civilianType = ["Tak_Civ_Men_KTL1", "CUP_C_TK_Man_04_Jack", "Tak_Civ_Men_KTL2","CUP_C_TK_Man_07_Coat", "Tak_Civ_Men_KTL3", "Tak_Civ_Men_KTL4", "Tak_Civ_Men_KTs1", "Tak_Civ_Men_KTs2", "Tak_Civ_Men_KTs3", "Tak_Civ_Men_KTs4",  "CUP_C_TK_Man_05_Jack", "Tak_Civ_Men_J1", "Tak_Civ_Men_J2", "Tak_Civ_Men_J3"];

publicvariable "civiliantype";
homeEnemy = ["twc_greek_rifleman"];

AA_VEHICLE_TYPE = "CUP_O_ZU23_TK_INS";
AATeams = 6;
AATeam = ["twc_greek_officer", "twc_greek_aa", "twc_greek_aa", "twc_greek_aa"];

//List of Spoof Objects
iedSpoofs = ["Land_Garbage_square3_F", "Land_Garbage_square5_F", "Land_Garbage_line_F"];

paradropVehicleWhitelist = ["CUP_B_C130J_GB", "CUP_B_C130J_Cargo_GB"];

cacheBoxType = "Box_FIA_Wps_F";

townSpawn = ["twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_fal","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_fal","twc_greek_ar","twc_greek_rifleman_fal","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_at2","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_smg","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_at2","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_smg","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_farmer","twc_greek_rifleman","twc_greek_mg","twc_greek_farmer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_farmer","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_smg","twc_greek_ar","twc_greek_at2","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_farmer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg"];

townSquadWave = ["twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_fal","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_fal","twc_greek_ar","twc_greek_rifleman_fal","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_at2","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_smg","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_at2","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_smg","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_farmer","twc_greek_rifleman","twc_greek_mg","twc_greek_farmer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_farmer","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_smg","twc_greek_ar","twc_greek_at2","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_farmer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg","twc_greek_officer","twc_greek_rifleman","twc_greek_rifleman_2","twc_greek_ar","twc_greek_rifleman_at","twc_greek_grenadier","twc_greek_rifleman","twc_greek_mg"];

vehicleList = ["CUP_C_UAZ_Unarmed_TK_CIV", "CUP_C_Skoda_Blue_CIV", "CUP_C_Datsun_Plain", "CUP_C_Ural_Open_Civ_03"];

enemyTechnical = ["CUP_O_LR_MG_TKM", "CUP_O_LR_SPG9_TKM"];

_script = execVM "siege_core\SHK_pos\shk_pos_init.sqf";
waitUntil{scriptDone _script};


badTownArray = ["Airport north","Kakaru","Falar","Faro","Guran","Feas"];

[missionNamespace,"base","Main Base"] call BIS_fnc_addRespawnPosition;

//defines how close mortar shells have to be predicted to land before tripping the base alarm. FOB kunduz is 40 as a baseline.
idfbasesize = 70;
publicvariable "idfbasesize";


//Sets up the unit Caching. I have no idea why i have to sleep and wait.
[]spawn{sleep 120;
["AllVehicles","init",{
	[false,(_this select 0),1000] spawn twc_fnc_initVehicleCache
}, true, ["Man","Static"], true] call CBA_fnc_addClassEventHandler;
};
// event handlers run in the non-scheduled environment (can't be execVM)
[] call compile preprocessFile "siege_core\server\init.sqf";