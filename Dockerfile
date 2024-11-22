FROM ghcr.io/linuxserver/baseimage-alpine:edge

WORKDIR /usr/src/app

RUN apk add --update --no-cache curl py-pip

RUN python3 -m venv venv

COPY ./requirements.txt ./

RUN source venv/bin/activate && pip install --upgrade pip  && pip install -r requirements.txt  && pip cache purge

COPY ./run.sh ./
COPY ./TwitchChannelPointsMiner ./TwitchChannelPointsMiner

ENTRYPOINT [ "/bin/sh", "run.sh" ]
