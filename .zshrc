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
