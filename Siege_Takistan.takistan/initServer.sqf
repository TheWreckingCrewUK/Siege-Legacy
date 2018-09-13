//This file defines all of the units used. To change to a new map you mostly only have to change this file.

/*
Known other changes occur in:
server\sys_cache\cacheLoadout.sqf
server\sys_vehicles\VBIED.sqf
*/

//Enable or Disable Debug
twc_serverDebug = false;

twc_surrenderVote = false;

twc_wdveh = 0;
publicVariable "twc_wdveh";

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

twc_difficulty = 1.1;
publicVariable "twc_difficulty";

//roamsize multiplies the size of the random waypoint divergence from base. A setting of 1 means each waypoint is up to 100-200 meters away from base. Set higher for maps where there's a lot of cover and you don't want the enemies to just swim in so that you can use higher difficulties without swamping the base. The downside is that they take longer to get to engagement range so there's more downtime at mission start.
twc_roamsize = 2;

//wpcount adds extra waypoints that scale by the roamsize variable. If left unset in the mission's initserver then it will default to 1. The game will add 2 waypoints near base regardless of this value. Set this to 0 to have them move straight to base, set to 2-4 if you want enemies to loiter around nearby a lot but not make a play for the base that often.
	twc_wpcount = 2;

mortarcount = 0;

//add in an object name and the game will create a location there and spawn enemies from it
customlocations = [camp1, camp2];

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

townSpawn = ["CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","CUP_O_TK_INS_Soldier_TL","CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","Tak_twc_ins_Men_a1","CUP_O_TK_INS_Soldier_TL","CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","CUP_O_TK_INS_Soldier_TL","CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","Tak_twc_ins_Men_a1","CUP_O_TK_INS_Soldier_TL","Tak_twc_ins_Men_RPG1","CUP_O_TK_INS_Soldier_AT"];

townSquadWave = ["CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","CUP_O_TK_INS_Soldier_TL","CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","Tak_twc_ins_Men_a1","CUP_O_TK_INS_Soldier_TL","CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","CUP_O_TK_INS_Soldier_TL","CUP_O_TK_INS_Soldier_AR","Tak_twc_ins_Men_R1","CUP_O_TK_INS_Soldier","CUP_O_TK_INS_Soldier_MG","Tak_twc_ins_Men_R2","Tak_twc_ins_Men_AR1","Tak_twc_ins_Men_MG1","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_R3","Tak_twc_ins_Men_a2","Tak_twc_ins_Men_a1","CUP_O_TK_INS_Soldier_TL","Tak_twc_ins_Men_RPG1","CUP_O_TK_INS_Soldier_AT"];

vehicleList = ["CUP_C_UAZ_Unarmed_TK_CIV", "CUP_C_Skoda_Blue_CIV", "CUP_C_Datsun_Plain", "CUP_C_Ural_Open_Civ_03"];

enemyTechnical = ["CUP_O_LR_MG_TKM", "CUP_O_LR_SPG9_TKM"];

_script = execVM "siege_core\SHK_pos\shk_pos_init.sqf";
waitUntil{scriptDone _script};


badTownArray = ["Airport north","Kakaru","Falar","Faro","Guran","Feas"];

twc_basespawn = [missionNamespace,"base","Main Base"] call BIS_fnc_addRespawnPosition;

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