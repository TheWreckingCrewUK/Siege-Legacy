_low = (floor (twc_currentenemy/10)) * 10;
_high = ((ceil (twc_currentenemy/10)) + 1 + (floor (twc_currentenemy/30)))* 10;
	_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>Intel Report</t>";
	_text1 = "<br />There are currently between ";
	_th = " and ";
	_text2 = " enemy combatants in the area";
	hint parseText (_title + _text1 + str _low + _th + str _high +  _text2);