#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import tornado
import tornado.locale
import markdown
import os
import boto3 
import botocore

from handlers.base import BaseHandler
from boto3 import Session

# AWS S3 Configuration
BUCKET_NAME = 'chec-static'
session = Session()
credentials = session.get_credentials()
current_credentials = credentials.get_frozen_credentials()
s3 = boto3.resource('s3')
s3c = boto3.client('s3',aws_access_key_id=current_credentials.access_key,aws_secret_access_key=current_credentials.secret_key,aws_session_token=current_credentials.token)

class HomeHandler(BaseHandler):
    def get(self):
        BaseHandler.initialize(self)
        self.title = "CHEC"
        self.render("home/home.html", title = self.title)

class MembersHandler(BaseHandler):
    def get(self):
        self.title = "Members"

        # AWS S3 access bucket
        myBucket = s3.Bucket(BUCKET_NAME)
        config = s3c._client_config
        config.signature_version = botocore.UNSIGNED
        allAvatarURL={}

        # OLD CODE
        # MemberURL = os.path.join(os.path.dirname('./..'), "static/members/")

        memberList = {

            "Professor": {
                "Xiangshi Ren":{"link": "http://xiangshiren.com"},
                "Kiyoshi Nakahara":{},
                "Kaechang Park":{},
            },

            "Associate Professor": {
                "Yukinobu Hoshino":{},
                "Kazunori Ueda":{},
                "Toru Kurihara":{},
            },
            
            "Visiting Researcher": {
                "Kavous Salehzadeh Niksirat": {"link": "http://member.acm.org/~kavous"},
                "Silpasuwanchai Chaklam": {},
                "Kibum Kim": {},
            },

            "Assistant Professor": {
                "Zhenxin Wang": {},
                "Sayan Sarcar": {}, 
                "William Delamare": {}, 
            },

            "Secretary": {
                "Kyoko Hatakenaka": {},
            },

            "Ph.D. Student": {
                "Xinhui Jiang": {}, 
                "Yang Li": {}, 
                "Chen Wang": {},
            },

            "Master Student": {
                "Jingxin Liu": {}, 
                "Ayumu Ono": {}, 
                "Fitra Rahmamuliani": {}, 
                "Xiaoxuan Li": {}, 
                "Yilin Zheng": {}, 
                "Chunyuan Lan": {}, 
                "Xinpeng Li": {}, 
                "Xi Chen": {}, 
                "Sai Jiang": {}, 
                "Hongyun Lyu": {}, 
                "Jian Zhang": {}, 
                "Zhihang Guo": {}, 
                "Yanyin Zhou": {},
            },

            "Bachelor Student": {
                "Kouya Ono": {}, 
                "Kyoichirou Yonezawa": {}, 
                "Mikina Nambu": {}, 
                "Naoki Higashi": {}, 
                "Seira Itou": {}, 
                "Akinori Kondo": {}, 
                "Hijiri Kaneko": {}, 
                "Ryota Torii": {}, 
                "Takaaki Kubo": {}, 
                "Yusuke Tokito": {}, 
                "Saki Hiramatsu": {}, 
                "Jiayuan Geng": {},
            },
        }

        alumniList = {
            "PostDocs": {
                "William Delamare":{"years": '2017 ~ 2019', "job": 'Associate Professor', "affiliation": 'ESTIA, France', "link": "http://member.acm.org/~william.delamare", "avatar": 1},
                "Sayan Sarcar":{"years": '2015 ~ 2018', "job": 'Assistant Professor', "affiliation": 'Tsukuba University, Japan', "avatar": 1},
                "Silpasuwanchai Chaklam":{"years": '2015 ~ 2017', "job": 'Assistant Professor', "affiliation": 'Asian Institute of Technology, Thailand', "avatar": 1},
                "Zhenxin Wang":{"years": '2015 ~ 2018', "job": 'Chief Technology Officer', "affiliation": 'Changchun Hongda Information Technology Co., Ltd., China', "avatar": 1},
                "Kibum Kim":{"years": '2012 ~ 2014', "job": 'Associate Professor', "affiliation": 'Hanyang University, South Korea', "avatar": 1},

            },
            
            "Ph.d. Students": {
                "Kavous Salehzadeh Niksirat": {"years": '', "job": 'Postdoctoral Fellow', "affiliation": 'École Polytechnique Fédérale de Lausanne EPFL, Switzerland', "avatar": 1},
                "Qinglong Wang": {"years": '', "job": 'Postdoc', "affiliation": 'Jilin University, China', "avatar": 1},
                "Handityo Aulia Putra": {"years": '', "job": 'Assistant Professor', "affiliation": 'Keimyung University, Daegu, Korea', "avatar": 1},
                "Nem Khan Dim":{"years": '', "job": 'Assistant Professor', "affiliation": 'Yangon University, Myanmar', "avatar": 1},
                "Mahmoud Mohamed H. Ahmed": {"years": '', "job": 'Assistant Professor', "affiliation": 'South Valley University, Egypt', "avatar": 1},
                "Huawei Tu": {"years": '', "job": 'Assistant Professor', "affiliation": 'La Trobe University, Australia', "avatar": 1},
                "Minghui Sun": {"years": '', "job": 'Assistant Professor', "affiliation": 'Kunming University of Sci. and Tech., China', "avatar": 1},
                "Feng Wang": {"years": '', "job": 'Prof. & Vice dean', "affiliation": 'Yangon University, Myanmar', "avatar": 1},
                "Yizhong Xin": {"years": '', "job": 'Professor', "affiliation": 'Shenyang University of Technology, China', "avatar": 1},
                "Chuanyi Liu": {"years": '', "job": 'Associate Professor', "affiliation": 'Lanzhou University, China', "avatar": 1},
                "Xiaolei Zhou": {"years": '', "job": 'Assistant Professor', "affiliation": 'Capital University of Economics and Business, China', "avatar": 1},
                "Xinyong Zhang": {"years": '', "job": 'Associate Professor', "affiliation": 'Renmin University of China, China', "avatar": 1},
                "Jibin Yin": {"years": '', "job": 'Associate Professor', "affiliation": 'Kunming University of Sci. and Tech., China', "avatar": 1},
                "Jing Kong": {"years": '', "job": 'Research fellow', "affiliation": 'Nagoya University, Japan', "avatar": 1},
                
            }

        }

        allAvatarURL["members/Handityo Aulia Putra/avatar.png"] = "https://media.licdn.com/dms/image/C5103AQEYVvXfbkE6Mw/profile-displayphoto-shrink_800_800/0?e=1545868800&v=beta&t=nP2BNCn54128cMsdb7p0W3KP4V7Po8f50k6-6w8qpCw"
        allAvatarURL["members/Mahmoud Mohamed Hussein Ahmed/avatar.png"]= "https://i1.rgstatic.net/ii/profile.image/283545642782721-1444613957285_Q128/Mahmoud_Hussien7.jpg"
        customLinkDict = {}
        MemberURL=""
        for file in myBucket.objects.filter(Prefix="members/", Delimiter = '\\'):
            params = {'Bucket': BUCKET_NAME, 'Key': file.key}
            url = s3c.generate_presigned_url('get_object', params)
            # get avatar public url
            allAvatarURL[file.key] = url
            file_key = file.key
            # print(allAvatarURL[file.key])
            if 'member' in file_key.split('/')[0]:
                MemberURL=file_key.split('/')[0]
            # get custom link content
            if 'custom.link' in file_key:
                dir = os.path.dirname(file_key)
                # create directory if it does not exist
                if not os.path.exists(dir):
                    os.makedirs(dir)
                s3.Bucket(BUCKET_NAME).download_file(file_key, file_key)
                with open(file_key) as f:
                    customLinkDict[file_key.split('/')[1]] = f.read()
        # OLD CODE
        # for x in os.listdir(MemberURL):
        #     if os.path.isfile(MemberURL + x + '/custom.link'):
        #         with open(MemberURL + x + '/custom.link') as f:
        #             customLinkDict[x] = f.read()
        # print(customLinkDict)
        # self.render("home/members.html", title = self.title, memberList = memberList, MemberURL = MemberURL, customLinkDict = customLinkDict)

        self.render("home/members.html", title = self.title, memberList = memberList, alumniList = alumniList, MemberURL = MemberURL, allAvatarURL=allAvatarURL, customLinkDict = customLinkDict)