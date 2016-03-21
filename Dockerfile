FROM vertisfinance/baseimage

RUN set -ex \
    && deps=' \
        libpq5 \
        git \
    ' \
    && buildDeps=' \
        gcc \
        libpq-dev \
    ' \
    && apt-get update \
    && apt-get install -y $deps --no-install-recommends \
    && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && pip2 install --no-cache-dir \
           psycopg2==2.6.1 \
           trac==1.0.10 \
           pygments==2.1.1 \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/*

COPY entry.py /entry.py
