README
======
Author: Stephen Lazaro
Copyright: Stephen Lazaro 2014

Strategy
--------
The strategy is straightforward. The problem is related to a simple combinatorial one; the number of
permutations with repetitions of a set of objects. In general, the formula for this is the n length
permutations of m objects divided by the product of the factorials of the number of repetitions objects.
In other words, if we have to find the permutations with repetitions of five objects from a set of
five, where two of the objects are repeated, we would compute (5! / (5 - 5)!) / 2! = 5! / 2!.

But, of course, in the problem we are looking for a word that may be in the middle of that tree of
permutations, and we want its position in that tree. Thankfully, we can reduce this problem to the
former.

We can calculate the position of our word in the list by summing the number of all the permutations
'above' the word. Each letter in the word contributes a determinate amount to the position of the
word in the list. We can calculate this by taking the number of total permutations; this number
is the factorial of the number of letters after the letter we are currently at. Then, we take
that value and for each character before the letter we're at we divide off by the number of repetitions
of each character we could be putting after that letter, accounting for the fact that if the
first letter is a repeated one, we must divide by the factorial of one less than the number of
repetitons.

That's all sort of abstract so to work out a concrete example of the approach, consider the word
'zapping'. Since p is before z, there is a tree corresponding to words starting with p instead of
z. However, this tree doesn't need to have repetitions of p divided off, since the permutations
are of the remaining letters {z,a,p,i,n,g}, which multiset has only one p, and not two.

In any case, once one sums the result of this calculation over every letter in the word, making sure
to add one for the word itself, one has the position of the original word in the list.


Problem
-------
The Python implementation is satisfyingly compact; it takes about 60 lines to implement the complete solution.

Unfortunately, there are a few significant issues with the Python implementation I first used. 
The first and most obvious problem being that the Python solution is relatively slow. Calculating
the solution takes a minimum of 30 milliseconds, most of which seems to be dedicated to just starting
the Python interpreter.

Secondly, the solution is recursive. Intrinsically, this isn't a problem but Python has a limit to
recursive call stacks of around 1000 as I understand it, varying by implementation. The obvious
suggestion is to use tail recursion as an optimization strategy. Unfortunately, that won't help 
since Python doesn't implement tail call elimination. Hence, the maximum word length is fixed 
at around 999 letters. Though the problem specification didn't call for the solution to be able 
to handle words of such length, it's a bit galling to have the artifical limitation forced on us.

Thirdly, there's really no reason to run each recursive call sequentially; they in no way depend on
one another. Hence, one would think that there'd be significant benefits to running them concurrently.
Solving for this third problem solves the previous problem, though admittedly it is a bit like taking a 
bazooka to hammer in a nail.

Solution
--------
The obvious solution to the first problem is to use a compiled language, and in solving the third problem
one also solves the second. Therefore, it would be reasonable to choose a compiled language with satisfying
support for concurrency. So I wrote a solution in the Go language.

In the Go language we implement each separate call to the count function concurrently using the Go runtimes
lightweight threads, and then asynchronously collect the results.

The result speaks for itself; the Go language solution takes about 4 milliseconds to complete.

The most siginficant drawback is Go executables are large; each one includes the Go runtime in itself.

Running the Solutions
---------------------
The Python solution is the simplest to run. I have executed it in my personal installations of Python 3.4.1
and Python 2.7.7. The solution runs in both. In order to run it, simply move to the correct directory in
the command line and execute the script with the command: "python wordpos.py <argument>", where <argument> is
to be replaced with the word whose position you wish to find. I personally recommend the use of Python 3.

The Go solution is packaged as a compiled executable and can be run by moving to the correct directory in
the command line and executing it with the command: "./wordpos <argument>", as is usual. Of course, the
source is also included, and if you should have any issues running the executable you may compile it natively
using the Go compiler as found here:  
https://golang.org/doc/install  
The correct command to compile the source is "go build wordpos.go".

If you have no interest in examining more than one solution to the problem, I would ask that you examine the
solution in the Go language. I believe that, though I am less comfortable in that language, it shows more of
the way I think about problems than the Python solution. I of course encourage you to examine the code in
both solutions if you should have the time. 

Thank you for reading,
Stephen Lazaro