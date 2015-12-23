defmodule Mod do
  defmacro definfo do
    IO.puts "In macro's context (#{__MODULE__})."
    IO.puts "In macro's context2 (#{unquote(__MODULE__)})."

    quote do
      IO.puts "In caller's context (#{__MODULE__})."
      IO.puts "In caller's context2 (#{unquote(__MODULE__)})."

      def friendly_info do
        IO.puts """
        My name is #{__MODULE__}
        My name2 is #{unquote(__MODULE__)}
        My functions are #{inspect __info__(:functions)}
        """
      end
    end
  end
end

defmodule MyModule do
  require Mod
  Mod.definfo
end
