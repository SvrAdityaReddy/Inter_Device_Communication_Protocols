// SPI mode 1

// 8 bit data tranmitted/received

module spi_master (sclk,ss,mosi,miso,data_in,data_out);
    input miso;
    input reg [7:0] data_in;
    output reg sclk,ss,mosi;
    output reg [7:0] data_out;
    // internal variable
    reg [3:0] count;
    initial begin
        sclk=0;
        forever begin
            #100 sclk=~sclk;
        end
    end
    always_ff @(posedge sclk) begin
        if(count==0) begin
            ss<=0;
            mosi<=data_in[count];
            count<=count+1;
        end
        if(count>0) begin 
            if(count<8) begin
                mosi=data_in[count];
                count<=count+1;
            end
            else begin
                if(count>0) begin
                    data_out[8-count]=miso;
                    count<=count-1;
                end
                else begin
                    count<=0;
                end
            end
        end    
    end
endmodule

// 8 bit data tranmitted/received

module spi_slave (sclk,ss,mosi,miso);
    input sclk,mosi,ss;
    output reg miso;
    reg [7:0] mem;
    reg [3:0] count;
    always_ff @(negedge sclk) begin
        if (ss) begin
            count<=4'b0000;
        end
        if(ss==0 && count>0) begin
            if(count<8) begin
                mem[count]<=mosi;
                count<=count+1;
            end
            else begin
                if(count>0) begin
                    miso<=mem[8-count];
                    count<=count-1; 
                end
            end
        end
    end
endmodule
