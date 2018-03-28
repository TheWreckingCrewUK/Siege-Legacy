params ["_group", "_list"];

sleep 1;

_lead = leader _group;
_pos = getpos _lead;
if ((count playableUnits) == 0) then {
waituntil {(_lead distance (waypointposition [_group, (currentwaypoint _group)])) < 100};
deleteWaypoint [_group, currentwaypoint (_group)];

for "_i" from 1 to twc_wpcount do {

_group addwaypoint [[getmarkerpos "base", 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0]};

_group addwaypoint [getmarkerpos "base", 20 * twc_roamsize] call CBA_fnc_randPos;

[_group, twc_wpcount + 1] setWaypointStatements ["true", "[this] call CBA_fnc_taskDefend"]
} 

else {
waituntil {(_lead distance (waypointposition [_group, (currentwaypoint _group)])) < 100};

_enemy = playableUnits select (floor (random (count playableunits)));
deleteWaypoint [_group, currentwaypoint (_group)];

_group addwaypoint [[getpos _enemy, 100 * twc_roamsize, 300 * twc_roamsize, 3, 0, 20, 0] call BIS_fnc_findSafePos, 0];
[_group] call twc_fnc_huntergroup}

