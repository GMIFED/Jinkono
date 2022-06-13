v00h HSPICE MODEL 
-----------------
Device: 4Gb DDR3L SDRAM - Die Revision "P"
Architecture: 1Gig x 4, 512Meg x 8, 256Meg x 16
VDD/VDDQ: 1.283V-1.425V


SOURCE
------------
Micron Technology, Inc.
For support send e-mail to modelsupport@micron.com


REVISION HISTORY
----------------
Rev 1.0: 07/17/2014
       - Initial pre-silicon model
       - Model matched to IBIS model revision 1.0
Rev 2.0: 08/25/2015
       - Updated model to match with measurements
	   - Model matched to IBIS model revision 2.0


FILES
------------
v00h_dqbuff.inc   Encrypted net-list for DQ I/O's  
v00h_dmbuff.inc   Encrypted net-list for DM Inputs
v00h_dqsbuff.inc  Encrypted net-list for DQS/DQS# I/O's 
v00h_clkbuff.inc  Encrypted net-list for CK and CK# Inputs 
v00h_inbuff1.inc  Encrypted net-list for Inputs (A1-A9, A11, A13, A14, BA0, BA1, BA2, CKE, ODT)
v00h_inbuff2.inc  Encrypted net-list for Inputs (CAS, CS#, A0, A10, A12, RAS, WE)

v00h_dq.sp        HSPICE deck file to run a test simulation using v00h_dqbuff.inc netlist
v00h_dm.sp        HSPICE deck file to run a test simulation using v00h_dmbuff.inc netlist
v00h_dqs.sp       HSPICE deck file to run a test simulation using v00h_dqsbuff.inc netlist 
v00h_clk.sp       HSPICE deck file to run a test simulation using v00h_clkbuff.inc netlist 
v00h_input1.sp    HSPICE deck file to run a test simulation using v00h_inbuff1.inc netlist
v00h_input2.sp    HSPICE deck file to run a test simulation using v00h_inbuff2.inc netlist
v00h_1p35_model.cnr    File to select typical, weak or strong process

v00h_1p35_hspice_readme.txt  Read me file

v00h_1p35_ext_model_quality_rpt_rev2p0.pdf    Model Quality Report



 Part Number       VDD/VDDQ      Architecture   Package
 -----------       --------      ------------   -------
 MT41K1G4DA        1.35V/1.35V   1Gig x 4       78-Ball 8x10.5mm FBGA
 MT41K512M8DA      1.35V/1.35V   512Meg x 8     78-Ball 8x10.5mm FBGA
 MT41K256M16TW     1.35V/1.35V   256Meg x 16    96-Ball 8x14mm FBGA
 MT41K1G4V00H      1.35V/1.35V   1Gig x 4       Bare Die
 MT41K512M8V00H    1.35V/1.35V   512Meg x 8     Bare Die
 MT41K256M16V00H   1.35V/1.35V   256Meg x 16    Bare Die 


INSTRUCTIONS
------------
- To run test simulation using the spice deck file, the files "v00h_1p35_model.cnr" 
  and encrypted netlist are required to be in the same directory. 

- Commercial Temperature settings are: Typical 50C, Slow 110C, Fast   0C
  Industrial Temperature settings are: Typical 50C, Slow 110C, Fast -40C
 

- The spice netlists are not designed to match datasheet timing numbers. 
  Delay times are smaller than those given in the data sheets.

- The .LIB statement selects the following simulation corners:
     LIB             DATARATE        PROCESS  DIE CAP  VDD/VDDQ  TEMPERATURE
     ---             --------        -------  -------  --------  -----------
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
	 
- Please refer to the IBIS model for specific package parasitic values.

- VCCQ/VSSQ decoupling capacitance is included in the DQ and DQS models
    DQ       = 300pF
    DQS/DQS# = 600pF
    DM       = 300pF
    Total    = 300pF x 16(DQ) + 600pF x 2(DQS/DQS#) + 300pF x 2(DM) = 6.6nF
  Set "rcap_vccq" parameter high in "v00h_1p35_model.cnr" to remove this capacitance
- VCC/VSS decoupling capacitance is included in the DQ and DQS models
    DQ       = 145pF
    DQS/DQS# = 290pF
    DM       = 145pF
    Total    = 145pF x 16(DQ) + 290pF x 2(DQS/DQS#) + 145pF x 2(DM) = 3.19nF
  Set "rcap_vcc" parameter high in "v00h_1p35_model.cnr" to remove this capacitance



[Disclaimer] This software code and all associated documentation, comments
             or other information (collectively "Software") is provided 
             "AS IS" without warranty of any kind. MICRON TECHNOLOGY, INC. 
             ("MTI") EXPRESSLY DISCLAIMS ALL WARRANTIES EXPRESS OR IMPLIED,
             INCLUDING BUT NOT LIMITED TO, NONINFRINGEMENT OF THIRD PARTY
             RIGHTS, AND ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS
             FOR ANY PARTICULAR PURPOSE. MTI DOES NOT WARRANT THAT THE
             SOFTWARE WILL MEET YOUR REQUIREMENTS, OR THAT THE OPERATION OF
             THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE. FURTHERMORE,
             MTI DOES NOT MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE
             RESULTS OF THE USE OF THE SOFTWARE IN TERMS OF ITS CORRECTNESS,
             ACCURACY, RELIABILITY, OR OTHERWISE. THE ENTIRE RISK ARISING OUT
             OF USE OR PERFORMANCE OF THE SOFTWARE REMAINS WITH YOU. IN NO
             EVENT SHALL MTI, ITS AFFILIATED COMPANIES OR THEIR SUPPLIERS BE
             LIABLE FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, INCIDENTAL, OR
             SPECIAL DAMAGES (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS
             OF PROFITS, BUSINESS INTERRUPTION, OR LOSS OF INFORMATION)
             ARISING OUT OF YOUR USE OF OR INABILITY TO USE THE SOFTWARE,
             EVEN IF MTI HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
             Because some jurisdictions prohibit the exclusion or limitation
             of liability for consequential or incidental damages, the above
             limitation may not apply to you.
 
             Copyright 2015 Micron Technology, Inc. All rights reserved.
