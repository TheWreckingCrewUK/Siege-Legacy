_enemycount = 0;
if (twc_heavymode == 1) then {_enemycount = (east countside allunits) - 40} else {_enemycount = (east countside allunits)};

if (_enemycount>twc_maxenemy) exitwith
{};

//adding in enemy count just to save a bit of overhead
{
// disregards the towns in the badTown array in initServer
	if(!((text _x) in badTownArray))then{
	
	
_spawnpos = getpos _x;

_x setVariable ["active",1];
_x setVariable ["fighting",0];
_x setVariable ["defended",0];

//systemchat format ["%1", _x getVariable "active",1];

	_dis2 = (twc_basepos distance _x)/2;
_trg = createTrigger ["EmptyDetector", _spawnpos];
_trg setTriggerArea [_dis2 , _dis2, 0, false];
_trg setTriggerActivation ["west", "PRESENT", true];
_trg setTriggerTimeout [1,1,1, true];
_trg setTriggerStatements ["this", format ["[(%1)] call twc_spawnDefend", getpos _x], format ["[(%1)] call twc_DeSpawnDefend", getpos _x]];




[_x] spawn {
params ["_this"];
while {true} do {
twc_maxenemy=((30*twc_difficulty)+((count(allPlayers - entities "HeadlessClient_F")*twc_diff_scaler)*(6*twc_difficulty))) min 80;
publicVariable "twc_maxenemy";
sleep 0.2;


if ((pointLimit-totalpoints)<(twc_maxenemy)) then {
twc_maxenemy=((50*twc_difficulty)+((count(allPlayers - entities "HeadlessClient_F")*twc_diff_scaler)*(6*twc_difficulty))) min 80;
	};
[_this] spawn twc_townSetup;
sleep 30;};
}


// Creates a marker that marks the town
/*
		_markerstr = createMarker [str (random 1000),getPos _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "mil_flag";
		_markerstr setMarkerText (text _x);
*/


	};
}forEach townLocationArray;
