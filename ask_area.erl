-module(ask_area).
-export([area/0]).

area() -> 
  Answer = io:get_line("R)ectangle, T)riangle, or E)llipse"),
  Shape = char_to_shape(hd(Answer)),
  case Shape of
  	rectangle -> Dimensions = get_dimensions("width", "height");
  	triangle  -> Dimensions = get_dimensions("base", "height");
  	ellipse   -> Dimensions = get_dimensions("axis major", "axis minor");
  	unknown   -> Dimensions = {-1, -1}
  end,
  Area = calculate(Shape, element(1, Dimensions), element(2, Dimensions)),
  Area.

char_to_shape(Char) ->
  case Char of
  	$r  -> rectangle;
  	$R  -> rectangle;
  	$t  -> triangle;
  	$T  -> triangle;
    $e  -> ellipse;
    $E  -> ellipse;
    _   -> unknown
  end.

get_number(Prompt) ->
  Str = io:get_line("Enter " ++ Prompt ++ ">"),
  {Test, _ } = string:to_float(Str),
  case Test of
  	error -> {N, _} = string:to_integer(Str);
  	_ -> N = Test
  end,
  N.
  
get_dimensions(PromptA, PromptB) ->
  {get_number(PromptA), get_number(PromptB)}.

calculate(Shape, DimA, DimB) when DimA >=0, DimB >=0->
  geom:area({Shape, DimA, DimB});
calculate(_, _, _) ->
  io:format("Sorry no good, your dimensions must be positive.").