def Legendre(top, bottom):  #This is defined field independently since the Legendre symbol is a morphism really.
    top = top%bottom
    if top==1 or top ==0:
        return 1
    if top%2==0 and top!=2:
        return Legendre(2, bottom)*Legendre(top/2, bottom)
    if top == bottom-1:
        if bottom%4 == 1:
            return 1
        if bottom%4 == 3:
            return -1
    if top == 2:
        if bottom%8 == 1 or bottom%8 == 7:
            return 1
        if bottom%8 == 3 or bottom%8 == 5:
            return -1
    else:
        if top%4 == 1 or bottom%4 == 1:
            return Legendre(bottom, top)
        if top%4 == 3 and bottom%4 == 3:
            return -Legendre(bottom, top)
#this should hopefully calculate the legendre symbol for our two numbers
#there appears to be a case missing however. Sometimes we get a null outpout

class GeneralField():
    def __init__(self, prime, power):
        self.elements = range(0, prime**power)
        self.characteristic = prime
        self.cardinality = len(self.elements)

    def add(self, a, b):
        return Element(self, (a+b))

    def mult(self, a, b):
        return Element(self, (a*b))
        
    def sub(self, a, b):
        return Element(self, (a-b))

    def is_square(self, number, is_prime = False):
        if is_prime:
            return self.exponent(number, (self.cardinality - 1) // 2, self.cardinality) == 1
        if Legendre(number, field_size)==1:
            return True
        return False

    def exponent(self, number, exponent):
        if exponent == 0:
            return 1
        if number or exponent is float:
            try:
                number = int(number)
                exponent = int(exponent)
            except:
                print('You\'re number and exponent can\'t be true floats.')
        cut = bin(exponent).index('b') #Python nicely gives us 0xb but we don't need that information
        binexp = bin(exponent)[cut+1:][::-1] #Take the binary powers and reverse them
        exponents = [i for i in range(0, len(binexp)) if int(binexp[i])==1] #make an array of when the power is 1
        powers = [number] #Here we make the powers for the square and multiply algorithm
        for i in range(1, max(exponents)+1):
            powers.append((powers[i-1]**2)%field_size)
        r = 1
        for j,val in enumerate(powers): #Here we just multiply through the values
            if j in exponents:
                r = (r*val)%field_size
        return Element(self, r%self.cardinality) #one last call to modulus to guarantee, then return

    def square_root(self, number):
        if not self.is_square(number):
            return None
        if self.cardinality == 2:
            return number,number,number
        elif self.cardinality%4 == 3:
            r = self.exponent(2 * number, (self.cardinality - 5)//4)
            return Element(self, number),Element(self, r),Element(self, field_size-r)
        elif self.cardinality % 8 == 5:
            v = self.exponent(2 * number, (self.cardinality - 5)//8)
            i = (2 * number * v * v) % self.cardinality
            r = (number*v*(i - 1)) % self.cardinality
            return Element(self, number),Element(self, r),Element(self, self.cardinality-r)
        elif self.cardinality % 8 == 1:
            r = self.shanks(number) #this needs replacing since having a separate shanks method sucks
            return Element(self, number),Element(self, r),Element(self, self.cardinality-r)
        return None

    def of(self, number):
        return Element(self, number)

class Element():
    def __init__(self, field, data):
        self.data = data%field.cardinality
        self.field = field

    def __add__(self, other):
        if self.field == other.field:
            return self.field.add(self.data, other.data)
        return None

    def __sub__(self, other):
        if self.field == other.field:
            return self.field.sub(self.data, other.data)
        return None

    def __mult__(self, other):
        if self.field == other.field:
            return self.field.mult(self.data, other.data)
        return None
        
    __rmult__ = __mult__
    
    __radd__ = __add__

    def exp(self, other):
        if other == self.field.characteristic:
            return Element(self.field, 1)
        else:
            return self.field.exponent(self, other)

    def square_root(self):
        return self.field.square_root(self)

#Implement also a __lt__, __gt__, and etc

'''
#The following method can be severely generalized by passing it a method as its final argument, this being the polynomial relation to be raised to the higher power of the prime. As written, we require that there be implemented an element class which the arithmetic is operating on
The idea is to take things that are defined mod p**n and raise them mod p**n+1
This shouldn't be hard using Hensel's Lemma
'''


#Tests:
field_5 = GeneralField(5, 1)
print(field_5.cardinality)
print([i for i in field_5.elements])
print(field_5.characteristic)
print(field_5.add(3, 7))
print(field_5.add(3, 7).data)
print(field_5.sub(3, 7))
print(field_5.sub(3, 7).data)
print(field_5.of(77))
a, b = field_5.of(77), field_5.of(89)
print(a + b)
print((a + b).data)
