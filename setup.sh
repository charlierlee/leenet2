python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
flask run

#to deploy
az webapp up
#go to Deployment Center (Preview)/Logs/Show Logs


#initial setup
Create app service in azure
in configuration set the following property
SCM_DO_BUILD_DURING_DEPLOYMENT:true
az webapp up
# ^ then go to Deployment Center (Preview)/Logs/Show Logs
#OR if no existing VM
az webapp up --sku F1 --name leenet2
#wait about 20 minutes

#Note
#SCM_DO_BUILD_DURING_DEPLOYMENT:true must be set. 
# It causes pip install -r requirements.txt to run
# If set to false then the pip install -r requirements.txt will get uninstalled
