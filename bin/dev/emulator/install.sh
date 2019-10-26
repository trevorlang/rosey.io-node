# install_emulator.sh
# Install and start a Raspberry Pi emulator. This is useful for testing builds without needing to use a real device.
#
# Inspired by: https://gist.github.com/hfreire/5846b7aa4ac9209699ba

# Install QEMU OSX port with ARM support
echo "Updating Homebrew..."
brew update &&
brew install qemu
export QEMU=$(which qemu-system-arm)

# Cleanning old kernals
echo "Cleaning kernals..."
# rm -rf ./tmp/files/2019-09-26-raspbian-buster.zip
# rm -rf ./tmp/files/2019-09-26-raspbian-buster.img

# Dowload kernel and export location
echo "Downloading kernal..."
# curl -OL curl -o ./tmp/files/kernel-qemu-4.19.50-buster https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.19.50-buster
export RPI_KERNEL=./tmp/files/kernel-qemu-4.19.50-buster

# Download filesystem and export location
echo "Downloading filesystem..."
# curl -o ./tmp/files/2019-09-26-raspbian-buster.img -L http://downloads.raspberrypi.org/raspbian/images/raspbian-2019-09-30/2019-09-26-raspbian-buster.zip
# unzip ./tmp/files/2019-09-26-raspbian-buster.zip
export RPI_FS=./tmp/files/2019-09-26-raspbian-buster.img

# Tweak filesystem
echo "Tweaking filesystem..."

$QEMU -M versatilepb \
-cpu arm1176 \
-m 256 \
-drive format=raw,file=$RPI_FS \
-net nic \
-net user,hostfwd=tcp::5022-:22 \
-dtb ./bin/dev/emulator/versatile-pb.dtb \
-kernel $RPI_KERNEL \
-append 'root=/dev/sda2 panic=1' \
rw \
-no-reboot

# Enter these on the qemu terminal and exit
echo "Configuring QEMU..."
sed -i -e 's/^/#/' /etc/ld.so.conf
sed -i -e 's/^/#/' /etc/fstab

# # Emulate Raspberry Pi
# $QEMU -kernel $RPI_KERNEL \
# -cpu arm1176 -m 256 \
# -M versatilepb -no-reboot -serial stdio \
# -dtb ./bin/dev/emulator/versatile-pb.dtb \
# -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
# -drive "file=./tmp/files/2019-09-26-raspbian-buster.img,index=0,media=disk,format=raw" \
# -net user,hostfwd=tcp::5022-:22

# # Login to Pi
# echo "Logging into emulation..."
# ssh -p 5022 pi@localhost