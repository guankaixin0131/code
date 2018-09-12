# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import json
import datetime
from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect,JsonResponse
from models import User_Info,Student_Employment_Info,School_Info,Positions_info,People_Discuss,Company_Info,Root_User
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout

def login_1(request):
    if request.method =="GET":
        return render(request,"login.html")


def login_post(request):
    if request.method =="POST":
        username = request.POST.get('username')
        pwd = request.POST.get('pwd')
        print username,pwd
        user = authenticate(username=username,password=pwd)
        print user
        if user is not None:
            if user.is_active:
                login(request,user)
                return HttpResponse(json.dumps("登录成功！"))



def register(request):
    return render(request,"student/regiter.html")

def school_register_root(request):
    return render(request,"school/regiter_root_user.html")

def school_register_root_post(request):
    if request.method == "POST":
        username = request.POST.get("username")
        pwd = request.POST.get("pwd")
        user = Root_User.objects.filter(username=username,password=pwd)
        if user:
            return HttpResponse(json.dumps("suceessful"))
        else:
            return HttpResponse(json.dumps("failed"))

def school_register(request):
    return render(request,"school/regiter.html")

def company_register(request):
    return render(request, "company/regiter.html")


def register_post(request):
    if request.method == "POST":
        realname = request.POST.get("realname")
        username = request.POST.get("username")
        email = request.POST.get("email")
        gender = request.POST.get("gender")
        pwd = request.POST.get("pwd")
        college = request.POST.get("college")
        professional = request.POST.get("professional")
        age = request.POST.get("age")
        phone = request.POST.get("phone")
        signature = request.POST.get("signature")
        parent_phone = request.POST.get("parent_phone")
        birth_date = request.POST.get("birth_date")
        tag = request.POST.get("tag")
        User.objects.create_user(username=username,password=pwd)
        User_Info.objects.create(realname=realname,username=username,email=email,gender=gender,
                                 college=college,professional=professional,age=age,phone=phone,
                                 signature=signature,parent_phone=parent_phone,birth_date=birth_date,tag=tag)
        return HttpResponse(json.dumps("注册成功"))

def register_company_post(request):
    if request.method =="POST":
        username = request.POST.get("username")
        pwd = request.POST.get("pwd")
        company_name = request.POST.get('company_name')
        company_address = request.POST.get('company_address')
        position = request.POST.get('position')
        set_time = request.POST.get("set_time")
        company_introduction = request.POST.get('company_introduction')
        tag = request.POST.get('tag')
        User.objects.create_user(username=username,password=pwd)
        Company_Info.objects.create(username=username,company_name=company_name,company_address=company_address,
                                    position=position,set_time=set_time,company_introduction=company_introduction,tag=tag)
        return HttpResponse(json.dumps("注册成功"))

def register_school_post(request):
    if request.method == "POST":
        real_name = request.POST.get("real_name")
        username = request.POST.get("username")
        email = request.POST.get("email")
        school_name = request.POST.get("school_name")
        pwd = request.POST.get("pwd")
        college = request.POST.get("college")
        position = request.POST.get("position")
        school_address = request.POST.get("school_address")
        phone = request.POST.get("phone")
        tag = request.POST.get('tag')
        User.objects.create_user(username=username,password=pwd)
        School_Info.objects.create(real_name=real_name,username=username,email=email,school_address=school_address,
                                 college=college,position=position,phone=phone,school_name=school_name,tag=tag)
        return HttpResponse(json.dumps("注册成功"))

def index(request):
    username = request.user
    # print username
    db_user = User_Info.objects.filter(username=username)
    if db_user:
        db_tag = User_Info.objects.filter(username=username)[0].tag
        db_signature = db_user[0].signature
        if db_tag=="0":
            return render(request, "student/index.html",{ "db_signature": db_signature})
    else:
        db_user = School_Info.objects.filter(username=username)
        if db_user:
            # db_signature = db_user[0].signature
            return render(request, "school/index.html")
        else:
            db_user = Company_Info.objects.filter(username=username)
            db_signature = db_user[0].company_introduction
            return render(request, "company/index.html", {"db_signature": db_signature})



#学生
#评论
def all_discuss(request):
    username = request.user
    db_user = User_Info.objects.filter(username=username)
    db_signature = db_user[0].signature
    content_all = People_Discuss.objects.all()
    content_dict = {}
    for index, content in enumerate(content_all):
        content_dict[index] = content_all[index]
    return render(request,"student/ui_discuss_all.html",{ "db_signature": db_signature,"content_dict":content_dict})

