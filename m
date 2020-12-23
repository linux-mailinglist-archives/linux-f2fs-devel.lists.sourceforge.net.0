Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F42E1829
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Dec 2020 05:39:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krvvV-0003wA-RE; Wed, 23 Dec 2020 04:39:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1krvvU-0003vz-S8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 04:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=muQLOjM9cb3AMjRQOvwL9bVxh0yMIY1nwPuUOG9Yo0U=; b=CpjgJSNzCDQmrrlRJnQmNLMnew
 h8iV0URnvaE1z5APWBF0HWIYORfsuP+vxXF3M2k5ze7mVE/nkpwLUPIS9WYJjDtwV8b9gex2bOQKd
 EB9SGkqn9ub04dPq8b2CGW+iHfork/wN42SNySrmNKN5PfQEeqqm5g8C4KlPyGied5WA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=muQLOjM9cb3AMjRQOvwL9bVxh0yMIY1nwPuUOG9Yo0U=; b=XwCfCOCLwe2ADhuSZo+v54L/Zu
 //1LB2FetQ4yxjrHPA4ibyI/KXuNu/4tkKZ1IbREpXfaE0ZjgKYkLKCH/w2r035DR0Zp7egVn8pQ1
 be3ApGpoDVfovCg0HIWLYfDj9qpV4OCpTXfb+FIY5RPbk4ksLtkK6cIVZaQ3rzcLw6fo=;
Received: from mail-eopbgr1310059.outbound.protection.outlook.com
 ([40.107.131.59] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krvvM-007KyY-ID
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 04:39:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kF10XaqslB/eBLiFk1KfG4D6NZw9DzZh0pCYnz3szdoLC9gc8byKB8kX7yVtsZsvjf68SmjWJYLXQ/vrSzJ/pOiyKwnmgCxHzdm3ZYCFxiRnaRRE50yZt3JIfwt9BoNy8LHA24KZ+TA+NnbSiiUwJuS9WlK/mRJ67epJmzbHy6bTK1l8+rLgJGVlxdCMGVEqaXlTeEQo0UwWuCxNCgzseBVRfUIpgNRGEGWGfjehnNweH/mL4GoQ7el0vqgfHPqwsVAJ/4GzhJdWTJrrr5KBwwrOF21J84PQjoTFKitGFfmypfry29HP6FjCjFmDXEP+sWRl4onlpNZrdOzae67H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7WgyNxgyrNDHbYBvGszT9/2iWB4oDWVE0lM8hkuf1M=;
 b=DHAMx+WQHOy0P8lmY/j3524vCoPa0SK2L/gH9dBF4pwd90MkjYL9E3yC7NrSOAxFcy7BotqLRjfC1LVOxKY52Lkv25OfaPrkPfI6nKAKRzqj+z/zhLekgi29+N0nyDbMmo3F7k+N5MTT4Y9R88XvrmHhBufQhUFxU4zEQ59WWEIyIz+JC5zQJm1qCi0o+Sui1zzPkr4cqnYW7J37SwRlodevf4sYBt04yFzQtR1iHEAHRLQ/5gEvDjiGSJS+7pZOSQ51p82U7btUeH5zxK0LrOzEAan92NT0i0IsM6480Re/e2ivcdnKnUUUrYQ+l22yoNewA2smoGLF8JBeinUWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oppoglobal.onmicrosoft.com; s=selector1-oppoglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7WgyNxgyrNDHbYBvGszT9/2iWB4oDWVE0lM8hkuf1M=;
 b=uvM9dpIf/HsW3RbI6Fcph7Mh62s9Guh8CyYcAOrgyF3fGyNeAnHWTkgMO7Xmdva2XKibRyAjCZj9T8rBxhckDa/I1F0hlnxI+nzIKAUAxgArNV4RHZM3DTp/tn1sxcH9k7blEs0rHmfpYcVmVOdZLLYmKceduWZvHrEy4MR0a60=
Authentication-Results: lists.sourceforge.net; dkim=none (message not signed)
 header.d=none; lists.sourceforge.net;
 dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK0PR02MB2450.apcprd02.prod.outlook.com (2603:1096:203:21::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Wed, 23 Dec
 2020 04:38:45 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691%3]) with mapi id 15.20.3676.034; Wed, 23 Dec 2020
 04:38:45 +0000
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
 <c537b5d4-5e1a-956f-bc46-f8b608468984@oppo.com>
 <41642a06-f629-bf5e-96b4-412473447c31@huawei.com>
 <a2a4ab3b-e5a1-0b55-e094-06508c1f2a01@oppo.com>
 <16f46413-0c94-12d4-09bb-dcc26a670a7d@huawei.com>
