(comment) @comment

(string) @string

[
    "("
    ")"
    "{"
    "}"
] @punctuation.bracket

[
    ":"
    ","
] @punctuation.delimiter

[
    "="
    "+"
    "-"
    "*"
    "/"
    ">"
    "<"
    ".."
    "=="
    "!="
    ">="
    "<="
] @operator

[
    "true"
    ; "false"
] @boolean

(ERROR) @error

(func_stmt
    "func" @keyword.function
    name: (identifier) @identifier)

(func_stmt
    parameters: (param_list
        (param_decl
            name: (identifier) @parameter
            type: (identifier) @type)))

((identifier)
    @_type
        (#any-of? @_type
            "Number"
            "Int"
            "Float"
            "String"
            "Any")) @type.builtin

(for_stmt
    "for" @repeat
    "in" @keyword.operator)

(class_stmt
    "class" @keyword
    (identifier) @type)

(return_stmt
    "return" @keyword.return)

(call_expr
    function:
        (identifier) @function)

(call_expr
    function:
        ((identifier) @_name (#any-of? @_name
            "print" "println")) @function.builtin)

(if_stmt
    "if" @conditional)

(integer) @number
(float) @float

(var_decl
    [
        "let"
        "const"
    ] @keyword)
