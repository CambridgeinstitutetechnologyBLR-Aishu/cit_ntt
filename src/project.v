`default_nettype none

module tt_um_pqc_aishu (
    input  wire [7:0] ui_in,    
    output wire [7:0] uo_out,   
    input  wire [7:0] uio_in,   
    output wire [7:0] uio_out,  
    output wire [7:0] uio_oe,   
    input  wire       ena,      
    input  wire       clk,      
    input  wire       rst_n     
);

    // Combinational math
    wire [7:0] math_result = ui_in[7:4] + ui_in[3:0];

    // THE TRICK: Use clk in a way that doesn't change the math
    // but forces the tool to 'see' the pin.
    assign uo_out = math_result ^ {7'b0, (clk & 1'b0)}; 

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
