defmodule liszt do
  def lastr(Lz) do
    [Hd|Ls] = Lz
    cond Ls == [] do
      :true -> Hd
      :false -> lastr(Ls)
    end
  end
end
