Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4633EA65
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Mar 2021 08:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBug1TE8k8HaR44P3YkDh7IhcRFYFDDUWZFGkQeXL3I=; b=bTm7OrXMXHBDuJ6JT5IvtE7PKT
	oKBkZvXsNVd+HLfFp9RbClWgiRsy1rZYfl81K1YExwljSL1sqTsjOj1dRk9euq2KJ5LLZOXCJ3JaJ
	bd6CVPehJ8C+LdDvveFFCVXTsUHB3FJoX4UYyYSmgS40agixDARiKG0DrHxPJlMHIWQY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMQPT-00024l-Lz; Wed, 17 Mar 2021 07:16:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1lMQPS-00024Z-EF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 07:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6quPZhhSSjVNxrHYo1yUBOFPnMqYYMR6YAjP7B72Ci4=; b=JtzcRUldQGOKMaqm5Ubjom7SCk
 NHze2iyWtTkUzCD6SWCVvk3O9tPmuzJrKnJjF1dH3CF0/pH5nUKMFCR+xodDvsNm6WMhOwtS9gFh2
 wd6XreUzGz84H+LS3S1C5uC7E2r0r+ohzOQzN9LjbjL7Vot4TSOaKUd0PH9kIOj/pN+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6quPZhhSSjVNxrHYo1yUBOFPnMqYYMR6YAjP7B72Ci4=; b=Gr3ExgovP1bmahjGQQp/oarkON
 cgfOzJdSxxLkMTPZRsks5V6NuqhUa6SfX3W2YvrLV4sJDcXueWvjBIBqxai9Xml6zLhCljBwzBC/u
 6oK/udfyyCQ+xdtQQEFaLwYWuYELGfeoldGPeN2HK3xCaOquXNLO7vtBGzGJDbJomqTo=;
