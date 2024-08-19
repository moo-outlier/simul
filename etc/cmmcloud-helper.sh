#!/bin/bash

path=(`pwd`)
if [[ "${path}" =~ "etc" ]]; then
  echo "======================================="
  echo "        cmmcloud helper start..        "
  echo "======================================="
else
  echo "etc폴더 안에서 실행해주세요."
  echo "end.."
  exit 0
fi

cd ../src/main/java
cmmcloud=(`ls -a | grep 'cmmcloud'`)

if [ -z ${cmmcloud} ]; then
  echo "there is no cmmcloud directory.."
  echo "make cmmcloud.."

  mkdir cmmcloud
fi

cd cmmcloud
ls=(`ls -a | grep '.git$'`)
if [ -z ${ls} ]; then
  echo "cmmcloud directory is not clone directory.."
  echo "remove cmmcloud.."

  cd ..
  rm -rf cmmcloud

  echo "start clone.."
  git clone --branch cbm https://github.com/BazerHanMinSu/cmmcloud.git

else
  echo "cmmcloud directory is clone directory.."
  echo "start pull.."

  git checkout cbm
  git pull origin cbm
fi

echo "end.."