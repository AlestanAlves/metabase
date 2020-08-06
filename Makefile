star-metabase:
	sudo docker start metabase
docker-metabase:
	sudo docker run -d -p 3000:3000 --name metabase metabase/metabase
end-metabase:
	sudo docker rm -f metabase