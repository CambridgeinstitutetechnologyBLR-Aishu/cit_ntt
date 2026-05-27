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

    // Simplified NTT Butterfly logic
    wire [7:0] a = ui_in[7:4];
    wire [7:0] b = ui_in[3:0];
    
    // Core NTT math (Addition and simple Bitmasking)
    // We use 'clk' in a simple register so the tool is forced to route it correctly
    reg [7:0] ntt_result;
    
    always @(posedge clk) begin
        if (!rst_n)
            ntt_result <= 8'b0;
        else
            ntt_result <= (a + b) ^ {7'b0, ena};
    end

    assign uo_out = ntt_result;
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
