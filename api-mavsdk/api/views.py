from django.shortcuts import render

# Create your views here.
from django.contrib.auth.models import User, Group
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Enterprise
from .serializers import UserSerializer, GroupSerializer, EnterpriseSerializer
from .tasks import fly_test
from django.shortcuts import get_object_or_404
from decimal import Decimal


@api_view(['GET'])
def enterpriseList(request):
    enterprises = Enterprise.objects.all()
    serializer = EnterpriseSerializer(enterprises, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def request(request):
    enterprise_id = request.data.get('enterprise_id')
    enterprise = get_object_or_404(Enterprise, id=enterprise_id)
    
    result = fly_test.delay(Decimal(enterprise.lat), Decimal(enterprise.lon))
    return Response('Buenos dias')

@api_view(['POST'])
def go_home(request):
    home_lat = 40.20564
    home_lon = -8.41955 
    fly_test.delay(home_lat, home_lon)
    return Response()
