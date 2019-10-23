; Temperatures
M140 H0 S60
G10 P0 R120 S200

; Filament & Nozzle Width
; https://duet3d.com/wiki/G-code#M404:_Filament_width_and_nozzle_diameter

; Filament Diameter
; https://duet3d.com/wiki/G-code#M200:_Set_filament_diameter

M200 D1.75
 ; D1.75 	1.75mm			set all extruder filament diameters to 1.75mm

; Firmware Retraction
; https://duet3d.com/wiki/G-code#M207:_Set_retract_length

M207 S5.0 F3000 R0.0 T3000 Z0.2
 ; S5.0		5.0mm			positive length to retract, in mm
 ; R0.0		0.0mm			positive or negative additional length to un-retract, in mm
 ; F3000	50mm/sec		retraction feedrate, in mm/min
 ; T1500	25mm/sec		feedrate for un-retraction if different from retraction, mm/min (RepRapFirmware 1.16 and later only)
 ; Z0.2		0.2mm			additional zlift/hop

; Pressue Advance
; https://duet3d.com/wiki/G-code#M572:_Set_or_report_extruder_pressure_advance

M572 D0 S0
 ; D0		E0			Extruder number
 ; S0.1		0.1s			Pressure advance amount (in seconds)

; Extrude Factor
; https://duet3d.com/wiki/G-code#M221:_Set_extrude_factor_override_percentage

M221 D0 S100
 ; D0		E0			Extruder drive number
 ; S100		100%			Extrude factor override percentage
