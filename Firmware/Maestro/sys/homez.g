M564 H0			; allow movements before homing

G91
G1 Z10 F9000		; lift up a little
G90

M98 P"0:/macros/probing/switch"

M98 P"0:/macros/probing/goto/switch"

G30 Z-99999		; single Z probe at center of bed

M564 S1 H1		; homing done, enforce limits
