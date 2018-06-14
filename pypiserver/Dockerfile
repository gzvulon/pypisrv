FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev wget git
RUN cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && ln -s /usr/bin/pip3 pip \
  && pip install --upgrade pip

# install task
RUN wget -q -O - https://github.com/go-task/task/releases/download/v2.0.2/task_linux_amd64.tar.gz | tar xvz -C /bin
RUN chmod +x /bin/task

# prepare
RUN mkdir -p /app/data/packages
COPY Taskfile.yml /app/Taskfile.yml
RUN task -d /app --list

# install dependncies
RUN task -d /app deps-install
RUN ls /app

# RUN mkdir -p /srv
# ADD strartup.sh /srv/strartup.sh
# RUN chmod +x /srv/strartup.sh
# RUN ls /srv

WORKDIR /
# RUN rm -rf /pypiserver

# Start Script
ADD startup.sh /bin/startup.sh
RUN chmod +x /bin/startup.sh

# Data Directory
RUN mkdir -p /app/data/packages
WORKDIR /app/data

# ENTRYPOINT [ "task", "-d", "/app", "run-mypypi" ]
# CMD [ "bash", "-c","/srv/strartup.sh" ]

# ENTRYPOINT ["pypi-server"]
# CMD ["--overwrite", "-P", ".", "-a", ".", "-p", "8081", "packages"]




CMD ["/bin/startup.sh"]