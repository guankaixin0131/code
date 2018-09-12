# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class User_Info(models.Model):
    realname = models.CharField(max_length=50)
    username = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    age = models.IntegerField(default=0)
    college = models.CharField(max_length=200)
    professional = models.CharField(max_length=200)
    phone = models.BigIntegerField()
    email = models.EmailField()
    signature = models.CharField(max_length=300)
    parent_phone = models.BigIntegerField()
    birth_date = models.DateField(auto_now_add=True)
    tag = models.CharField(max_length=10)


    class Meta:
        db_table = 'user_info'

    def __str__(self):
        return self.realname,self.tag,self.gender,self.age,self.college,self.professional,self.phone,self.email,self.signature,self.parent_phone,self.birth_date

class Student_Employment_Info(models.Model):
    realname = models.CharField(max_length=50)
    username = models.CharField(max_length=50)
    gender = models.CharField(max_length=50)
    age = models.IntegerField(default=0)
    college = models.CharField(max_length=200)
    professional = models.CharField(max_length=200)
    company_name = models.CharField(max_length=100)
    company_address = models.CharField(max_length=300)
    position = models.CharField(max_length=50)
    company_phone = models.CharField(max_length=50)
    company_header = models.CharField(max_length=100)
    company_header_phone = models.BigIntegerField()
    phone_self = models.BigIntegerField()
    email = models.EmailField()
    birth_date = models.DateField(auto_now_add=True)

    class Meta:
        db_table = "student_employment_info"

    def __str__(self):
        return self.realname,self.gender,self.age,self.college,self.professional,self.company_name,\
               self.company_address,self.position,self.company_phone,self.company_header,\
               self.company_header_phone,self.phone_self,self.email,self.birth_date

class Positions_info(models.Model):
    company_name = models.CharField(max_length=50)
    username = models.CharField(max_length=50)
    set_time = models.DateTimeField()
    company_address = models.CharField(max_length=300)
    position = models.CharField(max_length=50)
    salary = models.CharField(max_length=50)
    datetime = models.DateField(auto_now_add=True)
    company_introduction = models.TextField()
    skills = models.TextField()
    people_number = models.IntegerField(default=0)
    company_email = models.EmailField()
    content = models.TextField()


    class Meta:
        db_table = 'positions_info'

    def __str__(self):
        return self.company_name,self.username,self.set_time,self.company_address,self.position,\
               self.salary,self.company_introduction,self.content,self.skills,self.people_number,\
               self.datetime,self.company_email


class People_Discuss(models.Model):
    username = models.CharField(max_length=100)
    datetime = models.DateTimeField()
    content = models.TextField()


    class Meta:
        db_table = "people_discusses"

    def __str__(self):
        return  self.username,self.datetime,self.content

class Company_Info(models.Model):
    company_name = models.CharField(max_length=100)
    username = models.CharField(max_length=50)
    company_address = models.CharField(max_length=300)
    position = models.CharField(max_length=50)
    set_time = models.CharField(max_length=50)
    company_introduction = models.CharField(max_length=500)
    tag = models.CharField(max_length=10)

    class Meta:
        db_table = 'company_info'

    def __str__(self):
        return self.company_name,self.tag,self.username,self.company_address,self.position,self.set_time,self.company_introduction


class School_Info(models.Model):
    school_name= models.CharField(max_length=300)
    username = models.CharField(max_length=200)
    real_name = models.CharField(max_length=50)
    school_address = models.CharField(max_length=300)
    college = models.CharField(max_length=200)
    position = models.CharField(max_length=200)
    phone = models.CharField(max_length=50)
    email = models.EmailField()
    tag = models.CharField(max_length=10)


    class Meta:
        db_table = "school_info"

    def __str__(self):
        return self.school_name,self.tag,self.username,self.real_name,self.school_address,self.college,self.position,self.phone,self.email


class Root_User(models.Model):
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)

    class Meta:
        db_table = "root_user"

    def __str__(self):
        return self.username,self.password


class Img(models.Model):
    user = models.CharField(max_length=500)
    path = models.FileField()


    class Meta:
        db_table = "img"

    def __str__(self):
        return self.path,self.user