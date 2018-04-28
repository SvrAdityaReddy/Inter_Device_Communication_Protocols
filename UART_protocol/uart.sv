module uart (clk, reset, rw, databus_read, databus_write, Rx, Tx);
    input clk;
    input reset;
    input rw;
    input reg [7:0] databus_read;
    output reg [7:0] databus_write;
    input Rx;
    output reg Tx;
    // internal variables
    reg [3:0] Tx_count;
    reg [7:0] Rx_reg;
    reg [3:0] Rx_count;

    // assertions

    property verify_reset_transmitter_1;
        @(posedge clk) disable iff (rw)
            (reset & !rw) |=> Tx<=1;
    endproperty

    property verify_reset_transmitter_2;
        @(posedge clk) disable iff (rw)
            (reset & !rw) |=> Tx_count<=0;
    endproperty

    property verify_final_output_receiver;
        @(posedge clk) disable iff (!rw)
            (rw & Rx_count==9) |=> databus_write<=databus_read;
    endproperty

    assert property(verify_reset_transmitter_1) else $error("assertion to verify reset in transmitter failed");
    assert property(verify_reset_transmitter_2) else $error("assertion to verify reset in transmitter failed");
    assert property(verify_final_output_receiver) else $error("assertion to verify final output in receiver failed");

    // transmitter 

    always_ff @(posedge clk) begin
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
                else begin 
                    if(Tx_count > 0 && Tx_count < 9) begin
                        Tx<=databus_read[Tx_count-1];
                        Tx_count<=Tx_count+1;
                        $display("%b",Tx_count);
                    end
                    else begin 
                        if(Tx_count==9) begin
                            Tx<=1;
                        end
                    end
                end
            end
        end 
    end

    // receiver

    always_ff @(posedge clk) begin
        if (rw) begin
            if(reset) begin
                Rx_reg<=8'b00000000;
                Rx_count<=0;
                databus_write<=8'b00000000;
                Tx<=1;                    
            end
            else begin
                if(Rx_count==0 && Rx==0) begin
                    Tx<=Rx;
                    Rx_count<=Rx_count+1;
                end
                else begin 
                    if(Rx_count >= 1 && Rx_count < 9) begin
                        Rx_reg[Rx_count-1]<=Rx;
                        Rx_count<=Rx_count+1;
                        Tx<=Rx;
                    end
                    else begin 
                        if(Rx_count==9) begin
                            Tx<=1;
                            Rx_count<=Rx_count+1;
                            databus_write<=Rx_reg;
                        end
                    end
                end
            end
        end
    end
endmodule
