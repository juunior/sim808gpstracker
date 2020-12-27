del main7.elf
del main7.o
del main7.hex
avr-gcc -mmcu=atmega328p -std=gnu99 -Wall -Os -o main7.elf main7.c -w
avr-objcopy -j .text -j .data -O ihex main7.elf main7.hex
avr-size --mcu=atmega328p --format=avr main7.elf
# fuse = 62 for 1MHz clock = internal 8Meg / division 8
# ATTENTION ! if using External XTAL 8Hz with division by 8 - replace "lfuse:w:0x7f:m" below
avrdude -c usbasp -p m328p -U lfuse:w:0x62:m  -U flash:w:"main7.hex":a

