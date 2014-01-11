# THIS IS STILL NOT WORKING. I'M JUST PLAYING A LITTLE BIT :P

# Nagging WIP notifier

This is a simple tool I wrote to send automatically an email to a 
team of people if the WIP at a given point in time surpasses a
value.

## Installation

```
gem install nagging-wip
```

## Configuration

You must place a __.nagging_wip.yml__ file in _$HOME_

There you can add several sections for the different notifiers and projects

### Notifiers

A notifier warns people that the WIP has been surpassed. All the notifiers added to the config file will be invoked.

#### Email
```yaml
email:
    emails:
        - teammate@email.com
        - other@email.com
    smtp_server: mail.myserver.com
    smtp_port: 25
    username: username # Optional
    password: password # Optional
    from_address: my@email.com
    subject: 'WIP too high in our awesome project'
    body: 'We need to do something soon!'
```

#### Console

This one just outputs the information to the console. I use this for testing my projects.

```yaml
console:
    message: 'WIP surpassed'
```
### Projects

These are the sources of the WIP for the team.

#### Mock projects

This is just a mock that we can use to test out notifications.

```yaml
mock_project:
    current_wip: 6
```

## Development

[![Build Status](https://travis-ci.org/rafadc/nagging-wip.png?branch=master)](https://travis-ci.org/rafadc/nagging-wip) [![Code Climate](https://codeclimate.com/github/rafadc/nagging-wip.png)](https://codeclimate.com/github/rafadc/nagging-wip) [![Coverage Status](https://coveralls.io/repos/rafadc/nagging-wip/badge.png)](https://coveralls.io/r/rafadc/nagging-wip)
