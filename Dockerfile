FROM node:0.10.35
ADD . /code
WORKDIR /code
RUN ./docker-scripts/create-user.sh tasks
ENV PATH=/code/node_modules/.bin:$PATH
RUN chown -R tasks:tasks /code
USER tasks
RUN npm install
CMD gulp start
