; ########
; # DUET #
; ########

M111 S0
M575 P1 B57600 S1



; ###########
; # NETWORK #
; ###########

M552 S1
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED
M550 PMaestro
M551 Preprap
M552 P0

M586 P0 T0 S1
M586 P1 T0 S1
M586 P2 T0 S1


; ##########
; # MOTION #
; ##########

G21
G90
M83
M555 P2



; ########
; # AXIS #
; ########

M669 K1
M208 X0 Y0 Z0 S1
M208 X148 Y149 Z120 S0



; ############
; # ENDSTOPS #
; ############

M574 X2 Y2 S0
M574 Z0 S1



; ###########
; # Z-PROBE #
; ###########

M98 P"0:/macros/probing/omron"



; ##########
; # LAYOUT #
; ##########

; #     EXTRUDER = Z
; #  --------- --------
; # | A = E2  | B = E3 |
; # | ------- | ------ |
; # | Z2 = E0 | Z3 = X |
; # | ------- | -------|
; # | Z1 = E1 | Z4 = Y |
; #  --------- --------
; #         FRONT



; ############
; # STEPPERS #
; ############

M584 X5 Y6 Z4:3:0:1 E2

M569 P5 S0 D2	; A/X
M569 P6 S0 D2	; B/Y
M569 P4 S0 D2	; EXTRUDER
M569 P0 S0 D2	; Z1
M569 P1 S1 D2	; Z2
M569 P2 S0 D2	; Z3
M569 P3 S1 D2	; Z4

M350 X32 Y32 Z16 E16 I0
M92 X160 Y160 Z400 E560



; ################
; # FEED & SPEED #
; ################

M566 X900 Y900 Z60 E3000
M203 X18000 Y18000 Z3000 E6000
M201 X3000 Y3000 Z250 E6000
M204 P3000 T3000

M906 X1250 Y1250 Z1000 E500 I100
M913 X100 Y100 E100 Z100
M84 S3600



; ############
; # LEVELING #
; ############

G29 S2
M671 X-54:-54:205:205 Y-4:225:225:-4 S5
M557 X25:125 Y25:125 S25:25



; ###########
; # HEATBED #
; ###########

M143 H0 S110
M305 S"Printbed" P0 X0 R2200 T100000 B4267
M307 H0 B0 S1
; M301 H0 Px Ix Dx
; M303 H0 S80



; ##########
; # HOTEND #
; ##########

M143 S300
M305 S"Hotend" P1 X200 W2
M307 H1 B0 S1.0
; M301 H1 Px Ix Dx
; M303 H1 S240

M563 P2 D-1 H-1



; ########
; # FANS #
; ########

M106 P0 T50 S255 X255 F250 B0.1 H1	; coldend/heatsink
M106 P1 S0 X255 F250 B0.1 H-1		; nozzle/parts
M106 P2 S1 X255 F250 B0.1 H-1		; cabinet
; M106 Px I-1	; disable fan



; #########
; # TOOLS #
; #########

M563 P0 S"Hotend" D0 H1 F1
G10 P0 R0 S0 X0 Y0 Z0



; ############
; # OPTIONAL #
; ############

M305 P100 X1000 S"CPU"
M305 P101 X1001 S"TMC"



; ###########
; # DISPLAY #
; ###########

M918 P1



; #########
; # RESET #
; #########

M98 P"0:/macros/reset-filament"



; ##########
; # EEPROM #
; ##########

; M501


; ########
; # TOOL #
; ########

T0 P0
