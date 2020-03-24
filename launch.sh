cd /tmp/models && git pull -q && cd research
mount -t nfs 192.168.50.216:/home/blita/nfsnew/nfstest /tmp/nfsnew
export PYTHONPATH=$PYTHONPATH:pwd:pwd/slim
python ./object_detection/model_main.py --pipeline_config_path=./object_detection/samples/configs/ssd_mobilenet_v1_focal_loss_pets.config --model_dir=./object_detection/checkpoint --alsologtostder
