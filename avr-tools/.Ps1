make atmega328 BAUD_RATE=57600
make mega2560
cd $TRAVIS_BUILD_DIR/optiboot/bootloaders/optiboot
ls *.hex
ls /dev/cu.usb*
avrdude -v -patmega328p -carduino -P/dev/ttyXXX -b115200 -D -Uflash:w:optiboot_atmega328.hex:i
avrdude -v -patmega328p -carduino -P/dev/ttyXXX -b57600 -D -Uflash:w:optiboot_atmega328.hex:i
avrdude -v -patmega2560 -cwiring -P/dev/ttyXXX -b115200 -D -Uflash:w:optiboot_mega2560.hex:i
