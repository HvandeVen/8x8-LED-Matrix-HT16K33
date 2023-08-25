Device = 16F628A
Config INTRC_OSC_NOCLKOUT, WDT_OFF, PWRTE_ON, LVP_OFF, MCLRE_OFF
Xtal = 4

Clear

TRISB = %00000000
DelayMS 500

Declare SCL_Pin = PORTB.4 
Declare SDA_Pin = PORTB.5
'Declare Slow_Bus On

Symbol LED = PORTB.7
Toggle LED

BStart 
BusOut %11100000, [$21] 'Slave address HT16K33 set to write + Set oscillator on
DelayMS 10
BusOut %11100000, [$80]'Slave address HT16K33 set to write + Set display off
DelayMS 10
BusOut %11100000, [$E0] 'Slave address HT16K33 set to write  +  set lowest brightness
DelayMS 10
BusOut %11100000, [0,255, 2,255, 4,255, 6,255, 8,255, 10,255, 12,255, 14,255] 'Slave address HT16K33 set to write  +  All LED's on
DelayMS 10
BusOut %11100000, [$81] 'Slave address HT16K33 set to write  +  Set display on
BStop
DelayMS 1000

main: 
Toggle LED

BStart
BusOut %11100000, [0,0, 2,0, 4,0, 6,0, 8,0, 10,0, 12,0, 14,0] ' blank
DelayMS 150
BusOut %11100000, [0,255, 2,255, 4,12, 6,12, 8,12, 10,12, 12,255, 14,255] ' H
DelayMS 500
BusOut %11100000, [0,0, 2,0, 4,0, 6,0, 8,0, 10,0, 12,0, 14,0] ' blank
DelayMS 50
BusOut %11100000, [0,255, 2,255, 4,237, 6,237, 8,237, 10,237, 12,225, 14,225] ' E
DelayMS 500
BusOut %11100000, [0,0, 2,0, 4,0, 6,0, 8,0, 10,0, 12,0, 14,0] ' blank
DelayMS 50
BusOut %11100000, [0,255, 2,255, 4,129, 6,129, 8,129, 10,129, 12,129, 14,129] ' L
DelayMS 500
BusOut %11100000, [0,0, 2,0, 4,0, 6,0, 8,0, 10,0, 12,0, 14,0] ' blank
DelayMS 50
BusOut %11100000, [0,255, 2,255, 4,129, 6,129, 8,129, 10,129, 12,129, 14,129] ' L
DelayMS 500
BusOut %11100000, [0,0, 2,0, 4,0, 6,0, 8,0, 10,0, 12,0, 14,0] ' blank
DelayMS 50
BusOut %11100000, [0,63, 2,255, 4,225, 6,225, 8,225, 10,225, 12,255, 14,63] ' O
DelayMS 500
BusOut %11100000, [0,0, 2,0, 4,0, 6,0, 8,0, 10,0, 12,0, 14,0] ' blank
DelayMS 50
BusOut %11100000, [0,63, 2,192, 4,212, 6,194, 8,194, 10,212, 12,192, 14,63] ' Smile
BStop

DelayMS 1000
Toggle LED

BStart
BusOut %11100000, [$E1]
DelayMS 50
BusOut %11100000, [$E2]
DelayMS 50
BusOut %11100000, [$E3]
DelayMS 50
BusOut %11100000, [$E4]
DelayMS 50
BusOut %11100000, [$E5]
DelayMS 50
BusOut %11100000, [$E6]
DelayMS 50
BusOut %11100000, [$E7]
DelayMS 50
BusOut %11100000, [$E8]
DelayMS 50
BusOut %11100000, [$E9]
DelayMS 50
BusOut %11100000, [$EA]
DelayMS 50
BusOut %11100000, [$EB]
DelayMS 50
BusOut %11100000, [$EC]
DelayMS 50
BusOut %11100000, [$ED]
DelayMS 50
BusOut %11100000, [$EE] 
DelayMS 1000
BusOut %11100000, [$EF] 'Full brightness
DelayMS 50
BusOut %11100000, [$EE]
DelayMS 50
BusOut %11100000, [$ED]
DelayMS 50
BusOut %11100000, [$EC]
DelayMS 50
BusOut %11100000, [$EB]
DelayMS 50
BusOut %11100000, [$EA]
DelayMS 50
BusOut %11100000, [$E9]
DelayMS 50
BusOut %11100000, [$E8]
DelayMS 50            
BusOut %11100000, [$E7]
DelayMS 50
BusOut %11100000, [$E6]
DelayMS 50
BusOut %11100000, [$E5]
DelayMS 50
BusOut %11100000, [$E4]
DelayMS 50
BusOut %11100000, [$E3]
DelayMS 50
BusOut %11100000, [$E2]
DelayMS 50
BusOut %11100000, [$E1]
DelayMS 50
BusOut %11100000, [$E0] 'Lowest brightness
BStop

DelayMS 1000

GoTo main
End
