// SPI MODE 1

// 8 bit data tranmitted/received

module spi_master (sclk,ss,rst,mosi,miso,data_in,data_out);
    input miso,rst;
    input reg [7:0] data_in;
    output reg sclk,ss,mosi;
    output reg [7:0] data_out;
    // internal variable
    reg [3:0] count_send;
    reg [3:0] count_recv;
    reg [7:0] mem;
    initial begin
        sclk=0;
        ss=1;
        #10 ss=0;
        forever begin
            #100 sclk=~sclk;
        end
    end
    always_ff @(posedge sclk) begin
        if(rst) begin
            count_send<=0;
        end
        if(rst==0) begin
            if(count_send>=0) begin 
                if(count_send<8) begin
                    mosi<=data_in[count_send];
                    count_send<=count_send+1;
                end
                else begin
                    count_send<=0;
                end
            end    
        end
    end
    always_ff @(negedge sclk) begin
        if(rst) begin
            count_recv<=0;
        end
        if(rst==0) begin
            if(count_recv>=0) begin 
                if(count_recv<8) begin
                    mem[count_recv]<=miso;
                    count_recv<=count_recv+1;
                end
                else begin
                    data_out<=mem;
                    count_recv<=0;
                end
            end    
        end
    end
endmodule

// 8 bit data tranmitted/received

module spi_slave (sclk,ss,rst,mosi,miso,data_transfer);
    input sclk,mosi,ss,rst;
    input [7:0] data_transfer;
    output reg miso;
    reg [7:0] mem;
    reg [3:0] count_send;
    reg [3:0] count_recv;
    always_ff @(negedge sclk) begin
        if (ss) begin
            count_recv<=0;
        end
        if(ss==0 && rst==0) begin
            if(count_recv>=0) begin
                if(count_recv<8) begin
                    mem[count_recv]<=mosi;
                    count_recv<=count_recv+1;
                end
                else begin
                    count_recv<=0;
                end
            end
        end
    end
    always_ff @(posedge sclk) begin
        if (rst) begin
            count_send<=0;
        end
        $display("miso %b",count_send);
        if(ss==0 && rst==0) begin
            if(count_send>=0) begin
                $display("miso %b",data_transfer[count_recv]);
                if(count_send<8) begin
                    miso<=data_transfer[count_send];
                    count_send<=count_send+1;
                end
                else begin
                    count_send<=0;
                end
            end
        end
    end
endmodule
