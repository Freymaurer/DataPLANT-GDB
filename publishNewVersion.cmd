@echo off

@REM get shared strings
set /p gdb_image_name=<SharedLiterals\gdb_image_name.txt
set /p postgres_image_name=<SharedLiterals\postgres_image_name.txt
set /p latest_version=<SharedLiterals\version.txt
@REM set derived variables
set gdb_remote_name=csbdocker/%gdb_image_name%
set postgres_remote_name=csbdocker/%postgres_image_name%

echo This script will create new images from ":new". These will be tagged as ":latest" and ":<next_version>".

echo    "(Last Release Version: %latest_version%)"

set /p next_version="What version to publish next? [major.minor.patch]: "

IF NOT "%next_version%"=="" ( 
  echo "Starting.."
  echo "..tagging images.."
  @REM tag gdb
  docker tag %gdb_image_name%:new %gdb_remote_name%:latest
  docker tag %gdb_image_name%:new %gdb_remote_name%:%next_version%
  @REM tag postgres
  docker tag %postgres_image_name%:new %postgres_remote_name%:latest
  docker tag %postgres_image_name%:new %postgres_remote_name%:%next_version%
  echo "..pushing images.."
  @REM push gdb
  docker push %gdb_remote_name%:latest
  docker push %gdb_remote_name%:%next_version%
  @REM push postgres
  docker push %postgres_remote_name%:latest
  docker push %postgres_remote_name%:%next_version%
  echo %next_version% > SharedLiterals\version.txt
  echo "..done!"
)
