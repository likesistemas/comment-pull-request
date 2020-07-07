FROM debian:10-slim

RUN apt update && apt install -y curl

RUN head --version \
 && shuf --version \
 && tail --version

ENV DOCKERIZE_VERSION v0.6.1
RUN apt-get update && apt-get install -y wget \
 && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
 && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV OWNER=likesistemas

ADD phrases.list .
ADD phrases-with-frontend.list .

ADD post-comment.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/post-comment.sh

ENTRYPOINT ["post-comment.sh"]