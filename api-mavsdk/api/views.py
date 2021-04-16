from django.shortcuts import render

# Create your views here.
from django.contrib.auth.models import User, Group
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Enterprise
from .serializers import UserSerializer, GroupSerializer, EnterpriseSerializer
from .tasks import fly_test


@api_view(['GET'])
def enterpriseList(request):
    enterprises = Enterprise.objects.all()
    serializer = EnterpriseSerializer(enterprises, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def request(request):
    result = fly_test.delay()
    return Response()
