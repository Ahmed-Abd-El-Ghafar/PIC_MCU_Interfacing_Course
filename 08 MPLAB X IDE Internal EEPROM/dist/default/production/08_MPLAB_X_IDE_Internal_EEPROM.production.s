opt subtitle "Microchip MPLAB XC8 C Compiler v2.10 (Free license) build 20190730164152 Og1 "

opt pagewidth 120

	opt flic

	processor	18F46K20
opt include "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\18f46k20.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 54 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPMSK equ 0F77h ;# 
# 124 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SLRCON equ 0F78h ;# 
# 168 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON1 equ 0F79h ;# 
# 207 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON0 equ 0F7Ah ;# 
# 277 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM1CON0 equ 0F7Bh ;# 
# 347 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WPUB equ 0F7Ch ;# 
# 409 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IOCB equ 0F7Dh ;# 
# 448 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSEL equ 0F7Eh ;# 
# 510 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSELH equ 0F7Fh ;# 
# 554 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTA equ 0F80h ;# 
# 790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTB equ 0F81h ;# 
# 998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTC equ 0F82h ;# 
# 1186 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTD equ 0F83h ;# 
# 1328 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTE equ 0F84h ;# 
# 1534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATA equ 0F89h ;# 
# 1646 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATB equ 0F8Ah ;# 
# 1758 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATC equ 0F8Bh ;# 
# 1870 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATD equ 0F8Ch ;# 
# 1982 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATE equ 0F8Dh ;# 
# 2034 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISA equ 0F92h ;# 
# 2039 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRA equ 0F92h ;# 
# 2256 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISB equ 0F93h ;# 
# 2261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRB equ 0F93h ;# 
# 2478 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISC equ 0F94h ;# 
# 2483 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRC equ 0F94h ;# 
# 2700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISD equ 0F95h ;# 
# 2705 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRD equ 0F95h ;# 
# 2922 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISE equ 0F96h ;# 
# 2927 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRE equ 0F96h ;# 
# 3074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCTUNE equ 0F9Bh ;# 
# 3144 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE1 equ 0F9Dh ;# 
# 3221 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR1 equ 0F9Eh ;# 
# 3298 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR1 equ 0F9Fh ;# 
# 3375 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE2 equ 0FA0h ;# 
# 3455 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR2 equ 0FA1h ;# 
# 3535 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR2 equ 0FA2h ;# 
# 3615 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON1 equ 0FA6h ;# 
# 3681 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON2 equ 0FA7h ;# 
# 3688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEDATA equ 0FA8h ;# 
# 3695 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADR equ 0FA9h ;# 
# 3757 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADRH equ 0FAAh ;# 
# 3783 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA equ 0FABh ;# 
# 3788 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA1 equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA equ 0FACh ;# 
# 3998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA1 equ 0FACh ;# 
# 4249 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG equ 0FADh ;# 
# 4254 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG1 equ 0FADh ;# 
# 4261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG equ 0FAEh ;# 
# 4266 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG1 equ 0FAEh ;# 
# 4273 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG equ 0FAFh ;# 
# 4278 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG1 equ 0FAFh ;# 
# 4285 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRGH equ 0FB0h ;# 
# 4292 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T3CON equ 0FB1h ;# 
# 4404 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3 equ 0FB2h ;# 
# 4411 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3L equ 0FB2h ;# 
# 4418 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3H equ 0FB3h ;# 
# 4425 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON2 equ 0FB4h ;# 
# 4452 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON equ 0FB5h ;# 
# 4531 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ECCP1AS equ 0FB6h ;# 
# 4613 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PWM1CON equ 0FB7h ;# 
# 4683 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCON equ 0FB8h ;# 
# 4688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCTL equ 0FB8h ;# 
# 4849 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PSTRCON equ 0FB9h ;# 
# 4893 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP2CON equ 0FBAh ;# 
# 4957 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2 equ 0FBBh ;# 
# 4964 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2L equ 0FBBh ;# 
# 4971 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2H equ 0FBCh ;# 
# 4978 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP1CON equ 0FBDh ;# 
# 5060 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1 equ 0FBEh ;# 
# 5067 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1L equ 0FBEh ;# 
# 5074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1H equ 0FBFh ;# 
# 5081 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON2 equ 0FC0h ;# 
# 5152 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON1 equ 0FC1h ;# 
# 5203 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON0 equ 0FC2h ;# 
# 5322 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRES equ 0FC3h ;# 
# 5329 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESL equ 0FC3h ;# 
# 5336 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESH equ 0FC4h ;# 
# 5343 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON2 equ 0FC5h ;# 
# 5405 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON1 equ 0FC6h ;# 
# 5475 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPSTAT equ 0FC7h ;# 
# 5700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPADD equ 0FC8h ;# 
# 5707 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPBUF equ 0FC9h ;# 
# 5714 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T2CON equ 0FCAh ;# 
# 5785 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PR2 equ 0FCBh ;# 
# 5790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
MEMCON equ 0FCBh ;# 
# 5895 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR2 equ 0FCCh ;# 
# 5902 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T1CON equ 0FCDh ;# 
# 6005 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1 equ 0FCEh ;# 
# 6012 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1L equ 0FCEh ;# 
# 6019 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1H equ 0FCFh ;# 
# 6026 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCON equ 0FD0h ;# 
# 6159 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WDTCON equ 0FD1h ;# 
# 6187 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
HLVDCON equ 0FD2h ;# 
# 6192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LVDCON equ 0FD2h ;# 
# 6457 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCCON equ 0FD3h ;# 
# 6534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T0CON equ 0FD5h ;# 
# 6604 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0 equ 0FD6h ;# 
# 6611 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0L equ 0FD6h ;# 
# 6618 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0H equ 0FD7h ;# 
# 6625 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STATUS equ 0FD8h ;# 
# 6696 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2 equ 0FD9h ;# 
# 6703 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2L equ 0FD9h ;# 
# 6710 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2H equ 0FDAh ;# 
# 6717 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW2 equ 0FDBh ;# 
# 6724 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC2 equ 0FDCh ;# 
# 6731 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC2 equ 0FDDh ;# 
# 6738 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC2 equ 0FDEh ;# 
# 6745 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF2 equ 0FDFh ;# 
# 6752 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BSR equ 0FE0h ;# 
# 6759 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1 equ 0FE1h ;# 
# 6766 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1L equ 0FE1h ;# 
# 6773 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1H equ 0FE2h ;# 
# 6780 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW1 equ 0FE3h ;# 
# 6787 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC1 equ 0FE4h ;# 
# 6794 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC1 equ 0FE5h ;# 
# 6801 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC1 equ 0FE6h ;# 
# 6808 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF1 equ 0FE7h ;# 
# 6815 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WREG equ 0FE8h ;# 
# 6827 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0 equ 0FE9h ;# 
# 6834 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0L equ 0FE9h ;# 
# 6841 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0H equ 0FEAh ;# 
# 6848 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW0 equ 0FEBh ;# 
# 6855 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC0 equ 0FECh ;# 
# 6862 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC0 equ 0FEDh ;# 
# 6869 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC0 equ 0FEEh ;# 
# 6876 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF0 equ 0FEFh ;# 
# 6883 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON3 equ 0FF0h ;# 
# 6975 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON2 equ 0FF1h ;# 
# 7045 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON equ 0FF2h ;# 
# 7162 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PROD equ 0FF3h ;# 
# 7169 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODL equ 0FF3h ;# 
# 7176 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODH equ 0FF4h ;# 
# 7183 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TABLAT equ 0FF5h ;# 
# 7192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTR equ 0FF6h ;# 
# 7199 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRL equ 0FF6h ;# 
# 7206 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRH equ 0FF7h ;# 
# 7213 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRU equ 0FF8h ;# 
# 7222 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLAT equ 0FF9h ;# 
# 7229 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PC equ 0FF9h ;# 
# 7236 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCL equ 0FF9h ;# 
# 7243 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATH equ 0FFAh ;# 
# 7250 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATU equ 0FFBh ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STKPTR equ 0FFCh ;# 
# 7331 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOS equ 0FFDh ;# 
# 7338 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSL equ 0FFDh ;# 
# 7345 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSH equ 0FFEh ;# 
# 7352 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSU equ 0FFFh ;# 
# 54 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPMSK equ 0F77h ;# 
# 124 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SLRCON equ 0F78h ;# 
# 168 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON1 equ 0F79h ;# 
# 207 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON0 equ 0F7Ah ;# 
# 277 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM1CON0 equ 0F7Bh ;# 
# 347 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WPUB equ 0F7Ch ;# 
# 409 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IOCB equ 0F7Dh ;# 
# 448 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSEL equ 0F7Eh ;# 
# 510 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSELH equ 0F7Fh ;# 
# 554 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTA equ 0F80h ;# 
# 790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTB equ 0F81h ;# 
# 998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTC equ 0F82h ;# 
# 1186 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTD equ 0F83h ;# 
# 1328 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTE equ 0F84h ;# 
# 1534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATA equ 0F89h ;# 
# 1646 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATB equ 0F8Ah ;# 
# 1758 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATC equ 0F8Bh ;# 
# 1870 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATD equ 0F8Ch ;# 
# 1982 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATE equ 0F8Dh ;# 
# 2034 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISA equ 0F92h ;# 
# 2039 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRA equ 0F92h ;# 
# 2256 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISB equ 0F93h ;# 
# 2261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRB equ 0F93h ;# 
# 2478 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISC equ 0F94h ;# 
# 2483 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRC equ 0F94h ;# 
# 2700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISD equ 0F95h ;# 
# 2705 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRD equ 0F95h ;# 
# 2922 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISE equ 0F96h ;# 
# 2927 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRE equ 0F96h ;# 
# 3074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCTUNE equ 0F9Bh ;# 
# 3144 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE1 equ 0F9Dh ;# 
# 3221 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR1 equ 0F9Eh ;# 
# 3298 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR1 equ 0F9Fh ;# 
# 3375 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE2 equ 0FA0h ;# 
# 3455 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR2 equ 0FA1h ;# 
# 3535 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR2 equ 0FA2h ;# 
# 3615 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON1 equ 0FA6h ;# 
# 3681 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON2 equ 0FA7h ;# 
# 3688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEDATA equ 0FA8h ;# 
# 3695 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADR equ 0FA9h ;# 
# 3757 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADRH equ 0FAAh ;# 
# 3783 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA equ 0FABh ;# 
# 3788 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA1 equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA equ 0FACh ;# 
# 3998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA1 equ 0FACh ;# 
# 4249 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG equ 0FADh ;# 
# 4254 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG1 equ 0FADh ;# 
# 4261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG equ 0FAEh ;# 
# 4266 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG1 equ 0FAEh ;# 
# 4273 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG equ 0FAFh ;# 
# 4278 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG1 equ 0FAFh ;# 
# 4285 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRGH equ 0FB0h ;# 
# 4292 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T3CON equ 0FB1h ;# 
# 4404 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3 equ 0FB2h ;# 
# 4411 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3L equ 0FB2h ;# 
# 4418 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3H equ 0FB3h ;# 
# 4425 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON2 equ 0FB4h ;# 
# 4452 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON equ 0FB5h ;# 
# 4531 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ECCP1AS equ 0FB6h ;# 
# 4613 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PWM1CON equ 0FB7h ;# 
# 4683 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCON equ 0FB8h ;# 
# 4688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCTL equ 0FB8h ;# 
# 4849 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PSTRCON equ 0FB9h ;# 
# 4893 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP2CON equ 0FBAh ;# 
# 4957 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2 equ 0FBBh ;# 
# 4964 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2L equ 0FBBh ;# 
# 4971 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2H equ 0FBCh ;# 
# 4978 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP1CON equ 0FBDh ;# 
# 5060 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1 equ 0FBEh ;# 
# 5067 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1L equ 0FBEh ;# 
# 5074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1H equ 0FBFh ;# 
# 5081 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON2 equ 0FC0h ;# 
# 5152 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON1 equ 0FC1h ;# 
# 5203 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON0 equ 0FC2h ;# 
# 5322 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRES equ 0FC3h ;# 
# 5329 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESL equ 0FC3h ;# 
# 5336 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESH equ 0FC4h ;# 
# 5343 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON2 equ 0FC5h ;# 
# 5405 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON1 equ 0FC6h ;# 
# 5475 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPSTAT equ 0FC7h ;# 
# 5700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPADD equ 0FC8h ;# 
# 5707 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPBUF equ 0FC9h ;# 
# 5714 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T2CON equ 0FCAh ;# 
# 5785 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PR2 equ 0FCBh ;# 
# 5790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
MEMCON equ 0FCBh ;# 
# 5895 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR2 equ 0FCCh ;# 
# 5902 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T1CON equ 0FCDh ;# 
# 6005 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1 equ 0FCEh ;# 
# 6012 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1L equ 0FCEh ;# 
# 6019 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1H equ 0FCFh ;# 
# 6026 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCON equ 0FD0h ;# 
# 6159 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WDTCON equ 0FD1h ;# 
# 6187 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
HLVDCON equ 0FD2h ;# 
# 6192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LVDCON equ 0FD2h ;# 
# 6457 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCCON equ 0FD3h ;# 
# 6534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T0CON equ 0FD5h ;# 
# 6604 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0 equ 0FD6h ;# 
# 6611 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0L equ 0FD6h ;# 
# 6618 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0H equ 0FD7h ;# 
# 6625 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STATUS equ 0FD8h ;# 
# 6696 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2 equ 0FD9h ;# 
# 6703 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2L equ 0FD9h ;# 
# 6710 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2H equ 0FDAh ;# 
# 6717 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW2 equ 0FDBh ;# 
# 6724 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC2 equ 0FDCh ;# 
# 6731 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC2 equ 0FDDh ;# 
# 6738 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC2 equ 0FDEh ;# 
# 6745 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF2 equ 0FDFh ;# 
# 6752 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BSR equ 0FE0h ;# 
# 6759 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1 equ 0FE1h ;# 
# 6766 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1L equ 0FE1h ;# 
# 6773 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1H equ 0FE2h ;# 
# 6780 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW1 equ 0FE3h ;# 
# 6787 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC1 equ 0FE4h ;# 
# 6794 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC1 equ 0FE5h ;# 
# 6801 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC1 equ 0FE6h ;# 
# 6808 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF1 equ 0FE7h ;# 
# 6815 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WREG equ 0FE8h ;# 
# 6827 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0 equ 0FE9h ;# 
# 6834 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0L equ 0FE9h ;# 
# 6841 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0H equ 0FEAh ;# 
# 6848 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW0 equ 0FEBh ;# 
# 6855 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC0 equ 0FECh ;# 
# 6862 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC0 equ 0FEDh ;# 
# 6869 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC0 equ 0FEEh ;# 
# 6876 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF0 equ 0FEFh ;# 
# 6883 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON3 equ 0FF0h ;# 
# 6975 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON2 equ 0FF1h ;# 
# 7045 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON equ 0FF2h ;# 
# 7162 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PROD equ 0FF3h ;# 
# 7169 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODL equ 0FF3h ;# 
# 7176 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODH equ 0FF4h ;# 
# 7183 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TABLAT equ 0FF5h ;# 
# 7192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTR equ 0FF6h ;# 
# 7199 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRL equ 0FF6h ;# 
# 7206 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRH equ 0FF7h ;# 
# 7213 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRU equ 0FF8h ;# 
# 7222 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLAT equ 0FF9h ;# 
# 7229 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PC equ 0FF9h ;# 
# 7236 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCL equ 0FF9h ;# 
# 7243 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATH equ 0FFAh ;# 
# 7250 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATU equ 0FFBh ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STKPTR equ 0FFCh ;# 
# 7331 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOS equ 0FFDh ;# 
# 7338 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSL equ 0FFDh ;# 
# 7345 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSH equ 0FFEh ;# 
# 7352 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSU equ 0FFFh ;# 
# 54 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPMSK equ 0F77h ;# 
# 124 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SLRCON equ 0F78h ;# 
# 168 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON1 equ 0F79h ;# 
# 207 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON0 equ 0F7Ah ;# 
# 277 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM1CON0 equ 0F7Bh ;# 
# 347 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WPUB equ 0F7Ch ;# 
# 409 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IOCB equ 0F7Dh ;# 
# 448 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSEL equ 0F7Eh ;# 
# 510 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSELH equ 0F7Fh ;# 
# 554 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTA equ 0F80h ;# 
# 790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTB equ 0F81h ;# 
# 998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTC equ 0F82h ;# 
# 1186 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTD equ 0F83h ;# 
# 1328 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTE equ 0F84h ;# 
# 1534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATA equ 0F89h ;# 
# 1646 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATB equ 0F8Ah ;# 
# 1758 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATC equ 0F8Bh ;# 
# 1870 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATD equ 0F8Ch ;# 
# 1982 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATE equ 0F8Dh ;# 
# 2034 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISA equ 0F92h ;# 
# 2039 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRA equ 0F92h ;# 
# 2256 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISB equ 0F93h ;# 
# 2261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRB equ 0F93h ;# 
# 2478 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISC equ 0F94h ;# 
# 2483 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRC equ 0F94h ;# 
# 2700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISD equ 0F95h ;# 
# 2705 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRD equ 0F95h ;# 
# 2922 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISE equ 0F96h ;# 
# 2927 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRE equ 0F96h ;# 
# 3074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCTUNE equ 0F9Bh ;# 
# 3144 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE1 equ 0F9Dh ;# 
# 3221 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR1 equ 0F9Eh ;# 
# 3298 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR1 equ 0F9Fh ;# 
# 3375 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE2 equ 0FA0h ;# 
# 3455 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR2 equ 0FA1h ;# 
# 3535 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR2 equ 0FA2h ;# 
# 3615 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON1 equ 0FA6h ;# 
# 3681 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON2 equ 0FA7h ;# 
# 3688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEDATA equ 0FA8h ;# 
# 3695 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADR equ 0FA9h ;# 
# 3757 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADRH equ 0FAAh ;# 
# 3783 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA equ 0FABh ;# 
# 3788 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA1 equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA equ 0FACh ;# 
# 3998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA1 equ 0FACh ;# 
# 4249 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG equ 0FADh ;# 
# 4254 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG1 equ 0FADh ;# 
# 4261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG equ 0FAEh ;# 
# 4266 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG1 equ 0FAEh ;# 
# 4273 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG equ 0FAFh ;# 
# 4278 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG1 equ 0FAFh ;# 
# 4285 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRGH equ 0FB0h ;# 
# 4292 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T3CON equ 0FB1h ;# 
# 4404 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3 equ 0FB2h ;# 
# 4411 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3L equ 0FB2h ;# 
# 4418 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3H equ 0FB3h ;# 
# 4425 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON2 equ 0FB4h ;# 
# 4452 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON equ 0FB5h ;# 
# 4531 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ECCP1AS equ 0FB6h ;# 
# 4613 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PWM1CON equ 0FB7h ;# 
# 4683 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCON equ 0FB8h ;# 
# 4688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCTL equ 0FB8h ;# 
# 4849 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PSTRCON equ 0FB9h ;# 
# 4893 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP2CON equ 0FBAh ;# 
# 4957 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2 equ 0FBBh ;# 
# 4964 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2L equ 0FBBh ;# 
# 4971 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2H equ 0FBCh ;# 
# 4978 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP1CON equ 0FBDh ;# 
# 5060 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1 equ 0FBEh ;# 
# 5067 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1L equ 0FBEh ;# 
# 5074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1H equ 0FBFh ;# 
# 5081 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON2 equ 0FC0h ;# 
# 5152 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON1 equ 0FC1h ;# 
# 5203 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON0 equ 0FC2h ;# 
# 5322 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRES equ 0FC3h ;# 
# 5329 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESL equ 0FC3h ;# 
# 5336 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESH equ 0FC4h ;# 
# 5343 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON2 equ 0FC5h ;# 
# 5405 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON1 equ 0FC6h ;# 
# 5475 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPSTAT equ 0FC7h ;# 
# 5700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPADD equ 0FC8h ;# 
# 5707 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPBUF equ 0FC9h ;# 
# 5714 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T2CON equ 0FCAh ;# 
# 5785 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PR2 equ 0FCBh ;# 
# 5790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
MEMCON equ 0FCBh ;# 
# 5895 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR2 equ 0FCCh ;# 
# 5902 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T1CON equ 0FCDh ;# 
# 6005 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1 equ 0FCEh ;# 
# 6012 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1L equ 0FCEh ;# 
# 6019 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1H equ 0FCFh ;# 
# 6026 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCON equ 0FD0h ;# 
# 6159 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WDTCON equ 0FD1h ;# 
# 6187 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
HLVDCON equ 0FD2h ;# 
# 6192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LVDCON equ 0FD2h ;# 
# 6457 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCCON equ 0FD3h ;# 
# 6534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T0CON equ 0FD5h ;# 
# 6604 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0 equ 0FD6h ;# 
# 6611 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0L equ 0FD6h ;# 
# 6618 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0H equ 0FD7h ;# 
# 6625 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STATUS equ 0FD8h ;# 
# 6696 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2 equ 0FD9h ;# 
# 6703 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2L equ 0FD9h ;# 
# 6710 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2H equ 0FDAh ;# 
# 6717 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW2 equ 0FDBh ;# 
# 6724 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC2 equ 0FDCh ;# 
# 6731 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC2 equ 0FDDh ;# 
# 6738 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC2 equ 0FDEh ;# 
# 6745 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF2 equ 0FDFh ;# 
# 6752 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BSR equ 0FE0h ;# 
# 6759 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1 equ 0FE1h ;# 
# 6766 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1L equ 0FE1h ;# 
# 6773 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1H equ 0FE2h ;# 
# 6780 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW1 equ 0FE3h ;# 
# 6787 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC1 equ 0FE4h ;# 
# 6794 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC1 equ 0FE5h ;# 
# 6801 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC1 equ 0FE6h ;# 
# 6808 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF1 equ 0FE7h ;# 
# 6815 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WREG equ 0FE8h ;# 
# 6827 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0 equ 0FE9h ;# 
# 6834 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0L equ 0FE9h ;# 
# 6841 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0H equ 0FEAh ;# 
# 6848 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW0 equ 0FEBh ;# 
# 6855 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC0 equ 0FECh ;# 
# 6862 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC0 equ 0FEDh ;# 
# 6869 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC0 equ 0FEEh ;# 
# 6876 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF0 equ 0FEFh ;# 
# 6883 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON3 equ 0FF0h ;# 
# 6975 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON2 equ 0FF1h ;# 
# 7045 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON equ 0FF2h ;# 
# 7162 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PROD equ 0FF3h ;# 
# 7169 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODL equ 0FF3h ;# 
# 7176 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODH equ 0FF4h ;# 
# 7183 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TABLAT equ 0FF5h ;# 
# 7192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTR equ 0FF6h ;# 
# 7199 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRL equ 0FF6h ;# 
# 7206 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRH equ 0FF7h ;# 
# 7213 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRU equ 0FF8h ;# 
# 7222 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLAT equ 0FF9h ;# 
# 7229 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PC equ 0FF9h ;# 
# 7236 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCL equ 0FF9h ;# 
# 7243 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATH equ 0FFAh ;# 
# 7250 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATU equ 0FFBh ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STKPTR equ 0FFCh ;# 
# 7331 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOS equ 0FFDh ;# 
# 7338 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSL equ 0FFDh ;# 
# 7345 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSH equ 0FFEh ;# 
# 7352 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSU equ 0FFFh ;# 
# 54 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPMSK equ 0F77h ;# 
# 124 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SLRCON equ 0F78h ;# 
# 168 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON1 equ 0F79h ;# 
# 207 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM2CON0 equ 0F7Ah ;# 
# 277 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CM1CON0 equ 0F7Bh ;# 
# 347 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WPUB equ 0F7Ch ;# 
# 409 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IOCB equ 0F7Dh ;# 
# 448 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSEL equ 0F7Eh ;# 
# 510 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ANSELH equ 0F7Fh ;# 
# 554 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTA equ 0F80h ;# 
# 790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTB equ 0F81h ;# 
# 998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTC equ 0F82h ;# 
# 1186 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTD equ 0F83h ;# 
# 1328 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PORTE equ 0F84h ;# 
# 1534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATA equ 0F89h ;# 
# 1646 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATB equ 0F8Ah ;# 
# 1758 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATC equ 0F8Bh ;# 
# 1870 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATD equ 0F8Ch ;# 
# 1982 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LATE equ 0F8Dh ;# 
# 2034 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISA equ 0F92h ;# 
# 2039 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRA equ 0F92h ;# 
# 2256 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISB equ 0F93h ;# 
# 2261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRB equ 0F93h ;# 
# 2478 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISC equ 0F94h ;# 
# 2483 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRC equ 0F94h ;# 
# 2700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISD equ 0F95h ;# 
# 2705 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRD equ 0F95h ;# 
# 2922 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TRISE equ 0F96h ;# 
# 2927 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
DDRE equ 0F96h ;# 
# 3074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCTUNE equ 0F9Bh ;# 
# 3144 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE1 equ 0F9Dh ;# 
# 3221 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR1 equ 0F9Eh ;# 
# 3298 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR1 equ 0F9Fh ;# 
# 3375 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIE2 equ 0FA0h ;# 
# 3455 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PIR2 equ 0FA1h ;# 
# 3535 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
IPR2 equ 0FA2h ;# 
# 3615 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON1 equ 0FA6h ;# 
# 3681 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EECON2 equ 0FA7h ;# 
# 3688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEDATA equ 0FA8h ;# 
# 3695 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADR equ 0FA9h ;# 
# 3757 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
EEADRH equ 0FAAh ;# 
# 3783 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA equ 0FABh ;# 
# 3788 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCSTA1 equ 0FABh ;# 
# 3993 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA equ 0FACh ;# 
# 3998 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXSTA1 equ 0FACh ;# 
# 4249 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG equ 0FADh ;# 
# 4254 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TXREG1 equ 0FADh ;# 
# 4261 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG equ 0FAEh ;# 
# 4266 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCREG1 equ 0FAEh ;# 
# 4273 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG equ 0FAFh ;# 
# 4278 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRG1 equ 0FAFh ;# 
# 4285 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SPBRGH equ 0FB0h ;# 
# 4292 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T3CON equ 0FB1h ;# 
# 4404 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3 equ 0FB2h ;# 
# 4411 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3L equ 0FB2h ;# 
# 4418 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR3H equ 0FB3h ;# 
# 4425 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON2 equ 0FB4h ;# 
# 4452 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CVRCON equ 0FB5h ;# 
# 4531 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ECCP1AS equ 0FB6h ;# 
# 4613 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PWM1CON equ 0FB7h ;# 
# 4683 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCON equ 0FB8h ;# 
# 4688 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BAUDCTL equ 0FB8h ;# 
# 4849 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PSTRCON equ 0FB9h ;# 
# 4893 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP2CON equ 0FBAh ;# 
# 4957 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2 equ 0FBBh ;# 
# 4964 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2L equ 0FBBh ;# 
# 4971 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR2H equ 0FBCh ;# 
# 4978 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCP1CON equ 0FBDh ;# 
# 5060 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1 equ 0FBEh ;# 
# 5067 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1L equ 0FBEh ;# 
# 5074 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
CCPR1H equ 0FBFh ;# 
# 5081 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON2 equ 0FC0h ;# 
# 5152 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON1 equ 0FC1h ;# 
# 5203 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADCON0 equ 0FC2h ;# 
# 5322 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRES equ 0FC3h ;# 
# 5329 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESL equ 0FC3h ;# 
# 5336 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
ADRESH equ 0FC4h ;# 
# 5343 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON2 equ 0FC5h ;# 
# 5405 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPCON1 equ 0FC6h ;# 
# 5475 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPSTAT equ 0FC7h ;# 
# 5700 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPADD equ 0FC8h ;# 
# 5707 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
SSPBUF equ 0FC9h ;# 
# 5714 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T2CON equ 0FCAh ;# 
# 5785 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PR2 equ 0FCBh ;# 
# 5790 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
MEMCON equ 0FCBh ;# 
# 5895 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR2 equ 0FCCh ;# 
# 5902 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T1CON equ 0FCDh ;# 
# 6005 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1 equ 0FCEh ;# 
# 6012 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1L equ 0FCEh ;# 
# 6019 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR1H equ 0FCFh ;# 
# 6026 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
RCON equ 0FD0h ;# 
# 6159 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WDTCON equ 0FD1h ;# 
# 6187 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
HLVDCON equ 0FD2h ;# 
# 6192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
LVDCON equ 0FD2h ;# 
# 6457 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
OSCCON equ 0FD3h ;# 
# 6534 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
T0CON equ 0FD5h ;# 
# 6604 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0 equ 0FD6h ;# 
# 6611 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0L equ 0FD6h ;# 
# 6618 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TMR0H equ 0FD7h ;# 
# 6625 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STATUS equ 0FD8h ;# 
# 6696 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2 equ 0FD9h ;# 
# 6703 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2L equ 0FD9h ;# 
# 6710 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR2H equ 0FDAh ;# 
# 6717 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW2 equ 0FDBh ;# 
# 6724 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC2 equ 0FDCh ;# 
# 6731 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC2 equ 0FDDh ;# 
# 6738 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC2 equ 0FDEh ;# 
# 6745 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF2 equ 0FDFh ;# 
# 6752 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
BSR equ 0FE0h ;# 
# 6759 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1 equ 0FE1h ;# 
# 6766 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1L equ 0FE1h ;# 
# 6773 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR1H equ 0FE2h ;# 
# 6780 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW1 equ 0FE3h ;# 
# 6787 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC1 equ 0FE4h ;# 
# 6794 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC1 equ 0FE5h ;# 
# 6801 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC1 equ 0FE6h ;# 
# 6808 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF1 equ 0FE7h ;# 
# 6815 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
WREG equ 0FE8h ;# 
# 6827 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0 equ 0FE9h ;# 
# 6834 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0L equ 0FE9h ;# 
# 6841 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
FSR0H equ 0FEAh ;# 
# 6848 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PLUSW0 equ 0FEBh ;# 
# 6855 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PREINC0 equ 0FECh ;# 
# 6862 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTDEC0 equ 0FEDh ;# 
# 6869 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
POSTINC0 equ 0FEEh ;# 
# 6876 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INDF0 equ 0FEFh ;# 
# 6883 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON3 equ 0FF0h ;# 
# 6975 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON2 equ 0FF1h ;# 
# 7045 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
INTCON equ 0FF2h ;# 
# 7162 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PROD equ 0FF3h ;# 
# 7169 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODL equ 0FF3h ;# 
# 7176 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PRODH equ 0FF4h ;# 
# 7183 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TABLAT equ 0FF5h ;# 
# 7192 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTR equ 0FF6h ;# 
# 7199 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRL equ 0FF6h ;# 
# 7206 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRH equ 0FF7h ;# 
# 7213 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TBLPTRU equ 0FF8h ;# 
# 7222 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLAT equ 0FF9h ;# 
# 7229 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PC equ 0FF9h ;# 
# 7236 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCL equ 0FF9h ;# 
# 7243 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATH equ 0FFAh ;# 
# 7250 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
PCLATU equ 0FFBh ;# 
# 7257 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
STKPTR equ 0FFCh ;# 
# 7331 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOS equ 0FFDh ;# 
# 7338 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSL equ 0FFDh ;# 
# 7345 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSH equ 0FFEh ;# 
# 7352 "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\pic18f46k20.h"
TOSU equ 0FFFh ;# 
	FNCALL	_main,_DATAEE_ReadByte
	FNCALL	_main,_DATAEE_WriteByte
	FNCALL	_main,_SYSTEM_Initialize
	FNCALL	_SYSTEM_Initialize,_OSCILLATOR_Initialize
	FNCALL	_SYSTEM_Initialize,_PIN_MANAGER_Initialize
	FNROOT	_main
	global	_read_value
	global	_counter
	global	_PIR2bits
