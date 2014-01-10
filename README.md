# THIS IS STILL NOT WORKING. I'M JUST PLAYING A LITTLE BIT :P

# Nagging WIP notifier

This is a simple tool I wrote to send automatically an email to a 
team of people if the WIP at a given point in time surpasses a
value.

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
    subject: 'WIP too high in out awesome project'
    body: 'We need to do something soon!'
```
