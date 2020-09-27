SHELL := /bin/bash



docker: 
	cp usta-0.0.1-SNAPSHOT.war usta.war 
	docker build -t usta_backend .
	rm -rf usta.war 

upload: docker
	 docker login -u ustadrive -p june5_2020
	 docker tag usta_backend ustadrive/usta_backend:latest
	 docker push ustadrive/usta_backend

build: upload

deploy: 
	docker container run -it --publish 8080:8080 ustadrive/usta_backend

clean:
	docker rmi -f usta_backend
	docker rmi -f ustadrive/usta_backend
