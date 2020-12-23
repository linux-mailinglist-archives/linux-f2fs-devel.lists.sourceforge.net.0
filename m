Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E852E182A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Dec 2020 05:42:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krvyy-0001MR-4r; Wed, 23 Dec 2020 04:42:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1krvyw-0001MK-ON
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 04:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2yNjh5+p+LSM/vbdA8ZfZKiPRpo2hoSeq8EKmol815g=; b=elGQhDCCLalD86OLeCP1N2Ylki
 Cz02JoCUnHWRampDIkrDJgXfdFSzqgv/NyBiLLITbmbnZCZZB+BAq4GCI+GilaSb1Va6ARi+osfNU
 yHfTmqPUYCxzsFRucOSM1CxErVfLENO8YcC9jSuHZv3syLhmCJJsyiybJUhz8M97x9sg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:
 Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2yNjh5+p+LSM/vbdA8ZfZKiPRpo2hoSeq8EKmol815g=; b=dY9XonSaqL8rZha9nSCUpD6YT7
 DV0vnUcLwyBFYYDb1/SvX82YqlxEj//kbZdLn1EmIP5R+Fa9g9E6SW+YDaNLEZc1jn94Js2jiJgd7
 Dh4ZvKApWdqyvcKoNZB2+Qfa80QIuVUHBxAr8j5npSzX9N9mbc2huhOcmRx+wM4tJ7+I=;
Received: from mail-eopbgr1310084.outbound.protection.outlook.com
 ([40.107.131.84] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krvyr-005jD0-B4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 04:42:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYX1Y1qS3VOVORZCwii4drA9NZ4DbK0PF/bMoBn80CsnArSQ0GIjDuHmIoxnd3VPYoXsOy4C+c6GowYCIax4kwiF6KQCFn1VnoAWRRNMTkzcUG8+gCNk5/BQXyPEX2Cev/jErHUTjTIAmHHsv8HHeVZi6l6F6+EShpvsCkVTxoxxkI7Biyqmdb+tmP/r8DB0wM7eiBSmYQjk6EAZM0R3uTLPhr471C2N9fCeKidA01upSf2cUBIwuh8othxbKbc/HCR9f7HGY7mBZmlZMaQWZSnG+KD7vqNrhOgIijGBA8cMTWaaFDyo382Bf1Q9pnDA4xDqpxN7qm0IQpN7SWoJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNMd9fQ6cpAirRJn9kFk9TGGRu5NjPuzg2SZN1IkRIM=;
 b=MH5w41yS/V0hxLAql6K2F455uHvdpGet7OiCyw/42cvbi8LVaoYn6/gLYVorgWW1tmnZjffSENSjRFr5z5QXZp2ecfQUCnSR7JSFL+GK7SAaD0Rh1zi28UMwjXCv7sajH5uModLOG7p/C3guWjRngx+YqoKsoqWua/rwzLP12JYgg+/fe+rKEzmCY5oU/nGN65OSMoevG/oU690jwsUxX8QA+sjtIYi6mNVug26s7j970Tf9AZBj5px44/g+NvUILdxMc36M9JmvwFFvBL201vyHrD2iyhHSaW1QoMCMiG40tSFNKgSpS8BycNDEdZDJK1HUWGjfOQZAsWhhWTLL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oppoglobal.onmicrosoft.com; s=selector1-oppoglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNMd9fQ6cpAirRJn9kFk9TGGRu5NjPuzg2SZN1IkRIM=;
 b=u7kpUSD8z6MyvpLIv7DZSbN24wVSquX40AobTbFBEdIxNwbblVtjLJLUCHQPfOrVdTHVFcrgO2ndiDhP2Z1q4i1+9QpwfWj8GI8O4Bkes/4KojwjWKpLfqclVkWxAPmpnLzAv+KJ+WS4bof3nMZRFUS2JUsQjipsePDU+8lg8uE=
Authentication-Results: lists.sourceforge.net; dkim=none (message not signed)
 header.d=none; lists.sourceforge.net;
 dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK0PR02MB2450.apcprd02.prod.outlook.com (2603:1096:203:21::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Wed, 23 Dec
 2020 04:42:21 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691%3]) with mapi id 15.20.3676.034; Wed, 23 Dec 2020
 04:42:21 +0000
