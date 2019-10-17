; ########
; # DUET #
; ########

M111 S0				; Debug off
M575 P1 B57600 S1	; PanelDue



; ###########
; # NETWORK #
; ###########

M552 S1								; Turn network on
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED	; MAC Address
M550 PMaestro						; Machine name
M551 Preprap						; (FTP) Password
M552 P0								; (0 = DHCP)

M586 P0 T0 S1						; enable HTTP/HTTPS (T0/T1)
M586 P1 T0 S1						; enable FTP/SFTP (T0/T1)
M586 P2 T0 S1						; enable Telnet/SSH (T0/T1)


; ##########
; # MOTION #
; ##########
G21									; Work in millimeters
G90									; Send absolute coordinates...
M83									; ...but relative extruder moves
M555 P2								; Set firmware compatibility to look like Marlin



; ########
; # AXIS #
; ########

; M667 S1				; CoreXY (< 2.03
M669 K1					; CoreXY (>=2.03)
M208 X0 Y0 Z0 S1		; Set axis minima to end of safe travel.
M208 X148 Y149 Z120 S0	; Set axis maxima to match endstop location.



; ############
; # ENDSTOPS #
; ############

M574 X2 Y2 Z0 S0		; Define active high and unused microswitches
	; X2 Y2 sets endstops for high end
	; Z0 because Z endstop is handled in Zprobe setup
	; S0 for active-high endstops. My switches are wired to be NC - Normally Closed.



; ###########
; # Z-PROBE #
; ###########

M98 P"0:/macros/probing/omron"



; ##########
; # LAYOUT #
; ##########
;  -------
; | A | B |
; | ----- |
; | 6 | 7 |
; | ----- |
; | 5 | 8 |
;  -------
;   front



; ############
; # STEPPERS #
; ############

M584 X5 Y6 Z4:3:0:1 E2	; Motor mappings

M569 P5 S0 D2			; X motor goes forwards
M569 P6 S0 D2			; Y motor goes forwards

M569 P4 S0 D2			; E motor goes backwards

M569 P0 S0 D2			; Z motor 1 goes forwards
M569 P1 S1 D2			; Z motor 2 goes backwards
M569 P2 S0 D2			; Z motor 3 goes forwards
M569 P3 S1 D2			; Z motor 4 goes backwards

M350 X16 Y16 Z16 E16 I1	; 1/16 microstepping with interpolation
M92 X80 Y80 Z400 E560	; steps per mm



; ################
; # FEED & SPEED #
; ################

M566 X900 Y900 Z60 E3000			; maximum instantaneous speed changes (mm/min) (jerk)
M203 X18000 Y18000 Z3000 E6000		; maximum speeds (mm/min)
M201 X3000 Y3000 Z250 E6000			; accelerations (mm/s^2)
M204 P3000 T3000 					; print and travel accelerations

M906 X1250 Y1250 Z1000 E500 I100	; motor currents (mA) and motor idle factor in per cent
M913 X100 Y100 E100 Z100			; full current
M84 S3600							; idle timeout



; ############
; # LEVELING #
; ############

G29 S2									; forget heightmap
M671 X-54:-54:205:205 Y-4:225:225:-4 S5	; Z drive positions
M557 X25:125 Y25:125 S25:25				; Bed mesh



; ###########
; # HEATBED #
; ###########

M143 H0 S110								; maximum heatbed temperature
M305 S"Printbed" P0 X0 R2200 T100000 B4267	; R4700 T100000 B3950
M307 H0 B0 S1								; PWM (B1 = bang-bang)
; M301 H0 Px Ix Dx							; PID
; M303 H0 S80								; Autotune


; Silicone Heater
M305 S"Heatmat" P103 X3 R2200 T100000 B4267	; R4700 T100000 B3950
M143 P100 H0 X103 A2 C0 S120				; supervise silicone heater stays below 110°C
M143 P101 H0 X103 A1 C0 S130				; supervise silicone heater shutdown at 125°C





; ##########
; # HOTEND #
; ##########

M143 S300						; maximum hotend temperature
M305 S"E3Dv6" P1 X200 W2		; PT100
M307 H1 B0 S1.0					; PWM (B1 = bang-bang)
; M301 H1 Px Ix Dx				; PID
; M303 H1 S240 					; Autotune

; Disable Channel 2
M563 P2 D-1 H-1



; ########
; # FANS #
; ########

M106 P0 S0 X255 F250 B0.1 H-1		; Part fan L/R (Buck, 12V)
M106 P1 S0 X255 F250 B0.1 H-1		; Part fan L/R (Buck, 12V)
M106 P2 T75 S255 X255 F250 B0.1 H1	; E3Dv6 fan (Duet, 24V) >=50°C



; #########
; # TOOLS #
; #########

M563 P0 S"E3Dv6" D0 H1 F0:1	; define tool 0
G10 P0 R0 S0 X0 Y0 Z0		; set tool 0 axis offsets, active and standby temperatures to 0°C



; ############
; # OPTIONAL #
; ############

; Disable Fans
; M106 Px I-1

; LED Bars
; M106 Px I0 S38 	; C"LED xxx"

; Virtual Heaters
M305 P100 X1000 S"CPU"
M305 P101 X1001 S"TMC"



; ###########
; # DISPLAY #
; ###########

M918 P1

M98 P"0:/macros/reset-filament"


; EEPROM
; M501

; Select Tool
T0 P0