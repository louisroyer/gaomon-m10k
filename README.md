# Installation
Tested with Linux 5.10.0-8-amd64

```bash
# apt install digimend-dkms libwacom-bin
# modprobe -r hid-kye hid-uclogic hid-polostar hid-viewsonic
# git clone https://github.com/louisroyer/gaomon-m10k
# make install
$ systemctl --user enable --now gaomon-m10k.service
```
