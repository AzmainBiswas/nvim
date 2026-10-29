# NVIM Config
minimal neovim config.

# Vim Tricks
this are some vim tricks i want to remember.

* Regex trick: `\v`(very magic), `\V`(very Nonmagic), `\m`(Magic), `\M`(Nomagic)
### How the Same Symbols Behave Across All 4 Modes

| Symbol     | Very Magic (\v)  | Magic (\m - Default) | Nomagic (\M)      | Very Nomagic (\V) |
|------------|------------------|----------------------|-------------------|-------------------|
| +, ?,      | Special operator | Literal character    | Literal character | Literal character |
| (, ), {, } | Grouping / Range | Literal character    | Literal character | Literal character |
| ., *, [, ] | Wildcard / Class | Wildcard / Class     | Literal character | Literal character |
| ^, $       | Line anchors     | Line anchors         | Line anchors      | Literal character |

 ### Quick Selection Rule of Thumb

| Use Case                                                          | Recommended Flag |
|-------------------------------------------------------------------|------------------|
| Complex regex, capture groups, alternation (OR), quantifiers      | `\v`             |
| Quick basic wildcard search with .*                               | `\m`             |
| Matching literal symbols (*, .) while keeping line anchors (^, $) | `\M`             |
| Copy-pasting raw code snippets, equations, or exact URLs          | `\V`             |

* Highlight some word(`search_text`) in nvim:
```command
match Search /\v<search_text>
match none
```
