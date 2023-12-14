@echo off
set /p gdb_image_name=<SharedLiterals\gdb_image_name.txt
set /p postgres_image_name=<SharedLiterals\postgres_image_name.txt

cd easyGDB_docker

set /p GDB="Build new GDB image [y/n]: "
set /p postgres="Build new postgres image [y/n]: "

IF "%GDB%"=="y" (
  ECHO "Start building %gdb_image_name%:new image ..."
  docker build -t %gdb_image_name%:new -f Dockerfile.gdb .
)

IF "%postgres%"=="y" (
  ECHO "Start building %postgres_image_name%:new image ..."
  docker build -t %postgres_image_name%:new -f Dockerfile.postgres .
)

ECHO Done!