def myself_discuss(request):
    user = request.user
    username=str(user)
    # print username,type(username)
    db_signature = User_Info.objects.filter(username=username)[0].signature
    content_all = People_Discuss.objects.all()
    # print type(content_all)
    user_list_content = []
    user_list_time = []
    for user_content in content_all:
        # print user_content.username
        if user_content.username == username:
            user_list_content.append(user_content.content)
            user_list_time.append(user_content.datetime)
    # print user_list_content,user_list_time
    user_content_dict = {}
    for index, content in enumerate(user_list_content):
        user_content_dict[user_list_time[index]]= user_list_content[index]
    # print user_content_dict
    return render(request,"student/ui_discuss_myself.html",{"db_signature": db_signature,"user_content_all":user_content_dict})

def published_discusses(request):
    username = request.user
    db_signature = User_Info.objects.filter(username=username)[0].signature
    return render(request,"student/published_discusses.html",{"db_signature": db_signature})

def published_discusses_post(request):
    if request.method == "POST":
        username = request.user
        now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print now_time,type(now_time)
        content = request.POST.get("content")
        People_Discuss.objects.create(username=username,datetime=now_time, content=content)
        return HttpResponse(json.dumps("发表成功"))

#职位信息
def all_positions(request):
    username = request.user
    db_signature = User_Info.objects.filter(username=username)[0].signature
    release_all = Positions_info.objects.all()
    release_dict = {}
    for index,content in enumerate(release_all):
        print index
        release_dict[index] = release_all[index]
    return render(request,"student/all_positions.html",{"db_signature": db_signature,"release_dict":release_dict})




def position_info(request):
    username = request.user
    id= "1"
    db_signature = User_Info.objects.filter(username=username)[0].signature
    print db_signature
    info = Positions_info.objects.filter(id=id)[0]
    print type(info)
    return  render(request,"student/positions_info.html",{"db_signature": db_signature,"release_dict":info})

#student信息
def look_self_info(request):
    username = request.user
    db_all_info = User_Info.objects.filter(username=username)[0]
    print db_all_info.birth_date
    return render(request,"student/look_self_info.html",{"db_all_info": db_all_info})

def update_self_info(request):
    username = request.user
    db_signature = User_Info.objects.filter(username=username)[0].signature
    db_all_info = User_Info.objects.filter(username=username)[0]
    return render(request,"student/update_self_info.html",{"db_signature": db_signature,"db_all_info":db_all_info})

def update_self_info_post(request):
    username = request.user
    if request.method =="POST":
        realname = request.POST.get("realname")
        print realname
        gender = request.POST.get("gender")
        age=request.POST.get("age")
        college = request.POST.get("college")
        professional = request.POST.get("professional")
        phone = request.POST.get("phone")
        email = request.POST.get("email")
        parent_phone = request.POST.get("parent_phone")
        birth_date =request.POST.get("birth_date")
        print type(birth_date)
        birth_date_1 = datetime.datetime.strptime(birth_date,"%Y-%m-%d")
        signature = request.POST.get("signature")
        User_Info.objects.filter(username=username).update(realname=realname,gender=gender,age=age,college=college,
                                               professional=professional,phone=phone,email=email,parent_phone=parent_phone,
                                               birth_date=birth_date_1,signature=signature)
        return HttpResponse(json.dumps("修改成功"))

def input_info(request):
    username = request.user
    db_signature = User_Info.objects.filter(username=username)[0].signature
    return render(request,"student/input_info.html",{"db_signature": db_signature})

def input_info_post(request):
    if request.method =="POST":
        realname = request.POST.get("realname")
        username =request.user
        gender = request.POST.get("gender")
        if realname:
            if not gender:
                print "a"
        age=request.POST.get("age")
        college = request.POST.get("college")
        professional = request.POST.get("professional")
        company_name = request.POST.get("company_name")
        company_address = request.POST.get("company_address")
        position = request.POST.get("position")
        company_phone = request.POST.get("company_phone")
        company_header = request.POST.get("company_header")
        company_header_phone = request.POST.get("company_header_phone")
        phone_self = request.POST.get("phone_self")
        email = request.POST.get("email")
        birth_date =request.POST.get("birth_date")
        Student_Employment_Info.objects.create(realname=realname,username=username,gender=gender,age=age,college=college,
                                               professional=professional,company_name=company_name,company_address=company_address,
                                               position=position,company_phone=company_phone,company_header=company_header,
                                               company_header_phone=company_header_phone,phone_self=phone_self,
                                               email=email,birth_date=birth_date)
        return HttpResponse(json.dumps("登记成功"))

def check_info(request):
    username = request.user
    db_signature = User_Info.objects.filter(username=username)[0].signature
    db_info =Student_Employment_Info.objects.filter(username=username)[0]
    return render(request,"student/check_info.html",{"db_signature": db_signature,"user_all":db_info})

