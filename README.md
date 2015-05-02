# docker-neo4j

Latest **Neo4j-2.2.1** release with native memory configuration using docker environment variables.

## Environment variables

`DOCKER_NEO4J_XMS` for `wrapper_java_initmemory` in MB _(default: 512)_  
`DOCKER_NEO4J_XMX` for `wrapper_java_maxmemory` in MB _(default: 512)_  

## Usage

### Docker client

`docker run -p 7474:7474 -e DOCKER_NEO4J_XMS=1024 -e DOCKER_NEO4J_XMX=2048 -t tvial/docker-neo4j`

### Docker Compose

	neo4j:
	  image: tvial/docker-neo4j
	  ports:
	    - "7474:7474"
	  environment:
	    DOCKER_NEO4J_XMS: 1024
	    DOCKER_NEO4J_XMX: 2048    

Start it with `docker-compose up neo4j -d`

## Contribute

Contributors welcome, just fork & PR.