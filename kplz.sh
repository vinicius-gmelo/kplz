#!/bin/sh

<<DESC
- Syntax: kplz [process name]
- My version of killall or pkill. Do not kill 
  own/parent process and send a SIGKILL if SIGTERM 
  doesn't kill the process.
DESC

if [ $# -gt 1 ] || [ -z $1 ]; then
  printf 'kplz [command]\n'
  exit 1
fi

ps --no-headers -eo pid:1,comm:1 | grep -i $1 | cut -d' ' -f1 | while read pid; do
if [ $pid -eq $$ ] || [ $pid -eq $PPID ]; then
  continue
fi
kill -TERM $pid 2>/dev/null
if ps -p $pid 1>/dev/null; then 
  kill -KILL $pid 2>/dev/null
fi
done

exit 0
