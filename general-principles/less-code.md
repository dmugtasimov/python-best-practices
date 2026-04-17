# Less Code is Better

> "The best code is no code at all." — Jeff Atwood

> "Readability matters, and you should not sacrifice readability in order to get less code." — Daan

## Why Fewer Lines Matter

- Vertically compact code lets you see more source at once, freeing brain capacity for analysis
- Less vertical scrolling reduces distractions and human-factor bugs from misreading code positions
- Fewer lines mean entire logic blocks fit on one screen, reducing short-term memory load and letting you focus on the algorithm rather than mentally tracking code scrolled out of view
- Each line switch requires brain effort to determine if the next line continues the current logic construct or starts a new one — fewer lines means less of this overhead
- Smaller commit diffs are easier to review

## Practical examples of reducing code size

### Instead of assigning then immediately branching on the result
```python
match = re.search(pattern, text)
if match:
    print(match.group())
```

↓↓↓ Use the walrus operator to assign and test in one step (3 → 2 lines) ↓↓↓

```python
if match := re.search(pattern, text):
    print(match.group())
```


### Instead of assigning to a variable and using it only once
```python
error_message = get_error_message(code)
raise ValueError(error_message)
```

↓↓↓ Inline the expression directly (2 → 1 line) ↓↓↓

```python
raise ValueError(get_error_message(code))
```

### Instead of multi-line conditional assignment
```python
if is_admin:
    role = "admin"
else:
    role = "user"
```

↓↓↓  Use a ternary expression (4 → 1 line) ↓↓↓
```python
role = "admin" if is_admin else "user"
```

### Instead of rebuilding a string by referencing the variable itself
```python
string_value = f'{string_value} {suffix}'
```

↓↓↓ Use augmented assignment to append in place ↓↓↓
```python
string_value += f' {suffix}'
```

More to be added...

## Complementary techniques

Several techniques work well alongside writing less code to further reduce cognitive load and scrolling overhead:

**Extra monitors (especially vertically positioned)** — Research suggests an extra monitor can increase productivity up to 30%. They reduce scrolling and file-switching friction significantly. Keep in mind that a developer can only focus on one screen at a time, and monitors limit mobility for those who work from a laptop in different locations.

**Smaller font sizes** — Fitting more lines on screen at once is a simple win, though it does come at the cost of greater eye strain, so balance it against comfort.

**Breaking long files into smaller ones** — Shorter files mean less scrolling within a single file. Switching between files has its own overhead, though.

**Breaking code into smaller functions** — Extracting focused, well-named functions lets you read and reason about a limited piece of logic at a time, without holding the surrounding context in your head.

[Back](../README.md)
