Manual installation

1. Run prepare.sh to clone "ciadpi-i686" from the Git repository and
   prepare the service configuration file.

2. Before testing, please run test.sh and verify that video hosting websites
   (marked as "Y") work correctly.

3. Service installation instructions:
- Copy the service file goodbyedpi.service to /etc/systemd/system/ or any other
  systemd services directory.

- Run the following commands:
sudo systemctl daemon-reload
sudo systemctl enable goodbyedpi.service
sudo systemctl start goodbyedpi.service

- Check the service status:
sudo systemctl status goodbyedpi.service

Enjoy!

Just a quick note:
To enhance functionality, install the SmartProxy browser extension
and apply the following configuration:

"Proxy" -> 127.0.0.1:1080 type: SOCKS5
"Smart proxy" -> "Add hard rule(s)" , list:

yt3.ggpht.com
yt4.ggpht.com
yt3.googleusercontent.com
googlevideo.com
jnn-pa.googleapis.com
stable.dl2.discordapp.net
wide-youtube.l.google.com
youtube-nocookie.com
youtube-ui.l.google.com
youtube.com
youtubeembeddedplayer.googleapis.com
youtubekids.com
youtubei.googleapis.com
youtu.be
yt-video-upload.l.google.com
ytimg.com
ytimg.l.google.com
