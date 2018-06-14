from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Users(Resource):
    def get(self):
        return {
            'users': [  { 'name': 'foo', 'age': 11},
                        { 'name': 'bar', 'age': 21},
                        { 'name': 'diudiu', 'age': 54},
                    ]
                }
                
api.add_resource(Users, '/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True) 
