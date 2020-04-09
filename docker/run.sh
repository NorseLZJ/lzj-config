#!/bin/bash

# shell case

case $1 in
  'srv')
  cc tsrv.c -o srv ;;
  'cli')
  cc tcli.c -o cli ;;
  'opt')
  cc getopt.c -o opt ;;
  'thread')
  cc -g -pthread tthread.c -o thread -Wall ;;
  *)
  echo 'no match cmd';;
esac



