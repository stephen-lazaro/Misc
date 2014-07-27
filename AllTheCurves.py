import sys
sys.path.append('~/')
from EllipticCurve import *
import csv


primes = open('/Users/s42/Desktop/Elliptic/Primes.txt', 'r').readline().split(',')
primes = [int(k) for k in primes if k!='2' and k!='3' and k!='']
t = 0
with open('/Users/s42/Desktop/Elliptic/Fields.csv', 'w') as csvfile:
    curver = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    curver.writerow(['Field','Number','Equation','Discriminant','J-Invariant'])
    for k in primes:
        field = GeneralField(int(k), 1)
        for i in range(0, field.cardinality):
            for j in range(0, field.cardinality):
                E = EllipticCurve(field, [i, j])
                curver.writerow([str(k),str(t),E.weierstrass.replace(' ', ''),str(E.discriminant),str(E.j)])
                t += 1
