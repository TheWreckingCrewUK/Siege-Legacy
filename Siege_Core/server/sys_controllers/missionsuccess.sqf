sleep 60;
waituntil {twc_siege_baseside == 0};
//double checking then salting the baseside variable to try and prevent double finishes
if (twc_siege_baseside == 0) then {
twc_siege_baseside = 5;
publicVariable "twc_siege_baseside";
"pointVictory" call BIS_fnc_endMissionServer;}