from pymongo import MongoClient
class Connect(object):
    @staticmethod
    def get_connection():
        client = MongoClient("mongodb+srv://Malik:boss8811@cluster0.eo1kq.mongodb.net/myFirstDatabase?retryWrites=true&w=majority", port=27017, connect=False)
        return client