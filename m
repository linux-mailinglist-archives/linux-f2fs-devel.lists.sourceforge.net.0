Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889C2E0843
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 10:49:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kreIB-0003rU-3R; Tue, 22 Dec 2020 09:49:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1kreIA-0003rM-2y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 09:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xPuABj2t+Jo68G+IcHzmw4ns6NSXz6zWqFG+F/VqWpE=; b=EQ/A05ie1Q10MqNHGXvNJHZCw4
 oG9t3ttbk6XNJm5KG8JbdmXHyv0XVhkCw5d0LNmUIXqf3JchdxMElZXn3/qG/4Zl2dhqIWHzlBcrD
 pcIMoVvqJIzK/r6DnK8c1YQ3tGPLA+lyeCKoppWtfOxaV+eGpytHDQhEFsN+CzZqxfG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xPuABj2t+Jo68G+IcHzmw4ns6NSXz6zWqFG+F/VqWpE=; b=LfpGqeCA3kY2hSl1QaVQhvGG2k
 G0HmI7fj4XvT0PlEnfREF5HSHSVH7zkOBXstzCllBxK7ymjvAUycYkE6z4FFvbU4MoTZhjs2yc1eY
 OkYj1iVfgVDOsiy1uzfsrqQJ53+pT6A0yuS7OJb4Fvarj4ir6+EEM21nlR+fBjJpNheM=;
Received: from mail-eopbgr1300089.outbound.protection.outlook.com
 ([40.107.130.89] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kreHq-004aji-85
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 09:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1eGWb369vhZ1oUuShwv+CNUGnAJrawBoSxlPJo/Jt9GEXeOIb3uwjBKdJ5RV7PJPIzds5SLbBoqpnWFXfp9UN4d2r+NLpqiPy9Q+RDbfMryUEv0kNm55eVmuov6LhmUSyBPM4ylzlf+yTYXo0zuvhNUTbh9jGD7rfuaJ34QF1OV42g+d59GY5MbqalbJhB0mpjzKIGNVi1HZjpli8zIXu3D7N2KX4KidiX0/x9RK7V8IKJHH1t5gafzb6LblCvD4vzs1Ezr3v5fCUTjwwApA3X3oe3vDnae7y0QM8WJPKShURP5JgbU1x5knNEJa+id4xM1qXMyou8FlpLDDlz2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i24sG9A7P8uUjmDqxjt83TsKDmTlXkoelpV1CHmtFTU=;
 b=UuuesqIGkGQhUIgq6W4BRY1a2BXVKDhMrp1krCAcuFzzcW9Th5fBHRc7GvdsyqetsoluArZ5PkE0nK4u7rz/nJNh/8esIWqKMnXDZAyxOgXyEIbvB7fj+2fCZwp75wWEED1r3VZ7tIYIxV8j1qz+oubgbDKda0ztIGjVVF5JJwROakDsSI8KqcO9M4pdP3CWEPuOIWfe47EEpgZZm+G9/xH5m/JRcpA82aJgu7PM3Ub2bHHgr0MsIhAzfmPfWlvA5IbqpDBofC+V94z+AZQR811B+SQJwWc+nSsvLT9qH4eFZgx0UuvMZlKf82Vsml2fXSomGqztE94Io5wOcA6R+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oppoglobal.onmicrosoft.com; s=selector1-oppoglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i24sG9A7P8uUjmDqxjt83TsKDmTlXkoelpV1CHmtFTU=;
 b=UDRRkho9/8L8MnsaJ+TEwY3QZBv/eA2iR6eCBFaspqs8jUASSr7oZYSvKT9wfO8ove/Yc3qRa06xmU77xRofu2wosdhCJTGqLF/WSVexeLXG9/dJeg07tcIXCU5OjS9C/NKPvNmJr22zgxXahSi4Np0tHoZInSxeMk33269jy8c=
Authentication-Results: lists.sourceforge.net; dkim=none (message not signed)
 header.d=none; lists.sourceforge.net;
 dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK2PR02MB3844.apcprd02.prod.outlook.com (2603:1096:202:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 09:32:33 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691%3]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:32:33 +0000
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
From: Weichao Guo <guoweichao@oppo.com>
Message-ID: <c537b5d4-5e1a-956f-bc46-f8b608468984@oppo.com>
Date: Tue, 22 Dec 2020 17:32:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
X-Originating-IP: [58.252.5.68]
X-ClientProxiedBy: HK2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:202:2::27) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.102.228.252] (58.252.5.68) by
 HK2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:202:2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend
 Transport; Tue, 22 Dec 2020 09:32:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ddc8a1-b886-466e-95d1-08d8a65c82cc
