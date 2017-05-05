# Compiled using Elmchemy v0.0.22
defmodule Elmchemy.XBasics do
  use Elmchemy

  import Elmchemy
  alias XList
  @type order :: :lt | :eq | :gt
  #  Operators

  import Kernel, except: [
  {:'++', 2},
  {:round, 1},
  {:to_string, 1}

  ]

  curry ==/2
  curry !=/2
  curry </2
  curry >/2
  curry <=/2
  curry >=/2
  curry max/2
  curry min/2

  curry &&/2
  curry ||/2

  curry +/2
  curry -/2
  curry */2
  curry //2
  curry div/2
  curry rem/2
  curry abs/1


  @doc """
  Basic compare function


  ### Example

      compare a b

  """
  @spec compare(any, any) :: order
  @spec compare() :: (any -> (any -> order))
  curry compare/2
  def compare(a, b) do
    cond do
      a > b -> :gt
      a < b -> :lt
      true -> :eq
    end
  end

  # >> is replaced with >>> by the compiler
  def l >>> r do
  fn x -> l.(r.(x)) end
  end


  #  not/1 is inlined by the compiler
  @spec xor(boolean, boolean) :: boolean
  @spec xor() :: (boolean -> (boolean -> boolean))
  curry xor/2
  def xor(a, b) do
    a && (&!/0).().(b) || (&!/0).().(a) && b
  end

  @spec negate(number) :: number
  @spec negate() :: (number -> number)
  curry negate/1
  def negate(x) do
    -(x)
  end

  @spec sqrt(float) :: float
  @spec sqrt() :: (float -> float)
  curry sqrt/1
  def sqrt(x) do
    :math.sqrt(x)
  end

  @spec clamp(any, any, any) :: any
  @spec clamp() :: (any -> (any -> (any -> any)))
  curry clamp/3
  def clamp(x, bottom, top) do
    x |> min.(bottom) |> max.(top)
  end

  @spec log_base(float, float) :: float
  @spec log_base() :: (float -> (float -> float))
  curry log_base/2
  def log_base(a, b) do
    not_implemented
  end

  @spec e :: float
  @spec e() :: float
  def e() do
    2.71828
  end

  @spec pi :: float
  @spec pi() :: float
  def pi() do
    apply(":math", "pi", [])
  end

  @spec cos(float) :: float
  @spec cos() :: (float -> float)
  curry cos/1
  def cos(x) do
    :math.cos(x)
  end

  @spec sin(float) :: float
  @spec sin() :: (float -> float)
  curry sin/1
  def sin(x) do
    :math.sin(x)
  end

  @spec tan(float) :: float
  @spec tan() :: (float -> float)
  curry tan/1
  def tan(x) do
    :math.tan(x)
  end

  @spec acos(float) :: float
  @spec acos() :: (float -> float)
  curry acos/1
  def acos(x) do
    :math.acos(x)
  end

  @spec asin(float) :: float
  @spec asin() :: (float -> float)
  curry asin/1
  def asin(x) do
    :math.asin(x)
  end

  @spec atan(float) :: float
  @spec atan() :: (float -> float)
  curry atan/1
  def atan(x) do
    :math.atan(x)
  end

  @spec atan2(float, float) :: float
  @spec atan2() :: (float -> (float -> float))
  curry atan2/2
  def atan2(x, y) do
    :math.atan2(x, y)
  end

  @spec round(float) :: integer
  @spec round() :: (float -> integer)
  curry round/1
  def round(x) do
    round(x)
  end

  @spec floor(float) :: integer
  @spec floor() :: (float -> integer)
  curry floor/1
  def floor(x) do
    not_implemented
  end

  @spec ceiling(float) :: integer
  @spec ceiling() :: (float -> integer)
  curry ceiling/1
  def ceiling(x) do
    not_implemented
  end

  @spec truncate(float) :: integer
  @spec truncate() :: (float -> integer)
  curry truncate/1
  def truncate(x) do
    not_implemented
  end

  @spec to_float(integer) :: float
  @spec to_float() :: (integer -> float)
  curry to_float/1
  def to_float(x) do
    Elmchemy.*(x, 1)
  end

  @spec to_string(any) :: String.t
  @spec to_string() :: (any -> String.t)
  curry to_string/1
  def to_string(x) do
    Kernel.to_string(x)
  end

  curry ++/2
  def a ++ b do
    cond do
      is_binary(a) && is_binary(b) -> Kernel.<>(a, b)
      true -> Kernel.++(a, b)
    end
  end

  @spec identity(any) :: any
  @spec identity() :: (any -> any)
  curry identity/1
  def identity(a) do
    a
  end

  @spec id(any) :: any
  @spec id() :: (any -> any)
  curry id/1
  def id(a) do
    identity.(a)
  end

  @spec always(any, any) :: any
  @spec always() :: (any -> (any -> any))
  curry always/2
  def always(a, b) do
    a
  end

  #  TODO Will be fixed with #34
  @spec curried(({any, any} -> any)) :: ((any -> any) -> any)
  curry curried/1
  def curried(fun) do
  fn fst -> fn snd -> fun.({fst, snd}) end end
  end

  @spec uncurried(((any -> any) -> any)) :: ({any, any} -> any)
  curry uncurried/1
  def uncurried(fun) do
  fn {fst, snd} -> fun.(fst).(snd) end
  end


  #  We don't care for Never type
  @spec not_implemented :: any
  @spec not_implemented() :: any
  def not_implemented() do
    throw("Not implemented")
  end

end