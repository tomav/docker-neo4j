FROM java:latest
MAINTAINER Thomas VIAL

# Source: http://debian.neo4j.org/
RUN wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add - 
RUN echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list 
RUN apt-get update -y && apt-get install neo4j -y && apt-get clean

ADD start-neo4j /var/lib/neo4j/bin/start-neo4j
RUN chmod +x /var/lib/neo4j/bin/start-neo4j

# neo4j-server.properties
RUN sed -i "s/#org.neo4j.server.webserver.address/org.neo4j.server.webserver.address/g" /var/lib/neo4j/conf/neo4j-server.properties

# neo4j.properties
RUN sed -i "s/#node_auto_indexing/node_auto_indexing/g" /var/lib/neo4j/conf/neo4j.properties
RUN sed -i "s/#remote_shell_enabled/remote_shell_enabled/g" /var/lib/neo4j/conf/neo4j.properties
RUN sed -i "s/#remote_shell_host=127.0.0.1/remote_shell_host=0.0.0.0/g" /var/lib/neo4j/conf/neo4j.properties

EXPOSE 1337
EXPOSE 7474

WORKDIR /var/lib/neo4j

CMD ["/bin/bash", "-c", "./bin/start-neo4j"]
