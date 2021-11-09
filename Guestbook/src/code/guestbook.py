from flask import Flask, request, redirect, render_template, url_for
from jinja2 import evalcontextfilter, Markup, escape
from connect import Connect as con
import re


app = Flask(__name__)

connection = con.get_connection()
conclient = connection.client
db = connection.guestbook #database name
collection = db.guestbook #collection name

_paragraph_re = re.compile(r'(?:\r\n|\r|\n){2,}')

@app.template_filter()
@evalcontextfilter
def nl2br(eval_ctx, value):
    result = u'\n\n'.join(u'<p>%s</p>' % p.replace('\n', Markup('<br>\n'))
                          for p in _paragraph_re.split(escape(value)))
    if eval_ctx.autoescape:
        result = Markup(result)
    return result

@app.route('/')
def index():
    gb = collection.find()
    return render_template("index.html", books=gb)

@app.route("/add_msg", methods=["POST"])
def add_msg():
    try:
        guestname = request.form["guestname"]
        email = request.form["email"]
        message = request.form["message"]
        icon = request.form["icon"]
        guestbook = {"guestname":guestname, "email":email,"message":message, "icon":icon}
        collection.insert(guestbook)
        
    except Exception as e:
        print("出錯啦～無法新增留言！")
        print(e)
    return redirect("/")

if __name__ == "__main__":
    app.run('0.0.0.0', 80, debug=True)