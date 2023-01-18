# Tweak docker for RouterOS

[Mikrotik Container](https://help.mikrotik.com/docs/display/ROS/Container) allows users to run containerized environments within RouterOS.
Most of docker images are working right out of box. But some images need additional customization to get it working.

## coredns

The original image `coredns/coredns` is not starting on v7.7.

Replace with `roscr/coredns`.