#企业
def company_all_positions(request):
    username = request.user
    db_signature = Company_Info.objects.filter(username=username)[0].company_introduction
    release_all = Positions_info.objects.all()
    release_dict = {}
    for index,content in enumerate(release_all):
        print index
        release_dict[index] = release_all[index]
    return render(request,"company/all_positions.html",{"db_signature": db_signature,"release_dict":release_dict})

def company_all_discuss(request):
    username = request.user
    db_user = Company_Info.objects.filter(username=username)
    db_signature = db_user[0].company_introduction
    content_all = People_Discuss.objects.all()
    content_dict = {}
    for index, content in enumerate(content_all):
        content_dict[index] = content_all[index]
    return render(request,"company/ui_discuss_all.html",{ "db_signature": db_signature,"content_dict":content_dict})

def company_myself_discuss(request):
    user = request.user
    username=str(user)
    db_signature = Company_Info.objects.filter(username=username)[0].company_introduction
    content_all = People_Discuss.objects.all()
    user_list_content = []
    user_list_time = []
    for user_content in content_all:
        if user_content.username == username:
            user_list_content.append(user_content.content)
            user_list_time.append(user_content.datetime)
    user_content_dict = {}
    for index, content in enumerate(user_list_content):
        user_content_dict[user_list_time[index]]= user_list_content[index]
    return render(request,"company/ui_discuss_myself.html",{"db_signature": db_signature,"user_content_all":user_content_dict})

def company_published_discusses(request):
    username = request.user
    db_signature = Company_Info.objects.filter(username=username)[0].company_introduction
    return render(request,"company/published_discusses.html",{"db_signature": db_signature})

def company_published_discusses_post(request):
    if request.method == "POST":
        username = request.user
        now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print now_time,type(now_time)
        content = request.POST.get("content")
        People_Discuss.objects.create(username=username,datetime=now_time, content=content)
        return HttpResponse(json.dumps("发表成功"))

def company_look_self_info(request):
    username = request.user
    db_all_info = Company_Info.objects.filter(username=username)[0]
    return render(request,"company/look_self_info.html",{"db_all_info": db_all_info})

def company_update_self_info(request):
    username = request.user
    db_signature = Company_Info.objects.filter(username=username)[0].company_introduction
    db_all_info = Company_Info.objects.filter(username=username)[0]
    return render(request,"company/update_self_info.html",{"db_signature": db_signature,"db_all_info":db_all_info})

def company_update_self_info_post(request):
    if request.method =="POST":
        username = request.user
        company_name = request.POST.get("company_name")
        company_address=request.POST.get("company_address")
        position = request.POST.get("position")
        set_time = request.POST.get("set_time")
        company_introduction = request.POST.get("company_introduction")
        Company_Info.objects.filter(username=username).update(company_name=company_name,company_address=company_address,
                                    position=position,set_time=set_time,company_introduction=company_introduction)
        return HttpResponse(json.dumps("修改成功"))


def company_input_info(request):
    username = request.user
    db_signature = Company_Info.objects.filter(username=username)[0].company_introduction
    return render(request,"company/input_info.html",{"db_signature": db_signature})


def company_input_info_post(request):
    if request.method == "POST":
        username = request.user
        company_name = request.POST.get("company_name")
        company_address = request.POST.get("company_address")
        position = request.POST.get("position")
        set_time = request.POST.get("set_time")
        salary = request.POST.get("salary")
        now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        company_introduction = request.POST.get("company_introduction")
        skills = request.POST.get("skills")
        people_number = request.POST.get("people_number")
        company_email = request.POST.get("company_email")
        content1 = request.POST.get("content1")
        print content1, skills
        Positions_info.objects.create(username=username, company_name=company_name, company_address=company_address,
                                      position=position, set_time=set_time, salary=salary, datetime=now_time,
                                      company_introduction=company_introduction,
                                      skills=skills, people_number=people_number, company_email=company_email,
                                      content=content1)
        return HttpResponse(json.dumps("发布成功"))

def company_position_self(request):
    user = request.user
    username = str(user)
    db_signature = Company_Info.objects.filter(username=user)[0].company_introduction
    release_all = Positions_info.objects.all()
    list_release_user = []
    for info in release_all:
        # print type(info.username)
        if info.username == username:
            list_release_user.append(info)
    return render(request,"company/position_self.html",{"db_signature": db_signature , "list_release_user": list_release_user})

def company_position_info(request):
    username = request.user
    db_signature = Company_Info.objects.filter(username=username)[0].company_introduction
    return  render(request,"company/positions_info.html",{"db_signature": db_signature})


#school

def school_all_discuss(request):
    content_all = People_Discuss.objects.all()
    content_dict = {}
    for index, content in enumerate(content_all):
        content_dict[index] = content_all[index]
    return render(request,"school/ui_discuss_all.html",{"content_dict":content_dict})

