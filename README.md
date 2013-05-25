Linda Temperature Alert
=======================
alert Temperature with RocketIO::Linda

* https://github.com/shokai/linda-temperature-alert
* read tuple ["sensor", "temperature"]
* write tuple ["say", "現在の気温、24度"] or ["say", "現在の気温、8度。お体に障りますよ"]


Dependencies
------------
- Ruby 1.8.7 ~ 2.0.0
- [Linda Arduino Sensor](https://github.com/shokai/linda-arduino-sensor)
- [Linda Mac Say](https://github.com/shokai/linda-mac-say)
- [LindaBase](https://github.com/shokai/linda-base)


Install Dependencies
--------------------

Install Rubygems

    % gem install bundler
    % bundle install


Run
---

set ENV var "LINDA_BASE" and "LINDA_SPACE"

    % export LINDA_BASE=http://linda.example.com
    % export LINDA_SPACE=test
    % bundle exec ruby linda-temperature-alert.rb


oneline

    % LINDA_BASE=http://linda.example.com LINDA_SPACE=test  bundle exec ruby linda-temperature-alert.rb


Crontab
-------

    % crontab -e

run 0 and 30 min every hour.

```
0,30 * * * *  cd /path/to/this/app && LINDA_BASE=http://linda.example.com LINDA_SPACE=test bundle exec ruby linda-temperature-alert.rb
```