
SSH

---
ключ -A используется для явного указания намерения использовать Agent Forwarding

#### $ssh -i ~/.ssh/id_rsa -A user@10.10.80.202
---

сквозное подключение через SSH (без доступа к интернету и внешнего IP - адреса)

#### $ssh -t -i ~/.ssh/id_rsa -A user@10.10.80.202 ssh 192.168.0.1

---

подключение SSH aлиасами / сквозное подключение алиасами

#### vim /etc/ssh/ssh_config

Host externalhost

HostName 1.2.3.4

User username

Port 22

---

Host internalhost

HostName 192.168.0.1

IdentityFile ~/.ssh/id_rsa

User username

ProxyJump externalhost

---

#### [Немного о SSH ](https://help.ubuntu.ru/wiki/ssh "Описание")

---
#### [10 Примеров: Копирование файлов через SSH](https://www.shellhacks.com/ru/copy-files-ssh-10-examples/ "копирование файлов через SSH")

---



## Pritunl — VPN-сервер ( на примере Ubuntu 16.04 )

#### 1. создаем скрипт  

cat <<EOF> setupvpn.sh

#!/bin/bash

echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse">/etc/apt/sources.list.d/mongodb-org-4.0.list

echo "deb http://repo.pritunl.com/stable/apt xenial main">/etc/apt/sources.list.d/pritunl.list

apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

apt-get update

apt-get --assume-yes install pritunl mongodb-org

systemctl start pritunl mongod

systemctl enable pritunl mongod

EOF

#### 2. запускаем скрипт

$ sudo bash setupvpn.sh

#### 3. настраиваем по данной инструкции

https://docs.pritunl.com/docs/configuration-5
