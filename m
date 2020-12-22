Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A12E09F2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 13:15:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krgZC-0008RI-HR; Tue, 22 Dec 2020 12:15:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1krgZA-0008Qf-Dc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 12:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gy+Jd2hr8xq0f4erg6/AUHcODAP2vhuCgw51lFux46w=; b=a+lm//XTtWh96XE3d4NaduGBkq
 Zb28FVmxWJqxf32DU/BCbxyHaIWUlBCrBcXy+bOKfoztX4ClaQsuRhPAwxgS+F0BG7toVxBuBv+Wm
 +gnCPzuAUMh/xwjq3rvmHokhLzyZjc6m3mSc2LIMorKODnBq+J9WSi8OpnxZ0WyY22UE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gy+Jd2hr8xq0f4erg6/AUHcODAP2vhuCgw51lFux46w=; b=XOnnu5pS5rwSFf7ZydyAngvUkV
 kdOz0xmug8pbSzSS/w3LblqTq86GRQiunov4C5FeCpEtmwni0zDxDD7QWkEXKx0Az1/t6+gNzrlK7
 FsrUeTYO6nNlETkruOMUuKp6JrAS9iUZ9HYgm3lBTRyLo48IHb7j0NHe/SGqhzm0fxS4=;
Received: from mail-eopbgr1310074.outbound.protection.outlook.com
 ([40.107.131.74] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krgZ4-004goJ-T3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 12:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1CZydG1K4zBb5MLmxTLPMQa2xRtHCdeWPxSxUiuhI3hkjR4sAQV9YJs1rN2OxIvvEbLto1LX78BNmc1OLU8BV/wlIfNKFCyDEagf4vuL9PQtoZNvdpref7P/Wb6Ypw7lBj03v+Ciouv9SUN5rxx1rhaFhvlRSVZyMoLNvC8M17gCaczXWKaMM+eFa+DShvQx7C1iFZMtug+lG0aQrlkMd02AlamaReJTMzQgaaMm8gf32GicaAguGrSWuLweXWFdvLQcfcM6g9r3mwjfJ0rMabh2eoEdi5Cv5vWsBL+7h6Kp0dFNv0um/MkxuaAkfKRJV774ONzwDE6IkEQOeBBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRJ59kpCZpNMjNg2ZjOlOMxu3PWPrtPQtbmzE9Eou/k=;
 b=m/POe74130f3bidpHNuduBXUuru7XhAHlHSgPWR/Sq+WMcDdv695LT7ECElb3My3Y8IasavOaXSTp56zqKOewgGzh4obLcXCMB21XR6Ie9+PjImb409HAHQBx4Se4vjHfY+BfM7dWOqlRxUsz292j0HFl8hyjRxH1neZiVoZY5ltXJ1PVPKNFD0eTxJBNKFctTqXFmkdFm1/sTv+kpf9X4MvEespr1TSo+TfU5+J04UsoaVLxJzjoclZ0InAOJ86EXRKsLmJ7/BFPwIZPlClRJs5EFEEOXXbs9VQW211NU3+qyW+ybtpkC2yIH4mngbjWg/6n1ZXHLO1ZK8UQXCrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oppoglobal.onmicrosoft.com; s=selector1-oppoglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRJ59kpCZpNMjNg2ZjOlOMxu3PWPrtPQtbmzE9Eou/k=;
 b=gZEEBpsF/u99dz++fEObRbyYlN/Hs+huWDGpghDS5+rhXu5gsMGzXiuRVoeqeB/bE9fiSYND+bLyYNGDfDXoN/y8IBpR+tD6sSqWFMWLkjaL6Odz9gJ0X0iW1CZIFFCbQKaqUgH8vClkisouzio4kt6h7uP0OAlkWedSJrndZkM=
Authentication-Results: lists.sourceforge.net; dkim=none (message not signed)
 header.d=none; lists.sourceforge.net;
 dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK0PR02MB2452.apcprd02.prod.outlook.com (2603:1096:203:24::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 12:14:45 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691%3]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 12:14:45 +0000
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
 <7129ad3d-cf60-2106-dcd6-783ec7470620@huawei.com>
 <c537b5d4-5e1a-956f-bc46-f8b608468984@oppo.com>
 <41642a06-f629-bf5e-96b4-412473447c31@huawei.com>
From: Weichao Guo <guoweichao@oppo.com>
Message-ID: <a2a4ab3b-e5a1-0b55-e094-06508c1f2a01@oppo.com>
Date: Tue, 22 Dec 2020 20:14:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <41642a06-f629-bf5e-96b4-412473447c31@huawei.com>
X-Originating-IP: [58.252.5.68]
X-ClientProxiedBy: HK2PR02CA0190.apcprd02.prod.outlook.com
 (2603:1096:201:21::26) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.102.228.252] (58.252.5.68) by
 HK2PR02CA0190.apcprd02.prod.outlook.com (2603:1096:201:21::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Tue, 22 Dec 2020 12:14:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a3b289-a91b-4bcd-90fd-08d8a6732ba1
X-MS-TrafficTypeDiagnostic: HK0PR02MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR02MB2452D45A6DBD237BD80B0379B6DF0@HK0PR02MB2452.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfBAVsDrGCxrqtO73hoH5X9qrv8hf3vLa0uEqCSVj4aVsaUwi8tedEYuk9TD0epO0BvwbsRIop4Vj6vIWqCa5H4DkeJ24tue3+Sy7ufDBZo+8VhJ5rqc0PoqkgDB8lPKV2/S1DXEkZgg/l3ZA0Z1bS+2Wcz/eA5pllwkZekEU9iGglI+2UJzyFtWw8XkTgoX5oW5HFs0VVTjyE7fuxNxNkprlBfQJjsHMKJW+IpMrecSuVSN0TpkkpFkaP4+aw9WpS6WVx9sDSCpvNz9tWZ06tfOrn+li0TlTNPWF02yUNuA0kcPiHEV+Wh5iI2Wm/LKcXJa67yCTDKgy/QRqn+rJPR19BoVND9I/WYqmqd0XVa3lhdRunE7IMGAz7m8MCEPbZNFEyf+nux7uuE5jNpyzMKO8b/nf1qc9c0v8l/D/vHd53L/A/FnCxA7fHgz7wfn09498HNkX5OAJPstggKnQEAq6W6X+wbqJzDj1TS7KgoVxIlWgRgnuDdHVG46EwfH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(8936002)(6486002)(31696002)(5660300002)(66556008)(66946007)(66476007)(316002)(4326008)(478600001)(186003)(16526019)(2906002)(26005)(86362001)(83380400001)(2616005)(52116002)(8676002)(36756003)(53546011)(956004)(16576012)(31686004)(11606006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?IQ6S81/0HQ1KZtm09lhwjFee9ORRBtmvL59EU6h2H4vik3KB/yOfzAqE?=
 =?Windows-1252?Q?0m2CsXLn7iQit888Zu8D1wKx8+R7yQp3oQhyaxLr3stmmnWicZDJ/Ryn?=
 =?Windows-1252?Q?7Vmp1y3MdiIhPgGFg18o6eFv0ieX2hah8sma5jmRNVIJIbqiYvLelJxr?=
 =?Windows-1252?Q?NCsgIeCMb+pVeCEvo59Q/Nsha9f9rixKGEGhGETSgb0GfsbqJf4lZcPL?=
 =?Windows-1252?Q?KI9MC64xHZ2RNmRCimhcU7yNKmziCz0Z9Q9olRe+LkVOVOo/4BMl9CLj?=
 =?Windows-1252?Q?x5GdtVEyfrKhQ20rYTVGuKYeHEKY10GRHUZ7iJ/FfReTMru5cOp+5nQN?=
 =?Windows-1252?Q?c4pfzvQAnM0HMRHztZmWIIAQacZaizNrTRF0QcDNzEAZyVfTFVpOX1ul?=
 =?Windows-1252?Q?V88aFXOip4IE65uUqT/DAdg4ByyLlgeklw39/LGXI6OSO2hBeinjbc03?=
 =?Windows-1252?Q?JR6/p4WFi5oa8VVkR3xjG43gBEf+efLfIEewo6M8NgYaBK41u+0Da67t?=
 =?Windows-1252?Q?eovwCLV4KIk62FINjM4v75dRmG5HkDSiUI6NTYawU2/HpsCNy4u+fg8N?=
 =?Windows-1252?Q?Fy8cjY+5pYBDHNnX6HQeFwGER9FKPkgbVEsDYNA3h7AcewuRN1NDA8eA?=
 =?Windows-1252?Q?iVq22kRjPkQjVIvemfAqejgvpVS8RWtg+wrOgH7CliDRoU4u4/eJjJOP?=
 =?Windows-1252?Q?h3us0RfcylPAqBrEb1aG+NdgKgKhVDjEKzrzEKR5jfCmhQ/PqnfyNS/g?=
 =?Windows-1252?Q?nhns+fKcH3ycqYdRZw8174YoLRqb7XTOWkPNWngXFxM4fIsh6uIskUgF?=
 =?Windows-1252?Q?nuKjvKOfEVrCrjafs3Q/7QT8DZf16tTLO8i3DF44n1CCANuz7eITPdbz?=
 =?Windows-1252?Q?YwoL6YWOglH7WlW1RdB5meyY19nPavhfcHMBJZU5VBbe0YLJtFofyRkX?=
 =?Windows-1252?Q?efkZlV02N0n7gVI6kqv1Kg5k26CHLfrJCaOIitsHybNcvy+AZ7JODsdA?=
 =?Windows-1252?Q?oZWzOD+hbUizuc+FLYgYC4KLg75nyq4zUNnRagSxNJE+19WIsW0=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 12:14:45.5454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a3b289-a91b-4bcd-90fd-08d8a6732ba1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/hsUC81bieVQLm8QqYfZfj8V9dvzpCBRKb4NPYlxxwtN8GO/wWPvp7VDvxzT8/knpE8Dck7kl+Ht9muqC+nZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2452
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.131.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.74 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1krgZ4-004goJ-T3
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


On 2020/12/22 18:49, Chao Yu wrote:
> On 2020/12/22 17:32, Weichao Guo wrote:
>>
>> On 2020/12/22 16:24, Chao Yu wrote:
>>> On 2020/12/14 11:54, Weichao Guo wrote:
>>>> We should update the ~S_IRWXUGO part of inode->i_mode in =

>>>> __setattr_copy,
>>>> because posix_acl_update_mode updates mode based on inode->i_mode,
>>>> which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old
>>>> i_mode.
>>>>
>>>> Testcase to reproduce this bug:
>>>> 0. adduser abc
>>>> 1. mkfs.f2fs /dev/sdd
>>>> 2. mount -t f2fs /dev/sdd /mnt/f2fs
>>>> 3. mkdir /mnt/f2fs/test
>>>> 4. setfacl -m u:abc:r /mnt/f2fs/test
>>>> 5. chmod +s /mnt/f2fs/test
>>>>
>>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>>> Signed-off-by: Bin Shu <shubin@oppo.com>
>>>> ---
>>>> =A0=A0 fs/f2fs/file.c | 1 +
>>>> =A0=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 16ea10f..4d355f9 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode,
>>>> const struct iattr *attr)
>>>> =A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!in_group_p(inode->i_gid) && !c=
apable(CAP_FSETID))
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
>>>> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D (inode->i_mode & S_IRWXUGO) |=
 (mode &
>>>> ~S_IRWXUGO);
>>>
>>> Sorry, I still have problem with this patch.
>>>
>>> I think this equals to inode->i_mode =3D mode;
>>>
>>> Because in chmod_common(), @mode was assigned as:
>>>
>>> newattrs.ia_mode =3D (mode & S_IALLUGO) | (inode->i_mode & ~S_IALLUGO);
>>
>> Hi Chao,
>>
>> I think this means=A0 all bits of S_IALLUGO can be changed during chmod(=
),
>> and i_acl_mode has
>
> Hi Weichao,
>
> Correct,
>
>>
>> new S_IRWXUGO bits , i_mode has old S_IRWXUGO bits.
>
> Look into acl related code again, I found what f2fs now do is trying to
> update i_mode and acl xattr entry atomically, so in advance updated mode
> will be record to i_acl_mode, and finally, it will update i_mode w/ =

