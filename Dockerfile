FROM mstormo/suse:11.4

# Updating the system
RUN zypper --non-interactive --gpg-auto-import-keys refresh
RUN zypper --non-interactive install git gcc-c++ bash

# Install libs to build Numpy/Scipy/Pandas
RUN zypper --non-interactive install gcc-fortran
RUN zypper --non-interactive install blas lapack

# Installing Python
RUN zypper --non-interactive install python python-xml python-devel

# Upgrade pip with wheel support
ADD https://bootstrap.pypa.io/get-pip.py ./
RUN python ./get-pip.py

# Define mount point and set it as working dir
VOLUME /usr/src/target
WORKDIR /usr/src/target

# Copy files
COPY ./entrypoint.sh /

# Start building process
ENTRYPOINT ["/entrypoint.sh"]
