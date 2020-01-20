FROM alpine:latest

ENV MONGO_VERSION=3.6.12
ENV DB_PATH=/data/db DB_CONFIG=/data/configdb

# Install MongoDB
RUN apk --no-cache --update add mongodb==${MONGO_VERSION} && \ 
rm -rf /var/cache/apk/*

RUN mkdir -p ${DB_PATH} ${DB_CONFIG} \
	&& chown -R mongodb:mongodb ${DB_PATH} ${DB_CONFIG}
    
VOLUME ${DB_PATH} ${DB_CONFIG}

EXPOSE 27017

CMD [ "mongod" ]