From: Weichao Guo <guoweichao@oppo.com>
Message-ID: <8ca717f8-f787-c34a-4b4e-7f97b5e4d87c@oppo.com>
Date: Wed, 23 Dec 2020 12:38:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <16f46413-0c94-12d4-09bb-dcc26a670a7d@huawei.com>
X-Originating-IP: [58.252.5.68]
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.102.228.252] (58.252.5.68) by
 HK0PR01CA0058.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Wed, 23 Dec 2020 04:38:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5463e8b-4699-4103-0fdf-08d8a6fca232
X-MS-TrafficTypeDiagnostic: HK0PR02MB2450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR02MB2450D5946A15C7B41B9C826BB6DE0@HK0PR02MB2450.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 64ShRF1JVj5EgbF81ecEccU5Rg4mQ5VPDAwFLOengSDRCd34B/4o2qEIqEJ1J14hub4P01o7qdL2EF6YBe+NwBxp7EiK+qjM9sTKZtzT7iLszH1b5EouDM5bbP1qHRdpj5BMTSMihdVLxNcbUC+GdohwTYANbYpYcXWkgWKqUvdXaFzWOP7A/Lss8IcXAEWml4ZoR0nxvI5OcemQTZzjxrr6ztOPiVnXy102okiymRASV/fYlLjEqTG8WPfXIcD3VE31oAizFuems+dBDq3mMTT54Sb9B2Mayd20rMbvpNQpRQylnhg79XPVD4dnJD5VyLhmNX/2nt7KFy6HnPDdGqLMoGSwFJSfxT1AoCrCptS9ik5XUalipk5D0JZCdnnCkZ+b5aSuW8PdFO1aycQ6BeBq9E3BErsoK5d7wgLJOvHf4QNdNNqYtuq9v0hC0eT2yDClRDYFBnQ8dafybHqz0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(16576012)(316002)(31696002)(956004)(66476007)(36756003)(5660300002)(66556008)(66946007)(83380400001)(8936002)(2906002)(16526019)(4326008)(8676002)(86362001)(26005)(2616005)(6666004)(52116002)(53546011)(31686004)(6486002)(186003)(478600001)(11606006)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?+kJGmEcqb2Kxrkm8XmXd1NPwyI+e0ii4XcCi/4TM5c2Cqq1VRQgyJ+26?=
 =?Windows-1252?Q?Me1UfmWn5D5hvxH+/E8EMs0b/46BDq0aE41howJuVkl81Fi19Qsav2Mc?=
 =?Windows-1252?Q?jMBe+2pKxYjYAK7R+Ty1Q9GIiIAEeKTR3Fjl9j8aW0XG5Q4vNEX0O6Um?=
 =?Windows-1252?Q?urJhhuv6t9eVIUFwQPnlisyDW9OojZq44+Pb9mZLtxkNa3PNAR0THp9F?=
 =?Windows-1252?Q?zloUxYNF7s0mpW+35Vfz24ePcGJRWKfRyMXi3y+NY7A4SY///mmZ/IpP?=
 =?Windows-1252?Q?zy6JjBV4PDshYUOdRWiN+oo+JaPen7/Hfyir9ZYk+wubGR5+zQGLtXJT?=
 =?Windows-1252?Q?BT+YtQNr0bDfV7t6N9lLIplyfSkdX09f+X2f4bhP9aVdTjufrAPKy59Q?=
 =?Windows-1252?Q?0T6FKiNDjDyqbcELuavaZWBkYChcLPy+X+RDNAirys46e2bS9fuDZLjT?=
 =?Windows-1252?Q?zqvMdpPPBuLlhI9FT6jrQcMSyhcoYi9EKLAnFGry9n56e0KUYgd7MszK?=
 =?Windows-1252?Q?qMvM96Lo61NE4IO/A+cGIbDBcZPNfC5EsQpwFdGh/6Lo3YlqfGE0ooUx?=
 =?Windows-1252?Q?mEsolDH6rdOme4BQWyyrQB9pcasf9BWLQqfk3/r4CnU5K8tQnMNaOBmO?=
 =?Windows-1252?Q?3odfYjqwxghX5orUu/m7z7hfQVm/xypFHP4JLFYFbxTQYD+ZA28Wav5j?=
 =?Windows-1252?Q?KxkpOzNP6saCnnRbcc1c2LFXu+aDnxG90WGSjL2oDXmAlyNWhsB0+Ok1?=
 =?Windows-1252?Q?Y9z02N9SLDqcn3w7dPIdhu7b9ec4ffEz0Omfq+HZoogXfYUEyMRcaVxJ?=
 =?Windows-1252?Q?uG4++rJ0aULy1RSXHAP/Kta79V88qz1x2Ir0Nhkk9EVORzNZ+elaHVEW?=
 =?Windows-1252?Q?s71Q4LGffiR86uEhkarDIjqRXI4g/Ow9LGma2ihJxOdYhEG8xsQNcmkt?=
 =?Windows-1252?Q?hqP0XW/E/zNfZUBzlpVUC1kivFVtwQfunU5arDw8vWejENiHhngpZO6R?=
 =?Windows-1252?Q?MD9NNBBau+lJZJKEDfrdv5vi/DDUh5h5UOHPyr3ksctcY2qA4Vw=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 04:38:45.4765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-Network-Message-Id: b5463e8b-4699-4103-0fdf-08d8a6fca232
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: og7F2XJuKxIq5WGL1M30/L1RWpl6eCjkcUnNjIt3Wc3CU+TW9iuGPQCEeJKTKDKQGg16xO4u0MM2xXUaNVb/KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2450
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.59 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 FORGED_SPF_HELO        No description available.
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krvvM-007KyY-ID
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


