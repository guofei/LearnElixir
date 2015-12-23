defmodule Translator do
  defmacro __using__(_options) do
    quote do
      IO.puts "quote context (#{__MODULE__})"
      IO.puts "quote context (#{unquote(__MODULE__)})"
      Module.register_attribute __MODULE__, :locales, accumulate: true, persist: false
      import unquote(__MODULE__), only: [locale: 2]
      @before_comple unquote(__MODULE__)
    end
  end

  defmacro __before_comple__(env) do
    compile(Module.get_attribute(env.module, :locales))
  end

  defmacro locale(name, mappings) do
    quote bind_quoted: [name: name, mappings: mappings] do
      @locales {name, mappings}
    end
  end

  def compile(translations) do
    # TBD:
  end
end

defmodule My do
  use Translator
end
