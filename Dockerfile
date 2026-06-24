FROM searxng/searxng:latest

# 1. 把 - html 改成 - json（原文件默认只有 html 那一行）
RUN sed -i 's/^\([[:space:]]*\)\(- html\)$/\1- html\n\1- json/' /etc/searxng/settings.yml

# 2. 再顺手把 limiter 关了，不然服务端调用容易被 429
RUN sed -i 's/limiter:.*/limiter: false/' /etc/searxng/settings.yml

# 3. secret_key
RUN sed -i "s/ultrasecretkey/$(openssl rand -hex 32)/g" /etc/searxng/settings.yml
