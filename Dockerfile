FROM python:3
RUN echo '%wheel    ALL=(ALL)    NOPASSWD: ALL' >> /etc/sudoers && \
    (yes|adduser atlas)

USER atlas
RUN pip install jupyter --user
RUN echo 'export PATH=$PATH:$HOME/.local/bin' >> /home/atlas/setup.sh
CMD . /home/atlas/setup.sh && jupyter notebook --ip=0.0.0.0
