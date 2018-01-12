//spawn scripts do a quick check of if there are more enemies than max then don't spawn, so that it can never exceed a certain threshold

twc_maxenemy=((30*twc_difficulty)+(count(allPlayers - entities "HeadlessClient_F")*6)) min 90;
publicVariable "twc_maxenemy";
//persistent enemy count for the spawn system, every spawn adds a point and every enemy death takes one away
twc_currentenemy=0;
publicVariable "twc_currentenemy";

//difficulty setup, lower is easier. Use lower values for maps where the players spawn in areas that are more difficult to defend (like a woodland camp instead of a FOB). 1 is the default value as set here, set a new one in initserver of the mission folder to set a difficulty on a particular mission.

	
while {true} do {
twc_maxenemy=((30*twc_difficulty)+(count(allPlayers - entities "HeadlessClient_F")*(6*twc_difficulty))) min 90;
publicVariable "twc_maxenemy";
sleep 0.2;
if ((pointLimit-totalpoints)<(twc_maxenemy*1.5)) then {
	twc_maxenemy=twc_maxenemy*2;
	systemchat "final round";

	execVM "Siege_Core\server\sys_townLocations\getLocations.sqf";
	sleep 600;};
execVM "Siege_Core\server\sys_townLocations\getLocations.sqf";

sleep 30;};
