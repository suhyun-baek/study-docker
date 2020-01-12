#!/bin/bash

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

function start(){
        echo "process ::: docker-compose down"
        docker-compose down
        echo "process ::: docker-compose up -d"
        docker-compose up -d

        responce=""
        while [ "$responce" != '{"status":"UP"}' ]
        do
                responce=`curl -s localhost:8081/health`
                echo 'starting spring-boot-solution ...'
                sleep 10
        done
        echo "end ::: start"
}

function restart(){
        echo "process ::: docker-compose restart"
        docker-compose restart
	containCount=`docker container ls | grep "spring-boot-solution" | wc -l`
	if [ "0" != "$containCount" ]; then
	        responce=""
        	while [ "$responce" != '{"status":"UP"}' ]
	        do
        	        responce=`curl -s localhost:8081/health`
	                echo 'restarting spring-boot-solution ...'
	                sleep 10
	        done
	        echo "end ::: restart"
	fi

}


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


case $1 in
	-h|--help)
		help;;
	start)
		start;;
        stop)
                echo "process ::: docker-compose down"
                docker-compose down;;

        restart)
		restart;;
        deploy)
                deploy;;
        *)
		echo "error ::: Check the available parameters using the 'devops.sh help' command";;
esac
