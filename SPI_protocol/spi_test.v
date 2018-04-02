// to connect master and slave

module data_path(data_in,sclk,rst,data_out,ss,mosi,miso);
    input [7:0] data_in;
    input rst;
    output [7:0] data_out;
    output ss,mosi,miso,sclk;
    spi_master spi_m(sclk,ss,rst,mosi,miso,data_in,data_out);
    spi_slave spi_s(sclk,ss,rst,mosi,miso);
endmodule

// testbench

module spi_test;
    wire miso;
    reg [7:0] data_in;
    reg rst;
    wire sclk,ss,mosi;
    wire [7:0] data_out;
    data_path dp(data_in,sclk,rst,data_out,ss,mosi,miso);
    initial begin
        rst=1;
        data_in=8'b11101010;
        #250 rst=0;
    end
endmodule