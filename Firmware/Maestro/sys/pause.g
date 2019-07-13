G91			; relative positioning
G1 E-3			; release pressure on nozzle
G1 Z+5 F6000 		; move Z more pressure release
G90			; absolute positioning
G1 X75 Y145 F6000	; prepare for part removal
G92 E0			; reset extrusion distance