_PIR2bits	set	0xFA1
	global	_EEDATA
_EEDATA	set	0xFA8
	global	_EEADR
_EEADR	set	0xFA9
	global	_EEADRH
_EEADRH	set	0xFAA
	global	_EECON2
_EECON2	set	0xFA7
	global	_EECON1bits
_EECON1bits	set	0xFA6
	global	_TABLAT
_TABLAT	set	0xFF5
	global	_TBLPTRL
_TBLPTRL	set	0xFF6
	global	_TBLPTRH
_TBLPTRH	set	0xFF7
	global	_TBLPTRU
_TBLPTRU	set	0xFF8
	global	_PORTCbits
_PORTCbits	set	0xF82
	global	_OSCTUNE
_OSCTUNE	set	0xF9B
	global	_OSCCON
_OSCCON	set	0xFD3
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_INTCON2bits
_INTCON2bits	set	0xFF1
	global	_WPUB
_WPUB	set	0xF7C
	global	_ANSELH
_ANSELH	set	0xF7F
	global	_ANSEL
_ANSEL	set	0xF7E
	global	_TRISD
_TRISD	set	0xF95
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISB
_TRISB	set	0xF93
	global	_TRISA
_TRISA	set	0xF92
	global	_TRISE
_TRISE	set	0xF96
	global	_LATC
