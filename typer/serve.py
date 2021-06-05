from django.contrib.staticfiles.views import serve as sf_serve


def custom_serve(request, path, insecure=False, **kwargs):
    request['Cache-Control'] = 'must-revalidate, no-cache'
    return sf_serve(request, path, insecure, **kwargs)
