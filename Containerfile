FROM python:3.12.2-alpine3.19
WORKDIR /app
RUN apk update \
 && apk add python3 py3-pip
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY humblebundle_downloader humblebundle_downloader
ENTRYPOINT ["python3", "humblebundle_downloader/cli.py"]
CMD ["-h"]
