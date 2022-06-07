# Waggle Common Tools

This repo contains some common tools for Waggle OS administration and operations.

## Complete List

* `waggle-get-config`. Useful for Bash scripts to read a config entry from a .ini file.

```
a=$(waggle-get-config -C /etc/waggle/config.ini -s registration -k port); echo "[$a]"
[49190]
```

* `waggle-publish-metric`. Tool to publish a key=value pair to Beehive by writing a file into a temporary directory that is later read by https://github.com/waggle-sensor/wes-metrics-agent to publish to Beehive.

* `waggle-set-psu-state`. Sets the current power supply state. (Only works on node controller.)