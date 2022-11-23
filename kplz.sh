#!/bin/sh

<<DESC
- Syntax: kplz [process name]
- My version of killall or pkill. Do not kill 
  own/parent process and send a SIGKILL if SIGTERM 
  doesn't kill the process.
DESC

prompt_echo()
{
  local options
  local args
  for arg in $@
  do
    if [ $(echo $arg | cut -c 1-1) = - ]; then
      options="${options} ${arg}"
    else
      args="${args} ${arg}"
    fi
  done
  echo $options $(basename $0): $args
}

if [ $# -gt 1 ] || [ -z $1 ]; then
  prompt_echo 'kplz [process name]'
  exit 1
fi

ps -e -o pid=,comm= | grep -i $1 | cut -d' ' -f2 | while read pid; do
if [ $pid -eq $$ ] || [ $pid -eq $PPID ]; then
  continue
fi
kill -TERM $pid 2>/dev/null
if ps -p $pid 1>/dev/null; then 
  kill -KILL $pid 2>/dev/null
fi
done

exit 0
