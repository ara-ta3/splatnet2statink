FROM python:2.7
ADD ./*.py /opt/
ADD ./requirements.txt /opt/
WORKDIR /opt
RUN pip install -r requirements.txt
ADD ./config.txt /opt/
ENTRYPOINT ["python", "splatnet2statink.py"]
CMD ["-r"]
