FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1

## Install dependencies
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev libffi-dev linux-headers postgresql-dev \
    musl-dev zlib zlib-dev

RUN mkdir /recruitment_task_api
WORKDIR /recruitment_task_api
COPY ./recruitment_task_api /recruitment_task_api

RUN pip install -r requirements.txt --no-cache-dir
RUN mkdir /static/images
## Media dir
RUN adduser -D user

#RUN chown -R user:user /recruitment_task_api/static/images/
#RUN chmod -R 755 /recruitment_task_api/static/images

USER user
