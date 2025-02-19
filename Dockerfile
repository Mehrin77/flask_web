FROM ubuntu:16.04

LABEL MAINTAINER Your Name "Mehrin.Khan.26@lambda.compute.cmc.edu"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
RUN python -m pip install --upgrade pip==20.2.4
RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
