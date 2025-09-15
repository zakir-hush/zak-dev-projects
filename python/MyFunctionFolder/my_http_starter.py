import azure.functions as func
import azure.durable_functions as df
import json

def http_start(req: func.HttpRequest, client: df.DurableOrchestrationClient) -> func.HttpResponse:
    instance_id = client.start_new("orchestrator_function", None, {"name": "Zakir"})
    return client.create_check_status_response(req, instance_id)

def say_hello(name: str) -> str:
    return f"Hello, {name} from Durable Function!"
