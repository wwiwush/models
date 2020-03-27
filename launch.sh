mount -t nfs 192.168.50.216:/home/blita/nfsnew/nfstest /tmp/nfsnew
cd /tmp/nfsnew/dataset/det_trainset && git pull -q
cd /tmp/nfsnew/dataset/det_testset && git pull -q
cd /tmp/models && git pull -q && cd research
protoc object_detection/protos/*.proto --python_out=.
python object_detection/dataset_tools/create_rio28_tf_record.py --data_dir=/tmp/nfsnew/dataset/det_trainset  --set=train  --label_map_path=object_detection/private/rio28_day_label_map.pbtxt --output_path=/tmp/rio28_day_train.tfrecord
python object_detection/dataset_tools/create_rio28_tf_record.py --data_dir=/tmp/nfsnew/dataset/det_testset  --set=test  --label_map_path=object_detection/private/rio28_day_label_map.pbtxt --output_path=/tmp/rio28_day_test.tfrecord
export PYTHONPATH=$PYTHONPATH:pwd:pwd/slim
python object_detection/model_main.py --pipeline_config_path=object_detection/private/configs/ssd_mobilenet_v2_multiple_run_config --model_dir=object_detection/checkpoint --alsologtostder
