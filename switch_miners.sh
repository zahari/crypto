#!/bin/bash

ETN_WALLET="etnXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
ETN_POOL="stratum+tcp://pool.etn.spacepools.org:1111"
ETN_POOL="stratum+tcp://eu2.electromine.fr:3333"
ETN_POOL="stratum+tcp://pool.etnminers.com:3333"
MINER_IMAGE="hmage/cpuminer-opt"
MINER_IMAGE="bitnn/alpine-monero-miner"

for vm in blabla tralala dinkydong munchdunch cewybong;
do
  echo ""
  echo "=== Processing [${vm}] ==="
  echo ""
  if [ ${1} == "0" ]; then
    sshpass ssh ${vm} "docker ps -aq|xargs docker rm -f"
    sshpass ssh ${vm} "docker images -q|xargs docker rmi -f"
    sshpass ssh ${vm} "rm -vf .cpu.sh"
  elif [ "${1}" == "1" ]; then
    #scp .cpu.sh ${vm}:~/; sshpass ssh ${vm} "/bin/bash .cpu.sh"
    sshpass ssh ${vm} "docker run -d ${MINER_IMAGE} -a cryptonight -o ${ETN_POOL} -u ${ETN_WALLET} -p x"
    sleep 2
    sshpass ssh ${vm} "docker ps"
  fi
done

exit 0;
