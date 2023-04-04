from django.urls import path,include
from . import views

app_name = 'metro'

urlpatterns = [
    path("",views.home,name="home"),
    path("register_check/",views.register_check,name = 'register'),
    path('',include("django.contrib.auth.urls")),
    path('login_check/',views.login_check,name="login_check"),
    path('user_check/',views.Userr,name="user"),
    path('help_check/',views.help_check,name="help"),
    path('payment_check/',views.payment,name="payment"),
    path('ticket_check/',views.ticket,name = "ticket"),
    path('admin_check/',views.admin,name="admin"),
    path('basic_check/',views.basic,name="basic"),
    path('feedback_check/',views.feedback,name="feedback"),
    path('delete_user/<username>',views.delete_user,name="delete_user"),
    path('delete_admin/<username>',views.delete_admin,name="delete_admin"),
    path('delete_station/<station_id>',views.delete_station,name="delete_station"),
    path('add_user/',views.add_user,name='add_user'),
    path('add_admin/',views.add_admin,name='add_admin'),
    path('add_station/',views.add_station,name='add_station'),
]