_LATC	set	0xF8B
	global	_LATB
_LATB	set	0xF8A
	global	_LATA
_LATA	set	0xF89
	global	_LATD
_LATD	set	0xF8C
	global	_LATE
_LATE	set	0xF8D
; #config settings
global __CFG_FOSC$HS
__CFG_FOSC$HS equ 0x0
global __CFG_FCMEN$OFF
__CFG_FCMEN$OFF equ 0x0
global __CFG_IESO$OFF
__CFG_IESO$OFF equ 0x0
global __CFG_PWRT$OFF
__CFG_PWRT$OFF equ 0x0
global __CFG_BOREN$SBORDIS
__CFG_BOREN$SBORDIS equ 0x0
global __CFG_BORV$18
__CFG_BORV$18 equ 0x0
global __CFG_WDTEN$OFF
__CFG_WDTEN$OFF equ 0x0
global __CFG_WDTPS$32768
__CFG_WDTPS$32768 equ 0x0
global __CFG_CCP2MX$PORTC
__CFG_CCP2MX$PORTC equ 0x0
global __CFG_PBADEN$ON
__CFG_PBADEN$ON equ 0x0
global __CFG_LPT1OSC$OFF
__CFG_LPT1OSC$OFF equ 0x0
global __CFG_HFOFST$ON
__CFG_HFOFST$ON equ 0x0
global __CFG_MCLRE$ON
__CFG_MCLRE$ON equ 0x0
global __CFG_STVREN$ON
__CFG_STVREN$ON equ 0x0
global __CFG_LVP$ON
__CFG_LVP$ON equ 0x0
global __CFG_XINST$OFF
__CFG_XINST$OFF equ 0x0
global __CFG_DEBUG$OFF
__CFG_DEBUG$OFF equ 0x0
global __CFG_CP0$OFF
__CFG_CP0$OFF equ 0x0
global __CFG_CP1$OFF
__CFG_CP1$OFF equ 0x0
global __CFG_CP2$OFF
__CFG_CP2$OFF equ 0x0
global __CFG_CP3$OFF
__CFG_CP3$OFF equ 0x0
global __CFG_CPB$OFF
__CFG_CPB$OFF equ 0x0
global __CFG_CPD$OFF
__CFG_CPD$OFF equ 0x0
global __CFG_WRT0$OFF
__CFG_WRT0$OFF equ 0x0
global __CFG_WRT1$OFF
__CFG_WRT1$OFF equ 0x0
global __CFG_WRT2$OFF
__CFG_WRT2$OFF equ 0x0
global __CFG_WRT3$OFF
__CFG_WRT3$OFF equ 0x0
global __CFG_WRTC$OFF
__CFG_WRTC$OFF equ 0x0
global __CFG_WRTB$OFF
__CFG_WRTB$OFF equ 0x0
global __CFG_WRTD$OFF
__CFG_WRTD$OFF equ 0x0
global __CFG_EBTR0$OFF
__CFG_EBTR0$OFF equ 0x0
global __CFG_EBTR1$OFF
__CFG_EBTR1$OFF equ 0x0
global __CFG_EBTR2$OFF
__CFG_EBTR2$OFF equ 0x0
global __CFG_EBTR3$OFF
__CFG_EBTR3$OFF equ 0x0
global __CFG_EBTRB$OFF
__CFG_EBTRB$OFF equ 0x0
	file	"dist/default/production\08_MPLAB_X_IDE_Internal_EEPROM.production.s"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssCOMRAM,class=COMRAM,space=1,noexec
