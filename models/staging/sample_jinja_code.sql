{# This jinja code prints a certain number of SELECT statements connected by UNION statement #}
{% set number_of_selects=10 %}
{% for i in range(number_of_selects) %}
    SELECT {{i}} AS number
    {% if not loop.last %}
        UNION
    {% endif %}

{% endfor %}