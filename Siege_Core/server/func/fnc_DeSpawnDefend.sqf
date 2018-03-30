/*
* Details:
* 
* Creates a enemy squad to defend around a given marker
*
* Required parameters:
*
* 0 - String     Marker name
*
* Example:
*
*["bastam"] spawn twc_SpawnDefend
*
* Author: [TWC] Fakematty / [TWC] Jayman
*/

params["_pos"];

_town = nearestlocation [_pos, ""];

systemchat format ["defence removed at %1", str _town];

_town setVariable ["defended",0];

if (!((str _town) in defendedtownarray)) exitwith {};

defendedtownarray = defendedtownarray - [str _town];
