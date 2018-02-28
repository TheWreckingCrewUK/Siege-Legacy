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
	publicvariable "mortarcount";
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

[west, 20] call BIS_fnc_respawnTickets;



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