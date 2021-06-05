from django.utils.deprecation import MiddlewareMixin


class NoCache(MiddlewareMixin):

    def __call__(self, request):
        response = self.get_response(request)
        response['Cache-Control'] = 'must-revalidate, no-cache'
        return response
