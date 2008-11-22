::@echo off
c:
cd \pixsuite
start /wait gmouse mousemove.gms
ping 127.0.0.1 -n 3 > NUL
start /wait gmouse mousemove.gms
ping 127.0.0.1 -n 3 > NUL
start /wait gmouse mousemove.gms
wizmo quiet blank
