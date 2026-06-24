FROM searxng/searxng:latest

COPY settings.yml /etc/searxng/settings.yml

# secret_key 必须换，原镜像也是这么干的
RUN sed -i "s/ultrasecretkey/$(openssl rand -hex 32)/g" /etc/searxng/settings.yml
