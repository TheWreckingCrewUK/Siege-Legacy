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
						  
params["_pos","_civnum","_civradius","_groupradius","_thisList",["_spawnCivs",true],["_forceSpawn",false]];
/*
if(_spawnCivs)then{
	[_pos, _civnum, _civradius] call twc_spawnCiv;
};
*/
_enemies = 0;
_random = random 100;

	_enemies = 1;
	[_pos] spawn twc_spawnDefend;


_random = random 100;

	_enemies = 1;
	[_pos, _groupradius,_thisList] spawn twc_spawnAIUnits;

if(_enemies == 0)exitWith{};

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [1700, 1700, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", False];
_trg setTriggerTimeout [7,7,7, true];
_trg setTriggerStatements ["this","[(thisTrigger getVariable 'unitsHome'),thisList] spawn twc_fnc_townDeciding",""];

_trg setVariable ["unitsHome",_pos];