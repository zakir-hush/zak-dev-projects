# define the orchestrator function using the DFApp() object from azure.durable_functions.
import azure.functions as func
import azure.durable_functions as df
import datetime
import json
import logging

def orchestrator_function(context: df.DurableOrchestrationContext):
    name = context.get_input()["name"]
    result = yield context.call_activity("say_hello", name)
    return result
