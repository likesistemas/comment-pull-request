FROM debian:10-slim

RUN apt update && apt install -y curl

ENV OWNER=likesistemas

ADD post-comment.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/post-comment.sh

ENTRYPOINT ["post-comment.sh"]