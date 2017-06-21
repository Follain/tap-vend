tap-vend
========

## A [singer.io](http://singer.io) tap to extract data from [Vend POS](http://vendhq.com) and load into any Singer target, like Stitch or CSV

# Configuration

    {
      "store":"your-vend-store",
      "token":"your-vend-personal-token",
      "requests_per_second": 2
    }

# Usage (with [Stitch target](https://github.com/singer-io/target-stitch))

    > bundle exec tap-vend
    Usage: tap-vend [options]
        -c, --config config_file         Set config file (json)
        -s, --state state_file           Set state file (json)
        -h, --help                       Displays help
        -v, --verbose                    Enables verbose logging to STDERR

    > pip install target-stitch
    > gem install tap-vend
    > bundle exec tap-vend -c config.vend.json -s state.json | target-stitch --config config.stitch.json | tail -1 > state.new.json
