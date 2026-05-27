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

    // Pure combinational logic - No clock used
    // This adds the two 4-bit halves of the input
    assign uo_out = ui_in[7:4] + ui_in[3:0];
    
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
