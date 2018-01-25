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
basemode = 1;
publicvariable "basemode";

execVM "Siege_Core\server\sys_townLocations\getLocations.sqf";

// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";

// Array of the locations and the strongholds
townLocationArray = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))] ;
_strongholdArray = [];
while{count _strongholdArray < 3}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((text _town) in badTownArray))then{
		townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback _town;
	};
};
//Strongholds


#include "sys_siege\init.sqf"; //needs to be included after townlocationarray is defined