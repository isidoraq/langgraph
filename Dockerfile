FROM python:3.10

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR='/var/cache/pypoetry' \
    POETRY_HOME='/usr/local'
RUN curl -sSL https://install.python-poetry.org | python3 -

RUN echo $PATH
RUN echo $HOME

WORKDIR /code

COPY ["pyproject.toml", "poetry.lock", "/code/"]

# RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

RUN poetry install --no-root


RUN poetry install --only-root

CMD ["uvicorn", "--host", "0.0.0.0", "--port", "8000", "--root-path"]
