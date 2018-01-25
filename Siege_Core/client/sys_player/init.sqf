#include "boxes\init.sqf";
_me = player;
if (faction player == "ana_units") then {[_me, "PersianHead_A3_01"] remoteExec ["setFace", 0, _me]};