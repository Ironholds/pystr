

# pystr [![Build Status](https://travis-ci.org/nicolewhite/pystr.svg?branch=master)](https://travis-ci.org/nicolewhite/pystr)

String operations the Python way: a package for those of us who miss Python's string methods while we're working in R.


```r
install.packages("pystr")
library(pystr)
```

## String Formatting

Most importantly, `pystr` brings a port of Python's [str.format](https://docs.python.org/3/library/stdtypes.html#str.format) to R with `pystr_format`.

### Indexed Parameters

You can pass in parameters individually:

```r
pystr_format("Hello {1}, my name is {2}.", "World", "Nicole")
```

```
## [1] "Hello World, my name is Nicole."
```

As a vector:

```r
params = c("World", "Nicole")
pystr_format("Hello {1}, my name is {2}.", params)
```

```
## [1] "Hello World, my name is Nicole."
```

Or as a list:

```r
params = list("World", "Nicole")
pystr_format("Hello {1}, my name is {2}.", params)
```

```
## [1] "Hello World, my name is Nicole."
```

### Named Parameters

You can pass in named parameters individually:

```r
pystr_format("Hello {thing}, my name is {name}.", thing="World", name="Nicole")
```

```
## [1] "Hello World, my name is Nicole."
```

As a named vector:

```r
params = c(thing="World", name="Nicole")
pystr_format("Hello {thing}, my name is {name}.", params)
```

```
## [1] "Hello World, my name is Nicole."
```

Or as a named list:

```r
params = list(thing="World", name="Nicole")
pystr_format("Hello {thing}, my name is {name}.", params)
```

```
## [1] "Hello World, my name is Nicole."
```

### Repeated Parameters

Parameters can be used more than once throughout a string:

```r
pystr_format("The name is {last}. {first} {last}.", last="Bond", first="James")
```

```
## [1] "The name is Bond. James Bond."
```

### Replacement Types

Pass in characters and numbers:

```r
pystr_format("Hello {name}, you have {n} new notifications!", name="Nicole", n=3)
```

```
## [1] "Hello Nicole, you have 3 new notifications!"
```

## Other Ported Methods

### `pystr_capitalize`

