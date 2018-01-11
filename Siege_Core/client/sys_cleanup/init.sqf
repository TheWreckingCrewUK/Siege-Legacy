#include "droppedGear.sqf";

player addMPEventHandler ["mpkilled", {[_this select 0] spawn twc_fnc_deleteDead;}];