# Basiconcepts

## Modules

- all other modules are available to all other modules at runtime
- a module is analogous to a *class*

## Named functions

- must be defined in a module
- the value of the last expression is *implicity returned* to the calling function 
- short functions using a one-line syntax, using `, do:`

```elixir
  
def short_div(x, y), do: x /y  

```
- **Arity** of a function is the number of arguments it accepts.

- For functions that returns a boolean value, it is idiomatic to end the function name with a `?`, like:

```elixir
def either_true?(a, b) do
  a or b
end

```

## Default values

- default values are defined by `\\`
- with functions with multiple clauses, it is required to created a funcion head, without a body, for declaring defaults

```elixir
defmodule Concat do
  # A function head declaring defaults
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts Concat.join("Hello", "world")      #=> Hello world
IO.puts Concat.join("Hello", "world", "_") #=> Hello_world
IO.puts Concat.join("Hello")               #=> Hello
```

## Guards

- used to prevent Elixir from invoking functions based on evaluation of the arguments by guard functions
- begin with the `when` keyword
- are special functions which: must be pure and not mutate any global states and must returns strict `true` or `false` values


## Anonymous functions

- can be assigned to variables
- start with the reserved word `fn`
- arguments are separated from the body of the function with the `->` token
- finished with an `end`

```elixir
function_variable = fn param -> param + 1 end
```
To invoke a function reference, you must use `.`, like

```elixir
function_variable.(1)
# => 2
```
There's the short way:

```elixir
variable = &(&1 + 1)
```
## Recursion
- needs a *base case* and a *recursive case*
- base case returns a value without calling the function again
- recursive case calls the function again and stop when match with the base case
- each case is written in a clause


## Lists

- denoted by square brackets 
- can hold items of any type
- linked list is different, the first item in the list is referred as the *head* and the remaining list of items is called the *tail* 
- list operatores never modify the existing list, always return a new list
- Elixir data structures are *immutable*
- 

```elixir
# [1] represented in [head | tail] notation
[1 | []]

# [1,2,3] represented in [head | tail] notation
[1 | [2 | [3 | []]]]

## to see the head and the tail

list = [1, 2, 3]
hd(list) 
# => 1
tl(list) 
# => [2, 3]
```

We can use this format to prepend elemnts to a list, for example:

```elixir
list = [1, 2]

[3, 2, 1] = [3 | list]
# => true
```
### Concatenation and subctration

```elixir
[1, 2, 3] ++ [4, 5, 6] # and

[1, 2, 3] -- [1, 3]
```

- if you want to see information about a value in IEx, use `i`, like `i 'hello'`.

- a string like `'hello'` is a list of integers (`[104, 101, 108, 108, 111]`), because Elixir sees single quote as a list of printable ASCII numbers, so print as a charlist.

- single-quote is different from double-quoted, the fist is a charlist and the second are strings

```elixir
"hello" == 'hello'
#=> false
```

## Atom

- type represents a fixed constant
- the value is simply its own name
- give us a type-safe way to interact with data
- its like a symbols in others languages
- often they are used to express the satate of an operation, such as `:ok` and `:error`

```elixir
variable = :an_atom
```

## Case an cond

### 1. Case

- compare a value against many patterns until we find a matching one

```elixir
case {1, 2, 3} do
  {4, 5, 6} ->
    "This caluse won't  match"
  {1, x, 3} ->
    "This clause will match and bind x to 2 in this clause"
  _ ->
    "This clause would match any value"
end
```

### 2. Cond
- check different conditions aht find the first one that does not evaluate to `nil` or `false`
- equivalent to else if

```elixir
cond do
  2 + 2 = 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But his will"
  true -> 
    "This is always true (equivalent to else)"
end
```

## Pattern matching

- `=` symbol is a match operator
- rigth side: pattern, left side: value

```elixir
x = 1
1 = x
```

## Tuples

- created using curly braces
- elements can be accessed using the `elem/2` built-in function
- tuple organizes data, holding a fixed number of items of any type
- often used for memory read-intensive operations
- and often used to represent grouped information, like `Float.ration(0.25) # => {1, 4Flo}
```elixir
tuple = {1, :a, "hello"}

elem(tuple, 3)
# => "hello"
```

## Strings

- delimited by double quotes, only
- can be concatenated using `<>/2` operator, like `"Welcome to" <> " " <> "New York"` 
- interpolation using the `#{}` syntax, like `"6 * 7 = #{6 * 7}"`
- new line with `\n`
- print a string using `IO.puts/1` function that returns `:ok` after printing

## Maps

- data structure for storing information in key-value pairs, like dictionaries in python
- do not guarantee the order of their entries when accessed or returned
- map is declared with `%{}`
- add items to a map, we can use two forms: 

```elixir
# if the key is an atom
%{atom_key: 1}

# if the key is a different type
%{1 => :atom_value}

%{"first_form" => :a, atom_form: :b}
```
- when map is used in a patter, it will always match on a subset of the given value
- use `map.fild` syntax and pattern matching instead of the function in the `Map` module

## Modules attributes
### As constants
- to make a value more visible or reusable

```elixir
defmodule Example do
  # Defines the attribute as the value 1
  @constant_number 1
  def example_value() do
    # Returns the value 1
    @constant_number
  end
end
```

## Others things
- `Kernel` module has functions and macros, is Elixir's default environment.

