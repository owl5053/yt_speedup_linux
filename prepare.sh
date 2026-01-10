#!/bin/bash
KEYS="-Kt,h -d1 -s0+s -s3+s -s6+s -s9+s -s12+s -s15+s -s20+s -s30+s -An -Ku -a5 -An"
echo "Downloading latest version of ByeDPI_x86_64 ..."
curl -s https://api.github.com/repos/hufrea/byedpi/releases/latest | grep -o '"browser_download_url": "[^"]*i686.tar\.gz"' | cut -d'"' -f4 | xargs wget -c -q --show-progress
mkdir -p byedpi && tar -xzf *.tar.gz -C byedpi
rm  -f *i686.tar.gz 
chmod +x byedpi/ciadpi-i686

echo "Generating test.sh file..."
cat > test.sh << EOF
#!/bin/bash
./byedpi/ciadpi-i686 ${KEYS}
EOF
chmod +x test.sh
echo "done"


echo "Generating byedpi (DPI bypass) service file..."
cat > byedpi.service << EOF
[Unit] 
Description=byedpi (DPI bypass)
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=3
User=owl
ExecStart=$(pwd)/byedpi/ciadpi-i686 ${KEYS}
WorkingDirectory=$(pwd)/byedpi
StandardOutput=journal
StandardError=journal
SyslogIdentifier=byedpi

[Install]
WantedBy=multi-user.target
EOF
echo "done."
