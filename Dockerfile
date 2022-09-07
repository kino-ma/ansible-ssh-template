FROM python:3.10-buster

WORKDIR /app

RUN pip3 install pipenv

COPY ./Pipfile* ./
RUN pipenv install

CMD pipenv run deploy
