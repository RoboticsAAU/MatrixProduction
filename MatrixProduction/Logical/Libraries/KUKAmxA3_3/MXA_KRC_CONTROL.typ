TYPE MXA_KRC_CONTROL :
STRUCT
	
		RESET			: BOOL; (*Cell Programm (neu) starten*)
		Override		: INT;
		Brake			: BOOL; (*Brake mittels Interrupt ausführen*)
		BrakeF			: BOOL; (*Brake mittels Interrupt ausführen*)
		ReleaseBrake	: BOOL; (*Programm nach einem Brake fortsetzen *)
		ShowTrace		: BOOL; (*Diagnosefunktion zur Anzeige des Trace im Meldungsfenster *)
		MessageReset	: BOOL; (*Meldungsquittierung von MXA Meldungen *)
		OUT_VAL_1       : BOOL; (*Sollwert des Ausgangs $OUT[1] *)
		OUT_VAL_2       : BOOL; (*Sollwert des Ausgangs $OUT[2] *)
		OUT_VAL_3       : BOOL; (*Sollwert des Ausgangs $OUT[3] *)
		OUT_VAL_4       : BOOL; (*Sollwert des Ausgangs $OUT[4] *)
		OUT_VAL_5       : BOOL; (*Sollwert des Ausgangs $OUT[5] *)
		OUT_VAL_6       : BOOL; (*Sollwert des Ausgangs $OUT[6] *)
		OUT_VAL_7       : BOOL; (*Sollwert des Ausgangs $OUT[7] *)
		OUT_VAL_8       : BOOL; (*Sollwert des Ausgangs $OUT[8] *)
		WRITE_OUT_1TO8  : BOOL; (*Anforderung zum Schreiben der Ausgänge 1 bis 8*)

END_STRUCT;
END_TYPE
