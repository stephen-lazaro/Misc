// Playground - noun: a place where people can play

infix operator >> {
    associativity left precedence 140
}
infix operator >>= {
    associativity left precedence 140
}
infix operator >=> {
    associativity left precedence 140
}

func >><T, S, Q>(left: (T -> S), right: (Q -> T))->(Q -> S) {
    return {(z: Q) -> S in
        left(right(z))
    }
}

infix operator << {
    associativity left precedence 140
}

func << <T,S,Q> (left: T->S, right: S -> Q) -> T -> Q {
    return {(z: T) -> Q in
        right(left(z))
    }
}

infix operator |> {
    associativity left precedence 140
}
func |> <T, S> (left: T, right: (T -> S)) -> S {
    return right(left)
}

infix operator <| {
    associativity left precedence 140
}

func <| <T, S> ( left: T -> S, right: T) -> S {
    return left(right)
}

func double(x: Int) -> Int {
    return 2*x
}

func mult(x: Int)(y: Int) -> Int {
    return x*y
}

mult(2)(y: 2) //curryng works
double(5) |> mult(12) //Piping works with curried functions!

//Both the forward and backward composition operators work!
let quadruple = double >> double
let quadruple2 = double << double

quadruple(5)
quadruple2(5)

//Both the forward and backword pipes work
quadruple(5) |> quadruple
quadruple2 <| quadruple(5)

//Defining functions anonymously works as well
let square = {(x: Int)->Int in mult(x)(y: x)}

//And said functions are first class
let fourth = square >> square

square(5)
fourth(5)

// All the function operators work! We've reached F#! Now. How about some Haskell?

infix operator +> {
    associativity left precedence 140
}

/* Structs cannot inherit from one another; only from portocols:
struct Foo {
func act() {
return 5
}
}
struct Bar: Foo {
}
let x = new Bar
x.act()
*/



/*
protocol Functorial {
    typealias T
    func empty: Functorial { get }
    func fmap<S where S is Functorial>(g: T -> S)(lz: Functorial<) -> Functorial
    func fappend(x: T) -> Functorial
    func +>(left: T, right: T)
}
*/

class Functor<T> {
    //Map a function to a functor
    class func empty<T>() {
        return
    }
    class func fmap<S>(g: T -> S)(Functor<T>) -> Functor<S> {
        fatalError("Must be overriden")
        //implement
    }
    //Add a value into a functor
    class func fappend(x: T, lz: Functor<T>) -> Functor<T> {
        fatalError("Must be overriden")
        //implement
    }
}

struct ListGenerator<T>: GeneratorType {
    let value: T
    var index = 0
    init() {
        
    }
    
}

class List<T>: Functor<T>, SequenceType {
    override class func empty<T>() {
        return
    }
    func generate() -> GeneratorType {
        
    }
    var data: Array<T>
    class func fappend(x: T, lz: List<T>) {
        var n: [T] = [x]
        for item in lz {
            n.append(item)
        }
        return new List<T>(n)
        
    }
    init(x: T) {
        return fappend(x, List<T>.empty)
    }
    func fmap<S>(g: (T -> S)) -> (List<T> -> List<S>) {
        for item in
    }
}
