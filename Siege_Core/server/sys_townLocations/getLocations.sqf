
if (twc_currentenemy>twc_maxenemy) exitwith
{systemchat "too much"};

//adding in enemy count just to save a bit of overhead
{
// disregards the towns in the badTown array in initServer
	if(!((text _x) in badTownArray))then{
	
	
_spawnpos = getpos _x;

_x setVariable ["active",1];
_x setVariable ["fighting",0];
_x setVariable ["defended",0];

systemchat format ["%1", _x getVariable "active",1];

	_dis2 = (twc_basepos distance _x)/2;
_trg = createTrigger ["EmptyDetector", _spawnpos];
_trg setTriggerArea [_dis2 , _dis2, 0, false];
_trg setTriggerActivation ["west", "PRESENT", true];
_trg setTriggerTimeout [1,1,1, true];
_trg setTriggerStatements ["this", format ["[%1] call twc_fnc_spawndefend", getpos _x], "systemchat 'back to normal'"];

[_x] spawn twc_townSetup;



// Creates a marker that marks the town

		_markerstr = createMarker [str (random 1000),getPos _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "mil_flag";
		_markerstr setMarkerText (text _x);



	};
}forEach townLocationArray;
