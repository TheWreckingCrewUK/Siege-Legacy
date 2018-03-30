//spawn scripts do a quick check of if there are more enemies than max then don't spawn, so that it can never exceed a certain threshold

twc_maxenemy=((30*twc_difficulty)+(count(allPlayers - entities "HeadlessClient_F")*6)) min 90;
publicVariable "twc_maxenemy";
//persistent enemy count for the spawn system, every spawn adds a point and every enemy death takes one away
twc_currentenemy=0;
publicVariable "twc_currentenemy";

twc_currentdefender=0;
publicVariable "twc_currentdefender";

//difficulty setup, lower is easier. Use lower values for maps where the players spawn in areas that are more difficult to defend (like a woodland camp instead of a FOB). 1 is the default value as set here, set a new one in initserver of the mission folder to set a difficulty on a particular mission.

	
while {true} do {
twc_maxenemy=((30*twc_difficulty)+((count(allPlayers - entities "HeadlessClient_F")*twc_diff_scaler)*(6*twc_difficulty))) min 80;
publicVariable "twc_maxenemy";
sleep 0.2;
execVM "Siege_Core\server\sys_townLocations\getLocations.sqf";
systemchat "getloc";
if ((pointLimit-totalpoints)<(twc_maxenemy)) then {
	twc_maxenemy=twc_maxenemy*1.3;

	execVM "Siege_Core\server\sys_townLocations\getLocations.sqf";
	sleep 60;};

sleep 30;};
