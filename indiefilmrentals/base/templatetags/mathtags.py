from django import template

register = template.Library()

@register.filter(is_safe=True)
def mult(value, arg):
    "Multiplies the arg and the value"
    return int(value) * int(arg)


@register.filter(is_safe=True)
def sub(value, arg):
    "Subtracts the arg from the value"
    return int(value) - int(arg)

@register.filter(is_safe=True)
def div(value, arg):
    "Divides the value by the arg"
    return int(value) / int(arg)

#template.register_filter('mult', mult, True)
#template.register_filter('sub', sub, True)
#template.register_filter('div', div, True)
