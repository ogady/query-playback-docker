FROM centos:centos7
RUN yum -y install git \
    && git clone https://github.com/Percona-Lab/query-playback.git
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
RUN yum -y localinstall http://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
RUN yum-config-manager --disable mysql80-community
RUN yum-config-manager --enable mysql56-community
RUN yum -y install tbb tbb-devel cmake boost boost-devel gcc gcc-c++ doxygen mysql-community-devel mysql-community-libs-compat openssl-devel wget make
RUN cd query-playback \
    && mkdir build_dir \
    && cd build_dir \
    && cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DMYSQL_LIB=/usr/lib64/mysql/libmysqlclient.so ..\
    && make \
    && make install \
    && cpack -G DEB ..

CMD ["/usr/sbin/init"]