global __pbssCOMRAM
__pbssCOMRAM:
	global	_read_value
_read_value:
       ds      1
	global	_counter
_counter:
       ds      1
	file	"dist/default/production\08_MPLAB_X_IDE_Internal_EEPROM.production.s"
	line	#
psect	cinit
; Clear objects allocated to COMRAM (2 bytes)
	global __pbssCOMRAM
clrf	(__pbssCOMRAM+1)&0xffh,c
clrf	(__pbssCOMRAM+0)&0xffh,c
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec
global __pcstackCOMRAM
__pcstackCOMRAM:
?_OSCILLATOR_Initialize:	; 1 bytes @ 0x0
??_OSCILLATOR_Initialize:	; 1 bytes @ 0x0
?_DATAEE_WriteByte:	; 1 bytes @ 0x0
?_DATAEE_ReadByte:	; 1 bytes @ 0x0
?_PIN_MANAGER_Initialize:	; 1 bytes @ 0x0
??_PIN_MANAGER_Initialize:	; 1 bytes @ 0x0
?_SYSTEM_Initialize:	; 1 bytes @ 0x0
??_SYSTEM_Initialize:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	DATAEE_WriteByte@bAdd
DATAEE_WriteByte@bAdd:	; 2 bytes @ 0x0
	global	DATAEE_ReadByte@bAdd
