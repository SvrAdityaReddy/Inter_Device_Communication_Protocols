# Inter Device Communication Protocols

In this repository we will be looking at verilog codes of various Inter Device Communication protocols like Universal Asynchronous Receiver Transmitter (UART), Serial Peripheral Interface (SPI).

## Universal Asynchronous Receiver Transmitter (UART)

![image](https://user-images.githubusercontent.com/19650574/37669739-981198a6-2c8d-11e8-80f9-f0b4e0e53fa8.png)

### Terminologies used in UART 

* __Start bit :__
    It is the first bit of one byte UART transmission. It is used to indicate the receiver that data bits are going to arrive i.e it indicates that data line is leaving it's idle state. In general idle state is *Logic HIGH* and Start bit is *Logic LOW*. 

* __Stop bit :__
    It is the last bit of one byte UART transmission. It has the same logic level idle state.

* __Baud rate :__
    It is the approximate rate at which data can be transmitted. Approximately the time period of one bit in a UART transmission is inverse of *Baud rate*.

## Serial Peripheral Interface (SPI)

## References

[1] [Back to Basics: The Universal Asynchronous Receiver/Transmitter (UART)](https://www.allaboutcircuits.com/technical-articles/back-to-basics-the-universal-asynchronous-receiver-transmitter-uart/)</br>
[2] [Serial Peripheral Interface (SPI) from sparkfun](https://learn.sparkfun.com/tutorials/serial-peripheral-interface-spi)</br>
[3] [Serial Peripheral Interface Bus](https://en.wikipedia.org/wiki/Serial_Peripheral_Interface_Bus)</br>
[4] [Clock Phase and Polarity](http://dlnware.com/dll/Clock-Phase-and-Polarity)</br>
