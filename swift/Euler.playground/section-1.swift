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

//Euler1
func isMod3(x: Int) -> Bool {
    return x % 3 == 0
}
func isMod5(x: Int) -> Bool {
    return x % 5 == 0
}

//Tests
isMod3(6)
isMod3(5)
isMod5(6)
isMod5(5)

func Euler1() -> Int {
    var answer = 0
    for number in 1..<1000 {
        if isMod3(number) || isMod5(number) {
            answer += number
        }
    }
    return answer
}
Euler1()

//Euler2
func isSquare(x: Int) -> Bool {
    
}
func isFib(x: Int) -> Bool {
    
}
