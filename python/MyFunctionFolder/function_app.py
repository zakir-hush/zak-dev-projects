from azure.durable_functions import DFApp
from azure.durable_functions import DurableOrchestrationClient
import azure.functions as func

# Importing handlers
### from my_http_trigger import MyHttpTrigger
from my_http_starter import http_start, say_hello # say_hello
from orchestrator import orchestrator_function  
import datetime
import json
import logging

# app = func.FunctionApp() # uncomment when calling http_trigger
app = DFApp() # main DFApp instance

### app.route(route="MyHttpTrigger", auth_level=func.AuthLevel.ANONYMOUS)(MyHttpTrigger)

# Register HTTP starter function
@app.route(route="durable/start", auth_level=func.AuthLevel.ANONYMOUS)
@app.durable_client_input(client_name="client")
def start(req: func.HttpRequest, client: DurableOrchestrationClient) -> func.HttpResponse:
    return http_start(req, client)

# Register Activity function
@app.activity_trigger(input_name="name")
def hello(name: str) -> str:
    return say_hello(name)

# Register Orchestrator function
@app.orchestration_trigger(context_name="context")
def orchestrator(context):
    return orchestrator_function(context)