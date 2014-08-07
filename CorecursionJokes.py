def fact():
  n,f = 0,1
  while True:
  	yield f
  	n,f = n + 1, (n+1)*f

#Now this gets us a particular item from a stream. (Interestingly, we also get all the ones leading up. Not sure why.)
#Of course, all this would be better done using the itertools module. But I'm just trying to get a feel for the stuff.
class genYielder():
  def __init__(self, gen, x):
    self.a = x
    self.ite = iter(gen())
    self.value = 0
    
  def get(self):
    i = 0
    while i < self.a + 1:
      try:
        fax = next(self.ite)
        print(fax)
      except StopIteration:
        self.value = fax
        return fax
      finally:
      	i += 1
    self.value = fax
    return fax

vaz = genYielder(fact, 6)
vaz.get()
print(vaz.value)

def fib():
  n,m = 0,1
  while True:
    yield n
    n,m = m, n+m

vaz = genYielder(fib, 27)
vaz.get()
print(vaz.value)

def naturals():
  n,m=0,1
  while True:
    yield n
    n,m = m,m+1

evens = (2n for n in naturals)
squares = (n*n for n in naturals)
