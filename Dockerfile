FROM node:0.10.35
ADD . /code
WORKDIR /code
ENV PATH=/code/node_modules/.bin:$PATH
RUN npm install
CMD gulp start
