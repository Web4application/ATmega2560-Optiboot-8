make atmega328 BAUD_RATE=57600
make mega2560
cd $TRAVIS_BUILD_DIR/optiboot/bootloaders/optiboot
ls *.hex
.lst
avrdude -v -patmega328p -carduino -P/dev/ttyXXX -b115200 -D -Uflash:w:optiboot_atmega328.hex:i
avrdude -v -patmega328p -carduino -P/dev/ttyXXX -b57600 -D -Uflash:w:optiboot_atmega328.hex:i
avrdude -v -patmega2560 -cwiring -P/dev/ttyXXX -b115200 -D -Uflash:w:optiboot_mega2560.hex:i
echo 'export PATH="$HOME/avr-tools/bin:$PATH"' >> ~/.zshrc  # Use ~/.bashrc for Bash
avrdude -c avrisp -P /dev/ttyXXX -b 19200 -p m328p -e -u \
  -U lock:w:0x3F:m \
  -U efuse:w:0xFD:m \
  -U hfuse:w:0xDE:m \
  -U lfuse:w:0xFF:m
avrdude -c avrisp -P /dev/ttyXXX -b 19200 -p m1284p -e -u \
  -U lfuse:w:0xFF:m \
  -U hfuse:w:0xDE:m \
  -U efuse:w:0xFD:m \
  -U flash:w:optiboot_atmega1284p.hex:i \
  -U lock:w:0x2F:m
avrdude -c usbasp -P usb -p t85 -e -u \
  -U lfuse:w:0xFF:m \
  -U hfuse:w:0xDF:m \
  -U efuse:w:0xFF:m
grep :10 optiboot_atmega328.hex | wc -l | awk '{print $1 * 16}'
make clean && make atmega328
avr-size -C --mcu=atmega328p optiboot_atmega328.elf
make atmega328 OPTIMIZE=-Os