def school_myself_discuss(request):
    user = request.user
    username=str(user)
    # print username,type(username)
    # db_signature = School_Info.objects.filter(username=username)[0].signature
    content_all = People_Discuss.objects.all()
    # print type(content_all)
    user_list_content = []
    user_list_time = []
    for user_content in content_all:
        # print user_content.username
        if user_content.username == username:
            user_list_content.append(user_content.content)
            user_list_time.append(user_content.datetime)
    # print user_list_content,user_list_time
    user_content_dict = {}
    for index, content in enumerate(user_list_content):
        user_content_dict[user_list_time[index]]= user_list_content[index]
    # print user_content_dict
    return render(request,"school/ui_discuss_myself.html",{"user_content_all":user_content_dict})

def school_published_discusses(request):
    if request.method == "GET":
        return render(request,"school/published_discusses.html")

def school_published_discusses_post(request):
    if request.method == "POST":
        username = request.user
        now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print now_time,type(now_time)
        content = request.POST.get("content")
        People_Discuss.objects.create(username=username,datetime=now_time, content=content)
        return HttpResponse(json.dumps("发表成功"))

def school_all_positions(request):
    release_all = Positions_info.objects.all()
    release_dict = {}
    for index,content in enumerate(release_all):
        print index
        release_dict[index] = release_all[index]
    return render(request,"school/all_positions.html",{"release_dict":release_dict})

def school_position_info(request):
    return  render(request,"school/positions_info.html")

def school_look_self_info(request):
    username = request.user
    # print username
    db_all_info = School_Info.objects.filter(username=username)[0]
    # print db_all_info
    return render(request,"school/look_self_info.html",{"db_all_info": db_all_info})

def school_update_self_info(request):
    username = request.user
    # db_signature = School_Info.objects.filter(username=username)[0].company_introduction
    db_all_info = School_Info.objects.filter(username=username)[0]
    return render(request,"school/update_self_info.html",{"db_all_info":db_all_info})

def school_update_self_info_post(request):
    if request.method =="POST":
        username = request.user
        school_name = request.POST.get("school_name")
        school_address=request.POST.get("school_address")
        position = request.POST.get("position")
        real_name = request.POST.get("real_name")
        college = request.POST.get("college")
        phone = request.POST.get("phone")
        email = request.POST.get("email")
        School_Info.objects.create(username=username,school_name=school_name,school_address=school_address,
                                    position=position,real_name=real_name,college=college,phone=phone,email=email)
        return HttpResponse(json.dumps("修改成功"))

def school_all_student_info(request):
    release_all = Student_Employment_Info.objects.all()
    release_dict = {}
    for index,content in enumerate(release_all):
        print index
        release_dict[index] = release_all[index]
    return render(request,"school/all_student_info.html",{"release_dict":release_dict})

def school_look_student_info(request):
    release_all = Student_Employment_Info.objects.all()
    release_dict = {}
    for index,content in enumerate(release_all):
        print index
        release_dict[index] = release_all[index]
    return render(request,"school/student_info.html",{"release_dict": release_dict})



# def upload(request):
#     if request.method == 'POST':  # 获取对象
#         obj = request.FILES.get('root')
#         # 获取文件的一个对象
#         path = request.POST['path']
#         # 获取手工输入的路径
#         return render(request, 'student/upload.html', {'path': path})
#     # 把path这个变量，作为参数传递给，upload.html

from app01 import models
import os

def upload(request):
    if request.method == 'GET':
        img_list = models.Img.objects.all()
        print img_list
        return render(request,'/student/upload.html',{'img_list': img_list})
    elif request.method == "POST":
        # user = request.POST.get('user')
        # fafafa = request.POST.get('fafafa')
        obj = request.FILES.get('fafafa')
        # print(obj.name,obj.size)  #读取文件名称和大小，返回后台
        file_path = os.path.join('static',"upload",obj.name)
        print file_path
        f = open(file_path, 'wb')
        for chunk in obj.chunks():
            f.write(chunk)
        f.close()
        models.Img.objects.create(path=file_path)
        ret={'status':True,'path':file_path}
        # return HttpResponse(json.dumps(ret))
        return render(request,"student/upload.html",{"ret":ret})

from django.http import StreamingHttpResponse
def big_file_download(request):

    def file_iterator(file_name, chunk_size=512):
        with open(file_name) as f:
            while True:
                c = f.read(chunk_size)
                if c:
                    yield c
                else:
                    break

    the_file_name = "static/auth_user.sql"
    response = StreamingHttpResponse(file_iterator(the_file_name))
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="{0}"'.format(the_file_name)
    return response