> i_acl_mode
> while acl entry update in path of f2fs_set_acl() - f2fs_setxattr().

Hi Chao,

IMO, only the S_IRWXUGO of part of i_mode needs update with acl xattr =

entry atomically.

>
> In order to keep this rule, I think we need to change as below, let me =

> know
> if I missed something.
>
If we change as below, "chmod +s dir" may be failed if ACL related code =

occurs=A0 some error. However,

this command should be successful , which is irrelevant with ACL.

BR,

Weichao

> From: Weichao Guo <guoweichao@oppo.com>
> Subject: [PATCH] f2fs: fix to set inode->i_mode correctly for
> =A0posix_acl_update_mode
>
> ---
> =A0fs/f2fs/acl.c=A0=A0 | 23 ++++++++++++++++++++++-
> =A0fs/f2fs/xattr.c | 15 +++++++++------
> =A02 files changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
> index 1e5e9b1136ee..732ec10e7890 100644
> --- a/fs/f2fs/acl.c
> +++ b/fs/f2fs/acl.c
> @@ -200,6 +200,27 @@ struct posix_acl *f2fs_get_acl(struct inode =

> *inode, int type)
> =A0=A0=A0=A0 return __f2fs_get_acl(inode, type, NULL);
> =A0}
>
> +static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl **acl)
> +{
> +=A0=A0=A0 umode_t mode =3D inode->i_mode;
> +=A0=A0=A0 int error;
> +
> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE))
> +=A0=A0=A0=A0=A0=A0=A0 mode =3D F2FS_I(inode)->i_acl_mode;
> +
> +=A0=A0=A0 error =3D posix_acl_equiv_mode(*acl, &mode);
> +=A0=A0=A0 if (error < 0)
> +=A0=A0=A0=A0=A0=A0=A0 return error;
> +=A0=A0=A0 if (error =3D=3D 0)
> +=A0=A0=A0=A0=A0=A0=A0 *acl =3D NULL;
> +=A0=A0=A0 if (!in_group_p(inode->i_gid) &&
> +=A0=A0=A0=A0=A0=A0=A0 !capable_wrt_inode_uidgid(inode, CAP_FSETID))
> +=A0=A0=A0=A0=A0=A0=A0 mode &=3D ~S_ISGID;
> +=A0=A0=A0 *mode_p =3D mode;
> +=A0=A0=A0 return 0;
> +}
> +
> =A0static int __f2fs_set_acl(struct inode *inode, int type,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct posix_acl *acl, struct page *=
ipage)
> =A0{
> @@ -213,7 +234,7 @@ static int __f2fs_set_acl(struct inode *inode, int =

> type,
> =A0=A0=A0=A0 case ACL_TYPE_ACCESS:
> =A0=A0=A0=A0=A0=A0=A0=A0 name_index =3D F2FS_XATTR_INDEX_POSIX_ACL_ACCESS;
> =A0=A0=A0=A0=A0=A0=A0=A0 if (acl && !ipage) {
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D posix_acl_update_mode(inode,=
 &mode, &acl);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error =3D f2fs_acl_update_mode(inode, =
&mode, &acl);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (error)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return error;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 set_acl_inode(inode, mode);
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 65afcc3cc68a..2086bef6c154 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -673,7 +673,7 @@ static int __f2fs_setxattr(struct inode *inode, =

> int index,
> =A0=A0=A0=A0=A0=A0=A0=A0 }
>
> =A0=A0=A0=A0=A0=A0=A0=A0 if (value && f2fs_xattr_value_same(here, value, =
size))
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto same;
> =A0=A0=A0=A0 } else if ((flags & XATTR_REPLACE)) {
> =A0=A0=A0=A0=A0=A0=A0=A0 error =3D -ENODATA;
> =A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
> @@ -738,17 +738,20 @@ static int __f2fs_setxattr(struct inode *inode, =

> int index,
> =A0=A0=A0=A0 if (error)
> =A0=A0=A0=A0=A0=A0=A0=A0 goto exit;
>
> -=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
> -=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
> -=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
> -=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
> -=A0=A0=A0 }
> =A0=A0=A0=A0 if (index =3D=3D F2FS_XATTR_INDEX_ENCRYPTION &&
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !strcmp(name, F2FS_XATTR_NAME_ENCRYP=
TION_CONTEXT))
> =A0=A0=A0=A0=A0=A0=A0=A0 f2fs_set_encrypted_inode(inode);
> =A0=A0=A0=A0 f2fs_mark_inode_dirty_sync(inode, true);
> =A0=A0=A0=A0 if (!error && S_ISDIR(inode->i_mode))
> =A0=A0=A0=A0=A0=A0=A0=A0 set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
> +
> +same:
> +=A0=A0=A0 if (is_inode_flag_set(inode, FI_ACL_MODE)) {
> +=A0=A0=A0=A0=A0=A0=A0 inode->i_mode =3D F2FS_I(inode)->i_acl_mode;
> +=A0=A0=A0=A0=A0=A0=A0 inode->i_ctime =3D current_time(inode);
> +=A0=A0=A0=A0=A0=A0=A0 clear_inode_flag(inode, FI_ACL_MODE);
> +=A0=A0=A0 }
> +
> =A0exit:
> =A0=A0=A0=A0 kfree(base_addr);
> =A0=A0=A0=A0 return error;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
