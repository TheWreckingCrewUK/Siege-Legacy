/* change classnames based on twc_wdveh parameter. much easier than doing it in the ace menu creation bit

*/


if (_heli == "UK3CB_BAF_LandRover_WMIK_HMG_Green_B") then {
_diffincamount = 0.4;
if (twc_wdveh == 0) then {
_heli = "UK3CB_BAF_LandRover_WMIK_HMG_Sand_A";
};
};

if (_heli == "UK3CB_BAF_LandRover_WMIK_GMG_Green_B") then {
_diffincamount = 0.7;
if (twc_wdveh == 0) then {
_heli = "UK3CB_BAF_LandRover_WMIK_GMG_Sand_A";
};
};

if (_heli == "CUP_B_HMMWV_M2_USMC") then {

if (twc_wdveh == 0) then {
_heli = "CUP_B_HMMWV_M2_USA";
};
};

if (_heli == "CUP_B_HMMWV_MK19_USMC") then {
_diffincamount = 0.7;
if (twc_wdveh == 0) then {
_heli = "CUP_B_HMMWV_MK19_USA";
};
};

if ( _heli == "UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A") then {

if (twc_wdveh == 1) then {
_heli = "UK3CB_BAF_LandRover_WMIK_GPMG_Green_B";
};
};

if ( _heli == "CUP_B_LAV25_desert_USMC") then {

if (twc_wdveh == 1) then {
_heli = "CUP_B_LAV25_USMC";
};
};


if ( _heli == "ukcw_cvrt_Scim_d") then {
if (twc_wdveh == 1) then {
_heli = "ukcw_cvrt_Scim_w";
};
};


if ( _heli == "CUP_B_M113_desert_USA") then {

if (twc_wdveh == 1) then {
_heli = "CUP_B_M113_USA";
};
};


if ( _heli == "CUP_B_MCV80_GB_D_SLAT") then {

if (twc_wdveh == 1) then {
_heli = "CUP_B_MCV80_GB_W_SLAT";
};
};

