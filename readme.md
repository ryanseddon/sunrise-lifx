# Sunrise effect using a Lifx lightbulb

Using their Ruby [gem](https://github.com/lifx/lifx-gem) I create a script that simulates a sunrise effect in time with my alarm.

## Context

I dive into more detail in [my article](http://www.thecssninja.com/hacking/sunrise-lifx) if you're interested in getting this up and running yourself.

## Setup

If you want to run this your self follow these steps

### OSX/Linux

All you need to do on your computer which will be triggering the script is have the following

1. RVM installed as the script will trigger `bundle exec ruby`
2. If copying and pasting the `sunrise.sh` bash script you'll need to make sure you pass the correct label your light has.

Clone this github repo to your machine and run `bundle install` inside the directory.

If that all works I would suggest running the script to see if it picks up your light and goes through the 2 minuted sunrise simulation.

```bash
bundle exec ruby path/to/sunrise.sh
```

To setup the alarm you configure a cron job by running the following command:

```bash
crontab path/to/sunrise.txt
```

This will setup two tasks the first will trigger the sunrise script at 6:28am and the second will recalibrate the light and turn it off at 6:45am. To change these times open up the `sunrise.txt` file and edit the times there. You'll also need to make sure the path to the script is correct.

### Windows

Mostly the same steps but instead of using a cron job you can use the windows task scheduler.

## License

Copyright 2014, Ryan Seddon
This content is released under the MIT license http://ryanseddon.mit-license.org
