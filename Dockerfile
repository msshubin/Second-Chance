# Используем за основу контейнера Ubuntu 16.04 LTS
FROM ubuntu:16.04

# Переключаем Ubuntu в неинтерактивный режим — чтобы избежать лишних запросов
ENV DEBIAN_FRONTEND noninteractive

# Устанавливаем локаль
RUN locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales

# Обновляем кэш apt и устанавливаем OpenSSH-сервер
RUN apt-get update
RUN apt-get install -yqq --no-install-recommends openssh-server

# Добавили пользователя
RUN useradd shubin

# Добавили публичный ключ из заранее сгенерированной пары для пользователя
#ADD id_dsa.pub /home/shubin/.ssh/id_dsa.pub
ADD authorized_keys /home/shubin/.ssh/authorized_keys
COPY sshd_config /etc/ssh/sshd_config

# Объявляем, что контейнер будет транслировать 22 порт OpenSSH-сервер
EXPOSE 22

# Запустили ssh-сервер
#RUN service ssh start

#CMD ["service", "ssh", "start"]
#CMD ["/usr/sbin/sshd"]
CMD ["sh"]

