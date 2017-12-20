defmodule SecretHandshake do
  use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    do_commands(code, [])
  end

  @spec do_commands(code :: integer, acc :: list(String.t())) :: list(String.t())
  defp do_commands(code, acc) do
    cond do
      (code &&& 0b1) == 0b1 ->
        do_commands(bxor(code, 0b1), ["wink" | acc])
      (code &&& 0b10) == 0b10 ->
        do_commands(bxor(code, 0b10), ["double blink" | acc])
      (code &&& 0b100) == 0b100 ->
        do_commands(bxor(code, 0b100), ["close your eyes" | acc])
      (code &&& 0b1000) == 0b1000 ->
        do_commands(bxor(code, 0b1000), ["jump" | acc])
      (code &&& 0b10000) == 0b10000 ->
        do_commands(bxor(code, 0b10000), Enum.reverse(acc))
      true -> Enum.reverse(acc)
    end
  end
end

