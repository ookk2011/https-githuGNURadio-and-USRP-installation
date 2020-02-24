sudo apt install -y xterm gnuradio uhd-host && sudo apt --fix-broken install
# Instalar paquetes extra y sus preferencias
# sudo apt build-dep gr-osmosdr && sudo apt install gr-osmosdr
# sudo apt build-dep libgnuradio-osmosdr0.1.4 && sudo apt install libgnuradio-osmosdr0.1.4 
# sudo apt build-dep soapyosmo-common0.6 && sudo apt install soapyosmo-common0.6
# sudo apt build-dep soapy-module-mirisdr && sudo apt install soapy-module-mirisdr
mkdir installation_files
cd installation_files
# Descarga de los .deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/a/airspy-host/libairspy0_1.0.9-3_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/a/airspyhf/libairspyhf0_1.0-1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/b/bladerf/libbladerf1_0.2016.06-2_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/libf/libfreesrp/libfreesrp0_0.3.0-2_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/hidapi/libhidapi-libusb0_0.8.0~rc1+git20140818.d17db57+dfsg-2_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/g/gr-fcdproplus/libgnuradio-fcdproplus3.7.11_3.7.25.4b6464b-5_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/g/gr-iqbal/libgnuradio-iqbalance3.7.11_0.37.2-11_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/h/hackrf/libhackrf0_2018.01.1-2_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/libm/libmirisdr/libmirisdr0_0.0.4.59ba37-5_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/libo/libosmosdr/libosmosdr0_0.1.8.effcaa7-7_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/r/rtl-sdr/librtlsdr0_0.5.3-13_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapysdr/libsoapysdr0.6_0.6.1-2_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/g/gr-osmosdr/libgnuradio-osmosdr0.1.4_0.1.4-14build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/g/gr-osmosdr/gr-osmosdr_0.1.4-14build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapyosmo/soapyosmo-common0.6_0.2.5-1build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapyosmo/soapysdr0.6-module-mirisdr_0.2.5-1build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapyosmo/soapysdr-module-mirisdr_0.2.5-1build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapyosmo/soapysdr0.6-module-osmosdr_0.2.5-1build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapyosmo/soapysdr-module-osmosdr_0.2.5-1build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapyosmo/soapysdr0.6-module-rfspace_0.2.5-1build1_amd64.deb
wget -c http://archive.ubuntu.com/ubuntu/pool/universe/s/soapyosmo/soapysdr-module-rfspace_0.2.5-1build1_amd64.deb
sudo dpkg -i *.deb
cd ..
rm -v -R installation_files
# Instalo drivers de la Ettus en la compu
sudo apt install --fix-broken
sudo uhd_images_downloader
# Verificar que funciona
while true; do
    read -p "Do you wish to test Ettus?" yn
    case $yn in
        [Yy]* ) read -n 1 -s -p "Connect the Ettus and press any key to continue";echo "";sudo uhd_find_devices;break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
