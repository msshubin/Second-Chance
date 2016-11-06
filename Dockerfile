# TODO Сделать порт у ssh 222 дефолтным
# TODO Сделать генерацию ключей каждый раз новую при запуске контейнера

# Используем за основу контейнера Ubuntu 16.04 LTS
FROM ubuntu:16.04

# Переключаем Ubuntu в неинтерактивный режим — чтобы избежать лишних запросов
ENV DEBIAN_FRONTEND noninteractive

# Автозапуск ssh-сервера
ENTRYPOINT service ssh restart && bash

# Устанавливаем локаль
RUN locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales

# Обновляем кэш apt и устанавливаем OpenSSH-сервер и Python по минимуму
RUN apt-get update
RUN apt-get install -yqq --no-install-recommends openssh-server python

# Добавили публичный ключ из заранее сгенерированной пары для root
ADD id_rsa.pub /tmp/id_rsa.pub
RUN mkdir /root/.ssh
RUN cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys && rm -f /tmp/id_rsa.pub

# Объявляем, что контейнер будет транслировать 22 порт OpenSSH-сервер
EXPOSE 22

