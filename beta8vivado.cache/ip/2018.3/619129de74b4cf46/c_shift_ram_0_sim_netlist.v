// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 21 18:07:10 2019
// Host        : DESKTOP-DULGENH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_shift_ram_0_sim_netlist.v
// Design      : c_shift_ram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_shift_ram_0,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (D,
    CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1088" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "0" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DEPTH = "1088" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "0" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "1" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [0:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1088" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
R80NnScBgIZD14acGTeYZyZzlDoMDRJH97QvrM1z3/BPxjYOI5xO+RmLRE3ogivikKxeQqDB3hYo
CtT6MXJE8w==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pzFf5UkhQCihEthT9/vXIu9qyyEco3ugn72RSG7p68vod9TXq7nS9azLrnGkzXHs3PQFBkq+3+ZG
PNN41vDN58/lK8pIjiAlp2V0xXr8ZRf/QoS3nU9pnZ3CEwxt9CGwUMks2MBnm+VSjWWRxbkUaTxZ
+kjzVWvQpUuyFFsOEs8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xDcafb3KrEW7vk1Eyiww/9CKbzlKF9C0uKrVBz5bHy5+6GMNsnwfCSkgxU14+VriR3jhdDN7viwB
M3a2pKPouTEOz066rknyw5X/sQ4hniBD3iUl4NQWkHTGym3kv31ZUeZYdl5ODPvzfUJOWUvkAXp/
gf4rtgV5FBbGm8qJS4jxuFSsv4rhcb7t+cae5sULvX9h7Uh0lEoAlNX3YmEW0fWj4bhIgTdzT2gk
C1ytdGU/UAnitwmujc/k+32KWV0i/o3dHRhIc31iawLLSmuBJYefDEaLG6KE8nGHeuho45Se0dhe
7kIaZp4SW1wGf7C0xxqwh1cgZ7+6eWgYBqVY1g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OrzITnToGC+ryHZVkpDHCj6CgE4vEVrPZ7Z829783FsE2zjugDCdpipuFZ7ikbeX4Bc52TEJ4mFm
0OxylPcCXPIE74pJ186gBXkmldW4bGFMhTmUHJ94bRAsyJjr329fm+j77y2NmfbHMVOsljahWWK4
OMppytgOrZcnsnsORsbXvvikZALiCB2t+Qc4RdHc3/98o+DDvRf+gwTZNX0GMOitJmVVvqxqw6No
K3aHL26WS+5291/TUz7aF7ySSp+k84h+0omwPrcy0Xc3URWaoYbqLrWiEi22RgQYitI1tEsa+afh
tv3h9WNr+65gWTbdbwWyOz1NeXJSaNV/mc+/Lg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
riYGAyaVfIXieMgcJVFsucQ9kUNBkyzgx5CLlDibSmqSJjCaDvK63ymwoZpsGDT9Rugub8H1Y8xX
XUpLlzZGCXrlWs6NgjXfNxVpLlkmz7GswYkQ6KhUkZhRuPh0HrpJPt1ne+1pTM6fzi5LXsyTv6sn
TisWpJPdsnmBDHgM6jupb4Iv3OG7/q/NPck9K59oFLN+AyKeQ/8pEy2j7xpMiFTRlE1OTJj2mjHF
yWQWyURMafr1KK5t9Wu7YuocfKiTo0f6okHNafEo/nNpObW1D/liUJlS5GVguNNbnFjSuun9SM4T
MXhUoU0rVPqSkeCGnTpMMYK0MY5IwmbyZXn/fQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
HyAIbEI1uxEAA90t6+VWFTmyUje1JDZQZoMv6A5VyFWA8tJ80b/Pwhc93aHby8xZos0WjlEANrxF
3hJ/l8XJYMVZWlVytBIRAZYGbhnMBOGo/5sjE6O2Ap0308iwfA50rb1ZITdKRqNiW+PlWkaGC+3R
QMUfNUa7cSm841V7mmc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GUEL70ZQ78wO25wq2V+5JNZcUKzj485nYHAlIxulC+dFYZ1T3bS7X0juNGn/cdIyRbeWgA5z1viA
KyiSR064Z0BmWFsIYHfLEP1CENE6B/DkEgUM//4pBnGxH0CUe8wWHQBcyJQAxQHemECYQ5/QfTqT
96OTv0jwZ8yRjX1vKXS1qZKREGwNAsV3Kgrd9M5oaNz3PuISlyOOLoxPx9Qvu0Z0QYAzZbksLAI6
oekHTbR7CXs/P7+GCnbyf0lD6RFUyKASz8PAAvPi/+knG0A5BGQv9W8rEQ1GlCyJMbWqS7UMYIM5
Aany0Gd6zUtHqzCJMTpR0Gv6o8IS9bMCD8CICQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ob2e1qYc9q0I9cTeVxVQ+kc3SzYl1HAMXhZWysObJcWxFmEv8V/VRAzeyNzOOZqku1Na7z2aXlf7
vLa3BKKved7sZzaNI7OQ/2F0NjR4CcXBisD4m7PJ1J7Vd4tBcolFKqCpoCR5aCkW5yZcxHkblyyl
CeLns+2wtD7/xyBFx8lKTFCX7GquFuQvhwfOQHxHzQZj/SQphPg/xQGArgZ9fuo/dFZS5UtkQPJL
xdogkJI/mb6Emb2KDdjIBrz5XCzlVDCIiEk6s2lq7Nq6vtIrSoEkpd7SH6VLuCT4j+BT/QzLEf2E
Uz2ywagvsn9Zz79mQ8oLqtc+yGiMLLTe0HGjAw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dzCkAski0ltcdIAda7DvMbd8IdMCx01y5vOuzvGsUoG24pYOt3M6MF4PshuuaB1Ry+qI67dHwe2m
DacNUVlcbw2OMHNfTQDSFDlzSgFo8Gl7qKF+4Hc4HSgA8RlXmTEOhLwsGokX9ehhApTNuK4mbT8I
gx28IJJPqjfx57W2C84mclv/cK4qj+LuyBJoviFLTsnbjHWOiLxymqNa8yd8MtIqrWyF/zjdwQQp
Bc0AO36z34chKXVH8Zq33NEgf10ZCqpiQKVrcz0eLh+26OIbgdgFGEGesGc3N+a987wffAwbbvp6
KsZRL6h5c+DFy4549C1hQK7MeMDdhh96KSnfnA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 34512)
`pragma protect data_block
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
AeAAvy2OzsiUQvABq1HRkW8qqzqjdz2aluSb
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
