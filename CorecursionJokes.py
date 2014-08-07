#Just trying to play with corecursion and generators a little.
def fact():
  n,f = 0,1
  while True:
  	yield f
  	n,f = n + 1, (n+1)*f

#Now this gets us a particular factorial from the stream
class factYielder():
  def __inite__(self, x):
    self.a = x
    
  def get(self):
    return iter(fact())[self.a - 1]

vaz = factYielder(6)
print(vaz.get())
