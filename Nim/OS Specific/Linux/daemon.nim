#How to create linux daemon

import os
import posix #required for fork
import times #required for sleep + time

let logFile = "/tmp/daemon.log"

proc daemonize() = #create daemon - unhook from parent process, kill parent, continue running child process
  if fork() > 0: #fork will return 1 if success
      let f = open(logFile, fmAppend)
      f.writeLine("Daemonized at " & $now())
      quit(0)  # kill parent
  elif fork() < 0: #fork will return -1 if failure
      let f = open(logFile, fmAppend)
      f.writeLine("Failed to start daemon at " & $now())
      quit(1) #exit upon failure to create child

proc daemon() = #run daemon
  while true:
      let f = open(logFile, fmAppend)
      f.writeLine("Daemon alive at " & $now())
      f.close()
      sleep(1000) 
      #Loop will write to log every second until its killed
