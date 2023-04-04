from django.db import models

class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)
    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)
    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)
    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()
    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)
    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)
    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()
    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()
    class Meta:
        managed = False
        db_table = 'django_session'


class Feedback(models.Model):
    email = models.CharField(max_length=30,  blank=True, null=True)
    message = models.CharField(max_length=5000, blank=True, null=True)
    username = models.CharField(max_length=20, blank=True, null=True)
    rev_stars = models.IntegerField(blank=True, null=True)
    id =  models.CharField(primary_key=True, max_length=20)
    class Meta:
        managed = False
        db_table = 'feedback'


class Metrouser(models.Model):
    username = models.CharField(primary_key=True, max_length=20)
    password = models.CharField(max_length=20, blank=True, null=True)
    mno = models.BigIntegerField(blank=True, null=True)
    email = models.CharField(max_length=30, blank=True, null=True)
    admin = models.BooleanField(default=False)
    class Meta:
        managed = False
        db_table = 'metrouser'


class Station(models.Model):
    s_name = models.CharField(max_length=20, blank=True, null=True)
    station_id = models.IntegerField(primary_key=True)
    class Meta:
        managed = False
        db_table = 'station'


class Ticketdetails(models.Model):
    ticket_id = models.IntegerField(primary_key=True)
    sourceid = models.ForeignKey(Station, models.DO_NOTHING, db_column='sourceid', blank=True, null=True,related_name='src')
    destid = models.ForeignKey(Station, models.DO_NOTHING, db_column='destid', blank=True, null=True,related_name='dest')
    uname = models.CharField(max_length=30, blank=True, null=True)
    email = models.ForeignKey(Metrouser, models.DO_NOTHING, db_column='email', blank=True, null=True)
    date = models.DateField(db_column='Date', blank=True, null=True)  # Field name made lowercase.
    cost = models.IntegerField(blank=True, null=True)
    trip = models.CharField(db_column='TRIP', max_length=20, blank=True, null=True)  # Field name made lowercase.
    time_slot = models.CharField(max_length=30, blank=True, null=True)
    tktype = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table ='ticketdetails'


class Help(models.Model):
    email = models.CharField(max_length=30,  blank=True, null=True)
    message = models.CharField(max_length=5000, blank=True, null=True)
    username = models.CharField(max_length=20, blank=True, null=True)
    # image = models.ImageField(blank=True, null=True)
    contact = models.IntegerField(blank=True, null=True)
    id =  models.CharField(primary_key=True, max_length=20)
    class Meta:
        managed = False
        db_table = 'help'


