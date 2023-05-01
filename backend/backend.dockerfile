FROM python:3.11.1-slim-buster

WORKDIR /app/

# Install curl
RUN apt-get -y update && apt-get -y install curl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/etc/poetry python3 - && \
    cd /usr/local/bin && \
    ln -s /etc/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy poetry.lock* in case it doesn't exist in the repo
COPY ./app/pyproject.toml ./app/poetry.lock* /app/

# Allow installing dev dependencies to run tests
ARG APP_ENV=prod
RUN bash -c "if [ $APP_ENV == 'dev' ] ; then poetry install --no-root ; else poetry install --no-root --no-dev ; fi"

COPY ./app /app
ENV PYTHONPATH=/app

RUN useradd -m -d /usr/fastapi -s /bin/bash fastapi \
    && chown -R fastapi:fastapi ./* && chmod +x ./scripts/*

USER fastapi

CMD [ "./scripts/start.sh" ]
