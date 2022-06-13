V00H 1.35V IBIS Model
Die Rev "P"
4Gb 1.35V DDR3L SDRAM IBIS model
Rev 2.0: 08/25/2015

v00h_1p35.ibs is valid for 1.283V-1.425V, Commercial Temperature Range 0C<=Tc<=95C 
v00h_1p35_it.ibs is valid for 1.283V-1.425V, Industrial Temperature Range -40C<=Tc<=95C

v00h.ibs is valid for 1.425V-1.575V, Commercial Temperature Range 0C<=Tc<=95C 
v00h_it.ibs is valid for 1.425V-1.575V, Industrial Temperature Range -40C<=Tc<=95C

This IBIS model includes On Die Termination (ODT) characteristics.  ODT is
modeled through the use of [Submodel] power and ground clamp I-V curves that
add the termination characteristics to the regular power and ground clamp
characteristics when the I/O is functioning as an input.  ODT applies to the
DQ, DQS/DQS#, TDQS/TDQS#, and DM signals.  Use the [Model Selector] to choose 
between 20, 30, 40, 60, or 120 ohm ODT settings.

Models for 1066, 1333, 1600, 1866, 2133 speed grades included and selected through
[Model Selector]. Models *_1066 are applicable for speed grade 1066 
Mbps, models *_1600 are for speed grade 1333 Mbps and 1600 Mbps, 
models *_1866 are applicable for speed grade 1866 Mbps and models *_2133 
are applicable for speed grade 2133 Mbps


[Disclaimer]  This software code and all associated documentation, comments
              or other information (collectively "Software") is provided
              "AS IS" without warranty of any kind. MICRON TECHNOLOGY, INC.
              ("MTI") EXPRESSLY DISCLAIMS ALL WARRANTIES EXPRESS OR IMPLIED,
              INCLUDING BUT NOT LIMITED TO, NONINFRINGEMENT OF THIRD PARTY
              RIGHTS, AND ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR
              FITNESS FOR ANY PARTICULAR PURPOSE. MTI DOES NOT WARRANT THAT 
              THE SOFTWARE WILL MEET YOUR REQUIREMENTS, OR THAT THE 
              OPERATION OF THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR-FREE. 
              FURTHERMORE, MTI DOES NOT MAKE ANY REPRESENTATIONS REGARDING
              THE USE OR THE RESULTS OF THE USE OF THE SOFTWARE IN TERMS OF
              ITS CORRECTNESS, ACCURACY, RELIABILITY, OR OTHERWISE. THE
              ENTIRE RISK ARISING OUT OF USE OR PERFORMANCE OF THE SOFTWARE
              REMAINS WITH YOU. IN NO EVENT SHALL MTI, ITS AFFILIATED
              COMPANIES OR THEIR SUPPLIERS BE LIABLE FOR ANY DIRECT,
              INDIRECT, CONSEQUENTIAL, INCIDENTAL, OR SPECIAL DAMAGES
              (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF PROFITS,
              BUSINESS INTERRUPTION, OR LOSS OF INFORMATION) ARISING OUT OF
              YOUR USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF MTI HAS
              BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. Because some
              jurisdictions prohibit the exclusion or limitation of 
              liability for consequential or incidental damages, the above
              limitation may not apply to you.
 
[Copyright]   Copyright 2015 Micron Technology, Inc. All rights reserved.
