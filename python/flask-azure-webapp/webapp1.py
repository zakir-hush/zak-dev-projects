# file-name: webapp1.py
# source ./bin/activate << required before running this file: 
# pointing python to pip folder for required packages like flask in this case
# pip freeze > requirements.txt: saves environment requirements for the app


# import Flask class from flask module
from flask import Flask

# __name__ tells Flask where the app is: webapp1.py
app = Flask(__name__)

# Python decorator - registering the function below it as a handler for HTTP requests to the path
@app.route("/")
def home():
    return "Hello, Flask is running in this Ubuntu server!"

#Python standard check; tells Flask to accept connections from any IP address (not just localhost)
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)




# az login

# publish to azure with the below command
# az webapp up --name webapp1-zakirh --resource-group rg_eastus_170170_1_175694808327 --runtime "PYTHON|3.10" --os Linux --location eastus

# pip install gunicorn and run the command below to start the webapp1-zakirh.py, by default python looks for app.py
# az webapp config set --resource-group rg_eastus_170170_1_175694808327 --name webapp1-zakirh --startup-file "gunicorn --bind=0.0.0.0 --timeout 600 webapp1:app"

# you can enable logging with the below command
# az webapp log tail --name webapp1-zakirh --resource-group rg_eastus_170170_1_175694808327