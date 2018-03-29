module uart (clk, reset, rw, databus, Rx, Tx);
    input clk;
    input reset;
    input rw;
    input [7:0] databus;
    input Rx;
    output reg Tx;
    // internal variables
    // reg [7:0] Tx_reg;
    reg [2:0] Tx_count;
    reg [7:0] Rx_reg;
    reg [2:0] Rx_count;
    always_ff @(posedge clk) begin
        if(rw==0) begin
            if(reset) begin
                // Tx_reg='b000000;
                Tx= 1;   
                Tx_count=0;    
            end
            else begin
                if(Tx_count==0) begin
                    Tx<=0;
                end
                if(Tx_count > 0 && Tx_count < 9) begin
                    // Tx<=databus[Tx_count];
                    Tx_count<=Tx_count+1;
                end
                if(Tx_count==9) begin
                    Tx<=1;
                    Tx_count=0;
                end
            end
        end 
        else begin
            if(reset) begin
                Rx_reg<='b000000;    
            end
            else begin
                if(Tx_count==0) begin
                    Rx_count<=Rx_count+1;
                end
                if(Rx_count > 0 && Rx_count < 9) begin
                    Rx_reg[Rx_count-1]<=Rx;
                    Rx_count<=Rx_count+1;
                end
                if(Tx_count==9) begin
                    Rx_count<=Rx_count+1;
                end
            end
        end
    end
endmodule
