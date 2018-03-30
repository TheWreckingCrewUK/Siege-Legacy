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
						  
params["_town"];
/*
if(_spawnCivs)then{
	[_pos, _civnum, _civradius] call twc_spawnCiv;
};
*/
_pos = getpos _town;
_enemies = 0;
_random = random 100;

_markerstr = createMarker [str (random 1000),_pos];
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerShape "Ellipse";
_markerstr setMarkerBrush "Grid";
_markerstr setMarkerSize [100,100];

	_enemies = 1;
	_dis = (twc_basepos distance _pos)/1.5;
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [_dis, _dis, 0, false];
_trg setTriggerActivation ["west", "PRESENT", false];
_trg setTriggerTimeout [1,1,1, true];
_trg setTriggerStatements ["this",format ["[%1] spawn twc_spawnDefend",_town],""];

	_dis2 = (twc_basepos distance _pos)/2;
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [_dis2 , _dis2, 0, false];
_trg setTriggerActivation ["west", "PRESENT", true];
_trg setTriggerTimeout [1,1,1, true];
_trg setTriggerStatements ["this",format ["	%1 setvariable ['fighting',1]", _town],format ["%1 setvariable ['fighting',0]; systemchat 'no fighting here'", _town]];

for "_i" from 1 to mortarcount do{
[_pos] spawn twc_spawnmortars;
};

twc_currentenemy= ({alive _x && side _x == east} count allUnits) - twc_currentdefender;
publicVariable "twc_currentenemy";


_random = random 100;
_chance = _town getvariable "active";
	[_pos] spawn twc_spawnAIUnits;