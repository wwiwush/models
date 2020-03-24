cd /tmp/models && git pull -q && cd research
mount -t nfs 192.168.50.216:/home/blita/nfsnew/nfstest /tmp/nfsnew
export PYTHONPATH=$PYTHONPATH:pwd:pwd/slim
