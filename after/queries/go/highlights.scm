(function_declaration
    name: (identifier) @constructor (#match? @constructor "^New.*"))

(call_expression
    function: (selector_expression
        (field_identifier) @constructor (#match? @constructor "^New.*")))

(call_expression
    function: (identifier) @constructor (#match? @constructor "^New.*"))
