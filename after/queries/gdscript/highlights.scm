
(const_statement
    "const" @keyword
    (name)  @constant)
(export_variable_statement
    "export"    @annotation)
(onready_variable_statement
    "onready"   @annotation)

[
    "=="
    "!="
    "is"
    "as"
] @operator

(type)                  @type
(get_node)              @string
"var"                   @keyword

(ERROR) @error
