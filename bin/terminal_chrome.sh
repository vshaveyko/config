#!/bin/bash

# Pass the PID as the 1st (and only) argument.
focusByPid()
{
  osascript -e "
    tell application \"System Events\"
      set frontmost of the first process whose unix id is equal to ${1} to true
    end tell
  "
}

CHROME_TMP_DIR='/tmp/terminal-chrome'
CHROME_ARGS="--user-data-dir=${CHROME_TMP_DIR}"

currentChromePid()
{
  pgrep -f "Chrome $CHROME_ARGS"
}

openNewChrome()
{
  open -n http://localhost:${1} --args $CHROME_ARGS
}

activeConsoleChrome()
{
  if [ -n ${1} ]; then
    PORT=3000
  else
    PORT=${1}
  fi

  local chromePid=$(currentChromePid)

  echo chromedPid: \"$chromePid\"

  if [ -n "$chromePid" ]; then
    echo Focusing current chrome with PID: $chromePid
    focusByPid $chromePid
  else
    echo Opening new chrome on PORT: $PORT
    openNewChrome $PORT
  fi

}
