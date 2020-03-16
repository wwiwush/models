cd /tmp/models && git pull -q && cd research
export PYTHONPATH=$PYTHONPATH:pwd:pwd/slim
python ./object_detection/model_main.py --pipeline_config_path=./object_detection/samples/configs/ssd_mobilenet_v1_focal_loss_pets.config --model_dir=object_detection/checkpoint --num_train_steps=50000 --sample_1_of_n_eval_examples=1 --alsologtostder
