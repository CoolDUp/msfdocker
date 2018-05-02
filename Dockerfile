FROM ubuntu:14.04

WORKDIR /opt
USER root

# Base packages
RUN apt-get update && apt-get -y install \
  git build-essential zlib1g zlib1g-dev \
  libxml2 libxml2-dev libxslt-dev locate curl \
  libreadline6-dev libcurl4-openssl-dev git-core \
  libssl-dev libyaml-dev openssl autoconf libtool \
  ncurses-dev bison curl wget xsel postgresql \
  postgresql-contrib postgresql-client libpq-dev \
  libapr1 libaprutil1 libsvn1 \
  libpcap-dev libsqlite3-dev libgmp3-dev \
  nasm tmux vim nmap \
  openssh-server sudo python binwalk

# Get Metasploit
RUN git clone https://github.com/cooldup/metasploit-framework.git msf

WORKDIR msf
 
 # RVM
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import
RUN curl -L https://get.rvm.io | bash -s stable 
RUN /bin/bash -l -c "rvm --install 2.5.1"
RUN /bin/bash -l -c "rvm use 2.5.1 --default"
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "source /usr/local/rvm/scripts/rvm"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Get dependencies
RUN /bin/bash -l -c "bundle install"

# Install PosgreSQL
COPY db.sql /tmp/db.sql
RUN /etc/init.d/postgresql start && su postgres -c "psql -f /tmp/db.sql"
COPY database.yml /opt/msf/config/database.yml
 
# Symlink tools to $PATH
RUN for i in `ls /opt/msf/tools/*/*`; do ln -s $i /usr/local/bin/; done
RUN ln -s /opt/msf/msf* /usr/local/bin

# startup script and tmux configuration file
COPY init.sh /usr/local/bin/init.sh
COPY tmux.conf /root/.tmux.conf
RUN  chmod a+xr /usr/local/bin/init.sh

# configure ssh and generate root password
RUN mkdir /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's|UsePAM yes|#UsePAM yes|g' /etc/ssh/sshd_config
RUN echo "root:$(date +%N)" > /root/passwd \
 && chmod 600 /root/passwd \
 && chpasswd < /root/passwd

# settings and custom scripts folder
VOLUME /root/.msf4/
VOLUME /tmp/data/

# clean apt-cache
RUN apt-get clean

CMD /usr/local/bin/init.sh
