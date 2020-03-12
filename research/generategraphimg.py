import tensorflow as tf
from tensorflow.python.platform import gfile

model = '/home/wuwei/.keras/datasets/ssd_mobilenet_v1_coco_2017_11_17/saved_model/saved_model.pb'
graph = tf.get_default_graph()
graph_def = graph.as_graph_def()
graph_def.ParseFromString(gfile.FastGFile(model, 'rb').read())
tf.import_graph_def(graph_def, name='graph')
summaryWriter = tf.summary.FileWriter('object_detection/log/', graph)