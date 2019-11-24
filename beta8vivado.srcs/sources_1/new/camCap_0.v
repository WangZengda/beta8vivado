module camCap_0 (
  pclk,
  vsync,
  href,
  d,
  addr,
  dout,
  we,
  wclk
);

input wire pclk;
input wire vsync;
input wire href;
input wire [7 : 0] d;
output wire [16 : 0] addr;
output wire [15 : 0] dout;
output wire we;
output wire wclk;

  camCap camCap (
    .pclk(pclk),
    .vsync(vsync),
    .href(href),
    .d(d),
    .addr(addr),
    .dout(dout),
    .we(we),
    .wclk(wclk)
  );
endmodule