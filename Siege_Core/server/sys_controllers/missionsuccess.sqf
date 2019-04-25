if (isnil "twc_missionending") then {
	twc_missionending = 0;
};

if (twc_missionending == 1) exitwith {};

twc_missionending = 1;

_range = 500 * twc_roamsize;

twc_endmissionplayer = {
player setvehicleammo 0;
};


_trg = createTrigger ["EmptyDetector", twc_basepos];
_trg setTriggerArea [_range, _range, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", false];
_trg setTriggerTimeout [30,30,30,True];
_trg setTriggerStatements ["((EAST countSide thisList) < (((twc_maxenemy / 3) + twc_currentdefender) max (10 + twc_currentdefender)) && ({_x isKindOf 'landVehicle' && side _x == EAST} count thisList <2) && (twc_siege_baseside == 0))","[] spawn { sleep 10; 'pointVictory' call BIS_fnc_endMissionServer; sleep 1; {[_x] remoteexec ['twc_endmissionplayer', _x];} foreach allplayers;};", ""];

