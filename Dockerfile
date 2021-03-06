FROM bioboxes/biobox-minimal-base@sha256:4a64abba8f4b2cd1c2d3f364ba41cb6bf4513c4caeb39f94b3b1492861a889ca

ENV PACKAGES python python-matplotlib
RUN apt-get update -y && apt-get install -y --no-install-recommends ${PACKAGES}

ADD image/install_quast.sh /install_quast.sh
RUN ./install_quast.sh && rm install_quast.sh

ADD image/Taskfile /
ADD image/schema.yml /
ADD image/run_quast.sh /usr/local/bin/

ENV SCHEMA /schema.yml
ENV BIOBOX_EXEC run_quast.sh
