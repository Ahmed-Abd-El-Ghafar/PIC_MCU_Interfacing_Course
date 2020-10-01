
	; Microchip MPLAB XC8 C Compiler V2.10
	; Copyright (C) 2019 Microchip Technology Inc.

	; Auto-generated runtime startup code for final link stage.

	;
	; Compiler options:
	;
	; -q --opt=none --chip=18f46k20 \
	; -Mdist/default/production/05_MPLAB_X_IDE_LED_and_7-Segments_Interfacing.production.map \
	; -DXPRJ_default=default -L--defsym=__MPLAB_BUILD=1 --double=32 \
	; --float=32 --emi=wordwrite --opt=+asmfile --addrqual=ignore -P \
	; --warn=-3 --asmlist --summary=+psect,+class,+mem,+hex,+file \
	; --output=+inhx032 --runtime=+clear --runtime=+init --runtime=+keep \
	; --runtime=-download --runtime=+config --std=c99 \
	; --output=+elf:multilocs --stack=compiled:auto:auto:auto \
	; --summary=+xml --summarydir=dist/default/production/memoryfile.xml \
	; -o05_MPLAB_X_IDE_LED_and_7-Segments_Interfacing.production.elf \
	; --objdir=dist/default/production --outdir=dist/default/production \
	; build/default/production/ECU Layer/seven_seg.p1 \
	; build/default/production/mcc_generated_files/pin_manager.p1 \
	; build/default/production/mcc_generated_files/mcc.p1 \
	; build/default/production/mcc_generated_files/device_config.p1 \
	; build/default/production/main.p1 \
	; build/default/production/seven_seg_cfg.p1 \
	; --errformat=%f:%l:%c: error: (%n) %s \
	; --warnformat=%f:%l:%c: warning: (%n) %s \
	; --msgformat=%f:%l:%c: advisory: (%n) %s
	;


	processor	18F46K20
	opt include "C:\Program Files (x86)\Microchip\xc8\v2.10\pic\include\18f46k20.cgen.inc"

	GLOBAL	_main,start
	FNROOT	_main

	pic18cxx	equ	1

	psect	config,class=CONFIG,delta=1,noexec
	psect	idloc,class=IDLOC,delta=1,noexec
	psect	const,class=CONST,delta=1,reloc=2,noexec
	psect	smallconst,class=SMALLCONST,delta=1,reloc=2,noexec
	psect	mediumconst,class=MEDIUMCONST,delta=1,reloc=2,noexec
	psect	rbss,class=COMRAM,space=1,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	rdata,class=COMRAM,space=1,noexec
	psect	irdata,class=CODE,space=0,reloc=2,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	data,class=RAM,space=1,noexec
	psect	idata,class=CODE,space=0,reloc=2,noexec
	psect	nvrram,class=COMRAM,space=1,noexec
	psect	nvbit,class=COMRAM,bit,space=1,noexec
	psect	temp,ovrld,class=COMRAM,space=1,noexec
	psect	struct,ovrld,class=COMRAM,space=1,noexec
	psect	rbit,class=COMRAM,bit,space=1,noexec
	psect	bigbss,class=BIGRAM,space=1,noexec
	psect	bigdata,class=BIGRAM,space=1,noexec
	psect	ibigdata,class=CODE,space=0,reloc=2,noexec
	psect	farbss,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	nvFARRAM,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	fardata,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	ifardata,class=CODE,space=0,reloc=2,delta=1,noexec

	psect	reset_vec,class=CODE,delta=1,reloc=2
	psect	powerup,class=CODE,delta=1,reloc=2
	psect	init,class=CODE,delta=1,reloc=2
	psect	text,class=CODE,delta=1,reloc=2
GLOBAL	intlevel0,intlevel1,intlevel2
intlevel0:
intlevel1:
intlevel2:
GLOBAL	intlevel3
intlevel3:
	psect	clrtext,class=CODE,delta=1,reloc=2

	psect	intcode,class=CODE,delta=1,reloc=2
	psect	intcode_body,class=CODE,delta=1,reloc=2
	psect	intcodelo,class=CODE,delta=1,reloc=2
	psect	intret,class=CODE,delta=1,reloc=2
	psect	intentry,class=CODE,delta=1,reloc=2
	psect	intsave_regs,class=BIGRAM,space=1

	psect	eeprom_data,class=EEDATA,delta=1,noexec
	psect	smallconst
	GLOBAL	__smallconst
