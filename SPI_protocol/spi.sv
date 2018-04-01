// SPI mode 1

// 8 bit data tranmitted/received

module spi_master (sclk,MISO,MOSI,ss);
    input sclk,MISO;
    output reg ss,MOSI;
    always_ff @(posedge sclk) begin
        
    end
endmodule

// 8 bit data tranmitted/received

module spi_slave (sclk,ss,MOSI,MISO);
    input sclk,MOSI,ss;
    output reg MISO;
    reg [7:0] mem;
    reg [3:0] count;
    always_ff @(negedge sclk) begin
        if (ss) begin
            count<=4'b0000;
        end
        if(ss==0 && count>0) begin
            if(count<8) begin
                mem[count]<=MOSI;
                count<=count+1;
            end
            else begin
                if(count>0) begin
                    MISO<=mem[8-count];
                    count<=count-1; 
                end
            end
        end
    end
endmodule
