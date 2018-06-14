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
ENTRYPOINT [ "task", "-d", "/app", "run-mypypi" ]




