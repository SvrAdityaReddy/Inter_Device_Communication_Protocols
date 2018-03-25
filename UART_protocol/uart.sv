module uart (
    clk,
    reset,
    rw,
    databus,
    Rx,
    Tx
);
    input clk;
    input reset;
    input rw;
    input [7:0] databus;
    input Rx;
    output reg Tx;
    // internal variables
    reg [7:0] Tx_reg;
    reg [2:0] Tx_count;
    // initialization
    Tx_reg<=databus;
    // transmitter
    if(rw==0) begin
        if(reset) begin
            Tx_reg<='b000000;
            Tx<=1;   
            Tx_count<=0;    
        end
        else begin
            always_ff @(posedge clk) begin
                if(Tx_count==0) begin
                    Tx<=0;
                end
                if(Tx_count > 0 && Tx_count < 9) begin
                    Tx<=Tx_reg[Tx_count];
                    Tx_count=Tx_count+1;
                end
                if(Tx_count==9) begin
                    Tx<=1;
                    Tx_count=0;
                end
            end 
        end
    end
    // receiver
    // if(rw) begin
        
    // end
endmodule
