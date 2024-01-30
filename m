Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230F841995
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 03:51:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUeDD-0001Af-QQ;
	Tue, 30 Jan 2024 02:51:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rUeDB-0001AR-Ig
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 02:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y2Skh+gcgmbCaVhQHgESqR6Df05Hu2BJPcHH4GeeNys=; b=UBnFOfF/1jlGHoBmIQn4ECyGAt
 uHR3Yix1y7TAqTuSibnQn6DxRXXoenpuyHygV5p3AZVTQfTU9p8ru53VRixbD3OEv38ETkOnb+qVa
 wmxQuCdEHD6gLToQ00hzNVCCK3/4soR9j5nG1oKidGrqoQWDAvr3WUtOUST41QjmlBGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y2Skh+gcgmbCaVhQHgESqR6Df05Hu2BJPcHH4GeeNys=; b=RK7myBUZ6AwhDo+CeQ+sM1acYk
 eM0BTDSBL9ZQFQUJkrAcnWaiX6WBHbhAhs/laBpK/f2Rm1BRvgTBaggqI7s0YW4Xikd4ZNXr2ZsQQ
 5SVuzvl2ztw49Q0djXV+SPuL/G0OKL1A5o5qH1wFJJjDGLTeszOpzL0n/ZX5+NttCgyQ=;
