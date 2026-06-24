from searxng/searxng:latest
sed -i 's/  formats:/  formats:\n    - json/' /etc/searxng/settings.yml

