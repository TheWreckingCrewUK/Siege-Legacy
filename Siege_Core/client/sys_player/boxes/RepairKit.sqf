/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/
if ((twc_ammotime-time) > 0) then {
	hint format ["The spawner is on cooldown currently. %2 seconds remaining.", twc_ammotime_amount, ceil (twc_ammotime-time)];
	waituntil {(twc_ammotime-time) < 0};
	hint "More Ammunition Is Now Available From The Spawner";
	} else {

twc_ammotime=time+twc_ammotime_amount;
publicVariable "twc_ammotime";
_boxClass = "GroundWeaponHolder";


_box = _boxClass createVehicle (getPos AmmoBoxSpawner);
//supplies
_box AdditemCargoGlobal ["Toolkit",1];
sleep 1;

_wheel = "ace_Wheel" createVehicle (getPos AmmoBoxSpawner); 
 createVehicle ["ace_Wheel", position _wheel vectoradd [random 1,random 1, 0.4], [], 0, "can_collide"];  
 createVehicle ["ace_Wheel", position _wheel vectoradd [random 1,random 1, 0.8], [], 0, "can_collide"];  
 createVehicle ["ace_Wheel", position _wheel vectoradd [random 1,random 1, 1.2], [], 0, "can_collide"]; 




};