# Hubot with Slack adapter and StackStorm integration

[![](https://images.microbadger.com/badges/version/unicell/hubot-slack.svg)](https://microbadger.com/images/unicell/hubot-slack "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/unicell/hubot-slack.svg)](https://microbadger.com/images/unicell/hubot-slack "Get your own image badge on microbadger.com")

## Requirements

* docker-compose: 1.5.0+ (for .env support)
* Slack API token for Hubot: https://slack.com/services/new/hubot

## Quick Start

Edit `.env` file:

```
ST2_API=https://<StackStorm host>:443/api
ST2_AUTH_URL=https://<StackStorm host>:443/auth
ST2_AUTH_USERNAME=testu
ST2_AUTH_PASSWORD=testp
ST2_ROUTE=chatops
HUBOT_SLACK_TOKEN=xoxb-1234567890-XXXXXXXXXXXXXXXXXXXXXXXX 
```

Run Hubot with docker-compose:

```
docker-compose -f hubot-slack.yml up -d
```
