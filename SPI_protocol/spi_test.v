module spi_test;
    wire miso;
    reg [7:0] data_in;
    wire sclk,ss,mosi;
    wire [7:0] data_out;
    spi_master spi_m(sclk,ss,mosi,miso,data_in,data_out);
    spi_slave spi_s(sclk,ss,mosi,miso);
    initial begin
        data_in=8'b11101010;
    end
    always begin

    end
endmodule