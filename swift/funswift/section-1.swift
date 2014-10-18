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
func |> <T, S>(left: T, right: (T -> S)) -> S {
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

double(5) |> mult(12)

mult(2)(y: 2)

let quadruple = double >> double
let quadruple2 = double << double


double(5)

quadruple(5)
quadruple2(5)

quadruple(5) |> quadruple
quadruple2 <| quadruple(5)

let square = {(x: Int)->Int in mult(x)(y: x)}

let fourth = square >> square

square(5)
fourth(5)

// All the function operators work! We've reached F#! Now. How about some Haskell?

infix operator +> {
    associativity left precedence 140
}

protocol Functorial {
    typealias T
    var empty: Functorial { get }
//    func fmap<S where S is Functorial>(g: T -> S) -> (Functorial -> Functorial)
    func fappend(x: T) -> Functorial
}

class Functor<T> {
    //Map a function to a functor
    func fmap<S>(g: (T -> S)) -> (Functor<T> -> Functor<S>) {
        fatalError("Must be overriden")
        //implement
    }
    //Add a value into a functor
    func fappend(x: T, lz: Functor<T>) -> Functor<T> {
        fatalError("Must be overriden")
        //implement
    }
}
/*
class List<T>: Functor<T> {
    var data: Array<T>
    func fmap<S>(g: (T -> S)) -> (List<T> -> List<S>) {
        for item in
    }
}
*/