Received: from mail-sgaapc01on2087.outbound.protection.outlook.com
 ([40.107.215.87] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUeD8-00075N-VF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 02:50:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifwFzZ98JTllEOMGud+LT7A3goxSCZqW+K5ze1ZNnr49Jzb2xzlLi1+97EcGO++4W7wkbofgFeOVQF3LzmZv9i0wjEfc5yDbkmysBr8L6g7WKSDhVkIlbkObX5AQZL2eGeRkhjlRL8gTZ9ovTy+JiNEtWjGqLUrgCwifcJRWBll9dwMLFd2vOJJnXn1QtRahGicgD8Qvrdoz0GR1cyuiq3zwNmRWtk0GHZCfp/hwJBFM4l9khMOjagh2KO78jCx2XB9CWR1Oe5SlxjB+aTD7CK0W/uej3EiESgFG2XlJof7OTVid53/DiOcmVaomvTgr+N0I4jNQSLqYB9lhuU4LGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2Skh+gcgmbCaVhQHgESqR6Df05Hu2BJPcHH4GeeNys=;
 b=Vbl3fezPSZ8QqhCXTGS+4xA3D9EkZX0CUvYOZvJBCBSD2FQGps7Cr7j0YKaJqL9eq8P4KwewB3b+c2AwE2plVBHsvR07sJWQmUva2gcf8FADDgabMc1Z26PWLoSj8UTh5ypAedD+NDcFPmnw2KFd0KRLX/6iBKc+rMqKdm/anlcU3hp80u7Nf7spC4fhlYpjI4FdXZMeP9MerIIqR0InUC/JlHqFkzYlulIkBRNtsAZZd2oyO+wJ0kI798oXHcu6vxMaCuY6SIka4LCU2ki+1cpJ4XByJRCjBZis1S4yxhKTuWd9Mz9+yGoHP0SBay1spnuOm2nd7bllj76+joyz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2Skh+gcgmbCaVhQHgESqR6Df05Hu2BJPcHH4GeeNys=;
 b=PX9wLsmzykmjYxW4fNAiU2JhgqbFIc4pWw9wQAMMZrVjkx7PNMyKlqmAKYiPFxmYcDoCeNqP53UJdowVOdRec9JWZRMO7FHPYKnQVQjtmtduYGrOYxJ3jRYNFinE7Av0X3oEJsZNpxdJJi4SYtPoWKCbN2lhGBxJhtBVtL3d0Zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by TY0PR02MB5921.apcprd02.prod.outlook.com (2603:1096:400:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 02:17:42 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 02:17:41 +0000
Message-ID: <20fdbfaf-aaa3-466e-8797-1927bf0bc804@oppo.com>
Date: Tue, 30 Jan 2024 10:17:36 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <chao@kernel.org>
References: <20240117230032.2312067-1-daeho43@gmail.com>
 <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
 <CACOAw_yjEuGSvo_qyoA13U0HwOr3gOzGtNf2Twhes01SNSGQeg@mail.gmail.com>
 <b18c286a-cc72-439c-b373-98e0d6504618@kernel.org>
 <CACOAw_yqrtEhq4wtJbs7CVn260h7iZyC7koCWH1iMyeQo5140g@mail.gmail.com>
 <e879da72-4c4f-4aed-8081-784f2de5c887@kernel.org>
 <CACOAw_xDDoOQEHOAXkG+8PF8yD0MtUAW4J04tYcPCh3VMp7FGQ@mail.gmail.com>
In-Reply-To: <CACOAw_xDDoOQEHOAXkG+8PF8yD0MtUAW4J04tYcPCh3VMp7FGQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|TY0PR02MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 43630786-c27b-4d3e-316c-08dc2139a2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s3dgoqKbxVXs2DKn89tR6JxtA8j4CH3eP/5gFdkvajnIS+p+mFe00dZEjVFAYw6C247HP4slIju+UrAv2EG6XJK52RAxvmok4i2ZlxwsmXG2MI4yxFw2Q0/afSLJGtAD/ELcrb2GN1O/ttItZz6bF/wVj0soslEAxnRNa03xk0ir4BtJMPkCdnGqpjUEjey3ZgT/y2kdlVedjlkYoJiIBxlI3OsPztOsxHgAQdEAqVk5mIyb+0DgLxzP6Iw1iNJeFJckUlH6kMKevvWC+YdxsrIf/TiZpK5B+BPA/XcsXc4vfaBct8x7+BLHV1+31vktrLt3QgV+A7nslmKWLSxXTBsoJIDcDsVS2gsJj+Ypgqxb5XK32zsZ+eej9dJmMz1cjbBDQ1SfBDpNpDz0Jm0oAV4X6amdqXdmfhid4oDsg9kYbbRgQIqQgCwGEeo+6MalsvknruppMIiSwFW2x1j1pMWBLHqsh3ZSVZ1CkbCfVk4tRyK86RxJFruBt9Kx4L9lwXtEW6GhuocUK6siU7M9aHNywYzXkY6wlMA/K+l3u+Wt5os7ltnwhzz0OkucMiVjSnJswD7YuKWVZPGWQ37r8XXziEYDzJ1b8cK/WlsUw+E5APfFjEjlajRe4RQv8tXZQZ1ZjcORfmOV6t7a+LAjxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(53546011)(26005)(83380400001)(6512007)(6666004)(6506007)(36756003)(86362001)(31696002)(8676002)(41300700001)(5660300002)(4326008)(8936002)(66946007)(38100700002)(66476007)(6486002)(2906002)(66556008)(2616005)(478600001)(316002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1hQc0lET05vWk9HZWhqNEowQnRvNEdvOFhueThWMWVxcDZYRXBEUWE5V2ox?=
 =?utf-8?B?ckdmbDQ3VDFWMmJDSVlEcW4yVmZ3bWRyOXFtZndZNnRwQlZibFN0TVlwQnY0?=
 =?utf-8?B?OUZkTytEVjJCRHRFZ08rT3lYWUlTYUVVZ0VVTlhiZjBSRVlNVUdzeVFiM20z?=
 =?utf-8?B?UzlYZFRTQk5PeUJTK04wUmN1dUJSRGNhRnhZSWxBclUwd3lyS1paYXlwK1pF?=
 =?utf-8?B?dFRrcWdDNitkRHBDYWZwV0tQSFNDRFFmVDl2VjhNSGFUQ2t3N0dQcDI5SGdP?=
 =?utf-8?B?d2RuZUJZckZaVFllckd5c2tReDVYR3JFeHhGT05YNEhnbmNodEZSbWVUQ3I3?=
 =?utf-8?B?TVNSZXZoMXV5QmxmNmVoVS9ubEprWUdCRDVNVXAwWk1Sc3Uwa21oQ0RpNHdO?=
 =?utf-8?B?MlRuSjlIdGNDcElZcytCVjdER1FZenZ1T2xnNU9wQU91VmJtcGkvVzVxcnJC?=
 =?utf-8?B?SjVtMWN5UlJvSU0xM1ZYdnRCNlh0c0ZXb3UxOUt2Yk5SM0hMYmhkSlVCR2l6?=
 =?utf-8?B?UXFUQml1bHM2R2RWanFIa0U2SFJncThqUVFkcCswTzV3SXBJUFBlS21iK3Fq?=
 =?utf-8?B?VEt4N3JnWldpVnZYYzJCcUc1ZDluZXVwaTlqYk8wdkpINE5sLzUrejg2a3Fr?=
 =?utf-8?B?bGRoell6S00ycm9GYi95WWdxMFgrR3NaYWV5RnI5dktpMXE1TFBCY1hSMW9i?=
 =?utf-8?B?OEtVa3lFNE1xdDJ5ZWNSUDc0bjBVU3J6ckxzWTl6VldJclh4RlN6bVBIWlNM?=
 =?utf-8?B?WjFsUDc1SDlqNnhEQXJGd1FCQlhEbUdRREJ1a1Y4STBhN2VyVXNQK3hHNjJr?=
 =?utf-8?B?b3k1S0xrM3poNmc0V3VTbHRtZU9kMS8yaCtwOXFKK3FmK3ZoMUZSQkU0MXE3?=
 =?utf-8?B?d0Z2T2JLVWNyMUtnTFl0UTFEQUhkbHZCR1RGeVZMUDdsdUwxM2FkUnh0ZFNM?=
 =?utf-8?B?NlFkS2NYODNiNVQ2QWk1TFRiVkdTNCs1OWJOUTU5Unh6WW13YWM5dUk5Qmhn?=
 =?utf-8?B?cnhuS0ZHMWEyVm0rVUd6TXZ6UGp4WnhOT3lEZFdoak9jSTRVbWYrWG9rNVdF?=
 =?utf-8?B?RHpYbzEwRzZoYWVsUG0zdjlLbWxHdDdtV3dYTWlwakd5Tk1vMFVQUHNXcnpU?=
 =?utf-8?B?RFU1UjVaOU9NK1YxU0VmNjdBaFpib0J1N2tDSjZHY0dqcmx1L2JsYXVjM1lB?=
 =?utf-8?B?R0FCRHV3MFEyeThNYzl1b3hKUXhGZnBSK0QwRjZ3R0Q4WWpTb0JmWCtrNUNQ?=
 =?utf-8?B?NUFvbjlrekowZDlKWlVmTC9QZlJFQlR1S1M3bWswWlJ5R2VITGdqOWNXdnha?=
 =?utf-8?B?WjdDVmZWbTI0MWJxV0k2dkhoeWVma1lCZlFRNTFTdDhha1pydHovU3g3OXBn?=
 =?utf-8?B?WG43eTlxbjNXRjNjWmJVZmU5MjFzWStDVWpzQ3hXdTNPdmNuMTR6eTUyYm0y?=
 =?utf-8?B?SG1xY3BrRDlEbXk3MTQwNFNTR0V0bFA5VHJCSDhsbmEzcUhZdG5lZmdTVmF4?=
 =?utf-8?B?eTZWWEx1TVhOcDVTZXp5Zlozb0pFS0ZNZzg1bENsSEYwNjh6SWw2Qk8vSzB2?=
 =?utf-8?B?RlV6Y2syQkZDcUhFRW5UY2grVDVKaFFuUDdEOTZqSFBrZGJiYzFBZk5sR1Ra?=
 =?utf-8?B?WlZ0aVFkS1I3emJndEpWZ1FGbEdwREduYnovc3k5TTl5ZWJNR1ZkSkU2Z0xY?=
 =?utf-8?B?MUtCMUhORUNWcG9FUEo3WTBzdkt6MGhtMjFTM2tWOU5KYW0xaUZMdXRnQlAv?=
 =?utf-8?B?TUhRdVRFYTFnb3FJNTU1Z2JwRzUzL00zWWJwamdqdlRuZVFnOXlvcTRBeWRC?=
 =?utf-8?B?c3h0ZTBSS3VJemJhNW1FNzBUdzc0bmZlWG5UKzFPbTF4TS8vTDJlOEtaVUt6?=
 =?utf-8?B?TkRDWmhGZVhKYld1dUZuSmpWc0NpWk16cnF2RGRTeGxQclg5UkR6aklQcXY1?=
 =?utf-8?B?ekNUN1Y1c0llV2ZIMmRUeDY4YnNscWRWSVRNSERZclY3VjAzcHNCam1wQWZY?=
 =?utf-8?B?SUtJWG90UVliTTNLOTVLeXUySjNGMnlXcVpKZWdNM2RKNWVtQit5SkNROWRq?=
 =?utf-8?B?U3NYZGdldDdBQ3UzcGdrK1hrbEVPa1hZUmRoSmIyUTc0YzkzK2lEK1pWK2JZ?=
 =?utf-8?B?RThkcGpjNkMwS3dVaGFBR1lETldKUFd2eHhaUjgxUkJKZ3djcHlqczFGeEU0?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43630786-c27b-4d3e-316c-08dc2139a2cf
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 02:17:41.0456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmPpquYoTcnxSl74JONgZAA5XS3jXSkEHjFo0uBayYzbP2Dj5UcOqh4tEwrZfzFbKYEMVqulKXhin4dV7wKMrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5921
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  cur_seg[CURSEG_COLD_DATA] will exceed end boundary of main
 area when: device[1]: zone device size = [2 MB ~ 10MB] So, if there are not
 enough seq zones for six cursegs,
 we should still assign 0 to c.cur_seg[CURSEG_HOT_NODE]
 or reserve several conv zones for cursegs. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.87 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.87 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUeD8-00075N-VF
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Y3VyX3NlZ1tDVVJTRUdfQ09MRF9EQVRBXSB3aWxsIGV4Y2VlZCBlbmQgYm91bmRhcnkgb2YgbWFp
biBhcmVhIHdoZW46CmRldmljZVsxXTogem9uZSBkZXZpY2Ugc2l6ZSA9IFsyIE1CIH4gMTBNQl0K
ClNvLCBpZiB0aGVyZSBhcmUgbm90IGVub3VnaCBzZXEgem9uZXMgZm9yIHNpeCBjdXJzZWdzLCB3
ZSBzaG91bGQgc3RpbGwgCmFzc2lnbiAwIHRvIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIG9y
IHJlc2VydmUgc2V2ZXJhbCBjb252IHpvbmVzIGZvciAKY3Vyc2Vncy4KCk9uIDEvMjkvMjAyNCAx
MTo0NyBQTSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gU3VuLCBKYW4gMjgsIDIwMjQgYXQgNToy
N+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjQvMS8y
NyAyOjE3LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDI1LCAyMDI0IGF0IDU6
MjfigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjAy
NC8xLzI2IDA6MjUsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEphbiAyNCwgMjAy
NCBhdCA3OjM04oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+Cj4+
Pj4+PiArQ2MgWW9uZ3BlbmcgWWFuZwo+Pj4+Pj4KPj4+Pj4+IERhZWhvLAo+Pj4+Pj4KPj4+Pj4+
IFlvbmdwZW5nIHJlcG9ydHMgYSBwb3RlbnRpYWwgaXNzdWU6IGlmIGMuZGV2aWNlc1swXS50b3Rh
bF9zZWdtZW50cyBpcwo+Pj4+Pj4gbGFyZ2VyIHRoYW4gc2VnbWVudHMgb2YgbWFpbmFyZWEsIGMu
Y3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIHdpbGwgZXhjZWVkCj4+Pj4+PiBlbmQgYm91bmRhcnkg
b2YgbWFpbmFyZWEuIENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgdGhhdD8gdGhvdWdoIGl0J3MgYSBj
b3JuZXIKPj4+Pj4+IGNhc2UuCj4+Pj4+Cj4+Pj4+IENhbiB5b3UgZWxhYm9yYXRlIG1vcmU/Cj4+
Pj4KPj4+PiBTaW5jZSBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RFXSBpcyBhbiBvZmZzZXQgc3Rh
cnRlZCBmcm9tIG1haW5fYmxrYWRkci4KPj4+Cj4+PiBPaCwgR290IGl0Lgo+Pj4gVGhlbiwgaG93
IGFib3V0IHRoaXM/Cj4+Pgo+Pj4gICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hPVF9OT0RF
XSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSA/Cj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoYy5kZXZpY2VzWzFdLnN0YXJ0X2Jsa2FkZHIgLQo+Pj4gZ2V0X3NiKG1haW5f
YmxrYWRkcikpIC8gYy5ibGtzX3Blcl9zZWcgOiAwOwo+Pgo+PiBCZXR0ZXIsIGJ1dCBsb2cgaGVh
ZGVyIHNob3VsZCBhbGlnbiB0byBzdGFydCBibGthZGRyIG9mIHpvbmU/Cj4gCj4gSXQncyBhbHJl
YWR5IGFsaWduZWQgaGVyZS4KPiAKPiAgICAgICAgICBpZiAoYy56b25lZF9tb2RlICYmIGMubmRl
dnMgPiAxKQo+ICAgICAgICAgICAgICAgICAgem9uZV9hbGlnbl9zdGFydF9vZmZzZXQgKz0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgKGMuZGV2aWNlc1swXS50b3RhbF9zZWN0b3JzICogYy5z
ZWN0b3Jfc2l6ZSkgJQo+IHpvbmVfc2l6ZV9ieXRlczsKPiAKPiAuLi4KPiAKPiAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgYy5uZGV2czsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgICBpZiAoaSA9
PSAwKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGMuZGV2aWNlc1tpXS50b3RhbF9zZWdt
ZW50cyA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGMuZGV2aWNlc1tpXS50
b3RhbF9zZWN0b3JzICoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLnNlY3Rv
cl9zaXplIC0gem9uZV9hbGlnbl9zdGFydF9vZmZzZXQpIC8KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzZWdtZW50X3NpemVfYnl0ZXM7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGMuZGV2aWNlc1tpXS5zdGFydF9ibGthZGRyID0gMDsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgYy5kZXZpY2VzW2ldLmVuZF9ibGthZGRyID0gYy5kZXZpY2VzW2ldLnRvdGFsX3NlZ21l
bnRzICoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Yy5ibGtzX3Blcl9zZWcgLSAxICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2ItPnNlZ21lbnQwX2Jsa2FkZHI7Cj4gICAgICAgICAgICAgICAgICB9
IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbaV0udG90YWxfc2Vn
bWVudHMgPQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMuZGV2aWNlc1tpXS50
b3RhbF9zZWN0b3JzIC8KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoYy5zZWN0
b3JzX3Blcl9ibGsgKiBjLmJsa3NfcGVyX3NlZyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGMuZGV2aWNlc1tpXS5zdGFydF9ibGthZGRyID0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMuZGV2aWNlc1tpIC0gMV0uZW5kX2Jsa2FkZHIgKyAxOwo+IAo+IC4u
Lgo+IAo+ICAgICAgICAgIHRvdGFsX21ldGFfem9uZXMgPSBaT05FX0FMSUdOKHRvdGFsX21ldGFf
c2VnbWVudHMgKgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjLmJsa3NfcGVyX3NlZyk7Cj4gCj4gICAgICAgICAgc2V0X3NiKG1haW5fYmxrYWRkciwg
Z2V0X3NiKHNlZ21lbnQwX2Jsa2FkZHIpICsgdG90YWxfbWV0YV96b25lcyAqCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYy5zZWdzX3Blcl96b25lICogYy5ibGtzX3Blcl9zZWcp
Owo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4+IElmIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05P
REVdIHdhcyBhc3NpZ25lZCB3LyBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMsCj4+Pj4gYW5k
IGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cyBpcyBsYXJnZXIgdGhhbiBzZWdtZW50cyBvZiBt
YWluYXJlLAo+Pj4+IGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIHdpbGwgZXhjZWVkIHRoZSBl
bmQgYm91bmRhcnkgb2YgbWFpbmFyZWEuCj4+Pj4KPj4+PiAgICAgICAgICAgYy5jdXJfc2VnW0NV
UlNFR19IT1RfTk9ERV0gPSBjLnpvbmVkX21vZGVsID09IEYyRlNfWk9ORURfSE0gPwo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYy5kZXZpY2VzWzBdLnRvdGFsX3NlZ21lbnRzIDogMDsK
Pj4+Pgo+Pj4+PiBJbiB0aGUgY2FzZSBvZiBGMkZTX1pPTkVEX0hNLCB3ZSBoYXZlIHRoZSBkZXZp
Y2VzWzFdLgo+Pj4+PiBEbyB5b3UgbWVhbiB0aGUgY2FzZSB3ZSBmb3JtYXQgdGhlIGZpbGVzeXN0
ZW0gaW50ZW50aW9uYWxseSBzbWFsbGVyCj4+Pj4+IHRoYW4gd2hhdCBkZXZpY2VzIGhhdmU/Cj4+
Pj4KPj4+PiBJIG1lYW4gYmxldyBjYXNlOgo+Pj4+IGRldmljZVswXTogY29udmVudGlvbmFsIGRl
dmljZSBzaXplID0gMTAyNDAgTUIKPj4+PiBkZXZpY2VbMV06IHpvbmUgZGV2aWNlIHNpemUgPSAy
IE1CCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAyMDI0LzEv
MTggNzowMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRh
ZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+IE1ha2UgdG8gYWxsb2NhdGUgbG9n
cyBhZnRlciBjb252ZW50aW9uYWwgYXJlYSBmb3IgSE0gem9uZWQgZGV2aWNlcyB0bwo+Pj4+Pj4+
IHNwYXJlIHRoZW0gZm9yIGZpbGUgcGlubmluZyBzdXBwb3J0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+PiAt
LS0KPj4+Pj4+PiAgICAgIG1rZnMvZjJmc19mb3JtYXQuYyB8IDMgKystCj4+Pj4+Pj4gICAgICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pj4KPj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1hdC5jIGIvbWtmcy9mMmZzX2Zvcm1hdC5j
Cj4+Pj4+Pj4gaW5kZXggZjI4NDBjOC4uOTFhN2Y0YiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9ta2Zz
L2YyZnNfZm9ybWF0LmMKPj4+Pj4+PiArKysgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPj4+Pj4+PiBA
QCAtNTU3LDcgKzU1Nyw4IEBAIHN0YXRpYyBpbnQgZjJmc19wcmVwYXJlX3N1cGVyX2Jsb2NrKHZv
aWQpCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0NPTERfREFUQV0g
PSAwOwo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19XQVJNX0RBVEFd
ID0gbmV4dF96b25lKENVUlNFR19DT0xEX0RBVEEpOwo+Pj4+Pj4+ICAgICAgICAgIH0gZWxzZSBp
ZiAoYy56b25lZF9tb2RlKSB7Cj4+Pj4+Pj4gLSAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VH
X0hPVF9OT0RFXSA9IDA7Cj4+Pj4+Pj4gKyAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hP
VF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSA/Cj4+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cyA6IDA7Cj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX1dBUk1fTk9ERV0gPSBuZXh0X3pvbmUo
Q1VSU0VHX0hPVF9OT0RFKTsKPj4+Pj4+PiAgICAgICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJT
RUdfQ09MRF9OT0RFXSA9IG5leHRfem9uZShDVVJTRUdfV0FSTV9OT0RFKTsKPj4+Pj4+PiAgICAg
ICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX0RBVEFdID0gbmV4dF96b25lKENVUlNF
R19DT0xEX05PREUpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