Received: from mail-eopbgr1320070.outbound.protection.outlook.com
 ([40.107.132.70] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lMQPJ-009TOI-C5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 07:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g65HA8xyCGSyBIYASiipEq0pQfYFTVeNedG6pnd2mNjtmm/1IImXrV6Xz7w9KZQ9pBp6X7eH1p2TChN+qFSTZ4T8wxJoNFFGg4kGw2r+3BWVVvMGKI7Q1mUTgccU/6n2G3Dmr2rIkc5hy3aIeKoPDZ03q39/lt1GStp7MWUzrHRrHO6UAGuO18q7zJg0TDbpeY4k/JWyqc/+iDYrM9okgB2S1Ya4ZBIv11lsNGQK7+8XKPVBkUW8en9zhbnwJhE7OPksULnvYfYecc350quWqosGAry33GoqK5OQF4A0VQAOjFBsA3nEyYpUu7OO/SGNDjZgWdq0SErQR7d+iCIFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naFNpRwtbld7l2nderKc4k1SuX4cImd+MOi7Z4IDGxc=;
 b=kfYK+sXGxGODc8xmNB/lS0OfmUtfEo3g7t+9cw6jDIrJOJ9wa+bwM+wAQ4q2tO8cN2883vrqoTpgFSkH0H5b4lxS4JQQ9PMKf9EM/KinWZ92uSymPREKx17tLDdQutrIV7P78n//SzrZbtC/vs4bsx3hBQmPVC/5HLflQVs+5nZeYJznGrYnw8D4P95JRiWzbmHQFU+f0Zhy3gaKTT7XQgQiVZ5mXUxb5tO5MTgvLXtViPtn/e0wIq5eskgBTkbixZCLmEBi8Ww5KJyDQ9Id9Cpx0pjU6SCAvZ90tNOzH41qbbYYx1Glzq6k0Uurnnxb0yriqsaecC5Myu6OHOKjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naFNpRwtbld7l2nderKc4k1SuX4cImd+MOi7Z4IDGxc=;
 b=KAoU+11V1xLeFC5sDq2p5Qm79rI5aKFP7/dRwRpUvdxPscmJJ62fPeNEdjq+4jHWMZfmntq32Np+M2IkqtCPJeVRzaBzs4+H/esZ5c0KvYDgDPYg5uVrFUd16WXKNqviSlsqngljOjhGr57sx7KC7hsGI9gOjpAG1xwAeThVx+s=
Authentication-Results: oppo.com; dkim=none (message not signed)
 header.d=none;oppo.com; dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HKAPR02MB4290.apcprd02.prod.outlook.com (2603:1096:203:df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 07:01:17 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2%2]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 07:01:17 +0000
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <1615900522-20747-1-git-send-email-guoweichao@oppo.com>
 <88f444a3-0fc4-8b8b-4ab3-2c744fc06e01@huawei.com>
 <4bdacbe3-d220-db51-dcba-4443a83a1473@oppo.com>
 <bc15c136-7e20-289d-c1a2-65dc1bfcdf43@huawei.com>
Message-ID: <12f95749-e783-900e-e292-6154f2350330@oppo.com>
Date: Wed, 17 Mar 2021 15:01:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <bc15c136-7e20-289d-c1a2-65dc1bfcdf43@huawei.com>
X-Originating-IP: [58.252.5.72]
X-ClientProxiedBy: HKAPR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:203:d0::24) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.104.32.214] (58.252.5.72) by
 HKAPR04CA0014.apcprd04.prod.outlook.com (2603:1096:203:d0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 07:01:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7b2633a-7e23-4532-bf00-08d8e91275fd
X-MS-TrafficTypeDiagnostic: HKAPR02MB4290:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HKAPR02MB4290C55625F6FF4BB2BC24D5B66A9@HKAPR02MB4290.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tz33/K1DIu1IPie+16M2RtZ7RvAWHaeIv/Gw7qpzAmRT9WPvQOO7Xs5g2uTtcmNZnCsH13HvmoxPxrTeG/8Y1+vxYZx8aEJXMDse/mPLNuRgRv95R7HWDfgDFgTXyQpfXrjlsp3VTM863aPyLI+eGR48CQ9LNkw8AjwMXZt/WjilSW17bJF4l0rYbEWpGSt8hAtUoxQ2U83rYV3uqIt2YUzCxk0nGP1w8fkq91vhQD3ZTDpKtHkzJiNXf3/SCrnJ410nHu8RSLCW64Lov4eroMvOa5W2xpBLydIephbAD2xgrKVrqGv6PdymmjRrpqbXKPXaEt+yBzfU0MkOXGcYaF4NKkZ3ZNK5FRMw0Ovlrq0MC6gh4h/DTqIZK7IAhQlRUfLyE31MOTa1nhHZESipntxBIHA9xbq54ui6p1OqftwysWysaxdQ00Htb3YcyepekSlV3XyiG9WPufy2QggBlf3QCQt0B9fq32eYlBHxoebyptHj9BfIO7/cbBlUFG4ULV+lFy90ZvaQ4IBqQ5nScYLOSpHqtfvyBP1EPlETYu7U0E2DwCdGOyAduVb1uMfiz8tWqnS8pCrsj/QdH06tMdqgrF7z6BC/o6maKOUrHlNRvT9HB2fKaqp8BFO4of3++61b2WGEPi4R30EJwWLr40bMP/iJlqdHMrU18eEN6m0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(478600001)(5660300002)(8676002)(4326008)(66556008)(66946007)(36756003)(8936002)(52116002)(66476007)(53546011)(2906002)(107886003)(6666004)(16526019)(16576012)(26005)(83380400001)(86362001)(6486002)(31696002)(956004)(31686004)(2616005)(316002)(186003)(11606007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?QNEIkC+najI5McC4fvgobm+jgZtXYl4sRMHrIVE407qs2NUvVb/jlfBY?=
 =?Windows-1252?Q?sHPTcjOOX20v2HFLKo0Wnpv2qKS1Ij63Z5RIdBuExZ9SSGKN6TxwPV5+?=
 =?Windows-1252?Q?Ci8E4yyD/OqN/AuniO4xIclk2VbUUWEkeGuHuJYqni15iCSzNA4+NiDH?=
 =?Windows-1252?Q?/ij/7RApBcYPyattA98UIrb5uLcoasQDk23ZEqqy1htVmNs2qlYPUhQf?=
 =?Windows-1252?Q?DzPd2WmrHgTtjxmxOlHF1Q2xz+d2FtbDtVyRyxIRTrQ5tfAWr7gabJQy?=
 =?Windows-1252?Q?QVX/CQ7Y1/m0PkZKwK1XAgRRhN1sL0pLlMTbnx2dGfkNnyTYpCz7eIWI?=
 =?Windows-1252?Q?z+eUmy8B2LIyi998qF8e+MvsQ1qP6UpB2mcPjQby6Gg56Yk1dzs2Ey6R?=
 =?Windows-1252?Q?7QiKRL8NMUgIYyIOhS56QV20bq8SIHZmD4ZVK4jE106R0bKhQzGbDKb6?=
 =?Windows-1252?Q?MVilcWB7sTXZ5RasfZ9pQ7EDAY8jThVEwECP1chgwAqx77EHeutHcYc5?=
 =?Windows-1252?Q?pfC5sahY5eSf40JUfkKM64Rj84JOsOgAlLVwP7MN6sEuQO0j2q6sqgCI?=
 =?Windows-1252?Q?3uOLAAD/bw73BfmjmTh74g09gBgSkRS5x5hFE3pur3fl3GM7bhM8eMpK?=
 =?Windows-1252?Q?Mlqpe2D7SZAUgZd1uZmYNhQWP7nDGcmK7MeYsGtwE1WVId8SZFdrk7Td?=
 =?Windows-1252?Q?j++dyYpHxThsuYo3MWRod3jwpjw4tfQn0uRaYDWnvkoZxegC8izDkblB?=
 =?Windows-1252?Q?HkPFyDmPyGWXwGNAtsXXqdGfvy+GNagRfXQdFl2lSGu1wOVEmTavrSTf?=
 =?Windows-1252?Q?DSt6vmeRz0WVhmiG4nBlcVd6Nc8LWd0q0IwSVEmT93SiRYRJQVWgNFMJ?=
 =?Windows-1252?Q?YV7JH+Yfbz8CYcWUDg6A+R4mo6h9QAcot/gTw6gaKxfCewrq5QmCrPg8?=
 =?Windows-1252?Q?KYD4aSKI+S3jpLQMtvVNFM3vP4FoLwQ92rbHdunh97LZR3dQRHZ8EPfs?=
 =?Windows-1252?Q?QHsu8Zq2nHUpn7wv9NgiROK/MinqbENUCkkZ26Aoog5fIIY2oPlEzPdJ?=
 =?Windows-1252?Q?G982keNNCeJUFYmGjfpnt1W2zmQ3CNHxEZlyOIZUnnU8aXn1lD/19xd0?=
 =?Windows-1252?Q?/QvIY5jARq3sXWnmViDb1sUXJPGWUkkguhHISmYZFrwSSZHLDSBsXtqM?=
 =?Windows-1252?Q?afLnbRTmTv75zcEFzJOwzOSlkwVxQ8Fi5QCC5E5cEY/kt7+AxoBkBjHu?=
 =?Windows-1252?Q?XptcYaJeS5Aqrr1V5390E9pdNCrsVFloOCx+YyrHgjw1p8AdKXkwm94w?=
 =?Windows-1252?Q?04BrSjx2i67Pz69cXjyMCPFKfAwr3SqUbvWDSdnfehUg1let9dWA8ZTb?=
 =?Windows-1252?Q?jovdZirwYg5XYCxQGSPKKiwOrWF8rwLMu0YYW6tYHEZQh904Xhlb5Bah?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b2633a-7e23-4532-bf00-08d8e91275fd
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 07:01:17.4790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5Lxm1W4dR6wzzdnlnY/Lb1Zk8DBrg32kjnAnyhRefYmM+XYQwDGCFuz2URu9uISv4/nlhkKIqc9Z8PCPYOHqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR02MB4290
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.70 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lMQPJ-009TOI-C5
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: do not use CURSEG_ALL_DATA_ATGC in
 foreground or urgent GC
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2021/3/17 14:41, Chao Yu wrote:
> On 2021/3/17 11:44, Weichao Guo wrote:
>>
>> On 2021/3/17 10:40, Chao Yu wrote:
>>> On 2021/3/16 21:15, Weichao Guo via Linux-f2fs-devel wrote:
>>>> CURSEG_ALL_DATA_ATGC is introduced by age threshold based GC for =

>>>> better
>>>> hot/cold data seperation and avoiding free segment cost. However, LFS
>>>> write mode is preferred in the scenario of foreground or urgent GC,
>>>> which
>>>> should be finished ASAP. So, let's only use CURSEG_ALL_DATA_ATGC when
>>>> not
>>>> urgent in background GC.
>>>
>>> Weichao,
>>>
>>> select_gc_type()
>>>
>>> =A0=A0=A0=A0=A0case GC_URGENT_HIGH:
>>> =A0=A0=A0=A0=A0=A0=A0=A0 gc_mode =3D GC_GREEDY;
>>>
>>> We have selected 'greedy' algorithm rather than 'atgc' algorithm for =

>>> high
>>> urgent gc, did you mean we should use 'greedy' for low urgent gc as =

>>> well?
>>
>> Hi Chao,
>>
>> I mean in the target victim selection, we use AT_SSR mode if only
>> atgc_enabled
>>
>> regardless of the gc mode. My point is:
>
> Yup,
>
>>
>> 1. AT_SSR is good, but LFS mode is perferred in the scenario of
>> foreground GC (at least)
>>
>> & high urgent background GC, which should be finished ASAP.
>>
>> 2. For other GC scenarios using 'greedy' algorithm, I think either
>> AT_SSR or LFS mode is OK.
>>
>> Because the source victim has few valid blocks & may be not cold.
>>
>> 3. And for GC scenarios using CB/ATGC algorithm, I think AT_SSR mode is
>> better.
>
> Alright, it's fine to me to change policy like this.
>
> One more concern is, if user trigger GC_URGENT_LOW, we don't need to
> force GC to use non-AT_SSR allocation, right? as now GC_URGENT_LOW only

Chao,

I agree with you, so using non-AT_SSR in foreground GC & high urgent =

background GC?

I will send=A0 a new version of this patch later.

Thanks,

Weichao

> controls IO awareness of discard/GC thread.
>
> +=A0=A0=A0=A0=A0=A0 if (sbi->gc_mode =3D=3D GC_URGENT_LOW &&
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (type=
 =3D=3D DISCARD_TIME || type =3D=3D GC_TIME))
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return true;
>
> Thanks,
>
>>
>> Thanks,
>>
>> Weichao
>>
>>>
>>> Thanks,
>>>
>>>>
>>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>>> Signed-off-by: Huang Jianan <huangjianan@oppo.com>
>>>> ---
>>>> =A0=A0 fs/f2fs/gc.c=A0=A0=A0=A0=A0 | 3 ++-
>>>> =A0=A0 fs/f2fs/segment.c | 4 +++-
>>>> =A0=A0 2 files changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>> index 86ba8ed..ee42f6e 100644
>>>> --- a/fs/f2fs/gc.c
>>>> +++ b/fs/f2fs/gc.c
>>>> @@ -1120,7 +1120,8 @@ static int move_data_block(struct inode *inode,
>>>> block_t bidx,
>>>> =A0=A0=A0=A0=A0=A0 block_t newaddr;
>>>> =A0=A0=A0=A0=A0=A0 int err =3D 0;
>>>> =A0=A0=A0=A0=A0=A0 bool lfs_mode =3D f2fs_lfs_mode(fio.sbi);
>>>> -=A0=A0=A0 int type =3D fio.sbi->am.atgc_enabled ?
>>>> +=A0=A0=A0 int type =3D fio.sbi->am.atgc_enabled && gc_type =3D=3D BG_=
GC &&
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio.sbi->gc_mode < GC_U=
RGENT_HIGH ?
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CURSEG_ALL_DATA=
_ATGC : CURSEG_COLD_DATA;
>>>> =A0=A0 =A0=A0=A0=A0=A0 /* do not read out */
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index 32b915e..cbfb0d1 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -3264,7 +3264,9 @@ static int __get_segment_type_6(struct
>>>> f2fs_io_info *fio)
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct inode *inode =3D fio->page->mapp=
ing->host;
>>>> =A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (is_cold_data(fio->page)) {
>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (fio->sbi->am.atgc_enabled)
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (fio->sbi->am.atgc_enabled &&
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio->io_type =3D=3D FS_=
DATA_IO &&
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio->sbi->gc_mode < GC_=
URGENT_HIGH)
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return CURSEG_A=
LL_DATA_ATGC;
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return CURSEG_C=
OLD_DATA;
>>>>
>> .
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
