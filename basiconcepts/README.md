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
## Others things
- `Kernel` module has functions and macros, is Elixir's default environment.