__smallconst:
	psect	mediumconst
	GLOBAL	__mediumconst
__mediumconst:
	PSECT	ramtop,class=RAM,noexec
	GLOBAL	__S1			; top of RAM usage
	GLOBAL	__ramtop
	GLOBAL	__LRAM,__HRAM
__ramtop:

	psect	reset_vec
reset_vec:
	; No powerup routine
	; No interrupt routine
	GLOBAL __accesstop
__accesstop EQU 96

;Initialize the stack pointer (FSR1)
	global stacklo, stackhi
	stacklo	equ	060h
	stackhi	equ	0F5Fh


	psect	stack,class=STACK,space=2,noexec
	global ___sp,___inthi_sp,___intlo_sp
___sp:
___inthi_sp:
___intlo_sp:



	psect	init
start:
	global start_initialization
	goto start_initialization	;jump to C runtime clear & initialization

; Config register IDLOC0 @ 0x200000
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x0
		db 0xFF

; Config register IDLOC1 @ 0x200001
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x1
		db 0xFF

; Config register IDLOC2 @ 0x200002
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x2
		db 0xFF

; Config register IDLOC3 @ 0x200003
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x3
		db 0xFF

; Config register IDLOC4 @ 0x200004
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x4
		db 0xFF

; Config register IDLOC5 @ 0x200005
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x5
		db 0xFF

; Config register IDLOC6 @ 0x200006
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x6
		db 0xFF

; Config register IDLOC7 @ 0x200007
;	unspecified using default value

	psect	idloc,class=IDLOC,delta=1,noexec
		org 0x7
		db 0xFF

; Padding undefined space
	psect	config,class=CONFIG,delta=1,noexec
		org 0x0
		db 0xFF

; Config register CONFIG1H @ 0x300001
;	Oscillator Selection bits
;	FOSC = HS, HS oscillator
;	Fail-Safe Clock Monitor Enable bit
;	FCMEN = OFF, Fail-Safe Clock Monitor disabled
;	Internal/External Oscillator Switchover bit
;	IESO = OFF, Oscillator Switchover mode disabled

	psect	config,class=CONFIG,delta=1,noexec
		org 0x1
		db 0x2

; Config register CONFIG2L @ 0x300002
;	Power-up Timer Enable bit
;	PWRT = OFF, PWRT disabled
;	Brown-out Reset Enable bits
;	BOREN = SBORDIS, Brown-out Reset enabled in hardware only (SBOREN is disabled)
;	Brown Out Reset Voltage bits
;	BORV = 18, VBOR set to 1.8 V nominal

	psect	config,class=CONFIG,delta=1,noexec
		org 0x2
		db 0x1F

; Config register CONFIG2H @ 0x300003
;	Watchdog Timer Enable bit
;	WDTEN = OFF, WDT is controlled by SWDTEN bit of the WDTCON register
;	Watchdog Timer Postscale Select bits
;	WDTPS = 32768, 1:32768

	psect	config,class=CONFIG,delta=1,noexec
		org 0x3
		db 0x1E

; Padding undefined space
	psect	config,class=CONFIG,delta=1,noexec
		org 0x4
		db 0xFF

; Config register CONFIG3H @ 0x300005
;	CCP2 MUX bit
;	CCP2MX = PORTC, CCP2 input/output is multiplexed with RC1
;	PORTB A/D Enable bit
;	PBADEN = ON, PORTB<4:0> pins are configured as analog input channels on Reset
;	Low-Power Timer1 Oscillator Enable bit
;	LPT1OSC = OFF, Timer1 configured for higher power operation
;	HFINTOSC Fast Start-up
;	HFOFST = ON, HFINTOSC starts clocking the CPU without waiting for the oscillator to stablize.
;	MCLR Pin Enable bit
;	MCLRE = ON, MCLR pin enabled; RE3 input pin disabled

	psect	config,class=CONFIG,delta=1,noexec
		org 0x5
		db 0x8B

; Config register CONFIG4L @ 0x300006
;	Stack Full/Underflow Reset Enable bit
;	STVREN = ON, Stack full/underflow will cause Reset
;	Single-Supply ICSP Enable bit
;	LVP = ON, Single-Supply ICSP enabled
;	Extended Instruction Set Enable bit
;	XINST = OFF, Instruction set extension and Indexed Addressing mode disabled (Legacy mode)
;	Background Debugger Enable bit
;	DEBUG = OFF, Background debugger disabled, RB6 and RB7 configured as general purpose I/O pins

	psect	config,class=CONFIG,delta=1,noexec
		org 0x6
		db 0x85

