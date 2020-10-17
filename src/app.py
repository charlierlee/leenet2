import os
from flask import Flask, request, jsonify
from translate import Translator
from config import *

app = Flask(__name__)
translator = Translator(MODEL_PATH)

app.config["DEBUG"] = True # turn off in prod

@app.route('/')
def hello_world():
    return 'Hello, World! Try the endpoints /summary?text=yourtext'

#get embedding and return top N matches
@app.route('/summary', methods=['GET'])
def get_summary():
    try:
        input_string = request.args.get('text')
        
    except Exception as e:
        raise e

    if(not input_string):
        return(bad_request())
    else:
        translation = translator.translate('source', 'target', input_string)
        return jsonify({"output":translation})

#only runs with docker deployments
if __name__ == '__main__':
    app.run(host="0.0.0.0")
