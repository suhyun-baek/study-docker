#!/bin/bash

function deploy(){
	echo "process ::: docker-compose build"
        docker-compose build
	echo "process ::: docker-compose up -d spring-boot-solution-01"
	docker-compose up -d spring-boot-solution-01
	responce=""
	while [ "$responce" != '{"status":"UP"}' ]
	do
        	responce=`curl -s localhost:8081/health`
		echo 'checking spring-boot-solution-01 status ...'
	        sleep 10
	done
	echo "process ::: docker-compose up -d spring-boot-solution-02"
	docker-compose up -d spring-boot-solution-02

}

function help(){
	echo "Web application deploy control shell"
	echo " "
	echo "Usage:"
	echo "  devops.sh [COMMAND]"
	echo "  devops.sh -h|--help"
	echo " " 
	echo "Commands:"
	echo "  start 		Full run of the container environment"
	echo "  stop 			stop the entire container environment"
	echo "  restart		Restart the entire container environment"
	echo "  deploy		Zero downtime deployment of web applications"
}

case $1 in
	-h|--help)
		help;;
	start)
        	echo "process ::: docker-compose down"
	        docker-compose down
	        echo "process ::: docker-compose up -d"
		docker-compose up -d;;
        stop)
	        echo "process ::: docker-compose down"
	        docker-compose down;;
        restart)
                echo "process ::: docker-compose restart"
	        docker-compose restart;;
        deploy)
	        echo "process ::: docker-compose deploy"
	        deploy;;
	*)
		echo "error ::: Check the available parameters using the 'devops.sh help' command";;
esac