X-MS-TrafficTypeDiagnostic: HK2PR02MB3844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR02MB38448FA36BD7AA21BCC62A14B6DF0@HK2PR02MB3844.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APkCcFG8mWdmRM5rhnlaWv5zbXN3tI+ew9T/stl6thuOMUcqoAQoS2pjNBSjDEfObXStt9Hoj2avG8zMx/sdCIj0ntwvwRiER9zsoN2nBGU5WpHdW7qxg70jttJWsqp3S+fqUi2TRNzImTWbolCsrjwUwAqXI/mq2JBhMlFIDaPr8/QFrSTaD8yUWteqfsoEG70WEfFH1qyniWnrkRVl5F8HpRx0HsmTBpK3zzTHnWS51whxWWQ3biL3u2YjKXdpBWYfcA0l2KKswGEojTKhKFVACUfZijQ6u44Js4yppEzKQFoKulJhBp7MwUnpRpOEE082tSJLpiaa1VY9vuspHEmR1Nplcup6l/4nTEF8BXel876+kowoUsxFrtU2sC507fjzYuHIsmOgz7BFaLPlZAbWqt9kbMeL+rAfJ574kI3MIjO4GQiyUvipNea0vHNmz52sWAH7ypMM8Nuv1bfi4tf3ZX2yA8YXN2rltSU/Ybu/mf0wAbKgPWUZzOJD9VPA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(8676002)(316002)(16526019)(31686004)(31696002)(6666004)(478600001)(2906002)(16576012)(53546011)(36756003)(6486002)(52116002)(186003)(83380400001)(4326008)(26005)(66946007)(8936002)(5660300002)(66556008)(2616005)(956004)(66476007)(86362001)(11606006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?rBuurg1qiCx9tc/3KkFxg6lxIysuP+0j4SmjzJ9UxqSUcC4qOX8wKkIJ?=
 =?Windows-1252?Q?1b0gH3v+97b/FICMtrPT8eMZ76qOtZ0fmWLKL9/6lFsLFEMteLNB5L1Q?=
 =?Windows-1252?Q?vkejEsetHPSRXQGOOijO8czDzx4K9/57c82yInrXvAjxlgPlJr8Misnr?=
 =?Windows-1252?Q?c1y9psPmpkawbI7Z0EEm/ErTt6GdIhkRzQY8ePvU3/0UbVhksGuS2O39?=
 =?Windows-1252?Q?si/H0B1Ij82nuvfjP0+aqihB0W5tneiV4zbncQFpY9qFjXuOYvJ+rdsL?=
 =?Windows-1252?Q?1uxK93D0EN9iFf3IaGy+j650lHiFXrbn4RIc9ToBf+2r8eyBncqYD6/x?=
 =?Windows-1252?Q?xK4N0+zT0Ff9RwjEzFuarOOd8JXUP01Rm4mCvQF2nuDWe9GrrQa9TrL+?=
 =?Windows-1252?Q?oj8ITB0RUJ2ILLcG/J8yW7gXvPZv0mQGwYex0a8bykRuHrXER9iTa5CJ?=
 =?Windows-1252?Q?L3QrxNFiQcfsWt1vOQ0MFtEV66kDRI7YKLoyjBLYTNdC4sQVShZzHdfL?=
 =?Windows-1252?Q?Fuvx88qoH8txTnJ6w/C5+eIDbOtWNhGGsbnVITBm4vGU0IprkvpFBEHd?=
 =?Windows-1252?Q?M6GD9loz5Z6KcN82CLb7LdnbaUG2q0xAWEp74OaGANb/bv83EKT44bF+?=
 =?Windows-1252?Q?xTlPRivTSFXCMObHlh/5sObtIct4DzYScfXmgYonJEqYG1nwUqVX4/6A?=
 =?Windows-1252?Q?Mj0h7vmrbJKvN1aYdkblvc/xOwwkHAKZqSb1KtC9NUwxLI7YpcfOEnok?=
 =?Windows-1252?Q?1Sf+o9w9iM1/oHNymgFip7ZavjE0Y78E2jYl88D4qC4l/iOFYAeLL11g?=
 =?Windows-1252?Q?euzQe1jNypO84MY9nAOykXkfCbMNJ/Z1E3g75sSpZ3SEWUCcJZDC25Bd?=
 =?Windows-1252?Q?1ePcfu+VbMFBfwzoFj4AODiGnLYOmzK6wWRtwrnjnuclxjAVj3sdvbHx?=
 =?Windows-1252?Q?DcMyuemfctADErYaMymdMpjceV8B1Fugm+NhpYlyiFLiDg5lwiHbEPwD?=
 =?Windows-1252?Q?LYOKNO8GQawqwYkccTMrykSZY1jSwJ5om6UlXXEmHTnWaJifBFxYIR6p?=
 =?Windows-1252?Q?nkNz2MQZN6EeViD/?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 09:32:33.3143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ddc8a1-b886-466e-95d1-08d8a65c82cc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YcV9UkQBO3nKHLebLfTGb/owWcwWbW6C7FUn4bfymJjXbI3nCef6iZ+93on5rQWmXtJjuyEuchQ+LVIZtINtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR02MB3844
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.130.89 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.89 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kreHq-004aji-85
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


On 2020/12/22 16:24, Chao Yu wrote:
> On 2020/12/14 11:54, Weichao Guo wrote:
>> We should update the ~S_IRWXUGO part of inode->i_mode in __setattr_copy,
>> because posix_acl_update_mode updates mode based on inode->i_mode,
>> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old =

>> i_mode.
>>
>> Testcase to reproduce this bug:
>> 0. adduser abc
>> 1. mkfs.f2fs /dev/sdd
>> 2. mount -t f2fs /dev/sdd /mnt/f2fs
>> 3. mkdir /mnt/f2fs/test
>> 4. setfacl -m u:abc:r /mnt/f2fs/test
>> 5. chmod +s /mnt/f2fs/test
>>
>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>> Signed-off-by: Bin Shu <shubin@oppo.com>
>> ---
>> =A0 fs/f2fs/file.c | 1 +
>> =A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 16ea10f..4d355f9 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode, =

>> const struct iattr *attr)
>> =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!in_group_p(inode->i_gid) && !capabl=
e(CAP_FSETID))
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D (inode->i_mode & S_IRWXUGO) | (=
mode & =

>> ~S_IRWXUGO);
>
> Sorry, I still have problem with this patch.
>
> I think this equals to inode->i_mode =3D mode;
>
> Because in chmod_common(), @mode was assigned as:
>
> newattrs.ia_mode =3D (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);

Hi Chao,

I think this means=A0 all bits of S_IALLUGO can be changed during chmod(), =

and i_acl_mode has

new S_IRWXUGO bits , i_mode has old S_IRWXUGO bits.

BR,

Weichao

>
> and only S_ISUID and S_ISGID bits of newattrs.ia_mode can be changed =

> during chmod()
>
> That's why setattr_copy() in fs/attr.c just uses "inode->i_mode =3D mode;"
>
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 set_acl_inode(inode, mode);
>
> Another problem is if i_acl_mode is used for error path handling, here =

> i_acl_mode
> and i_mode have the same value, that's not correct?
>
> Jaegeuk,
>
> IIUC, i_acl_mode was introduced for i_mode recovery once acl progress =

> fails?
>
> Thanks,
>
>> =A0=A0=A0=A0=A0 }
>> =A0 }
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
