/*If !isnil base then
Create a dummy marker and delete the proper one. 

Change the current trigger’s activation to blufor

waituntil count players == 0 then if there’s still no patrolbase then if there’s no base then end the mission
} else{
Create the proper marker and delete the dummy one
Change the current trigger’s activation to opfor
*/
params ["_thistrigger"];

[_thistrigger] spawn {
 params ["_thistrigger"];
if (!(getMarkerColor "base" == "")) then { 
systemchat "switched base to opfor"; 
createmarker ["dummybase", getmarkerpos "base"]; 
deletemarker "base"; 
mainbase setTriggerActivation ["WEST", "PRESENT", true];
waituntil {({isPlayer _x && alive _x} count allUnits)==0};
if (getMarkerColor "base" == "") then { 
if ((getMarkerColor "respawn_forwardBase" == "") ) then {systemchat "no base and no backup";"baselost" call BIS_fnc_endMissionServer;} else {systemchat "got a backup"}
} 
} 
else 
{ 
 
systemchat "switching base to blufor"; 
createmarker ["base", getmarkerpos "dummybase"]; 
deletemarker "dummybase"; 
mainbase setTriggerActivation ["east", "PRESENT", true]; 
} 
 
}