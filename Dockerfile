FROM java:latest
MAINTAINER Thomas VIAL

# Source: http://debian.neo4j.org/
RUN wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add - 
RUN echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list 
RUN apt-get update -y && apt-get install neo4j -y && apt-get clean

ADD start-neo4j /var/lib/neo4j/bin/start-neo4j
RUN chmod +x /var/lib/neo4j/bin/start-neo4j

# Enable WebServer
RUN sed -i "s/#dbms.connector.http.address=0.0.0.0:7474/dbms.connector.http.address=0.0.0.0:7474/g" /etc/neo4j/neo4j.conf

EXPOSE 1337
EXPOSE 7474

WORKDIR /var/lib/neo4j

CMD ["/bin/bash", "-c", "./bin/start-neo4j"]
