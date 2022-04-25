#Connects python to PostgreSql

import re
import psycopg2
from flask import Flask, render_template, request


conn = psycopg2.connect(dbname = "andygujral")

curr = conn.cursor()


#SELECT QUERIES:
curr.execute("Select firstname, lastname, clubname from ClubMembers")

data = curr.fetchall()

curr.execute("Select n_id, countryname, award from NationalTeam Where award < 10")

data2 = curr.fetchall()

curr.execute("Select n_id, countryname, award from NationalTeam Where award < 15")
data3 = curr.fetchall()

curr.execute("Select n_id, countryname, award from NationalTeam Where award >= 15")
data4 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname from Players Where clubname = 'Manchester United'")
data5 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname from Players Where clubname = 'PSG'")
data6 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname From Players Where clubname = 'Arsenal'")
data7 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname From Players Where clubname = 'FC Barcelona'")
data8 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname From Players Where clubname = 'Liverpool'")
data9 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname From Players Where clubname = 'Bayern'")
data10 = curr.fetchall()

curr.execute("Select firstname, lastname, age From Players Where age < 20")
data11 = curr.fetchall()

curr.execute("Select firstname, lastname, age From Players Where age < 40")
data12 = curr.fetchall()

curr.execute("Select firstname, lastname, age From Players Where age >= 40")
data13 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname From Players Where firstname LIKE 'A%' OR firstname LIKE 'B%' OR firstname LIKE 'C%' OR firstname LIKE 'D%' OR firstname LIKE 'E%' OR firstname LIKE 'F%' OR firstname LIKE 'G%' OR firstname LIKE 'H%' OR firstname LIKE 'I%' OR firstname LIKE 'J%' ORDER BY firstname ")
data14 = curr.fetchall()

curr.execute("Select firstname, lastname, clubname From Players Where firstname LIKE 'K%' OR firstname LIKE 'L%' OR firstname LIKE 'M%' OR firstname LIKE 'N%' OR firstname LIKE 'O%' OR firstname LIKE 'P%' OR firstname LIKE 'Q%' OR firstname LIKE 'R%' OR firstname LIKE 'S%' OR firstname LIKE 'T%' OR firstname LIKE 'U%' OR firstname LIKE 'V%' OR firstname LIKE 'W%' OR firstname LIKE 'X%' OR firstname LIKE 'Y%' OR firstname LIKE 'Z%' ")
data15 = curr.fetchall()

curr.execute("Select firstname, lastname, position, clubname From Players where position = 'Striker'")
data16 = curr.fetchall()

curr.execute("Select firstname, lastname, position, clubname From Players where position = 'Midfielder' OR position = 'midfielder' ")
data17 = curr.fetchall()

curr.execute("Select firstname, lastname, position, clubname From Players where position = 'Defensive Back'")
data18 = curr.fetchall()





#for r in rows:
#    print(f"firstname {r[0]} {r[1]}")



curr.close()
conn.close()

app = Flask(__name__)



@app.route("/")
def homepage():
    return render_template("index.html", data=data)

@app.route("/form.html")
def formpage():
    #output = request.form.to_dict()
    #FirstName = output["FirstName"]

    return render_template("form.html")


@app.route("/submit", methods =['POST' "GET"])
def submit():
    output = request.form.to_dict()
    FirstName = output["FirstName"]
    #return homepage()
    return render_template("index.html", FirstName=FirstName)


#Methods for National Team Tab:
@app.route("/style.html")
def awardsLessThan10():

    return render_template("style.html", data2 = data2 )


@app.route("/award15.html")
def awardsLessThan15():

    return render_template("/award15.html", data3 = data3)

@app.route("/awardMore15.html")
def awardMoreThan15():

    return render_template("/awardMore15.html", data4=data4)






#Methods for all Club Members Tab:
@app.route("/clubNameManchester.html")
def clubNameManchester():
    return render_template("clubNameManchester.html", data5=data5)

@app.route("/clubNamePSG.html")
def clubNamePSG():
    return render_template("clubNamePSG.html", data6=data6)


@app.route("/clubNameArsenal.html")
def clubNameArsenal():
    return render_template("clubNameArsenal.html", data7=data7)

@app.route("/clubNameFCBarcelona.html")
def clubNameFCBarcelona():
    return render_template("clubNameFCBarcelona.html", data8=data8)

@app.route("/clubNameLiverpool.html")
def clubNameLiverpool():
    return render_template("clubNameLiverpool.html", data9=data9)

@app.route("/clubNameBayern.html")
def clubNameBayern():
    return render_template("clubNameBayern.html", data10=data10)

@app.route("/playerAgeLess20.html")
def playerAgeLess20():
    return render_template("playerAgeLess20.html", data11=data11)

@app.route("/playerAgeLess40.html")
def playerAgeLess40():
    return render_template("playerAgeLess40.html", data12=data12)

@app.route("/playerAgeGreater40.html")
def playerAgeGreater40():
    return render_template("playerAgeGreater40.html", data13=data13)

@app.route("/playerNameAthruJ.html")
def playerNameAthruJ():
    return render_template("playerNameAthruJ.html", data14=data14)

@app.route("/playerNameKthruZ.html")
def playerNameKthruZ():
    return render_template("playerNameKthruZ.html", data15=data15)


#Methods for Position Tab:
@app.route("/positionStriker.html")
def positionStriker():
    return render_template("positionStriker.html", data16=data16)

@app.route("/positionMidfielder.html")
def positionMidfielder():
    return render_template("positionMidfielder.html", data17=data17)


@app.route("/positionDefender.html")
def positionDefender():
    return render_template("positionDefender.html", data18=data18)






if __name__ == "__main__":
    app.run()