DATAEE_ReadByte@bAdd:	; 2 bytes @ 0x0
	ds   2
??_DATAEE_ReadByte:	; 1 bytes @ 0x2
	global	DATAEE_WriteByte@bData
DATAEE_WriteByte@bData:	; 1 bytes @ 0x2
	ds   1
??_DATAEE_WriteByte:	; 1 bytes @ 0x3
	global	DATAEE_WriteByte@GIEBitValue
DATAEE_WriteByte@GIEBitValue:	; 1 bytes @ 0x3
	ds   1
??_main:	; 1 bytes @ 0x4
	ds   2
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         2
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           95      6       8
;!    BANK0           160      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0
;!    BANK8           256      0       0
;!    BANK9           256      0       0
;!    BANK10          256      0       0
;!    BANK11          256      0       0
;!    BANK12          256      0       0
;!    BANK13          256      0       0
;!    BANK14          256      0       0
;!    BANK15           96      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAM
;!
;!    _main->_DATAEE_WriteByte
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.
;!
;!Critical Paths under _main in BANK8
;!
;!    None.
;!
;!Critical Paths under _main in BANK9
;!
;!    None.
;!
;!Critical Paths under _main in BANK10
;!
;!    None.
;!
;!Critical Paths under _main in BANK11
;!
;!    None.
;!
;!Critical Paths under _main in BANK12
;!
;!    None.
;!
;!Critical Paths under _main in BANK13
;!
;!    None.
;!
;!Critical Paths under _main in BANK14
;!
;!    None.
;!
;!Critical Paths under _main in BANK15
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 2     2      0     361
;!                                              4 COMRAM     2     2      0
;!                    _DATAEE_ReadByte
;!                   _DATAEE_WriteByte
;!                  _SYSTEM_Initialize
;! ---------------------------------------------------------------------------------
;! (1) _SYSTEM_Initialize                                    0     0      0       0
;!              _OSCILLATOR_Initialize
;!             _PIN_MANAGER_Initialize
;! ---------------------------------------------------------------------------------
;! (2) _PIN_MANAGER_Initialize                               0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _OSCILLATOR_Initialize                                0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _DATAEE_WriteByte                                     4     1      3     241
;!                                              0 COMRAM     4     1      3
;! ---------------------------------------------------------------------------------
;! (1) _DATAEE_ReadByte                                      2     0      2     120
;!                                              0 COMRAM     2     0      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 2
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _DATAEE_ReadByte
;!   _DATAEE_WriteByte
;!   _SYSTEM_Initialize
;!     _OSCILLATOR_Initialize
;!     _PIN_MANAGER_Initialize
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BIGRAM             F5F      0       0      37        0.0%
;!EEDATA             400      0       0       0        0.0%
;!BITBANK14          100      0       0      33        0.0%
;!BANK14             100      0       0      34        0.0%
;!BITBANK13          100      0       0      30        0.0%
;!BANK13             100      0       0      31        0.0%
;!BITBANK12          100      0       0      28        0.0%
;!BANK12             100      0       0      29        0.0%
;!BITBANK11          100      0       0      26        0.0%
;!BANK11             100      0       0      27        0.0%
;!BITBANK10          100      0       0      24        0.0%
;!BANK10             100      0       0      25        0.0%
;!BITBANK9           100      0       0      22        0.0%
;!BANK9              100      0       0      23        0.0%
;!BITBANK8           100      0       0      20        0.0%
;!BANK8              100      0       0      21        0.0%
;!BITBANK7           100      0       0      18        0.0%
;!BANK7              100      0       0      19        0.0%
;!BITBANK6           100      0       0      16        0.0%
;!BANK6              100      0       0      17        0.0%
;!BITBANK5           100      0       0      14        0.0%
;!BANK5              100      0       0      15        0.0%
;!BITBANK4           100      0       0      12        0.0%
;!BANK4              100      0       0      13        0.0%
;!BITBANK3           100      0       0      10        0.0%
;!BANK3              100      0       0      11        0.0%
;!BITBANK2           100      0       0       8        0.0%
;!BANK2              100      0       0       9        0.0%
;!BITBANK1           100      0       0       6        0.0%
;!BANK1              100      0       0       7        0.0%
;!BITBANK0            A0      0       0       4        0.0%
;!BANK0               A0      0       0       5        0.0%
;!BITBANK15           60      0       0      35        0.0%
;!BANK15              60      0       0      36        0.0%
;!BITCOMRAM           5F      0       0       0        0.0%
;!COMRAM              5F      6       8       1        8.4%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%
;!STACK                0      0       0       2        0.0%
;!NULL                 0      0       0       0        0.0%
;!ABS                  0      0       8      32        0.0%
;!DATA                 0      0       8       3        0.0%
;!CODE                 0      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DATAEE_ReadByte
;;		_DATAEE_WriteByte
;;		_SYSTEM_Initialize
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	6
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	opt	callstack 29
	line	9
	
