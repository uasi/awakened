# awakened - executes given command when Mac wakes up

## Install

```
make
cp awakened /path/to/bin
```

## Usage

```
awakened /full/path/to/executable args...
```

## Install launchd.plist

```
cp org.exsen.awakened.plist.sample ~/Library/LaunchAgents/org.exsen.awakened.plist
$EDITOR ~/Library/LaunchAgents/org.exsen.awakened.plist

launchctl load ~/Library/LaunchAgents/org.exsen.awakened.plist
```
