(comment) @comment

[
    "return"
] @keyword

[
    ":"
] @punctuation

[
    "true"
    "false"
] @boolean

[
    "="
    "+"
    "-"
    "*"
    "/"
    "=="
    "!="
    ">="
    "<="
    ".."
] @operator

[
    "{"
    "}"
    "("
    ")"
] @punctuation.bracket

(func_stmt
    "func" @keyword.function
    name: (identifier) @function)

(type_annotation
    type: (identifier) @type)

(const_stmt
    "const" @keyword
    name: (identifier) @constant)

(if_stmt
    "if" @conditional)

(let_stmt
    "let" @keyword
    name: (identifier) @variable)

(for_stmt
    "for" @repeat
    "in" @keyword.operator)

(function_call
    (identifier) @function)

((identifier) @function.builtin
    (any-of? @function.builtin
        "print" "println"))

(string) @string

(number) @number

(ERROR) @error
