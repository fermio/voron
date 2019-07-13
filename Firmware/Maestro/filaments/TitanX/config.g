; Temperatures
M140 H0 S80
G10 P0 R120 S250

; Filament & Nozzle Width
; https://duet3d.com/wiki/G-code#M404:_Filament_width_and_nozzle_diameter

M200 D1.75
 ; D1.75 	1.75mm			set all extruder filament diameters to 1.75mm

; Firmware Retraction
; https://duet3d.com/wiki/G-code#M207:_Set_retract_length

M207 S4.0 F4500 R0.0 T3000 Z0.1
 ; S4.0		4mm			positive length to retract, in mm
 ; R0.0		0mm			positive or negative additional length to un-retract, in mm
 ; F4500	75mm/sec		retraction feedrate, in mm/min
 ; T3000	25mm/sec		feedrate for un-retraction if different from retraction, mm/min (RepRapFirmware 1.16 and later only)
 ; Z0.1		0.1mm			additional zlift/hop

; Pressue Advance
; https://duet3d.com/wiki/G-code#M572:_Set_or_report_extruder_pressure_advance

M572 D0 S0.1
 ; D0		E0			Extruder number
 ; S0.1		0.1s			Pressure advance amount (in seconds)

; Extrude Factor
; https://duet3d.com/wiki/G-code#M221:_Set_extrude_factor_override_percentage

M221 D0 S100	; S95
 ; D0		E0			Extruder drive number
 ; S95		95%			Extrude factor override percentage
 ; FormFutura recommends 106%, but with 105% its too much
