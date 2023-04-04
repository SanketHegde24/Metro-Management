# Create your views here.
from django.http import HttpResponse
#from .models import album
from django.shortcuts  import render,redirect
from django.contrib.auth import login,logout,authenticate
from django.http import Http404
from django.views.generic import View
from .forms import UserForm
from django.views.generic.edit import CreateView,UpdateView,DeleteView
from mm.models import *
import mysql.connector
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms
from .models import *

def home(request):
    return render(request,'templates/Welcome.html')

   
def login_check(request):
    if request.method == "POST":
        try:
            username = request.POST.get('username')
            password =  request.POST.get('password')
            product = Metrouser.objects.get(username=username)
            userr = authenticate(request,username = username ,password = password)
            if userr is not None and product.admin is True:
                login(request,userr)
                return redirect('/metro/admin_check')
            
            elif userr is not None :
                login(request,userr)
                print(request.user.username)
                return redirect('/metro/user_check')
            
            else:
                messages.error(request, 'Login unsuccessful,try again.')
        except:
            messages.error(request, 'Login unsuccessful,try again.')
    return render(request,'templates/login.html')
 
           
def register_check(request):
    if request.method == "POST":
        try:
            print("Welcome to post reg")
            red2 = Metrouser()
            red2.username = request.POST.get('RegUsername')
            red2.email = request.POST.get('RegEmail')
            red2.mno =  request.POST.get('RegMno') 
            red2.password =  request.POST.get('RegPassword1')
            red2.save()
            user = User.objects.create_user(username=request.POST.get('RegUsername'), password=request.POST.get('RegPassword1'),email =request.POST.get('RegEmail') )
            user.save()
            messages.success(request,"Registeration successful")               
            return redirect('/metro/login_check')
        except:
            messages.error(request, 'Username or Email already excist,try again.')
            return render(request,'templates/reg.html')
    else:
        messages.error(request, 'Registeration unsuccessful,try again.')
        return render(request,'templates/reg.html')
  

def Userr(request):
    station = Station.objects.all()
    if request.method == "POST":
        try:
            res =Ticketdetails.objects.latest("ticket_id")
            id = int(res.ticket_id) + 1          
        except:
            id = 0
        number = request.POST.get('NoOfTicket')
        cos = (int(request.POST.get('source_id')) - int(request.POST.get('dest_id')))*10
        if cos < 0 :
            cos= cos - ( cos * 2 )
        cos = cos * int(number)
        v= Station()
        w =Station()
        v.station_id = request.POST.get('source_id')
        w.station_id =request.POST.get('dest_id')
        m  = Metrouser()
        m.username = request.user.username
        u = Ticketdetails()
        u.ticket_id = id
        u.uname = m.username
        u.email = u.email  
        u.sourceid=v
        u.destid=w 
        u.date=request.POST.get('date')
        u.trip = request.POST.get('trip')
        u.time_slot = request.POST.get('time_slot')
        g = request.POST.get('gender')
        u.tktype = request.POST.get('grp')
        u.cost = cos * int(u.trip)
        u.save()
        return redirect('/metro/payment_check')
    return render(request,'templates/User.html', {'StationObj':station})


def payment(request):
    result =Ticketdetails.objects.latest("ticket_id")
    GST = ((18*result.cost) / 100)
    cost = result.cost + 2 + GST 
    if request.method == "POST":
        return redirect('/metro/ticket_check')
    return render(request,'templates/Payment.html',{'cost':cost})


def ticket(request):
    result =Ticketdetails.objects.latest("ticket_id")
    GST = ((18*result.cost) / 100)
    cost = result.cost + 2 + GST    
    return render(request,'templates/Ticket.html',{'object':result,"cost":cost, 'GST':GST})


def help_check(request):
    if request.method == 'POST':
        try:
            res =Help.objects.latest("id")
            id = int(res.id) + 1          
        except:
            id = 0
        email = request.POST.get('Email')
        contact = request.POST.get('Contact')
        messages = request.POST.get('message')
        # image = request.POST.get('Image')
        hp = Help(username = request.user.username, id = id, email = email, contact = contact, message = messages)
        hp.save()
    return render(request,'templates/Help.html')


def basic (request):
    return render(request,'templates/Basic.html')


def feedback (request):
    if request.method == 'POST':
        try:
            res =Feedback.objects.latest("id")
            id = int(res.id) + 1          
        except:
            id = 0
        email = request.POST.get('Email')
        rev_stars = request.POST.get('rev_stars')
        messages = request.POST.get('message')
        fb = Feedback(username = request.user.username ,id = id,email = email,rev_stars = rev_stars, message = messages)
        fb.save()
    return render(request,'templates/Feedback.html')


def entry (request):
    return render(request,'templates/Entry.html')


def admin (request):
    feedback = Feedback.objects.all()
    station = Station.objects.all()
    user = Metrouser.objects.all()
    help = Help.objects.all()
    cntS = 0
    return render(request,'templates/Admin.html',{'feedbackObj':feedback, 'StationObj':station, 'UserObj':user, 'HelpObj':help, 'CntObj':cntS})

def delete_user(request, username):
    dele = Metrouser.objects.get(username=username)
    dele1 = AuthUser.objects.get(username=username)
    dele1.delete()
    dele.delete()
    return redirect('/metro/admin_check')

def delete_admin(request, username):
    dele = Metrouser.objects.get(username=username)
    dele1 = AuthUser.objects.get(username=username)
    dele1.delete()
    dele.delete()
    return redirect('/metro/admin_check')

def delete_station(request, station_id):
    dele = Station.objects.get(station_id=station_id)
    dele.delete()
    return redirect('/metro/admin_check')

def add_user(request):
    try:
        AddUser = Metrouser()
        AddUser.username = request.POST.get('AddUserName')
        AddUser.email = request.POST.get('AddUserEmail')
        AddUser.mno =  request.POST.get('AddUserNumber') 
        AddUser.password =  request.POST.get('AddUserPassword')
        user = User.objects.create_user(username=request.POST.get('AddUserName'), password=request.POST.get('AddUserPassword'),email =request.POST.get('AddUserEmail') )
        user.save()
        AddUser.save()
        return redirect('/metro/admin_check')
    except:
        messages.error(request, 'Failed to perform the prev request,try again.')
        return redirect('/metro/admin_check')

def add_admin(request):
    try:
        AddAdmin = Metrouser()
        AddAdmin.username = request.POST.get('AddAdminName')
        AddAdmin.email = request.POST.get('AddAdminEmail')
        AddAdmin.mno =  request.POST.get('AddAdminNumber') 
        AddAdmin.password =  request.POST.get('AddAdminPassword')
        AddAdmin.admin = True
        admin = User.objects.create_user(username=request.POST.get('AddAdminName'), password=request.POST.get('AddAdminPassword'),email =request.POST.get('AddAdminEmail') )
        admin.save()
        AddAdmin.save()
        return redirect('/metro/admin_check')
    except:
        messages.error(request, 'Failed to perform the prev request,try again.')
        return redirect('/metro/admin_check')

def add_station(request):
    AddStation = Station()
    AddStation.s_name = request.POST.get('AddStationName')
    try:
        res = Station.objects.latest("station_id")
        id = int(res.station_id) + 1          
    except:
        id = 0
    AddStation.station_id = id
    AddStation.save()
    return redirect('/metro/admin_check')
