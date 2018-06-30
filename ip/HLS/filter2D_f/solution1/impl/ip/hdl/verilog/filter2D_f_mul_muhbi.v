
`timescale 1 ns / 1 ps

  module filter2D_f_mul_muhbi_DSP48_0(clk, rst, ce, a, b, p);
input clk;
input rst;
input ce;
input signed [25 - 1 : 0] a; // synthesis attribute keep a "true"
input [8 - 1 : 0] b; // synthesis attribute keep b "true"
output signed [33 - 1 : 0] p; // synthesis attribute keep p "true"

reg signed [33 - 1 : 0] p_reg; 

reg signed [25 - 1 : 0] a_reg; 
reg [8 - 1 : 0] b_reg; 

always @ (posedge clk) begin
    if (ce) begin
        a_reg <= a;
        b_reg <= b;
        p_reg <= $signed (a_reg) * $signed ({1'b0, b_reg});
    end
end

assign p = p_reg;

endmodule

`timescale 1 ns / 1 ps
module filter2D_f_mul_muhbi(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



filter2D_f_mul_muhbi_DSP48_0 filter2D_f_mul_muhbi_DSP48_0_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

