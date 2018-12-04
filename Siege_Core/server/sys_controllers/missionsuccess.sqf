if (isnil "twc_missionending") then {
	twc_missionending = 0;
};

if (twc_missionending == 1) exitwith {};

twc_missionending = 1;

_range = 300 * twc_roamsize;

_trg = createTrigger ["EmptyDetector", twc_basepos];
_trg setTriggerArea [_range, _range, 0, false];
_trg setTriggerActivation ["EAST", "PRESENT", false];
_trg setTriggerTimeout [30,30,30,True];
_trg setTriggerStatements ["((EAST countSide thisList) < ((twc_maxenemy / 3) max 10) && ({_x isKindOf 'landVehicle' && side _x == EAST} count thisList <2) && (twc_siege_baseside == 0))","[] spawn { sleep 10; 'pointVictory' call BIS_fnc_endMissionServer;};", ""];


/*
sleep 60;
waituntil {twc_siege_baseside == 0};
//double checking then salting the baseside variable to try and prevent double finishes
if (twc_siege_baseside == 0) then {
twc_siege_baseside = 5;
publicVariable "twc_siege_baseside";
"pointVictory" call BIS_fnc_endMissionServer;}
*/