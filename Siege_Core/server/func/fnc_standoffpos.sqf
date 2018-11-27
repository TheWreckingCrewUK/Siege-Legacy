params ["_vehicle"];

_base = twc_basepos;
_distance = _vehicle distance _base;

_direction = (_vehicle getdir _base) - 6 + random 12;

_standoff = ((1 + (twc_roamsize / 3)) * 200) + random 300;

_starter = _vehicle getpos [_distance - _standoff, _direction];

_starter = [_starter, 1, 70, 10, 0, 1, 0, [], [_starter, _starter]] call BIS_fnc_findSafePos;

_starter;