From: Weichao Guo <guoweichao@oppo.com>
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
 <c537b5d4-5e1a-956f-bc46-f8b608468984@oppo.com>
 <41642a06-f629-bf5e-96b4-412473447c31@huawei.com>
 <a2a4ab3b-e5a1-0b55-e094-06508c1f2a01@oppo.com>
 <16f46413-0c94-12d4-09bb-dcc26a670a7d@huawei.com>
 <8ca717f8-f787-c34a-4b4e-7f97b5e4d87c@oppo.com>
Message-ID: <bfcaa13d-ed39-3c53-6913-83f43cd60b25@oppo.com>
Date: Wed, 23 Dec 2020 12:42:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <8ca717f8-f787-c34a-4b4e-7f97b5e4d87c@oppo.com>
X-Originating-IP: [58.255.79.100]
X-ClientProxiedBy: HK2P15301CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::19) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.102.228.252] (58.255.79.100) by
 HK2P15301CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.8 via Frontend Transport; Wed, 23 Dec 2020 04:42:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c8b9e2a-a709-43eb-ed8a-08d8a6fd231f
X-MS-TrafficTypeDiagnostic: HK0PR02MB2450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR02MB2450A571F37EB0329BD472F8B6DE0@HK0PR02MB2450.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reCPt/1PfLMmPg5cKSIbJL2PFB2nVpmwvX2yPwM82YKB5w+NzS8fniEYEhAoHSFj3fvr5CmnS7huRRllavMDwnQ2Q5mtL6X8nlkZfO3AyikRIpW0u7BcnSIKR1GlmsBpvoSsLA6G/47025ej4+1zd1tbulgRg/eCHAMKhob0fjzrtreenQXX3v53l4J1789y2BDrR8daAs4Jpn+7cFN/9bKv71q8IIJ8MucHrzKTBUMPD+LDuMAm7RBR1rrSr3TYNLzfbrdEp42cvSig0hQ4z8rQ5kJBCZCSKDd5HytNA95Mdy7oRqQ42HzRPgtj/xJAKT0Ej2YeT0hjAXhQ56CWB/9ygv7Kl5geGaCfOCCO62jKODu5YCbPeB4Sms+eWZYXo+0Ro/4z/Hh/BDTgUOmK21Mzo240HC77ZOMYsEDzoJ1fQFZJgQmGnSClGVG1MszVNvfX1TerX4uy9Oq8A0GgbN0csjW0cw9qzy4vxeDDIct+GW1tkx/punHuXMjIA8Hc6hx8TuU9lZdZIyUjbFFZ+F2S8nXWFNG7OaiPMpjonnT12TdsNxwBfvUsRAKLSMDOtRqCXgAhA/jC63s9uwehRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(16576012)(316002)(31696002)(966005)(956004)(66476007)(36756003)(5660300002)(66556008)(66946007)(83380400001)(8936002)(2906002)(16526019)(4326008)(8676002)(86362001)(26005)(2616005)(52116002)(53546011)(31686004)(6486002)(186003)(478600001)(11606006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?pPRBgGcE3nLz5Cu89r7tbKNWbkT9nFbbiiyQPpYgRHzQxQHL9xTHnZ+T?=
 =?Windows-1252?Q?5qxbS7SNALC7KzXExi05eR3aGX1C/X8fwziap/SRA6HnUXSvEYeMNdOf?=
 =?Windows-1252?Q?jgez7NXzz43sn8KP5sullECmGnxYRK7xQ1f86Mqla9sDg+CoraMte0Lx?=
 =?Windows-1252?Q?nwinL5LeeXEnKQeoqgPjqwPm25zThmW8layV4fopIOjve6orJPyMwStf?=
 =?Windows-1252?Q?k91P65nvq6DyaweHE+RuhtJzEBlaeL0t0wYP5kxib+CJzCWvGkESo5/R?=
 =?Windows-1252?Q?0Is1sEz5Q+2GbEdt/GAF3CQi6Md6v726WMgYJ3uMNSElpSLupVbj/1dW?=
 =?Windows-1252?Q?37wvZy4AdRrsIy8WBFYwACjIjPdacD6Ei61Dyv/QAZdv4iLciKMfU/aS?=
 =?Windows-1252?Q?raUyyWv37LvcFbRDcNXLkH9OpOObkTNDo7e9JJLhg/+uqDYJHrXMMX7V?=
 =?Windows-1252?Q?TkIVXRIPiPSbYEagi7t5XVTD95Znt9yc5g3Vhg3+rB722Bx+ouggDmDy?=
 =?Windows-1252?Q?IrhyWmNvIJ8ITbT9oUE/QW9RogFS2AeyOSYh0pc3du8Bqv0F2jJ32HUl?=
 =?Windows-1252?Q?AYlzZiof8jGfoCbL8eIJTcuQlQNiY5YXFTOvbGdTDDvKcFuna4IrVKw5?=
 =?Windows-1252?Q?ulOsUls5u7i5BubIsjYNELAEC/TV2SAu5VKAk/+fy1nar/932jsUlVh0?=
 =?Windows-1252?Q?hnbfFwhylE9+FhuxjS8ANkbeaCrDu2zrSlTEjmqXLze8FR/WVDXcf5Sq?=
 =?Windows-1252?Q?ohhT0tdXOSaA/7r1wImK8HUm3B4Rd5tT/YCvVtT8mCuCITJPBn2IqpqA?=
 =?Windows-1252?Q?1ofE++BjRy1CPL04UazoBCGCrL5IrR7wGUdRlo2+2TCcPGtiNA3qlSDb?=
 =?Windows-1252?Q?YQwdEiE0ilKrHJrF4fVpXh5JoCiOyzvcbMiWsx7l1ILV27JFTh1xHs8n?=
 =?Windows-1252?Q?8d5lsKfmxPm+dQFnM8ITk6Bh44xdKvwkKBhdUAyvOGDkEf4tAlk+/0xE?=
 =?Windows-1252?Q?wM+APdnAWCY+j282W/Fmp0WEuJShHqbLkzCPq6j7fWXLFE0pb0KwG/8Y?=
 =?Windows-1252?Q?vYQFEmBeURC0W+nM?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 04:42:21.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8b9e2a-a709-43eb-ed8a-08d8a6fd231f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ketu4KQjJ2pFRQaly2B3EYOO6qDDWERInVJ3/LMttqyu8FmTSibFk0xOmeYlCKzegg5iZkoiAy3V5oYW0z5q4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2450
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.84 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krvyr-005jD0-B4
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set inode->i_mode correctly for
 posix_acl_update_mode
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
Cc: fh@oppo.com, Bin Shu <shubin@oppo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2020/12/23 12:38, Weichao Guo wrote:
>
> On 2020/12/23 9:14, Chao Yu wrote:
>> On 2020/12/22 20:14, Weichao Guo wrote:
>>>
>>> On 2020/12/22 18:49, Chao Yu wrote:
>>>> On 2020/12/22 17:32, Weichao Guo wrote:
>>>>>
>>>>> On 2020/12/22 16:24, Chao Yu wrote:
>>>>>> On 2020/12/14 11:54, Weichao Guo wrote:
>>>>>>> We should update the ~S_IRWXUGO part of inode->i_mode in
>>>>>>> __setattr_copy,
>>>>>>> because posix_acl_update_mode updates mode based on inode->i_mode,
>>>>>>> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old
>>>>>>> i_mode.
>>>>>>>
>>>>>>> Testcase to reproduce this bug:
>>>>>>> 0. adduser abc
>>>>>>> 1. mkfs.f2fs /dev/sdd
>>>>>>> 2. mount -t f2fs /dev/sdd /mnt/f2fs
>>>>>>> 3. mkdir /mnt/f2fs/test
>>>>>>> 4. setfacl -m u:abc:r /mnt/f2fs/test
>>>>>>> 5. chmod +s /mnt/f2fs/test
>>>>>>>
>>>>>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>>>>>> Signed-off-by: Bin Shu <shubin@oppo.com>
>>>>>>> ---
>>>>>>> =A0=A0=A0 fs/f2fs/file.c | 1 +
>>>>>>> =A0=A0=A0 1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>>> index 16ea10f..4d355f9 100644
>>>>>>> --- a/fs/f2fs/file.c
>>>>>>> +++ b/fs/f2fs/file.c
>>>>>>> @@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode,
>>>>>>> const struct iattr *attr)
>>>>>>> =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!in_group_p(inode->i_gid)=
 && =

