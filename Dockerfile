# Mezzanine
#
# VERSION   0.1
FROM ubuntu:12.10
MAINTAINER Filip Jukić <filip@appsembler.com>

RUN apt-get update
RUN apt-get install -y python-software-properties python-setuptools python-dev libxml2-dev libxslt-dev lib32z1-dev git-core nginx
RUN easy_install pip
RUN pip install mezzanine
RUN mkdir -p /opt/app && mezzanine-project test_project
RUN python /opt/app/test_project/manage.py createdb --noinput

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

