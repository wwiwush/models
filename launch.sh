cd /tmp/models && git pull -q && cd research
export PYTHONPATH=$PYTHONPATH:pwd:pwd/slim
service ssh restart && bash
