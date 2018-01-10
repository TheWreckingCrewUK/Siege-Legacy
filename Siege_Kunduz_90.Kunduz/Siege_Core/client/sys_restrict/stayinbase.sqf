_trg = createTrigger ["EmptyDetector", getmarkerpos "base"];
_trg setTriggerArea [400, 400, 0, false];
_trg setTriggerActivation ["west", "NOT PRESENT", True];
_trg setTriggerTimeout [60,60,60, true];
_trg setTriggerStatements ["this","player setdamage 1",""];
