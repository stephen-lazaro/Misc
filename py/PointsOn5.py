import sys
sys.path.append('~/')
from EllipticCurve import *
import csv

k = 5
with open('/Users/s42/Desktop/Elliptic/Points.csv', 'w') as Points:
    point_writer = csv.writer(Points, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    field = GF(k, 1)
    for i in range(0, field.cardinality):
        for j in range(0, field.cardinality):
            e = EllipticCurve(field, [i, j])
            point_writer.writerow([e.weierstrass, e.pointset])