On 2020/12/23 9:14, Chao Yu wrote:
> On 2020/12/22 20:14, Weichao Guo wrote:
>>
>> On 2020/12/22 18:49, Chao Yu wrote:
>>> On 2020/12/22 17:32, Weichao Guo wrote:
>>>>
>>>> On 2020/12/22 16:24, Chao Yu wrote:
>>>>> On 2020/12/14 11:54, Weichao Guo wrote:
>>>>>> We should update the ~S_IRWXUGO part of inode->i_mode in
>>>>>> __setattr_copy,
>>>>>> because posix_acl_update_mode updates mode based on inode->i_mode,
>>>>>> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old
>>>>>> i_mode.
>>>>>>
>>>>>> Testcase to reproduce this bug:
>>>>>> 0. adduser abc
>>>>>> 1. mkfs.f2fs /dev/sdd
>>>>>> 2. mount -t f2fs /dev/sdd /mnt/f2fs
>>>>>> 3. mkdir /mnt/f2fs/test
>>>>>> 4. setfacl -m u:abc:r /mnt/f2fs/test
>>>>>> 5. chmod +s /mnt/f2fs/test
>>>>>>
>>>>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>>>>> Signed-off-by: Bin Shu <shubin@oppo.com>
>>>>>> ---
>>>>>> =A0=A0=A0 fs/f2fs/file.c | 1 +
>>>>>> =A0=A0=A0 1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>>> index 16ea10f..4d355f9 100644
>>>>>> --- a/fs/f2fs/file.c
>>>>>> +++ b/fs/f2fs/file.c
>>>>>> @@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode,
>>>>>> const struct iattr *attr)
>>>>>> =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!in_group_p(inode->i_gid) =
&& !capable(CAP_FSETID))
>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D (inode->i_mode & S_IRWXUGO)=
 | (mode &
>>>>>> ~S_IRWXUGO);
>>>>>
>>>>> Sorry, I still have problem with this patch.
>>>>>
>>>>> I think this equals to inode->i_mode =3D mode;
>>>>>
>>>>> Because in chmod_common(), @mode was assigned as:
>>>>>
>>>>> newattrs.ia_mode =3D (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO=
);
>>>>
>>>> Hi Chao,
>>>>
>>>> I think this means=A0 all bits of S_IALLUGO can be changed during =