; Padding undefined space
	psect	config,class=CONFIG,delta=1,noexec
		org 0x7
		db 0xFF

; Config register CONFIG5L @ 0x300008
;	Code Protection Block 0
;	CP0 = OFF, Block 0 (000800-003FFFh) not code-protected
;	Code Protection Block 1
;	CP1 = OFF, Block 1 (004000-007FFFh) not code-protected
;	Code Protection Block 2
;	CP2 = OFF, Block 2 (008000-00BFFFh) not code-protected
;	Code Protection Block 3
;	CP3 = OFF, Block 3 (00C000-00FFFFh) not code-protected

	psect	config,class=CONFIG,delta=1,noexec
		org 0x8
		db 0xF

; Config register CONFIG5H @ 0x300009
;	Boot Block Code Protection bit
;	CPB = OFF, Boot block (000000-0007FFh) not code-protected
;	Data EEPROM Code Protection bit
;	CPD = OFF, Data EEPROM not code-protected

	psect	config,class=CONFIG,delta=1,noexec
		org 0x9
		db 0xC0

; Config register CONFIG6L @ 0x30000A
;	Write Protection Block 0
;	WRT0 = OFF, Block 0 (000800-003FFFh) not write-protected
;	Write Protection Block 1
;	WRT1 = OFF, Block 1 (004000-007FFFh) not write-protected
;	Write Protection Block 2
;	WRT2 = OFF, Block 2 (008000-00BFFFh) not write-protected
;	Write Protection Block 3
;	WRT3 = OFF, Block 3 (00C000h-00FFFFh) not write-protected

	psect	config,class=CONFIG,delta=1,noexec
		org 0xA
		db 0xF

; Config register CONFIG6H @ 0x30000B
;	Configuration Register Write Protection bit
;	WRTC = OFF, Configuration registers (300000-3000FFh) not write-protected
;	Boot Block Write Protection bit
;	WRTB = OFF, Boot Block (000000-0007FFh) not write-protected
;	Data EEPROM Write Protection bit
;	WRTD = OFF, Data EEPROM not write-protected

	psect	config,class=CONFIG,delta=1,noexec
		org 0xB
		db 0xE0

; Config register CONFIG7L @ 0x30000C
;	Table Read Protection Block 0
;	EBTR0 = OFF, Block 0 (000800-003FFFh) not protected from table reads executed in other blocks
;	Table Read Protection Block 1
;	EBTR1 = OFF, Block 1 (004000-007FFFh) not protected from table reads executed in other blocks
;	Table Read Protection Block 2
;	EBTR2 = OFF, Block 2 (008000-00BFFFh) not protected from table reads executed in other blocks
;	Table Read Protection Block 3
;	EBTR3 = OFF, Block 3 (00C000-00FFFFh) not protected from table reads executed in other blocks

	psect	config,class=CONFIG,delta=1,noexec
		org 0xC
		db 0xF

; Config register CONFIG7H @ 0x30000D
;	Boot Block Table Read Protection bit
;	EBTRB = OFF, Boot Block (000000-0007FFh) not protected from table reads executed in other blocks

	psect	config,class=CONFIG,delta=1,noexec
		org 0xD
		db 0x40


psect comram,class=COMRAM,space=1
psect abs1,class=ABS1,space=1
psect bigram,class=BIGRAM,space=1
psect ram,class=RAM,space=1
psect bank0,class=BANK0,space=1
psect bank1,class=BANK1,space=1
psect bank2,class=BANK2,space=1
psect bank3,class=BANK3,space=1
psect bank4,class=BANK4,space=1
psect bank5,class=BANK5,space=1
psect bank6,class=BANK6,space=1
psect bank7,class=BANK7,space=1
psect bank8,class=BANK8,space=1
psect bank9,class=BANK9,space=1
psect bank10,class=BANK10,space=1
psect bank11,class=BANK11,space=1
psect bank12,class=BANK12,space=1
psect bank13,class=BANK13,space=1
psect bank14,class=BANK14,space=1
psect bank15,class=BANK15,space=1
psect sfr,class=SFR,space=1


	end	start
