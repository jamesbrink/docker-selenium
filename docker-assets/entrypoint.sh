#!/bin/bash
echo "Starting Selenium"
cleanup ()
{
  echo "Exiting"
  vncserver -kill :1
  pkill -15 emulator
  exit $?
}
trap cleanup SIGTERM
# Start VNC server.
export USER=selenium
vncserver
# Add webdrivers to path, this is how selenium finds them.
export PATH=/home/selenium/webdrivers:$PATH
java -jar selenium_server.jar
wait ${!}
