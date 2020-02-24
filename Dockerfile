FROM tensorflow/tensorflow:devel-py3
RUN cd tensorflow_src && bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma  --copt=-msse4.1 --copt=-msse4.2 -k //tensorflow/tools/pip_package:build_pip_package && bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
RUN pip install /tmp/tensorflow_pkg/*
