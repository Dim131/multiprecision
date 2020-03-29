echo off

set INDEX_VALUE=%1

echo.
echo building mandelbrot.exe
echo.

echo on

g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcapimin.c -o jcapimin.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcapistd.c -o jcapistd.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jccoefct.c -o jccoefct.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jccolor.c  -o jccolor.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcdctmgr.c -o jcdctmgr.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jchuff.c   -o jchuff.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcinit.c   -o jcinit.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcmainct.c -o jcmainct.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcmarker.c -o jcmarker.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcmaster.c -o jcmaster.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcomapi.c  -o jcomapi.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcparam.c  -o jcparam.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcphuff.c  -o jcphuff.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcprepct.c -o jcprepct.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jcsample.c -o jcsample.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jctrans.c  -o jctrans.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdapimin.c -o jdapimin.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdatadst.c -o jdatadst.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdcoefct.c -o jdcoefct.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdcolor.c  -o jdcolor.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jddctmgr.c -o jddctmgr.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdinput.c  -o jdinput.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdmainct.c -o jdmainct.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdmarker.c -o jdmarker.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdmerge.c  -o jdmerge.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdpostct.c -o jdpostct.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jdsample.c -o jdsample.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jerror.c   -o jerror.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jfdctflt.c -o jfdctflt.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jfdctfst.c -o jfdctfst.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jfdctint.c -o jfdctint.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jidctflt.c -o jidctflt.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jidctfst.c -o jidctfst.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jidctint.c -o jidctint.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jidctred.c -o jidctred.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jmemansi.c -o jmemansi.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jmemmgr.c  -o jmemmgr.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jquant1.c  -o jquant1.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jquant2.c  -o jquant2.o
g++ -w -std=c99 -O3 -march=native -I./jpeg-6b -x c -c jpeg-6b/jutils.c   -o jutils.o
g++ -Wall -Wextra -pedantic -std=c++17 -O3 -march=native -DBOOST_MULTIPRECISION_MANDELBROT_IMAGE_INDEX="%INDEX_VALUE%" -I./jpeg-6b -I. -IC:/boost/boost_1_72_0 -x c++ -c mandelbrot.cpp -o mandelbrot.o
g++ -Wall -Wextra -pedantic -std=c++17 -O3 -march=native -x none jcapimin.o jcapistd.o jccoefct.o jccolor.o jcdctmgr.o jchuff.o jcinit.o jcmainct.o jcmarker.o jcmaster.o jcomapi.o jcparam.o jcphuff.o jcprepct.o jcsample.o jctrans.o jdapimin.o jdatadst.o jdcoefct.o jdcolor.o jddctmgr.o jdinput.o jdmainct.o jdmarker.o jdmerge.o jdpostct.o jdsample.o jerror.o jfdctflt.o jfdctfst.o jfdctint.o jidctflt.o jidctfst.o jidctint.o jidctred.o jmemansi.o jmemmgr.o jquant1.o jquant2.o jutils.o mandelbrot.o -o mandelbrot.exe

echo off

echo.
echo run mandelbrot.exe
echo.

mandelbrot.exe