>>>>>>> !capable(CAP_FSETID))
>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D (inode->i_mode & S_IRWXUGO=
) | (mode &
>>>>>>> ~S_IRWXUGO);
>>>>>>
>>>>>> Sorry, I still have problem with this patch.
>>>>>>
>>>>>> I think this equals to inode->i_mode =3D mode;
>>>>>>
>>>>>> Because in chmod_common(), @mode was assigned as:
>>>>>>
>>>>>> newattrs.ia_mode =3D (mode & S_IALLUGO) | (inode->i_mode & =

>>>>>> ~S_IALLUGO);
>>>>>
>>>>> Hi Chao,
>>>>>
>>>>> I think this means=A0 all bits of S_IALLUGO can be changed during =

>>>>> chmod(),
>>>>> and i_acl_mode has
>>>>
>>>> Hi Weichao,
>>>>
>>>> Correct,
>>>>
>>>>>
>>>>> new S_IRWXUGO bits , i_mode has old S_IRWXUGO bits.
>>>>
>>>> Look into acl related code again, I found what f2fs now do is =

>>>> trying to
>>>> update i_mode and acl xattr entry atomically, so in advance updated =

>>>> mode
>>>> will be record to i_acl_mode, and finally, it will update i_mode w/
>>>> i_acl_mode
>>>> while acl entry update in path of f2fs_set_acl() - f2fs_setxattr().
>>>
>>> Hi Chao,
>>>
>>> IMO, only the S_IRWXUGO of part of i_mode needs update with acl xattr
>>> entry atomically.
>>
>> I don't get the point, IMO, all S_IALLUGO bits of i_mode and acl entries
>> should be updated atomically.
>
> Hi Chao,
>
> I mean ACL is only related with user/group permissions (IIUC), it =

