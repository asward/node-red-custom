FROM nodered/node-red

WORKDIR /usr/src/node-red
RUN npm install johanneskropf/node-red-contrib-voice2json

# INSTALL VOICE2JSON
WORKDIR /home/node-red/voice2json
RUN curl -L https://github.com/synesthesiam/voice2json/releases/download/v2.1/voice2json_2.1_armhf.deb -o voice2json_2.1_armhf.deb
RUN sudo apt install ./voice2json_2.1_armhf.deb

# DOWNLOAD PROFILE
RUN voice2json --profile en-us_kaldi-zamia download-profile
RUN voice2json train-profile