>>>> chmod(),
>>>> and i_acl_mode has
>>>
>>> Hi Weichao,
>>>
>>> Correct,
>>>
>>>>
>>>> new S_IRWXUGO bits , i_mode has old S_IRWXUGO bits.
>>>
>>> Look into acl related code again, I found what f2fs now do is trying to
>>> update i_mode and acl xattr entry atomically, so in advance updated =

>>> mode
>>> will be record to i_acl_mode, and finally, it will update i_mode w/
>>> i_acl_mode
>>> while acl entry update in path of f2fs_set_acl() - f2fs_setxattr().
>>
>> Hi Chao,
>>
>> IMO, only the S_IRWXUGO of part of i_mode needs update with acl xattr
>> entry atomically.
>
> I don't get the point, IMO, all S_IALLUGO bits of i_mode and acl entries
> should be updated atomically.

Hi Chao,

I mean ACL is only related with user/group permissions (IIUC), it makes =

sense to

keep the atomicity of ACL & S_IRWXUGO bits. For S_ISGID bit, why we =

should keep

this atomicity? It seems that even the atomicity of ACL & S_IRWXUGO bits =

is not

considerd in EXT4.

>
>>
>>>
>>> In order to keep this rule, I think we need to change as below, let me
>>> know
>>> if I missed something.
>>>
>> If we change as below, "chmod +s dir" may be failed if ACL related code
>> occurs=A0 some error. However,
>>
>> this command should be successful , which is irrelevant with ACL.
>
> Will below appended change make sense to you? If posix_acl_chmod() =

> failed,
> just bail out w/o updating i_mode.

Forget my example about "chmod +s dir", it will be executed correctly if =

ACL errors

occur. Below change is not needed & will cause the problem in my example =

if included.

Overall, keeping the atomicity of S_IALLUGO bits w/ ACL is enough to me. =

Keeping the

atomicity of S_IALLUGO bits w/ ACL is also OK to me.

BR,

Weichao

