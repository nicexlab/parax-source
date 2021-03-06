# ParaX

## Overview
ParaX is a variation of MXNet 
that issues one instance processing a batch of samples for every core on a CPU, 
so as to alleviate memory bandwidth contention in DNN model training and inference on many-core CPUs.

Note: ParaX has been published in VLDB'21. 

## Install ParaX
git clone https://github.com/nicexlab/parax-source

cd parax-source

make -j

## Run ParaX
export MXNET_ENGINE_TYPE=NaiveEngine; 

python $MXNET_ROOT/tools/launch.py -n $number_of_instances -p $core_per_instance --launcher=local $command

$number_of_instances is the number of issued instances

$core_per_instance is the number of cores occupied by each instance

$command is the python program for DNN training or inference

When $number_of_instances is equal to the number of cores and using $core_per_instance=1, ParaX adopts the instance-per-core paradigm

## Example
export MXNET_ENGINE_TYPE=NaiveEngine; 

python $MXNET_ROOT /tools/launch.py -n 56 -p 1 --launcher=local python $MXNET_ROOT/example/image_classification/train_imagenet.py 

This will train ImageNet with ParaX.
