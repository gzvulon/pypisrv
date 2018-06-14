FROM ubuntu:16
RUN wget --help

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN pip3 install pypiserver
RUN mkdir -p /app/data


# install task
RUN wget -q -O - https://github.com/go-task/task/releases/download/v2.0.2/task_linux_amd64.tar.gz | tar xvz -C /bin
RUN chmod +x /bin/task

ADD Taskfile.yml /app/Taskfile.yml
RUN task -d /app --list
RUN task -d /app deps-install




