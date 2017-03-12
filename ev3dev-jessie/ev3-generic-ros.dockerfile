# Official ev3dev image for LEGO MINDSTORMS EV3 hardware

FROM ev3dev/ev3dev-jessie-ev3-base
COPY layers/generic/ /
RUN /brickstrap/generic/run
ARG BRICKSTRAP_IMAGE_NAME=unknown-ev3dev-jessie-ev3-generic
ENV BRICKSTRAP_IMAGE_NAME ${BRICKSTRAP_IMAGE_NAME}
RUN echo "$BRICKSTRAP_IMAGE_NAME" > /etc/ev3dev-release
COPY layers/ros/ /
RUN apt-get -y update && apt-get install -y -t stretch libroscpp1d
RUN apt-get install -y sshfs