> makes sense to
>
> keep the atomicity of ACL & S_IRWXUGO bits. For S_ISGID bit, why we =

> should keep
>
> this atomicity? It seems that even the atomicity of ACL & S_IRWXUGO =

> bits is not
>
> considerd in EXT4.
>
>>
>>>
>>>>
>>>> In order to keep this rule, I think we need to change as below, let me
>>>> know
>>>> if I missed something.
>>>>
>>> If we change as below, "chmod +s dir" may be failed if ACL related code
>>> occurs=A0 some error. However,
>>>
>>> this command should be successful , which is irrelevant with ACL.
>>
>> Will below appended change make sense to you? If posix_acl_chmod() =

>> failed,
>> just bail out w/o updating i_mode.
>
> Forget my example about "chmod +s dir", it will be executed correctly =

> if ACL errors
>
> occur. Below change is not needed & will cause the problem in my =

> example if included.
>
> Overall, keeping the atomicity of S_IALLUGO bits w/ ACL is enough to =

> me. Keeping the
Sorry, typo here: keeping the atomicity of S_IRWXUGO bits w/ ACL is =

enough to me
>
> atomicity of S_IALLUGO bits w/ ACL is also OK to me.
>
> BR,
>
> Weichao
>
>>
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 5bcaa68f74ad..8998fddde3e4 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -950,10 +950,9 @@ int f2fs_setattr(struct dentry *dentry, struct =

>> iattr *attr)
>>
>> =A0=A0=A0=A0 if (attr->ia_valid & ATTR_MODE) {
>> =A0=A0=A0=A0=A0=A0=A0=A0 err =3D posix_acl_chmod(inode, f2fs_get_inode_m=
ode(inode));
>> -=A0=A0=A0=A0=A0=A0=A0 if (err || is_inode_flag_set(inode, FI_ACL_MODE))=
 {
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_ac=
l_mode;
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE))
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE=
);
>> -=A0=A0=A0=A0=A0=A0=A0 }
>> =A0=A0=A0=A0 }
>>
>>>
>>> BR,
>>>
>>> Weichao
>>>
>>>> From: Weichao Guo <guoweichao@oppo.com>
>>>> Subject: [PATCH] f2fs: fix to set inode->i_mode correctly for
>>>> =A0=A0posix_acl_update_mode
>>>>
>>>> ---
>>>> =A0=A0fs/f2fs/acl.c=A0=A0 | 23 ++++++++++++++++++++++-
>>>> =A0=A0fs/f2fs/xattr.c | 15 +++++++++------
>>>> =A0=A02 files changed, 31 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
>>>> index 1e5e9b1136ee..732ec10e7890 100644
>>>> --- a/fs/f2fs/acl.c
>>>> +++ b/fs/f2fs/acl.c
>>>> @@ -200,6 +200,27 @@ struct posix_acl *f2fs_get_acl(struct inode
>>>> *inode, int type)
>>>> =A0=A0=A0=A0=A0 return __f2fs_get_acl(inode, type, NULL);
>>>> =A0=A0}
>>>>
>>>> +static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl **acl)
>>>> +{
>>>> +=A0=A0=A0 umode_t mode =3D inode->i_mode;
>>>> +=A0=A0=A0 int error;
>>>> +
>>>> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE))
>>>> +=A0=A0=A0=A0=A0=A0=A0 mode =3D F2FS_I(inode)->i_acl_mode;
>>>> +
>>>> +=A0=A0=A0 error =3D posix_acl_equiv_mode(*acl, &mode);
>>>> +=A0=A0=A0 if (error < 0)
>>>> +=A0=A0=A0=A0=A0=A0=A0 return error;
>>>> +=A0=A0=A0 if (error =3D=3D 0)
>>>> +=A0=A0=A0=A0=A0=A0=A0 *acl =3D NULL;
>>>> +=A0=A0=A0 if (!in_group_p(inode->i_gid) &&
>>>> +=A0=A0=A0=A0=A0=A0=A0 !capable_wrt_inode_uidgid(inode, CAP_FSETID))
>>>> +=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>>>> +=A0=A0=A0 *mode_p =3D mode;
>>>> +=A0=A0=A0 return 0;
>>>> +}
>>>> +
>>>> =A0=A0static int __f2fs_set_acl(struct inode *inode, int type,
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl *acl, struct =
page *ipage)
>>>> =A0=A0{
>>>> @@ -213,7 +234,7 @@ static int __f2fs_set_acl(struct inode *inode, int
>>>> type,
>>>> =A0=A0=A0=A0=A0 case ACL_TYPE_ACCESS:
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 name_index =3D F2FS_XATTR_INDEX_POSIX_ACL_=
ACCESS;
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (acl && !ipage) {
>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D posix_acl_update_mode(ino=
de, &mode, &acl);
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D f2fs_acl_update_mode(inod=
e, &mode, &acl);
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (error)
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_acl_inode(inode, mode);
>>>> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
>>>> index 65afcc3cc68a..2086bef6c154 100644
>>>> --- a/fs/f2fs/xattr.c
>>>> +++ b/fs/f2fs/xattr.c
>>>> @@ -673,7 +673,7 @@ static int __f2fs_setxattr(struct inode *inode,
>>>> int index,
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>>>>
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (value && f2fs_xattr_value_same(here, v=
alue, size))
>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto same;
>>>> =A0=A0=A0=A0=A0 } else if ((flags & XATTR_REPLACE)) {
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D -ENODATA;
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>>>> @@ -738,17 +738,20 @@ static int __f2fs_setxattr(struct inode *inode,
>>>> int index,
>>>> =A0=A0=A0=A0=A0 if (error)
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>>>>
>>>> -=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>>>> -=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>>>> -=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
>>>> -=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
>>>> -=A0=A0=A0 }
>>>> =A0=A0=A0=A0=A0 if (index =3D=3D F2FS_XATTR_INDEX_ENCRYPTION &&
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !strcmp(name, F2FS_XATTR_NAME_=
ENCRYPTION_CONTEXT))
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_set_encrypted_inode(inode);
>>>> =A0=A0=A0=A0=A0 f2fs_mark_inode_dirty_sync(inode, true);
>>>> =A0=A0=A0=A0=A0 if (!error && S_ISDIR(inode->i_mode))
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP=
);
>>>> +
>>>> +same:
>>>> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
>>>> +=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
>>>> +=A0=A0=A0 }
>>>> +
>>>> =A0=A0exit:
>>>> =A0=A0=A0=A0=A0 kfree(base_addr);
>>>> =A0=A0=A0=A0=A0 return error;
>>> .
>>>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
