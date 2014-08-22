defmodule liszt do
  def lastr(Lz) do
    [Hd | Ls] = Lz
    case Ls == [] do
      :true -> Hd
      :false -> lastr(Ls)
    end
  end
  def penlastr(Lz) do
    [Hd | [Hdd | Ls] = Lz
    case Ls == [] do
      :true -> Hd
      :false -> penlastr([Hdd | Ls])
    end
  end
end
#No good. This is a problem!
