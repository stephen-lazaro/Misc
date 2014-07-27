f = open('~/Primes.txt', 'w')
primes = [2,3,5,7,11,13]
div = False
for i in range(13,200):
    for j in primes:
        if i%j==0:
            div = True
            break
    if div == False:
        primes.append(i)
    else:
        div = False
for i in primes:
    f.write(str(i)+',')
f.close()
