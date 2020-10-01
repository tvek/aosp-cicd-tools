#!/bin/bash

sudo docker stop tcsbuildtoolcontainer
sudo docker rm tcsbuildtoolcontainer
sleep 3
sudo docker build . -t tcsbuildtool
sudo docker run -p 8080:8080 --name tcsbuildtoolcontainer tcsbuildtool &
sleep 40
wget http://localhost:8080/job/ReleasePipeline/build?delay=0sec > /dev/null

