[
    "("
    ")"
    "{"
    "}"
] @punctuation.bracket

[
    ","
    "."
    ":"
    "->"
] @punctuation.delimiter

[
    "+"
    "-"
    "*"
    "/"
    ">"
    "<"
    "="
    ".."
] @operator

[
    "in"
] @keyword.operator

[
    "class"
    "let"
    "const"
    "func"
    "return"
] @keyword

"if" @conditional
"for" @repeat

(const_stmt
    name: (identifier) @constant
    type: (identifier) @type)
(let_stmt
    type: (identifier) @type)

(class_stmt
    name: (identifier) @type
    super: (identifier) @type)
(class_stmt
    (let_stmt
        name: (identifier) @field))
(class_stmt
    (func_stmt
        name: (identifier) @method))

(call_expr
    function: (identifier) @function)
(call_expr
    function: (identifier) @function.builtin
        (#any-of? @function.builtin
            "print" "println"))

(func_stmt
    name: (identifier) @function)
(func_stmt
    parameters: (param_list
        (param_decl
            name: (identifier) @identifier
            type: (identifier) @type)))
(func_stmt
    result: (identifier) @type)

(func_type
    type: (identifier) @type)

(comment) @comment

(string) @string
(integer) @number

; ((identifier) @type.builtin
;     (#any-of? "Int" "Float" "Bool" "Any" "String"))
