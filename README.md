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

### Synchronizing and Sampling

One way we could sample the data is to transmit bit on *positive edge* of a *clock cycle* and on receiver side is to sample the data received on every *negative edge* of *clock cycle*.</br>

But as the name *UART* suggest it is *asynchronous* we donot have a clock to synchronize the *transmitter* and *receiver*. The receiver's sequence starts with falling edge of start bit. The *receiver's internal clock* is entirely *independent* of *transmitter's internal clock* and the __falling edge__ of a __start bit__ can occur at any point in the *receiver's clock cycle*. So, for this we try to make __positive edge__ of *receiver's clock* occur nearly at __middle__ of the bit. To ensure this we make the baud rate of receiver's clock to be much *higher* than transmitter's (actual baud rate) by a factor of 8 or 16 or 32.  

## Serial Peripheral Interface (SPI)

## References

[1] [Back to Basics: The Universal Asynchronous Receiver/Transmitter (UART)](https://www.allaboutcircuits.com/technical-articles/back-to-basics-the-universal-asynchronous-receiver-transmitter-uart/)</br>
[2] [Serial Peripheral Interface (SPI) from sparkfun](https://learn.sparkfun.com/tutorials/serial-peripheral-interface-spi)</br>
[3] [Serial Peripheral Interface Bus](https://en.wikipedia.org/wiki/Serial_Peripheral_Interface_Bus)</br>
[4] [Clock Phase and Polarity](http://dlnware.com/dll/Clock-Phase-and-Polarity)</br>
