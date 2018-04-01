module uartTest;
    // for instance 1 
    reg clk, reset, rw, Rx;
    reg [7:0] databus;
    wire Tx;
    wire [7:0] data_output;
    // for instance 2
    reg clk2, reset2, rw2, Rx2;
    reg [7:0] databus2;
    wire Tx2;
    wire [7:0] data_output2;

    uart uart_tx(clk, reset, rw, databus, data_output, Rx, Tx);
    uart uart_rx(clk2, reset2, rw2, databus2, data_output2, Tx, Tx2);
    
    initial begin
        reset=1;
        reset2=1;
        Rx=0;
        #10 rw=0;
        #10 rw2=1;
        #20 databus=8'b11110101;
        #35 reset=0;
        #35 reset2=0; 
    end
    always begin
        #30 clk=1;
        #35 clk=0;
        #40 clk=1;
        #45 clk=0;
        #50 clk=1;
        #55 clk=0;
        #60 clk=1;
        #65 clk=0;
        #70 clk=1;
        #75 clk=0;
        #80 clk=1;
        #85 clk=0;
        #90 clk=1;
        #95 clk=0;
        #100 clk=1;
        #105 clk=0;
        #110 clk=1;
        #115 clk=0;
        #120 clk=1;
        #125 clk=0;
        #130 clk=1;
        #135 clk=0;
        #140 clk=1;
        #145 clk=0;
        #150 clk=1;
        #155 clk=0;
        #160 clk=1;
        #165 clk=0;
        #170 clk=1;
        #175 clk=0;
        #180 clk=1;
        #185 clk=0;
        #190 clk=1;
        #195 clk=0;
        #200 clk=1;
        #205 clk=0;
        #210 clk=1;
        #215 clk=0;
        #220 clk=1;
        #225 clk=0;
        #230 clk=1;
        #235 clk=0;
        #240 clk=1;
        #245 clk=0;
    end
    always begin
        #30 clk2=1;
        #35 clk2=0;
        #40 clk2=1;
        #45 clk2=0;
        #50 clk2=1;
        #55 clk2=0;
        #60 clk2=1;
        #65 clk2=0;
        #70 clk2=1;
        #75 clk2=0;
        #80 clk2=1;
        #85 clk2=0;
        #90 clk2=1;
        #95 clk2=0;
        #100 clk2=1;
        #105 clk2=0;
        #110 clk2=1;
        #115 clk2=0;
        #120 clk2=1;
        #125 clk2=0;
        #130 clk2=1;
        #135 clk2=0;
        #140 clk2=1;
        #145 clk2=0;
        #150 clk2=1;
        #155 clk2=0;
        #160 clk2=1;
        #165 clk2=0;
        #170 clk2=1;
        #175 clk2=0;
        #180 clk2=1;
        #185 clk2=0;
        #190 clk2=1;
        #195 clk2=0;
        #200 clk2=1;
        #205 clk2=0;
        #210 clk2=1;
        #215 clk2=0;
        #220 clk2=1;
        #225 clk2=0;
        #230 clk2=1;
        #235 clk2=0;
        #240 clk2=1;
        #245 clk2=0;
    end
endmodule