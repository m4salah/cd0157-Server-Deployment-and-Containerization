FROM python:stretch

COPY . /app
WORKDIR /app

ENV PYTHONUNBUFFERED 1 \
    PYTHONDONTWRITEBYTECODE 1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_NO_CACHE_DIR=off

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
