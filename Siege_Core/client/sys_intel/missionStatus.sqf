if (totalPoints < pointLimit) then {hint format["Completion %1 / %2",totalPoints, pointLimit];} else {
	if (twc_siege_baseside == 0) then {
		hint "The enemy's reinforcements have run dry, eliminate their remaining attacking forces to complete the mission";
	} else {
		hint "The enemy's reinforcements have run dry but the remnants are in control of the base, eliminate their remaining attacking forces and retake the base to complete the mission";
	};

};