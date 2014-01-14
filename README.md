# Nagging WIP notifier

This is a simple tool I wrote to send automatically an email to a 
team of people if the WIP at a given point in time surpasses a
value.

This is under heavy development so I suppose that many things will change soon and something may not work ;)

## Installation

This is not yet pushed to rubygems so I'm afraid you need to:

        git clone https://github.com/rafadc/nagging-wip
        rake install


## Usage

Just install and set up a user for this. At this moment you can set a cron job that runs __nagging-wip__ command periodically

## Configuration

You must place a __.nagging_wip.yml__ file in home folder.

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
    use_ssl: false
    from: my@email.com
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

#### Pivotal tracker project

Takes current iteration of a Pivotal tracker project

```yaml
pivotal_tracker_project:
    token: jkfduisj97823974j2kl24899234 # Pivotal API token
    project_id: 84739
    max_wip: 4
```

#### Mock project

This is just a mock that we can use to test notifications.

```yaml
mock_project:
    current_wip: 6
    max_wip: 4
```

## Example

Let's prepare! We can test that everything is up and running if we create the following config file

```yaml
console:
    message: 'WIP surpassed'
mock_project:
    current_wip: 6
    max_wip: 4
```

If we run the command

        nagging-wip

we should get the following output

        WIP surpassed

We can then switch to a more useful configuration using pivotal tracker and sending emails

```yaml
pivotal_tracker_project:
    token: jkfduisj97823974j2kl24899234 # Pivotal API token
    project_id: 84739
    max_wip: 4
email:
    emails:
        - teammate@email.com
        - other@email.com
    smtp_server: mail.myserver.com
    smtp_port: 25
    username: username # Optional
    password: password # Optional
    use_ssl: false
    from: my@email.com
    subject: 'WIP too high in our awesome project'
    body: 'We need to do something soon!'
```

Now, how do we run this periodically? Well, at the moment there is no daemon mode yet so we can add it to our cron with a line line the following

        * 9,13,15 * * * bash -l -c nagging-wip

This will cause the WIP to be checked three times a day at 9, 13 and 15 hours. I run it under a new login shell since I'm using RVM. If you use system ruby you can just run nagging-wip.


## Development

[![Build Status](https://travis-ci.org/rafadc/nagging-wip.png?branch=master)](https://travis-ci.org/rafadc/nagging-wip) [![Code Climate](https://codeclimate.com/github/rafadc/nagging-wip.png)](https://codeclimate.com/github/rafadc/nagging-wip) [![Coverage Status](https://coveralls.io/repos/rafadc/nagging-wip/badge.png)](https://coveralls.io/r/rafadc/nagging-wip)
