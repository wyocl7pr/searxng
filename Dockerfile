FROM searxng/searxng:latest

# 在 "- html" 那行下面追加 "- json"，a\ 是 GNU sed 标准语法，稳
RUN sed -i '/^[[:space:]]*- html$/,+0 a\  - json' /etc/searxng/settings.yml || true

# 保险：确认有没有真的写进去
RUN grep -A1 'formats:' /etc/searxng/settings.yml

# secret_key
RUN sed -i "s/ultrasecretkey/$(openssl rand -hex 32)/g" /etc/searxng/settings.yml
