module uart (clk, reset, rw, databus, Rx, Tx);
    input clk;
    input reset;
    input rw;
    input [7:0] databus;
    input Rx;
    output reg Tx;
    // internal variables
    reg [2:0] Tx_count;
    reg [7:0] Rx_reg;
    reg [2:0] Rx_count;
    always @(posedge clk) begin
        if(rw==0) begin
            if(reset) begin
                Tx<=1;   
                Tx_count<=0;    
            end
            else begin
                if(Tx_count==0) begin
                    Tx<=0;
                    Tx_count<=Tx_count+1;
                end
                if(Tx_count > 0 && Tx_count < 9) begin
                    Tx<=databus[Tx_count];
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
                Rx_reg<=8'b00000000;
                Rx_count<=0;
                Tx<=1;    
            end
            else begin
                if(Rx_count==0) begin
                    Tx<=Rx;
                    Rx_count<=Rx_count+1;
                end
                if(Rx_count > 0 && Rx_count < 9) begin
                    Rx_reg[Rx_count-1]<=Rx;
                    Rx_count<=Rx_count+1;
                    Tx<=Rx;
                end
                if(Rx_count==9) begin
                    Tx<=1;
                    Rx_count<=Rx_count+1;
                end
            end
        end
    end
endmodule
