_time = random 4;
_base = idfradar;
_shooter = _this select 0;
_shell = _this select 1;
_direction = _shell getreldir _base;
_distance = (_shooter) distance _base;

//defines how close shells have to be before tripping the alarm. FOB kunduz is 40 as a baseline.
_accuracy = if(isNil "idfbasesize") then {40
} else {idfbasesize * 0.5};

_distancescale = _accuracy * ((_distance * (_distance*0.2)) / 3500000);
\\systemchat format ["%1, %2", _distancescale, _distance];


	if (idfreported == 0) then {
		if ((_shooter) distance _base < 5000) then
{
			if ((_shooter) distance _base > (idfbasesize *1)) then
{

				if ((_direction > ((360 - _accuracy) + (_distancescale))) or {_direction < ((0 + _accuracy) - ( _distancescale))}) then
{
basesafe = 0;
publicvariable "idfsafe";

idfreported = 1;
publicvariable "idfreported";




[_shooter,_distance] execvm "Siege_Core\server\sys_basedefence\IDF_marker.sqf";

terminate execVM "Siege_Core\server\sys_basedefence\IDF_cram.sqf";
//systemchat "middle man sees the shell";

if (idfon == 0) then {
execVM "Siege_Core\server\sys_basedefence\IDF_Alarm.sqf";

};
if (clearing == 0) then {
execVM "Siege_Core\server\sys_basedefence\IDF_Clear.sqf";
};
};
};
};
};

