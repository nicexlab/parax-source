#!/usr/bin/env bash -exuo pipefail
 

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -ex
disk=${1:-vda.qcow2}
qemu-system-arm -M virt -m 1024 \
  -kernel vmlinuz-3.16.0-6-armmp-lpae \
  -initrd initrd.img-3.16.0-6-armmp-lpae \
  -smp 4 \
  -append 'root=/dev/vda1' \
  -drive if=none,file=$disk,format=qcow2,id=hd \
  -device virtio-blk-device,drive=hd \
  -netdev user,id=mynet,hostfwd=tcp::2222-:22 \
  -device virtio-net-device,netdev=mynet \
  -nographic
#  -display none
