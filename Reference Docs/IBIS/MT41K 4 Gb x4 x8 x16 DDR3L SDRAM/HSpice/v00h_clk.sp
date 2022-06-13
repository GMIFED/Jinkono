*                         MICRON HSPICE MODEL
*
* Disclaimer: This software code and all associated documentation, comments
*             or other information (collectively "Software") is provided
*             "AS IS" without warranty of any kind. MICRON TECHNOLOGY, INC.
*             ("MTI") EXPRESSLY DISCLAIMS ALL WARRANTIES EXPRESS OR IMPLIED,
*             INCLUDING BUT NOT LIMITED TO, NONINFRINGEMENT OF THIRD PARTY
*             RIGHTS, AND ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS
*             FOR ANY PARTICULAR PURPOSE. MTI DOES NOT WARRANT THAT THE
*             SOFTWARE WILL MEET YOUR REQUIREMENTS, OR THAT THE OPERATION OF
*             THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE. FURTHERMORE,
*             MTI DOES NOT MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE
*             RESULTS OF THE USE OF THE SOFTWARE IN TERMS OF ITS CORRECTNESS,
*             ACCURACY, RELIABILITY, OR OTHERWISE. THE ENTIRE RISK ARISING OUT
*             OF USE OR PERFORMANCE OF THE SOFTWARE REMAINS WITH YOU. IN NO
*             EVENT SHALL MTI, ITS AFFILIATED COMPANIES OR THEIR SUPPLIERS BE
*             LIABLE FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, INCIDENTAL, OR
*             SPECIAL DAMAGES (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS
*             OF PROFITS, BUSINESS INTERRUPTION, OR LOSS OF INFORMATION)
*             ARISING OUT OF YOUR USE OF OR INABILITY TO USE THE SOFTWARE,
*             EVEN IF MTI HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
*             Because some jurisdictions prohibit the exclusion or limitation
*             of liability for consequential or incidental damages, the above
*             limitation may not apply to you.
* 
*             Copyright 2015 Micron Technology, Inc. All rights reserved.
*
****************** 1Gx4, 512Megx8, 256Megx16 DDR3 SDRAM **********************
*************** Example HSPICE setup file for CLK/CLK# inputs ****************
****
****************************************************************
****               ___                                         *
****              /  +|-CLKPAD----\/\/\/--@@@@-----IN_PKG      *
****     CLKOUT--{   -|-CLKPAD_--| R_pkg  L_pkg |              *
****              \___|-RCVREN   |             ===C_pkg        *
****                             |              |              *
****                             |             GND             *
****                             |                             *
****                             -\/\/\/--@@@@-----INN_PKG     *
****                              Rn_pkg Ln_pkg |              *
****                                           ===Cn_pkg       *
****                                            |              *
****                                           GND             *
****************************************************************
****
**** This netlist is for the x4, x8, x16 4Gb DDR3 SDRAM
**** The input signals are IN_PKG and INN_PKG.
**** The output of the input receiver circuit is the node CLKOUT.
**** To account for package parasitics correlative impedance values
**** X_pkg_pad has been attached to the PAD node.
****
**** NOTE: This spice file is not designed to match datasheet timing numbers.
****       Delay times are smaller than those given in the data sheet
****
**** The .LIB statement selects the following simulation corners:
****   LIB           DATARATE        PROCESS  DIE CAP  VDD/VDDQ  TEMPERATURE
****   ---           --------        -------  -------  --------  -----------
****   TYP_1066      1066 Mbps       Typical  Typical  1.350V    50C
****   SLOW_1066     1066 Mbps       Weak     Maximum  1.283V    110C
****   FAST_1066     1066 Mbps       Strong   Minimum  1.425V    0C
****
****   TYP_1066      1333/1600 Mbps  Typical  Typical  1.350V    50C
****   SLOW_1066     1333/1600 Mbps  Weak     Maximum  1.283V    110C
****   FAST_1066     1333/1600 Mbps  Strong   Minimum  1.425V    0C
****
****   TYP_1066      1866 Mbps       Typical  Typical  1.350V    50C
****   SLOW_1066     1866 Mbps       Weak     Maximum  1.283V    110C
****   FAST_1066     1866 Mbps       Strong   Minimum  1.425V    0C
****
****   TYP_2133      2133 Mbps       Typical  Typical  1.350V    50C
****   SLOW_2133     2133 Mbps       Typical  Maximum  1.283V    110C
****   FAST_2133     2133 Mbps       Strong   Minimum  1.425V    0C
****
****   TYP_1066_IT   1066 Mbps       Typical  Typical  1.350V    50C
****   SLOW_1066_IT  1066 Mbps       Weak     Maximum  1.283V    110C
****   FAST_1066_IT  1066 Mbps       Strong   Minimum  1.425V    -40C
****
****   TYP_1066_IT   1600/1333 Mbps  Typical  Typical  1.350V    50C
****   SLOW_1066_IT  1600/1333 Mbps  Weak     Maximum  1.283V    110C
****   FAST_1066_IT  1600/1333 Mbps  Strong   Minimum  1.425V    -40C
****
****   TYP_1066_IT   1866 Mbps       Typical  Typical  1.350V    50C
****   SLOW_1066_IT  1866 Mbps       Weak     Maximum  1.283V    110C
****   FAST_1066_IT  1866 Mbps       Strong   Minimum  1.425V    -40C
****
****   TYP_2133_IT   2133 Mbps       Typical  Typical  1.350V    50C
****   SLOW_2133_IT  2133 Mbps       Typical  Maximum  1.283V    110C
****   FAST_2133_IT  2133 Mbps       Strong   Minimum  1.425V    -40C
****
**** To run this simulation, the files "v00h_1p35_model.cnr" and "v00h_clkbuff.inc"
**** are required to be in the same directory as this netlist.
****
**** Commercial Temperature settings are: Typical 50C, Slow 110C, Fast 0C
**** Industrial Temperature settings are: Typical 50C, Slow 110C, Fast -40C
****************************************************************

.OPTIONS POST
.OPTIONS METHOD=GEAR
.OPTIONS SEARCH=' '  $This option must be present for decryption to work
.OPTIONS HIER_SCALE=1

.TRAN 0.005ns '12*per'

.LIB "v00h_1p35_model.cnr" TYP_1066
*.LIB "v00h_1p35_model.cnr" TYP_2133

.INC "v00h_clkbuff.inc"

.TITLE Typical

**** The temperature is for the typical case
.TEMP 50    $Nominal Junction Temp for CT and IT

****************************************************************
**** POWER SUPPLY PARAMETER 
****************************************************************

.PARAM  vccq_typ  = 1.350V
.PARAM  vccq_min  = 1.283V
.PARAM  vccq_max  = 1.425V

.PARAM  vcc_typ   = 1.350V
.PARAM  vcc_min   = 1.283V
.PARAM  vcc_max   = 1.425V

.PARAM  vccr_typ  = 1.000V
.PARAM  vccr_min  = 0.950V
.PARAM  vccr_max  = 1.050V

.PARAM  vss       = 0.000V
.PARAM  gnd       = 0.000V
.PARAM  vssq      = 0.000V

**** Match up typ, min, or max voltages for corner sims
.PARAM  vccq      = vccq_typ
.PARAM  vcc       = vcc_typ
.PARAM  vccr      = vccr_typ
.PARAM  VDDQ       = vcc_typ
.PARAM  VDD        = vcc_typ

****************************************************************
Vvccq   vccq  0  DC = vccq
Vvcc    vcc   0  DC = vcc
Vvssq   vssq  0  DC = vssq
Vvss    vss   0  DC = vss
Vvccr  vccr 0  DC = vccr

****************************************************************
**** RECEIVER ENABLE SIGNAL
****************************************************************
**** Active high (vcc) receiver enable, Active low (vss) to disable
Ven   rcvren  0  DC = vcc

****************************************************************
**** INPUT SIGNAL
****************************************************************
**** Input Stimulus Parameters

.PARAM datarate = 1066.67E6
*.PARAM datarate = 1333.33E6
*.PARAM datarate = 1600.00E6
*.PARAM datarate = 1866.67E6
*.PARAM datarate = 2133.33E6
.PARAM pulsewidth = '1/datarate - dataslew'
.PARAM per = '2*(1/datarate)'
.PARAM delay = 1ns
.PARAM dataslew = 300ps

**** Vin/Vin_ toggle the CLK/CLK# at the clock rate specified above
Vin   in_pkg  0  PULSE vss vcc delay dataslew dataslew pulsewidth per
Vin_  inn_pkg 0  PULSE vcc vss delay dataslew dataslew pulsewidth per

****************************************************************
**** TOP CELL:  v00h_clkbuff
****************************************************************
xi0 CLKOUT CLKPAD CLKPAD_ RCVREN vss vcc vccr v00h_clkbuff s=1e-6

****************************************************************
**** PACKAGE CONNECTION
****************************************************************
**** Refer to the IBIS model for specific package parasitic values.

X_pkg_pad  CLKPAD  IN_PKG  pkg  r=252.28m l=1.313nH c=0.306pF
X_pkg_pad_ CLKPAD_ INN_PKG pkg  r=250.13m l=1.242nH c=0.311pF

.SUBCKT pkg pad pkg_out r=0 l=0 c=0
R_pkg pad net1 R='r'
L_pkg net1 pkg_out L='l'
C_pkg pkg_out gnd C='c'
.ENDS pkg

****************************************************************
**** ALTER STATEMENTS
****************************************************************
.ALTER

.TITLE Weak

.PARAM  vccq        = vccq_min
.PARAM  vcc         = vcc_min
.PARAM  vccr      = vccr_min
.PARAM  VDDQ       = vcc_min
.PARAM  VDD        = vcc_min

.TEMP 110    $Max Junction Temp for CT and IT

.LIB "v00h_1p35_model.cnr" SLOW_1066
*.LIB "v00h_1p35_model.cnr" SLOW_2133

****************************************************************
.ALTER

.TITLE Strong

.PARAM  vccq        = vccq_max
.PARAM  vcc         = vcc_max
.PARAM  vccr      = vccr_max
.PARAM  VDDQ       = vcc_max
.PARAM  VDD        = vcc_max

.TEMP 0      $Min Junction Temp for CT
*.TEMP -40    $Min Junction Temp for IT

.LIB "v00h_1p35_model.cnr" FAST_1066
*.LIB "v00h_1p35_model.cnr" FAST_1066_IT
*.LIB "v00h_1p35_model.cnr" FAST_2133
*.LIB "v00h_1p35_model.cnr" FAST_2133_IT

****************************************************************
.END
