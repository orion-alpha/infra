#!/bin/bash
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse">/etc/apt/sources.list.d/mongodb-org-4.0.list
echo "deb http://repo.pritunl.com/stable/apt xenial main">/etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
apt-get update
apt-get --assume-yes install pritunl mongodb-org
systemctl start pritunl mongod
systemctl enable pritunl mongod
