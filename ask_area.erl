-module(ask_area).
-export([area/0]).

area() -> 
  io:format("R)ectangle, T)riangle, or E)llipse"),
  Shape = io:getchar(),
  case Shape of
    r -> io:format("Enter width"),
         W = io:getchar(),
         io:format("Enter height"),
         H = io:getchar(),
         io:format(area:area(rectangle, W, H));
    t -> io:format("Enter base"),
         B = io:getchar(),
         io:format("Enter height"),
         io:format(area:area(triangle, B, H));
    e -> io:format("Enter radius minor"),
         Rm = io:getchar(),
         io:format("Enter radius major"),
         Rmaj = io:getchar(),
         io:format(area:area(ellipse, Rm, Rmaj));
    _ -> io:format("Sorry, that wasn't an option.")
  end.