l1029:
;main.c: 9:     SYSTEM_Initialize();
	call	_SYSTEM_Initialize	;wreg free
	line	13
	
l1031:
;main.c: 11:     {;main.c: 13:         DATAEE_WriteByte(0x88, counter);
	movlw	high(088h)
	movwf	((c:DATAEE_WriteByte@bAdd+1))^00h,c
	movlw	low(088h)
	movwf	((c:DATAEE_WriteByte@bAdd))^00h,c
	movff	(c:_counter),(c:DATAEE_WriteByte@bData)
	call	_DATAEE_WriteByte	;wreg free
	line	14
	
l1033:
;main.c: 14:         counter++;
	incf	((c:_counter))^00h,c
	line	15
	
l1035:
;main.c: 15:         _delay((unsigned long)((1000)*(8000000/4000.0)));
	opt asmopt_push
opt asmopt_off
movlw  11
movwf	(??_main+0+0+1)^00h,c,f
movlw	38
movwf	(??_main+0+0)^00h,c,f
	movlw	94
u167:
decfsz	wreg,f
	bra	u167
	decfsz	(??_main+0+0)^00h,c,f
	bra	u167
	decfsz	(??_main+0+0+1)^00h,c,f
	bra	u167
opt asmopt_pop

	line	16
	
l1037:
;main.c: 16:         read_value = DATAEE_ReadByte(0x88);
	movlw	high(088h)
	movwf	((c:DATAEE_ReadByte@bAdd+1))^00h,c
	movlw	low(088h)
	movwf	((c:DATAEE_ReadByte@bAdd))^00h,c
	call	_DATAEE_ReadByte	;wreg free
	movwf	((c:_read_value))^00h,c
	line	17
	
l1039:
;main.c: 17:         if(10 == read_value){
		movlw	10
	xorwf	((c:_read_value))^00h,c,w
	btfss	status,2
	goto	u151
	goto	u150

u151:
	goto	l70
u150:
	line	18
	
l1041:
;main.c: 18:             PORTCbits.RC0 = 1;
	bsf	((c:3970))^0f00h,c,0	;volatile
	line	19
;main.c: 19:         }
	goto	l1031
	line	20
;main.c: 20:         else{
	
l70:
	line	21
;main.c: 21:             PORTCbits.RC0 = 0;
	bcf	((c:3970))^0f00h,c,0	;volatile
	goto	l1031
	global	start
	goto	start
	opt callstack 0
	line	24
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_SYSTEM_Initialize

;; *************** function _SYSTEM_Initialize *****************
;; Defined at:
;;		line 50 in file "mcc_generated_files/mcc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_OSCILLATOR_Initialize
;;		_PIN_MANAGER_Initialize
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	file	"mcc_generated_files/mcc.c"
	line	50
global __ptext1
__ptext1:
psect	text1
	file	"mcc_generated_files/mcc.c"
	line	50
	global	__size_of_SYSTEM_Initialize
	__size_of_SYSTEM_Initialize	equ	__end_of_SYSTEM_Initialize-_SYSTEM_Initialize
	
_SYSTEM_Initialize:
;incstack = 0
	opt	callstack 29
	line	53
	
l829:
;mcc_generated_files/mcc.c: 53:     PIN_MANAGER_Initialize();
	call	_PIN_MANAGER_Initialize	;wreg free
	line	54
;mcc_generated_files/mcc.c: 54:     OSCILLATOR_Initialize();
	call	_OSCILLATOR_Initialize	;wreg free
	line	55
	
l47:
	return	;funcret
	opt callstack 0
GLOBAL	__end_of_SYSTEM_Initialize
	__end_of_SYSTEM_Initialize:
	signat	_SYSTEM_Initialize,89
	global	_PIN_MANAGER_Initialize

;; *************** function _PIN_MANAGER_Initialize *****************
;; Defined at:
;;		line 55 in file "mcc_generated_files/pin_manager.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SYSTEM_Initialize
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	file	"mcc_generated_files/pin_manager.c"
	line	55
global __ptext2
__ptext2:
psect	text2
	file	"mcc_generated_files/pin_manager.c"
	line	55
	global	__size_of_PIN_MANAGER_Initialize
	__size_of_PIN_MANAGER_Initialize	equ	__end_of_PIN_MANAGER_Initialize-_PIN_MANAGER_Initialize
	
_PIN_MANAGER_Initialize:
;incstack = 0
	opt	callstack 29
	line	60
	
l815:
;mcc_generated_files/pin_manager.c: 60:     LATE = 0x00;
	movlw	low(0)
	movwf	((c:3981))^0f00h,c	;volatile
	line	61
;mcc_generated_files/pin_manager.c: 61:     LATD = 0x00;
	movlw	low(0)
	movwf	((c:3980))^0f00h,c	;volatile
	line	62
;mcc_generated_files/pin_manager.c: 62:     LATA = 0x00;
	movlw	low(0)
	movwf	((c:3977))^0f00h,c	;volatile
	line	63
;mcc_generated_files/pin_manager.c: 63:     LATB = 0x00;
	movlw	low(0)
	movwf	((c:3978))^0f00h,c	;volatile
	line	64
;mcc_generated_files/pin_manager.c: 64:     LATC = 0x00;
	movlw	low(0)
	movwf	((c:3979))^0f00h,c	;volatile
	line	69
;mcc_generated_files/pin_manager.c: 69:     TRISE = 0x07;
	movlw	low(07h)
	movwf	((c:3990))^0f00h,c	;volatile
	line	70
	
l817:
;mcc_generated_files/pin_manager.c: 70:     TRISA = 0xFF;
	setf	((c:3986))^0f00h,c	;volatile
	line	71
	
l819:
;mcc_generated_files/pin_manager.c: 71:     TRISB = 0xFF;
	setf	((c:3987))^0f00h,c	;volatile
	line	72
;mcc_generated_files/pin_manager.c: 72:     TRISC = 0x00;
	movlw	low(0)
	movwf	((c:3988))^0f00h,c	;volatile
	line	73
	
l821:
;mcc_generated_files/pin_manager.c: 73:     TRISD = 0xFF;
	setf	((c:3989))^0f00h,c	;volatile
	line	78
	
l823:
;mcc_generated_files/pin_manager.c: 78:     ANSEL = 0xFF;
	setf	((c:3966))^0f00h,c	;volatile
	line	79
;mcc_generated_files/pin_manager.c: 79:     ANSELH = 0x1F;
	movlw	low(01Fh)
	movwf	((c:3967))^0f00h,c	;volatile
	line	84
;mcc_generated_files/pin_manager.c: 84:     WPUB = 0x00;
	movlw	low(0)
	movwf	((c:3964))^0f00h,c	;volatile
	line	85
	
l825:
;mcc_generated_files/pin_manager.c: 85:     INTCON2bits.nRBPU = 1;
	bsf	((c:4081))^0f00h,c,7	;volatile
	line	94
	
l33:
	return	;funcret
	opt callstack 0
GLOBAL	__end_of_PIN_MANAGER_Initialize
	__end_of_PIN_MANAGER_Initialize:
	signat	_PIN_MANAGER_Initialize,89
	global	_OSCILLATOR_Initialize

;; *************** function _OSCILLATOR_Initialize *****************
;; Defined at:
;;		line 57 in file "mcc_generated_files/mcc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SYSTEM_Initialize
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,group=0
	file	"mcc_generated_files/mcc.c"
	line	57
global __ptext3
__ptext3:
psect	text3
	file	"mcc_generated_files/mcc.c"
	line	57
	global	__size_of_OSCILLATOR_Initialize
	__size_of_OSCILLATOR_Initialize	equ	__end_of_OSCILLATOR_Initialize-_OSCILLATOR_Initialize
	
_OSCILLATOR_Initialize:
;incstack = 0
	opt	callstack 29
	line	60
	
l827:
;mcc_generated_files/mcc.c: 60:     OSCCON = 0x30;
	movlw	low(030h)
	movwf	((c:4051))^0f00h,c	;volatile
	line	62
;mcc_generated_files/mcc.c: 62:     OSCTUNE = 0x00;
	movlw	low(0)
	movwf	((c:3995))^0f00h,c	;volatile
	line	63
	
l50:
	return	;funcret
	opt callstack 0
GLOBAL	__end_of_OSCILLATOR_Initialize
	__end_of_OSCILLATOR_Initialize:
	signat	_OSCILLATOR_Initialize,89
	global	_DATAEE_WriteByte

;; *************** function _DATAEE_WriteByte *****************
;; Defined at:
;;		line 173 in file "mcc_generated_files/memory.c"
;; Parameters:    Size  Location     Type
;;  bAdd            2    0[COMRAM] unsigned short 
;;  bData           1    2[COMRAM] unsigned char 
;; Auto vars:     Size  Location     Type
;;  GIEBitValue     1    3[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	file	"mcc_generated_files/memory.c"
	line	173
global __ptext4
__ptext4:
psect	text4
	file	"mcc_generated_files/memory.c"
	line	173
	global	__size_of_DATAEE_WriteByte
	__size_of_DATAEE_WriteByte	equ	__end_of_DATAEE_WriteByte-_DATAEE_WriteByte
	
_DATAEE_WriteByte:
;incstack = 0
	opt	callstack 30
	line	175
	
l989:
;mcc_generated_files/memory.c: 173: void DATAEE_WriteByte(uint16_t bAdd, uint8_t bData);mcc_generated_files/memory.c: 174: {;mcc_generated_files/memory.c: 175:     uint8_t GIEBitValue = INTCONbits.GIE;
	movlw	0
	btfsc	((c:4082))^0f00h,c,7	;volatile
	movlw	1
	movwf	((c:DATAEE_WriteByte@GIEBitValue))^00h,c
	line	177
	
l991:
;mcc_generated_files/memory.c: 177:     EEADRH = ((bAdd >> 8) & 0x03);
	movf	((c:DATAEE_WriteByte@bAdd+1))^00h,c,w
	andlw	low(03h)
	movwf	((c:4010))^0f00h,c	;volatile
	line	178
	
l993:
;mcc_generated_files/memory.c: 178:     EEADR = (bAdd & 0xFF);
	movff	(c:DATAEE_WriteByte@bAdd),(c:4009)	;volatile
	line	179
	
l995:
;mcc_generated_files/memory.c: 179:     EEDATA = bData;
	movff	(c:DATAEE_WriteByte@bData),(c:4008)	;volatile
	line	180
	
l997:
;mcc_generated_files/memory.c: 180:     EECON1bits.EEPGD = 0;
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	181
	
l999:
;mcc_generated_files/memory.c: 181:     EECON1bits.CFGS = 0;
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	182
	
l1001:
;mcc_generated_files/memory.c: 182:     EECON1bits.WREN = 1;
	bsf	((c:4006))^0f00h,c,2	;volsfr
	line	183
	
l1003:
;mcc_generated_files/memory.c: 183:     INTCONbits.GIE = 0;
	bcf	((c:4082))^0f00h,c,7	;volatile
	line	184
	
l1005:
;mcc_generated_files/memory.c: 184:     EECON2 = 0x55;
	movlw	low(055h)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	185
	
l1007:
;mcc_generated_files/memory.c: 185:     EECON2 = 0xAA;
	movlw	low(0AAh)
	movwf	((c:4007))^0f00h,c	;volsfr
	line	186
	
l1009:
;mcc_generated_files/memory.c: 186:     EECON1bits.WR = 1;
	bsf	((c:4006))^0f00h,c,1	;volsfr
	line	190
;mcc_generated_files/memory.c: 189:     {;mcc_generated_files/memory.c: 190:     }
	
l130:
	line	188
;mcc_generated_files/memory.c: 188:     while (EECON1bits.WR)
	btfsc	((c:4006))^0f00h,c,1	;volsfr
	goto	u131
	goto	u130
u131:
	goto	l130
u130:
	
l132:
	line	192
;mcc_generated_files/memory.c: 192:     EECON1bits.WREN = 0;
	bcf	((c:4006))^0f00h,c,2	;volsfr
	line	193
;mcc_generated_files/memory.c: 193:     INTCONbits.GIE = GIEBitValue;
	btfsc	(c:DATAEE_WriteByte@GIEBitValue)^00h,c,0
	bra	u145
	bcf	((c:4082))^0f00h,c,7	;volatile
	bra	u146
	u145:
	bsf	((c:4082))^0f00h,c,7	;volatile
	u146:

	line	194
	
l133:
	return	;funcret
	opt callstack 0
GLOBAL	__end_of_DATAEE_WriteByte
	__end_of_DATAEE_WriteByte:
	signat	_DATAEE_WriteByte,8313
	global	_DATAEE_ReadByte

;; *************** function _DATAEE_ReadByte *****************
;; Defined at:
;;		line 196 in file "mcc_generated_files/memory.c"
;; Parameters:    Size  Location     Type
;;  bAdd            2    0[COMRAM] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12  BANK13  BANK14  BANK15
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	196
global __ptext5
__ptext5:
psect	text5
	file	"mcc_generated_files/memory.c"
	line	196
	global	__size_of_DATAEE_ReadByte
	__size_of_DATAEE_ReadByte	equ	__end_of_DATAEE_ReadByte-_DATAEE_ReadByte
	
_DATAEE_ReadByte:
;incstack = 0
	opt	callstack 30
	line	198
	
l1011:
;mcc_generated_files/memory.c: 196: uint8_t DATAEE_ReadByte(uint16_t bAdd);mcc_generated_files/memory.c: 197: {;mcc_generated_files/memory.c: 198:     EEADRH = ((bAdd >> 8) & 0x03);
	movf	((c:DATAEE_ReadByte@bAdd+1))^00h,c,w
	andlw	low(03h)
	movwf	((c:4010))^0f00h,c	;volatile
	line	199
	
l1013:
;mcc_generated_files/memory.c: 199:     EEADR = (bAdd & 0xFF);
	movff	(c:DATAEE_ReadByte@bAdd),(c:4009)	;volatile
	line	200
	
l1015:
;mcc_generated_files/memory.c: 200:     EECON1bits.CFGS = 0;
	bcf	((c:4006))^0f00h,c,6	;volsfr
	line	201
	
l1017:
;mcc_generated_files/memory.c: 201:     EECON1bits.EEPGD = 0;
	bcf	((c:4006))^0f00h,c,7	;volsfr
	line	202
	
l1019:
;mcc_generated_files/memory.c: 202:     EECON1bits.RD = 1;
	bsf	((c:4006))^0f00h,c,0	;volsfr
	line	203
	
l1021:
;mcc_generated_files/memory.c: 203:     __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	204
	
l1023:
;mcc_generated_files/memory.c: 204:     __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	206
	
l1025:
;mcc_generated_files/memory.c: 206:     return (EEDATA);
	movf	((c:4008))^0f00h,c,w	;volatile
	line	207
	
l136:
	return	;funcret
	opt callstack 0
GLOBAL	__end_of_DATAEE_ReadByte
	__end_of_DATAEE_ReadByte:
	signat	_DATAEE_ReadByte,4217
	GLOBAL	__activetblptr
__activetblptr	EQU	0
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
