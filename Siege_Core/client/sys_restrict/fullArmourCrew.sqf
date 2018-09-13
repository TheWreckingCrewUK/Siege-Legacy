/*
by [TWC] Hobbs
renders unit blind if there's not enough units in his group, like if a sniper team needs both players or an armour crew needs all 3.

Once they have enough, then it runs itself again to wait until the situation changes, so if someone drops out it renders the player blind again

*/

waitUntil {!isNull player};

waituntil {(count (units group player)) > 1};

twc_activearmour = 1;
publicVariable "twc_activearmour";

waituntil {(count (units group player)) < 2};

twc_activearmour = 0;
publicVariable "twc_activearmour";

execvm "siege_core\client\sys_restrict\fullArmourCrew.sqf";