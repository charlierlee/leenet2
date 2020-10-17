python3 -m venv env
source env/bin/activate
pip install -r src/requirements.txt
flask run

#to deploy
az webapp up
#go to Deployment Center (Preview)/Logs/Show Logs


#initial setup
#Create app service in azure
#in configuration set the following property
SCM_DO_BUILD_DURING_DEPLOYMENT:true
cd src
az webapp up
# ^ then go to Deployment Center (Preview)/Logs/Show Logs
#OR if no existing VM
cd src
az webapp up --location westus2 --sku F1 --name leenet2
#wait about 20 minutes
#get location list (optional)
az account list-locations

#Note
#SCM_DO_BUILD_DURING_DEPLOYMENT:true must be set. 
# It causes pip install -r requirements.txt to run
# If set to false then the pip install -r requirements.txt will get uninstalled



### IF DOCKER ###
#docker note:
# if the server runs out of memory, there is no indication
  #other than it just dies
#docker image
#to run locally:
docker-compose up
#OR
docker-compose up -d   #<-- detached
#http://localhost:9901/summary?text=who%20is%20john%20nash
#then
docker-compose down -v --rmi local
#to build into host
docker build -t charlierlee/host src
#to build for azure
docker build -f src/Dockerfile -t charlierlee/host src

#deploy
docker push charlierlee/host


#to clear everything:
docker-compose down -v --rmi local
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
docker system prune --all
