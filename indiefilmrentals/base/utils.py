from django.core.mail import send_mail


def send_email_to_ohiohd(**kwargs):
    to_email = 'ohiohd@ohiohd.com'
    subject = 'Request to OhioHD'
    from_email = 'ohiohd@ohiohd.com'

    interests = ''

    if kwargs['services']:
        interests += 'Production Services, '
    if kwargs['crews']:
        interests += 'Production Crews, '
    if kwargs['rental']:
        interests += 'Equipment Rental, '
    if kwargs['other']:
        interests += 'Other Services, '

    interests = interests[:-2] # take off the final space and comma

    msg = '''Name: %s
        Email: %s
        Phone: %s
        Interested In: %s
        Message: %s''' % (kwargs['name'],kwargs['email'],kwargs['phone'],interests,kwargs['message'], )

    # 
    send_mail(subject, msg, from_email,
            [to_email], fail_silently=False)
