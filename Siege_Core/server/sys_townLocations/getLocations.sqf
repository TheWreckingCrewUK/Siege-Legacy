
if (twc_currentenemy>twc_maxenemy) exitwith
{systemchat "too much"};

//adding in enemy count just to save a bit of overhead
{
// disregards the towns in the badTown array in initServer
	if(!((text _x) in badTownArray))then{
systemchat "2";
	
	
_spawnpos = getpos _x;

_x setVariable ["active",1];
_x setVariable ["fighting",0];
_x setVariable ["defended",0];

[_x] spawn twc_townSetup;



// Creates a marker that marks the town
/*
		_markerstr = createMarker [str (random 1000),getPos _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "mil_flag";
		_markerstr setMarkerText (text _x);
*/


	};
}forEach townLocationArray;
