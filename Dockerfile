ARG JUPYTER_DEBIAN_VERSION="1.1.2"

FROM xandai/jupyter-debian:${JUPYTER_DEBIAN_VERSION}

ARG JSBSIM_VERSION="1.1.6"
ARG JUPYTER_USER="jupyter"
ARG HOME_PATH="/home/${JUPYTER_USER}"
ARG TEMP_JSBSIM_DIR="${HOME_PATH}/jsbsim"

USER root

ARG APT_PACKAGES="build-essential git make cmake pkg-config automake autoconf"
ARG PIP_PACKAGES="jsbsim==${JSBSIM_VERSION}"

RUN apt-get update \
    && apt-get install -y --no-install-recommends ${APT_PACKAGES} \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m pip install --no-cache-dir cython

USER ${JUPYTER_USER}

RUN git clone https://github.com/JSBSim-Team/jsbsim.git ${TEMP_JSBSIM_DIR} \
    && cd ${TEMP_JSBSIM_DIR} \
    && git checkout v${JSBSIM_VERSION} \
    && mkdir build \
    && cd build \
    && cmake .. -DBUILD_PYTHON_MODULE=OFF\
    && make -j$(nproc)

USER root

RUN cd ${TEMP_JSBSIM_DIR}/build \
    && make install \
    && python3 -m pip install --no-cache-dir jsbsim

USER ${JUPYTER_USER}

RUN rm -rf ${TEMP_JSBSIM_DIR}