>
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5bcaa68f74ad..8998fddde3e4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -950,10 +950,9 @@ int f2fs_setattr(struct dentry *dentry, struct =

> iattr *attr)
>
> =A0=A0=A0=A0 if (attr->ia_valid & ATTR_MODE) {
> =A0=A0=A0=A0=A0=A0=A0=A0 err =3D posix_acl_chmod(inode, f2fs_get_inode_mo=
de(inode));
> -=A0=A0=A0=A0=A0=A0=A0 if (err || is_inode_flag_set(inode, FI_ACL_MODE)) {
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl=
_mode;
> +
> +=A0=A0=A0=A0=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE))
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
> -=A0=A0=A0=A0=A0=A0=A0 }
> =A0=A0=A0=A0 }
>
>>
>> BR,
>>
>> Weichao
>>
>>> From: Weichao Guo <guoweichao@oppo.com>
>>> Subject: [PATCH] f2fs: fix to set inode->i_mode correctly for
>>> =A0=A0posix_acl_update_mode
>>>
>>> ---
>>> =A0=A0fs/f2fs/acl.c=A0=A0 | 23 ++++++++++++++++++++++-
>>> =A0=A0fs/f2fs/xattr.c | 15 +++++++++------
>>> =A0=A02 files changed, 31 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
>>> index 1e5e9b1136ee..732ec10e7890 100644
>>> --- a/fs/f2fs/acl.c
>>> +++ b/fs/f2fs/acl.c
>>> @@ -200,6 +200,27 @@ struct posix_acl *f2fs_get_acl(struct inode
>>> *inode, int type)
>>> =A0=A0=A0=A0=A0 return __f2fs_get_acl(inode, type, NULL);
>>> =A0=A0}
>>>
>>> +static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl **acl)
>>> +{
>>> +=A0=A0=A0 umode_t mode =3D inode->i_mode;
>>> +=A0=A0=A0 int error;
>>> +
>>> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE))
>>> +=A0=A0=A0=A0=A0=A0=A0 mode =3D F2FS_I(inode)->i_acl_mode;
>>> +
>>> +=A0=A0=A0 error =3D posix_acl_equiv_mode(*acl, &mode);
>>> +=A0=A0=A0 if (error < 0)
>>> +=A0=A0=A0=A0=A0=A0=A0 return error;
>>> +=A0=A0=A0 if (error =3D=3D 0)
>>> +=A0=A0=A0=A0=A0=A0=A0 *acl =3D NULL;
>>> +=A0=A0=A0 if (!in_group_p(inode->i_gid) &&
>>> +=A0=A0=A0=A0=A0=A0=A0 !capable_wrt_inode_uidgid(inode, CAP_FSETID))
>>> +=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>>> +=A0=A0=A0 *mode_p =3D mode;
>>> +=A0=A0=A0 return 0;
>>> +}
>>> +
>>> =A0=A0static int __f2fs_set_acl(struct inode *inode, int type,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl *acl, struct p=
age *ipage)
>>> =A0=A0{
>>> @@ -213,7 +234,7 @@ static int __f2fs_set_acl(struct inode *inode, int
>>> type,
>>> =A0=A0=A0=A0=A0 case ACL_TYPE_ACCESS:
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 name_index =3D F2FS_XATTR_INDEX_POSIX_ACL_A=
CCESS;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (acl && !ipage) {
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D posix_acl_update_mode(inod=
e, &mode, &acl);
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D f2fs_acl_update_mode(inode=
, &mode, &acl);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (error)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_acl_inode(inode, mode);
>>> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
>>> index 65afcc3cc68a..2086bef6c154 100644
>>> --- a/fs/f2fs/xattr.c
>>> +++ b/fs/f2fs/xattr.c
>>> @@ -673,7 +673,7 @@ static int __f2fs_setxattr(struct inode *inode,
>>> int index,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (value && f2fs_xattr_value_same(here, va=
lue, size))
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto same;
>>> =A0=A0=A0=A0=A0 } else if ((flags & XATTR_REPLACE)) {
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D -ENODATA;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>>> @@ -738,17 +738,20 @@ static int __f2fs_setxattr(struct inode *inode,
>>> int index,
>>> =A0=A0=A0=A0=A0 if (error)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>>>
>>> -=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>>> -=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>>> -=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
>>> -=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
>>> -=A0=A0=A0 }
>>> =A0=A0=A0=A0=A0 if (index =3D=3D F2FS_XATTR_INDEX_ENCRYPTION &&
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !strcmp(name, F2FS_XATTR_NAME_E=
NCRYPTION_CONTEXT))
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_set_encrypted_inode(inode);
>>> =A0=A0=A0=A0=A0 f2fs_mark_inode_dirty_sync(inode, true);
>>> =A0=A0=A0=A0=A0 if (!error && S_ISDIR(inode->i_mode))
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>>> +
>>> +same:
>>> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
>>> +=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
>>> +=A0=A0=A0 }
>>> +
>>> =A0=A0exit:
>>> =A0=A0=A0=A0=A0 kfree(base_addr);
>>> =A0=A0=A0=A0=A0 return error;
>> .
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
