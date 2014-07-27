#Some Number Theory Stuff

def is_Square(number, field_size, is_prime = False):
    if is_prime:
        return ModularExponent(number, (field_size - 1) // 2, field_size) == 1
    if Legendre(number, field_size)==1:
        return True
    return False

def ModularExponent(number, exponent, field_size): #i.e. the square and add method!
    if exponent == 0:
        return 1
    if number or exponent is float:
        number = int(number)
        exponent = int(exponent)
    cut = bin(exponent).index('b')
    binexp = bin(exponent)[cut+1:][::-1]
    exponents = []
    for i in range(0, len(binexp)):
        if int(binexp[i])==1:
            exponents.append(i)
    powers = [number]
    for i in range(1, max(exponents)+1):
        powers.append((powers[i-1]**2)%field_size)
    r = 1
    for j,val in enumerate(powers):
        if j in exponents:
            r = (r*val)%field_size
    return r%field_size

def Shanks(number, field_size):
    m = field_size-1
    e = 0
    while m%2 == 0:
        e += 1
        m = m // 2
    for i in range(2, field_size):
        if not is_Square(i, field_size):
            z = i
            break
    q = (field_size - 1)//2**e
    c = ModularExponent(z, q, field_size)
    r = ModularExponent(number, (q + 1) // 2, field_size)
    t = ModularExponent(number, q, field_size) 
    m = e
    while t != 1:
        temp = t
        counter = 0
        while temp!=1:
            temp = (temp**2)%field_size
            counter += 1
            if counter > m:
                raise
        b = ModularExponent(c, ModularExponent(1, m - counter - 1, field_size), field_size)
        r = (r * b) % field_size
        t = (t * b * b) % field_size
        c = (b * b) % field_size
        m = counter
    return number,r,field_size-r

def Cipolla(number, prime):
    not_square= 2
    while is_Square(not_square**2 - number, prime, is_prime=True):
        not_square += 1
        not_square %= prime
    a = not_square
    b = not_square**2 - number % prime
    x = ModularExponent (a + square_root(b, prime**2), (prime + 1) // 2, prime**2)
    return x
#This is clearly implemented wrongly

def square_root(number, field_size):
    if not is_Square(number, field_size):
        return None
    if field_size == 2:
        return number,number,number
    elif field_size%4 == 3:
        r = ModularExponent(number, (field_size+1)//4, field_size)
        return number,r,field_size-r
    elif field_size%8==5:
        v = ModularExponent((2*number), (field_size - 5)//8, field_size)
        i = (2*number*v*v)%field_size
        r = (number*v*(i-1))%field_size
        return number,r,field_size-r
    elif field_size%8==1:
        d = 2
        while is_Square(d, field_size):
            d += 1
        t = field_size - 1
        s = 0
        while t % 2 == 0:
            t //= 2
            s += 1
        at = pow(number, t, field_size)
        dt = pow(d, t, field_size)
        m = 0
        for i in range(0, s):
            if pow(at * pow(dt, m), pow(2, s-1-i), field_size) == (field_size-1):
                m = m + pow(2, i)
        r = (pow(number, (t+1)/2) * pow(dt, m/2)) % field_size
        return number,r,field_size-r
#I just can't get this case to work! Cipolla exceeds recursion depth very easily and friggin Shanks gets caught in an infinite loop. What am I doing wrong here
    return None

