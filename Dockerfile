FROM node:6
MAINTAINER Qiu Yu <unicell@gmail.com>

# Versions
ENV HUBOT_VERSION=0.4.0
ENV YO_VERSION=1.8.5
ENV COFFEE_SCRIPT=1.10.0
ENV HUBOT_SLACK_VERSION=4.0.5
ENV HUBOT_STACKSTORM_VERSION=0.4.5

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends vim git-core jq &&\
    apt-get clean

# Install coffee-script, hubot
RUN npm install -g yo@${YO_VERSION} \
        coffee-script@${COFFEE_SCRIPT} \
        generator-hubot@${HUBOT_VERSION}

# Working enviroment
ENV BOTDIR /opt/hubot
RUN install -o nobody -d ${BOTDIR}

WORKDIR ${BOTDIR}

# Install Hubot
USER nobody
ENV HOME ${BOTDIR}
RUN yo hubot --name="Hubot" --defaults

RUN npm install hubot-slack@${HUBOT_SLACK_VERSION} --save

RUN npm install hubot-stackstorm@${HUBOT_STACKSTORM_VERSION} --save && \
   (cat external-scripts.json && echo '["hubot-stackstorm"]') | jq -s add > external-scripts.json.new && \
   mv external-scripts.json.new external-scripts.json

# Entrypoint
CMD ["/bin/sh", "-c", "cd ${BOTDIR} && bin/hubot --adapter slack --alias !"]
