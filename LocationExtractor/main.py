import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import gmplot
import sqlite3 

gmap = gmplot.GoogleMapPlotter(52.17162, 4.507496, 16) 


database = sqlite3.connect('LocationExtractor/cache_encryptedB.db')
cursor = database.cursor() 

query = "SELECT latitude, longitude FROM LteCellLocation"
result = cursor.execute(query).fetchall()
longs = []
lats = []
for record in result: 
    longs.append(record[1])
    lats.append(record[0])

print('LteCellLocation', len(lats))
gmap.scatter(lats,longs,'#3B0B39', size=40, marker=False)

query = "SELECT latitude, longitude FROM CellLocation"
result = cursor.execute(query).fetchall()
longs = []
lats = []
for record in result: 
    longs.append(record[1])
    lats.append(record[0])

print('LteCellLocation', len(lats))
gmap.scatter(lats,longs,'#FF5733', size=40, marker=False)


# gmap.scatter(marker_lats, marker_lngs, 'k', marker=True)
# gmap.heatmap(heat_lats, heat_lngs)

gmap.draw("mymap.html")

print('done')



