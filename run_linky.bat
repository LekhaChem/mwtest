@echo off
set LUA_PATH=lualibs/?.lua;./?.lua
set LUA_CPATH=clibs/?.dll

lua.exe -e "io.stdout:setvbuf('no')" "./mwtest/linky.lua"