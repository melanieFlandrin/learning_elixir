# Learning Elixir

## Write a Function inside of a Module

Generate a new Elixir project with

```bash
mix new project_name
```

You can add a `--module` parameter to name the module in the generated code, otherwise the module has the same name of the generated project.

```bash
mix new project_name --module Example
```

Module is a group of functions, inside a `defmodule` declaration, you can define functions with the `def` keyword, with a function name, the code is wrapping with the `do` and `end` keywords.
No need of `return`, Elixir returns the last line of code inside the function.

```elixir
defmodule Example do
  def hello_world do
    ~w(apple orange bananas)
  end
end
```

You can call a function in the elixir server, run the elixir server with

```bash
iex
```

or  

```bash
iex -S mix
```

In the elixir server, call a function by typing the `moduleName.functionName`  
ex: `Example.hello_world`  
If you type `moduleName.` then press tab, Elixir shows us what is available.

When you modify a function, you must type the following command

```bash
recompile
```

a `:ok` then appears

## Pass arguments into functions

You can include the parameter names between parenthesis, here you can use Elixir string interpolation `#{msg}`. In the server, you can call the function by typing a value.

```elixir
defmodule Example do
  def hello_world(msg) do
    "Hello #{msg}"
  end
end
```

In the Elixir server:

```bash
Example.hello_world("There")
```

The Elixir function is based on its name and its arity (the numbr of arguments). Our function has an arity of `1`

`* hello_world/1`

You can define a default value like this:

```elixir
defmodule Example do
  def hello_world(msg \\ "There") do
    "Hello #{msg}"
  end
end
```

or define a new function with an arity of `0`

```elixir
defmodule Example do
  def hello_world(msg) do
    "Hello #{msg}"
  end

  def hello_world do
    "Hello There"
  end
end
```

## Elixir Array

There are several ways to write an array:

```bash
array1 = ["apple, orange"]
array2 = ~w(apple orange banana)
```

## Pattern Matching

**tuple** of `{a, b}`:

```bash
{a, b} = {"hello", "world"}
```

`a` matching with hello and `b` matching with world.

## Map = Object

The default map syntax:

```bash
map = %{:atom => "value", "string_key" => "value"}
```

You access the map by typing the variable name with the key inside the brackets:

```bash
map[:atom]
map["string_key"]
```

An another way to write a map

```bash
map_2 = %{:atom => "value", :another_atom => "value"}
```

Same thing to access the map:

```bash
map[:atom]
map[:another_atom]
```

The special syntax to access the atom:

```bash
map_2.another_atom
```

## Map.put

```bash
map_1 = %{:name => "Emilie"}
```

Function result:

```bash
Map.put(map_1, :name, "Antoine")
```

Assignment to a variable:

```bash
map_1 = Map.put(map_1, :name, "Antoine")
```

`|>` pipe to add as many functions in a row as desired

```bash
map_1 |> Map.put(:name, "Gabriel")
```

## Chain Function with the Pipe operator

There are no parentheses on this function call: the pipe operator automatically takes the value and passes it as the first argument.

```elixir
defmodule Example do
  # 1. reverse string "hello world"
  # 2. convert to uppercase
  # 3. add a bunch of whitespace to the front of it
  def without_pipes do
    String.pad_leading(String.upcase(String.reverse("hello world")), 30)
  end

  def with_pipes do
    "hello world"
    |> String.reverse
    |> String.upcase
    |> String.pad_leading(30)
  end
end
```

## Ternary condition

```elixir
if BOOL, do: "this", else: "that"
```

ex:

```elixir
my_var = if true, do: "will be returned", else: "never returned"
```

## Return html

Store a pure HTML, XML, SVG etc

```elixir
~E(<svg> ...</svg>)
```

or

```elixir
~E"""
  <div>
    ...
  </div>
"""
```

In elixir component:

```elixir
def render_svg_if(condition) do
  if condition do
     ~E(<svg>...</svg>
  else
     ~E(<svg...)
  end
end
```
