% Arithmetic problems as seen in 99 Problems Solved in Lisp (or OCaml).


%Finds greatest common divisor using djikstra's method
gcd(N, M) when N =:= M -> N;
gcd(N, M) when N > M   -> gcd(N - M, M);
gcd(N, M) when N < M   -> gcd(N, M - N).

%Finds greatest common divisor using euler's method


%Coprime test
coprime(N, M) -> gcd(N,M) =:= 1.
