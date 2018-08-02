# SymWorld

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sym_world` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sym_world, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sym_world](https://hexdocs.pm/sym_world).

## Production Scripts

### REPL

```
MIX_ENV=prod iex -S mix
```

### Executable Script

```
MIX_ENV=prod mix escript.build
```

### Run Application

```
MIX_ENV=prod mix run --no-halt
```

## Docker

```
sudo docker build -t symworld .
```
