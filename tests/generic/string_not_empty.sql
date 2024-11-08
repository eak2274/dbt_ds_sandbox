{% test string_not_empty(model, column_name) %}
    SELECT {{column_name}}
    FROM {{model}}
    WHERE trim({{column_name}})=''
{% endtest %}