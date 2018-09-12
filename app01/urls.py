#!/usr/bin/env python

from django.conf.urls import include, url

import views
urlpatterns = [
    url(r'^login/$',views.login_1),
    url(r'^login_post/$',views.login_post),
    url(r'^index/$',views.index),
    url(r'^register/$',views.register),
    url(r'^register_school/$',views.school_register_root),
    url(r'^register_school_post_1/$',views.school_register_root_post),
    url(r'^register_school_create/$',views.school_register),
    url(r'^register_company/$',views.company_register),
    url(r'^register_post/$',views.register_post),
    url(r'^register_school_post/$',views.register_school_post),
    url(r'^register_company_post/$',views.register_company_post),
    url(r'^all_discuss/$',views.all_discuss),
    url(r'^myself_discuss/$', views.myself_discuss),
    url(r'^all_positions/$',views.all_positions),
    url(r'^positions_info/$', views.position_info),
    url(r'^published_discusses/$',views.published_discusses),
    url(r'^published_discusses_post/$',views.published_discusses_post),
    url(r'^look_self_info/$',views.look_self_info),
    url(r'^update_self_info/$',views.update_self_info),
    url(r'^update_self_info_post/$',views.update_self_info_post),
    url(r"^input_info/$",views.input_info),
    url(r"^input_info_post/$",views.input_info_post),
    url(r"^check_info/$",views.check_info),

    url(r"^company_all_positions/$",views.company_all_positions),
    url(r"^company_all_discuss/$",views.company_all_discuss),
    url(r"^company_myself_discuss/$",views.company_myself_discuss),
    url(r"^company_published_discusses/$",views.company_published_discusses),
    url(r"^company_published_discusses_post/$",views.company_published_discusses_post),
    url(r"^company_look_self_info/$",views.company_look_self_info),
    url(r"^company_update_self_info/$",views.company_update_self_info),
    url(r"^company_update_self_info_post/$",views.company_update_self_info_post),
    url(r"^company_input_info/$",views.company_input_info),
    url(r"^company_input_info_post/$",views.company_input_info_post),
    url(r"^company_check_info/$",views.company_position_self),
    url(r"^company_position_info/$",views.company_position_info),

    url(r"^school_all_discuss/$",views.school_all_discuss),
    url(r"^school_myself_discuss/$",views.school_myself_discuss),
    url(r"^school_published_discusses/$",views.school_published_discusses),
    url(r"^school_published_discusses_post/$",views.school_published_discusses_post),
    url(r"^school_all_positions/$",views.school_all_positions),
    url(r"^school_position_info/$",views.school_position_info),
    url(r"^school_look_self_info/$",views.school_look_self_info),
    url(r"^school_update_self_info/$",views.school_update_self_info),
    url(r"^school_update_self_info_post/$",views.school_update_self_info_post),
    url(r"^school_check_info/$",views.school_all_student_info),
    url(r"^student_info/$",views.school_look_student_info),


    url(r"^upload/$",views.upload),
    url(r"^download/$",views.big_file_download),

]
