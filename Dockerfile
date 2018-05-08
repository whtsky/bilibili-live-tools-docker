FROM centos:7.4.1708

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum makecache && yum update -y
RUN yum install -y sudo gcc \
                        make \
                        openssl-devel \
                        bzip2-devel \
                        expat-devel \
                        gdbm-devel \
                        readline-devel \
                        sqlite-devel \
                        unzip

COPY ./Python-3.6.5.tar.xz Python-3.6.5.tar.xz
COPY ./pip-10.0.1.tar.gz pip-10.0.1.tar.gz
COPY pip.conf ~/.pip/pip.conf   

RUN tar -xzf pip-10.0.1.tar.gz
RUN xz -d Python-3.6.5.tar.xz && tar -xf Python-3.6.5.tar

RUN cd /Python-3.6.5 && ./configure --prefix=/usr/local/python3 && make && make install
RUN sudo ln -s /usr/local/python3/bin/python3 /usr/bin/python3

RUN cd pip-10.0.1 && python3 setup.py install --record log
RUN sudo ln -s /usr/local/python3/bin/pip /usr/bin/pip3

COPY bilibili-live-tools-master.zip bili.zip
RUN unzip bili.zip
COPY ./bilibili.conf /bilibili-live-tools-master/conf/bilibili.conf

RUN pip3 install -r /bilibili-live-tools-master/requirements.txt

CMD cd /bilibili-live-tools-master && PYTHONIOENCODING=utf-8 python3 run.py