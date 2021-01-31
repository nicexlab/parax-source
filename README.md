# Mxnet Training CNN with multiple virtual CPU synchronous SGD
Devide the physical CPU to multiple virtual CPU, then doing a synchronous SGD. This method can speed up classification network training on Intel CPU. In addition, this method can also be applied to arm.

For example, if the CPU has 28 cores, we can divide it into 4 workers each with 7 cores and do a synchronos SGD. We use shared memory IPC instead of Parameter Server to achieve communication between workers, which is faster than PS on single node. We do experiments on INTEL XEON E5-2690 v4 CPU, which can gain an 1.5x speed up when training both Resnet and Mobilenet.

To run this, you need to copy files above to overwrite the previous ones on MxNet. Total throughput is the sum of all workers' throughput. 

Read the bash 'run.sh' for more informations.
