
if(isNil "twc_activearmour") then{
	twc_activearmour = 0;
publicVariable "twc_activearmour";
};
if(isNil "twc_activefst") then{
	twc_activefst = 0;
publicVariable "twc_activefst";
};

// Includes
#include "func\init.sqf";
#include "sys_controllers\init.sqf";
#include "sys_townLocations\init.sqf";
#include "sys_vehicleRespawn\init.sqf";
#include "sys_cleanup\init.sqf";
//#include "sys_ied\init.sqf";
#include "sys_score\init.sqf";
#include "sys_chat\init.sqf";
#include "sys_basedefence\init.sqf";
#include "heavydefines.sqf";

execvm "siege_core\client\sys_ragdoll\fn_initRagdoll.sqf";


twc_missionname = missionname;
publicVariable "twc_missionname";

if(isNil "twc_wdveh") then{
	twc_wdveh = 1;
publicVariable "twc_wdveh";
};

if(isNil "twc_hasaps") then{
	twc_hasaps = ["rhs_t90a_tv", "rhs_t72be_tv"];
};

if(isNil "twc_hasnoaps") then{
	twc_hasnoaps = ["rhs_btr80a_msv", "rhs_btr80_msv", "rhs_bmp2d_msv", "rhs_bmp1_msv", "rhs_t80uk"];
	publicVariable "twc_hasnoaps";
};

if(isNil "twc_nonAPS_list") then{
	twc_nonAPS_list = [];
	publicVariable "twc_nonAPS_list";
};

if(isNil "twc_APS_list") then{
	twc_APS_list = [];
	publicVariable "twc_APS_list";
};

if(isNil "twc_heavymode") then{
	twc_heavymode = 0;
publicVariable "twc_heavymode";
};

if(isNil "twc_mortar_baseclear") then{
	twc_mortar_baseclear = 1;
};

if(isNil "mortarcount") then{
	mortarcount = 0;
};

if(isNil "twc_mortar_targetlist") then{
	twc_mortar_targetlist = [];
	publicVariable "twc_mortar_targetlist";
};

if(isNil "twc_is90") then{
	twc_is90 = 0;
};

if(isNil "twc_siege_baseside") then{
	twc_siege_baseside = 0;
publicVariable "twc_siege_baseside";
};

if(isNil "twc_difficulty") then{
		twc_difficulty = 1;
		
	};
publicVariable "twc_difficulty";

	if (isNil "technicals") then {
		technicals = 1;
		publicVariable "technicals";
	};
	
	

	if (isNil "enemyTechnical") then {
		if (twc_heavymode == 1) then {
			enemyTechnical =["rhs_btr70_msv","rhs_bmp1_msv","rhs_t72ba_tv"];
			publicVariable "enemyTechnical";} else {
			enemyTechnical = ["CUP_O_LR_MG_TKM"];
			publicVariable "enemyTechnical";}
	};
	
	

//multiplier for how much the enemy increases with player count, 1 is the standard figure. Set higher with lower overall difficulty for maps where there's a lot of ground for a small group to cover. Set lower for maps where higher player count doesn't make much difference to how difficult the area is to defend.
if(isNil "twc_diff_scaler") then{
	twc_diff_scaler = 1;
publicVariable "twc_diff_scaler";
};

//roamsize multiplies the size of the random waypoint divergence from base. A setting of 1 means each waypoint is up to 100-200 meters away from base. Set higher for maps where there's a lot of cover and you don't want the enemies to just swim in so that you can use higher difficulties without swamping the base. The downside is that they take longer to get to engagement range so there's more downtime at mission start.
if(isNil "twc_roamsize") then{
	twc_roamsize = 1;
publicVariable "twc_roamsize";
};

//wpcount adds extra waypoints that scale by the roamsize variable. If left unset in the mission's initserver then it will default to 1. The game will add 2 waypoints near base regardless of this value. Set this to 0 to have them move straight to base, set to 2-4 if you want enemies to loiter around nearby a lot but not make a play for the base that often.
if(isNil "twc_wpcount") then{
	twc_wpcount = 1;
publicVariable "twc_wpcount";
};


if(isNil "townLocationArray") then{
	townLocationArray = [];
};


if(isNil "defendedtownarray") then{
	defendedtownarray = [];
};

if(isNil "customlocations") then{
	customlocations = [];
};

if(isNil "twc_spawnlist") then{
	twc_spawnlist = [];
	publicVariable "twc_spawnlist";
};


{_location = createLocation [ "NameVillage" , getpos _x, 100, 100];
townLocationArray = townLocationArray + (nearestLocations [getpos _x, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2]);} foreach customlocations;

basemode = 1;
publicvariable "basemode";

[west, 5] call BIS_fnc_respawnTickets;

twc_basepos = getmarkerpos "base";

execVM "Siege_Core\server\sys_townLocations\getLocations.sqf";

// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";
if ((missionnamespace getvariable ["twc_siege_skiptowns", 0]) == 0) then {
	// Array of the locations and the strongholds
	townLocationArray = townLocationArray + (nearestLocations [twc_basepos, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2500]);
};
_strongholdArray = [];

/*
while{count _strongholdArray < 3}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((text _town) in badTownArray))then{
		townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback _town;
	};
};
//Strongholds
*/

["TWC_PlayerDisconnected", "onPlayerDisconnected", {
	
	if ((count(allPlayers - entities "HeadlessClient_F")) == 0) then {
		call BIS_fnc_endMission;
	};
}] call BIS_fnc_addStackedEventHandler;

//Mission time randomizer.
//only is random between 4am-2pm.
_time = (random 10) + 4;
_time = ((_time + 4) - dayTime + 24);
skipTime (_time % 24);

#include "sys_siege\init.sqf"; //needs to be included after townlocationarray is defined