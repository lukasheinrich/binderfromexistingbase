FROM python:3
RUN echo '%wheel    ALL=(ALL)    NOPASSWD: ALL' >> /etc/sudoers && \
    (yes|adduser atlas)

USER atlas
RUN pip install jupyter --user
RUN echo 'export PATH=$PATH:$HOME/.local/bin' >> /home/atlas/setup.sh

USER root
ADD entrypoint.sh /entrypoint.sh
RUN chown atlas /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER atlas

ENTRYPOINT ["/entrypoint.sh"]
