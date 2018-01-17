 #!/usr/bin/env bash 

sudo ln -s ~/dev/gchq/nginx/nginx.conf /etc/nginx/nginx.conf

sudo rm -rf /etc/nginx/certs
sudo mkdir /etc/nginx/certs
sudo ln -s $HOME/dev/gchq/nginx/certs/server.pem.crt /etc/nginx/certs/server.pem.crt
sudo ln -s $HOME/dev/gchq/nginx/certs/server.unencrypted.key /etc/nginx/certs/server.unencrypted.key
sudo ln -s $HOME/dev/gchq/nginx/certs/ca.pem.crt /etc/nginx/certs/ca.pem.crt