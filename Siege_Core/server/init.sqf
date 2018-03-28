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

if(isNil "mortarcount") then{
	mortarcount = 0;
};

if(isNil "twc_is90") then{
	twc_is90 = 0;
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


if(isNil "customlocations") then{
	customlocations = [];
};


{_location = createLocation [ "NameVillage" , getpos _x, 100, 100];
townLocationArray = townLocationArray + (nearestLocations [getpos _x, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2]);} foreach customlocations;

basemode = 1;
publicvariable "basemode";

[west, 10] call BIS_fnc_respawnTickets;



execVM "Siege_Core\server\sys_townLocations\getLocations.sqf";

// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";

// Array of the locations and the strongholds
townLocationArray = townLocationArray + (nearestLocations [getmarkerpos "base", ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2000]);
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


#include "sys_siege\init.sqf"; //needs to be included after townlocationarray is defined