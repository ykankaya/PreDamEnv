#!/bin/sh
ssh-add id_rsa*
gpg2 --import scvhapps@gmail.com.asc
/bin/cp -r password-store/ ~/.password-store/
gpg2 --edit-key "scvhapps@gmail.com" trust quit
