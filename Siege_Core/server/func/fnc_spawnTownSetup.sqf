/*
* Created by [TWC] jayman
*
* Is pre-compiled as twc_townSetup
* Called from server\townSetup\%townName\init
*
* Example:
*  _Bastamstart setTriggerStatements ["this","['Bastam',7,100,3,[600,700]] call twc_townSetup"
*
* This example gives the town of Bastam 7 civs with a radius of 100.
* It has 3 Waves morale not withstanding, which spawn between 600 and 700 meters away.
*
* Creates a trigger to spawn the town capture and cleanup
*/ 
						  
params["_pos","_civnum","_civradius","_groupradius","_thisList", ["_spawnCivs",true],["_forceSpawn",false]];
/*
if(_spawnCivs)then{
	[_pos, _civnum, _civradius] call twc_spawnCiv;
};
*/
_enemies = 0;
_random = random 100;
_flag = _pos nearEntities [["CUP_C_Skoda_Blue_CIV"], 300] select 0; 


	_enemies = 1;
	_dis = (getmarkerpos "base" distance _pos)/1.5;
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [_dis, _dis, 0, false];
_trg setTriggerActivation ["west", "PRESENT", false];
_trg setTriggerTimeout [1,1,1, true];
_trg setTriggerStatements ["this","	[getPos thisTrigger] spawn twc_spawnDefend",""];

	_dis2 = (getmarkerpos "base" distance _pos)/2;
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [_dis2 , _dis2, 0, false];
_trg setTriggerActivation ["west", "PRESENT", true];
_trg setTriggerTimeout [1,1,1, true];
_trg setTriggerStatements ["this","	_flag = getPos thisTrigger nearEntities [['CUP_C_Skoda_Blue_CIV'], 300] select 0; _flag setvariable ['fighting',1]","	_flag = getPos thisTrigger nearEntities [['CUP_C_Skoda_Blue_CIV'], 300] select 0; _flag setvariable ['fighting',0]; systemchat 'no fighting here'"];

for "_i" from 1 to mortarcount do{
[_pos] spawn twc_spawnmortars;
};

twc_currentenemy= ({alive _x && side _x == east} count allUnits) - twc_currentdefender;
publicVariable "twc_currentenemy";


_random = random 100;
_chance = _flag getvariable "active";
	_enemies = 1;
	[_pos, _groupradius,_thisList, _chance] spawn twc_spawnAIUnits;

if(_enemies == 0)exitWith{};

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [1700, 1700, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", False];
_trg setTriggerTimeout [7,7,7, true];
_trg setTriggerStatements ["this","[(thisTrigger getVariable 'unitsHome'),thisList] spawn twc_fnc_townDeciding",""];

_trg setVariable ["unitsHome",_pos];