module uart (
    databus,
    rw,
    Rx,
    Tx
);
    input [7:0] databus;
    input rw;
    input Rx;
    output reg Tx;
    // transmitter
    if(rw==0) begin
        
    end
    // receiver
    if(rw) begin
        
    end
endmodule