Port of [str.capitalize](https://docs.python.org/3/library/stdtypes.html#str.capitalize).

```r
pystr_capitalize("ONCE UPON A TIME, ")
```

```
## [1] "Once upon a time, "
```

### `pystr_center`

Port of [str.center](https://docs.python.org/3/library/stdtypes.html#str.center).

```r
pystr_center("center me", 15, "*")
```

```
## [1] "***center me***"
```

### `pystr_count`

Port of [str.count](https://docs.python.org/3/library/stdtypes.html#str.count).

```r
pystr_count("abcxyzabc123", "abc")
```

```
## [1] 2
```

### `pystr_endswith`

Port of [str.endswith](https://docs.python.org/3/library/stdtypes.html#str.endswith).

```r
pystr_endswith("selfie.jpg", ".jpg")
```

```
## [1] TRUE
```

```r
pystr_endswith("selfie.jpg", c(".jpg", ".png"))
```

```
## [1] TRUE
```

### `pystr_find`

Port of [str.find](https://docs.python.org/3/library/stdtypes.html#str.find).

```r
pystr_find("12345", "34")
```

```
## [1] 3
```

### `pystr_index`

Port of [str.index](https://docs.python.org/3/library/stdtypes.html#str.index).

```r
pystr_index("12345", "34")
```

```
## [1] 3
```

```r
pystr_index("12345", "xy")
```

```
## Error in pystr_index("12345", "xy"): ValueError
```

### `pystr_isalnum`

Port of [str.isalnum](https://docs.python.org/3/library/stdtypes.html#str.isalnum).

```r
pystr_isalnum("abc123")
```

```
## [1] TRUE
```

```r
pystr_isalnum("abc123!")
```

```
## [1] FALSE
```

### `pystr_isalpha`

Port of [str.isalpha](https://docs.python.org/3/library/stdtypes.html#str.isalpha).

```r
pystr_isalpha("abc")
```

```
## [1] TRUE
```

```r
pystr_isalpha("abc!")
```

```
## [1] FALSE
```

### `pystr_islower`

Port of [str.islower](https://docs.python.org/3/library/stdtypes.html#str.islower).

```r
pystr_islower("all lowercase!")
```

```
## [1] TRUE
```

```r
pystr_islower("All lowercase?")
```

```
## [1] FALSE
```

### `pystr_isnumeric`

Port of [str.isnumeric](https://docs.python.org/3/library/stdtypes.html#str.isnumeric).

```r
pystr_isnumeric("123")
```

```
## [1] TRUE
```

```r
pystr_isnumeric("123!")
```

```
## [1] FALSE
```

### `pystr_isspace`

Port of [str.isspace](https://docs.python.org/3/library/stdtypes.html#str.isspace).

```r
pystr_isspace("   ")
```

```
## [1] TRUE
```

### `pystr_istitle`

Port of [str.istitle](https://docs.python.org/3/library/stdtypes.html#str.istitle).

```r
pystr_istitle("I Am A Title")
```

```
## [1] TRUE
```

```r
pystr_istitle("I Am not A Title")
```

```
## [1] FALSE
```

### `pystr_isupper`

Port of [str.isupper](https://docs.python.org/3/library/stdtypes.html#str.isupper).

```r
pystr_isupper("HELLO!")
```

```
## [1] TRUE
```

### `pystr_join`

Port of [str.join](https://docs.python.org/3/library/stdtypes.html#str.join).

```r
pystr_join(c("A", "BB", "CCC"))
```

```
## [1] "ABBCCC"
```

```r
pystr_join(c(1, 2, 3), "+")
```

```
## [1] "1+2+3"
```

### `pystr_ljust`

Port of [str.ljust](https://docs.python.org/3/library/stdtypes.html#str.ljust).

```r
pystr_ljust("left", 10)
```

```
## [1] "left      "
```

```r
pystr_ljust("left", 10, "*")
```

```
## [1] "left******"
```

### `pystr_lower`

Port of [str.lower](https://docs.python.org/3/library/stdtypes.html#str.lower).

```r
pystr_lower("LOWERCASE ME!")
```

```
## [1] "lowercase me!"
```

### `pystr_lstrip`

Port of [str.lstrip](https://docs.python.org/3/library/stdtypes.html#str.lstrip).

```r
pystr_lstrip("www.example.com", "w.")
```

```
## [1] "example.com"
```

### `pystr_maketrans`

Port of [str.maketrans](https://docs.python.org/3/library/stdtypes.html#str.maketrans).

```r
map = pystr_maketrans("abc", "123")
pystr_translate("a blue cat", map)
```

```
## [1] "1 2lue 31t"
```

### `pystr_partition`

Port of [str.partition](https://docs.python.org/3/library/stdtypes.html#str.partition).

```r
pystr_partition("onetwothreeonetwothree", "two")
```

```
## [1] "one"              "two"              "threeonetwothree"
```

### `pystr_replace`

Port of [str.replace](https://docs.python.org/3/library/stdtypes.html#str.replace).

```r
pystr_replace("mississippi", "ss", "X")
```

```
## [1] "miXiXippi"
```

```r
pystr_replace("mississippi", "ss", "X", 1)
```

```
## [1] "miXissippi"
```

### `pystr_rfind`

Port of [str.rfind](https://docs.python.org/3/library/stdtypes.html#str.rfind).

```r
pystr_rfind("abcxyzabc", "abc")
```

```
## [1] 7
```

### `pystr_rindex`

Port of [str.rindex](https://docs.python.org/3/library/stdtypes.html#str.rindex).

```r
pystr_rindex("abcdab", "ab")
```

```
## [1] 5
```

```r
pystr_rindex("abcdab", "xy")
```

```
## Error in pystr_rindex("abcdab", "xy"): ValueError
```

### `pystr_rjust`

Port of [str.rjust](https://docs.python.org/3/library/stdtypes.html#str.rjust).

```r
pystr_rjust("right", 10)
```

```
## [1] "     right"
```

```r
pystr_rjust("right", 10, "*")
```

```
## [1] "*****right"
```

### `pystr_rpartition`

Port of [str.rpartition](https://docs.python.org/3/library/stdtypes.html#str.rpartition).

```r
pystr_rpartition("onetwothreeonetwothree", "two")
```

```
## [1] "onetwothreeone" "two"            "three"
```

### `pystr_rsplit`

Port of [str.rsplit](https://docs.python.org/3/library/stdtypes.html#str.rsplit).

```r
pystr_rsplit("a--b--c", "--", 1)
```

```
## [1] "a--b" "c"
```

### `pystr_rstrip`

Port of [str.rstrip](https://docs.python.org/3/library/stdtypes.html#str.rstrip).

```r
pystr_rstrip("mississippi", "ipz")
```

```
## [1] "mississ"
```

### `pystr_split`

Port of [str.split](https://docs.python.org/3/library/stdtypes.html#str.split).

```r
pystr_split("1+2+3+4", "+")
```

```
## [1] "1" "2" "3" "4"
```

```r
pystr_split("1+2+3+4", "+", 1)
```

```
## [1] "1"     "2+3+4"
```

### `pystr_splitlines`

Port of [str.splitlines](https://docs.python.org/3/library/stdtypes.html#str.splitlines).

```r
pystr_splitlines("First\nSecond\nThird")
```

```
## [1] "First"  "Second" "Third"
```

### `pystr_startswith`

Port of [str.startswith](https://docs.python.org/3/library/stdtypes.html#str.startswith).

```r
pystr_startswith("http://www.example.com", "http://")
```

```
## [1] TRUE
```

```r
pystr_startswith("http://www.example.com", c("http://", "https://"))
```

```
## [1] TRUE
```

### `pystr_strip`

Port of [str.strip]().

```r
pystr_strip("    very spacious    ")
```

```
## [1] "very spacious"
```

```r
pystr_strip("www.example.com", "wcom.")
```

```
## [1] "example"
```

### `pystr_swapcase`

Port of [str.swapcase](https://docs.python.org/3/library/stdtypes.html#str.swapcase).

```r
pystr_swapcase("Swap Me!")
```

```
## [1] "sWAP mE!"
```

### `pystr_title`

Port of [str.title](https://docs.python.org/3/library/stdtypes.html#str.title).

```r
pystr_title("make me pretty")
```

```
## [1] "Make Me Pretty"
```

### `pystr_translate`

Port of [str.translate](https://docs.python.org/3/library/stdtypes.html#str.translate).

```r
map = pystr_maketrans("abc", "123")
pystr_translate("a blue cat", map)
```

```
## [1] "1 2lue 31t"
```

### `pystr_upper`

Port of [str.upper](https://docs.python.org/3/library/stdtypes.html#str.upper).

```r
pystr_upper("uppercase me!")
```

```
## [1] "UPPERCASE ME!"
```

### `pystr_zfill`

Port of [str.zfill]().

```r
pystr_zfill("42", 5)
```

```
## [1] "00042"
```

```r
pystr_zfill("-42", 5)
```

```
## [1] "-0042"
```

## Methods Not Ported (Yet)

* [str.casefold](https://docs.python.org/3/library/stdtypes.html#str.casefold)
* [str.encode](https://docs.python.org/3/library/stdtypes.html#str.encode)
* [str.expandtabs](https://docs.python.org/3/library/stdtypes.html#str.expandtabs)
* [str.format_map](https://docs.python.org/3/library/stdtypes.html#str.format_map)
* [str.isdecimal](https://docs.python.org/3/library/stdtypes.html#str.isdecimal)
* [str.isdigit](https://docs.python.org/3/library/stdtypes.html#str.isdigit)
* [str.isidentifier](https://docs.python.org/3/library/stdtypes.html#str.isidentifier)
* [str.isprintable](https://docs.python.org/3/library/stdtypes.html#str.isprintable)
