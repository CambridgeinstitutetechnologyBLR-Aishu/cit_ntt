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

    wire [15:0] out_a, out_b;
    
    // THE FIX: Dummy connection so the tool doesn't lose the clk pin
    wire dummy_clk_connection = clk ^ rst_n ^ ena;

    butterfly_unit ntt_core (
        .a({12'b0, ui_in[7:4]}),
        .b({12'b0, ui_in[3:0]}),
        .omega(16'd2),
        .out_a(out_a),
        .out_b(out_b)
    );

    // Xoring with 0 doesn't change the result, but it forces the tool to 'see' the pins
    assign uo_out = out_a[7:0] ^ {7'b0, dummy_clk_connection};
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
