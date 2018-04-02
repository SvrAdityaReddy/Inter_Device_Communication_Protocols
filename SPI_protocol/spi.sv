// SPI mode 1

// 8 bit data tranmitted/received

module spi_master (sclk,ss,rst,mosi,miso,data_in,data_out);
    input miso,rst;
    input reg [7:0] data_in;
    output reg sclk,ss,mosi;
    output reg [7:0] data_out;
    // internal variable
    reg [5:0] count;
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
            count<=0;
        end
        if(rst==0) begin
            if(count>=0) begin 
                if(count<8) begin
                    mosi<=data_in[count];
                    count<=count+1;
                end
                else begin
                    if(count<16) begin
                        mem[count-8]<=miso;
                        count<=count+1;
                    end
                    else begin
                        data_out<=mem;
                        count<=0;
                    end
                end
            end    
        end
    end
endmodule

// 8 bit data tranmitted/received

module spi_slave (sclk,ss,rst,mosi,miso);
    input sclk,mosi,ss,rst;
    output reg miso;
    reg [7:0] mem;
    reg [5:0] count;
    always_ff @(negedge sclk) begin
        $display("count sclk = %b", count);
        if (ss) begin
            count=0;
            $display("count sclk initial = %b", count);
        end
        if(ss==0 && rst==0) begin
            if(count>=0) begin
                if(count<7) begin
                    mem[count]=mosi;
                    count=count+1;
                end
                else begin 
                    if(count==7) begin
                        mem[count]=mosi;
                        count=count+1;
                        miso=mem[count-8];
                        count=count+1; 
                    end
                    else begin
                        if(count<16) begin
                            miso<=mem[count-8];
                            count<=count+1; 
                            $display("count outside = %b ,,,, %b,,,,,%b", count,miso,mem);
                        end
                        else begin
                            count<=0;
                        end
                    end
                end
            end
        end
    end
endmodule
