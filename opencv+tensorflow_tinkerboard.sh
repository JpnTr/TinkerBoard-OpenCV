sudo sh -c 'apt-mark hold chromium && apt update && sudo apt upgrade -y'
wget http://ftp.us.debian.org/debian/pool/main/j/jasper/libjasper1_1.900.1-debian1-2.4+deb8u3_armhf.deb
sudo apt install ./libjasper1_1.900.1-debian1-2.4+deb8u3_armhf.deb
OPENCV_DEB=libopencv3_3.4.5-20181227.1_armhf.deb
curl -SL https://github.com/mt08xx/files/raw/master/opencv-rpi/${OPENCV_DEB} -o ${OPENCV_DEB}
sudo apt autoremove -y libopencv{3,4} # when old one is installed
sudo apt install -y ./${OPENCV_DEB}
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 ./get-pip.py
cat << EOF | sudo tee /etc/pip.conf
[global]
extra-index-url=https://www.piwheels.org/simple
EOF
wget https://github.com/lhelontra/tensorflow-on-arm/releases/download/v1.13.1/tensorflow-1.13.1-cp35-none-linux_armv7l.whl
sudo pip3 --no-cache-dir install ./tensorflow-1.13.1-cp35-none-linux_armv7l.whl