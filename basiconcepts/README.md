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
## Others things
- `Kernel` module has functions and macros, is Elixir's default environment.
