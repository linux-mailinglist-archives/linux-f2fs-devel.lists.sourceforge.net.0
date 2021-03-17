Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941F33E7D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Mar 2021 04:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:Date:Message-ID:
	References:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7tGxI7ekHjUTGwnd8NEvhV32CesQy35AUdSyKm//40=; b=lg09O/JzyNHgTl6lTYIfXQTknb
	6evapDYp2id1osV9QtRTmI1/rDG4Xl/Ql4d4Zhp/PAFf/SrFr0yWrrJWVGGTRQXSdcVBKv6KW2yg5
	d6hPFYKtJizrFFV4dXGngLeghYnGTz/EgwPZzdx0MwLvEUr2a6QdEo2mps8Bscx3tB2k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMN7O-0004Pz-AR; Wed, 17 Mar 2021 03:45:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1lMN7A-0004Nv-Sd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 03:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h14bKMOQBNLCQzyIY4IdU0QBPaALy4bJops0QLCnyqE=; b=G8AfiaqVp/JTYzZf2V5UIIUbw2
 uw+FPn9B8LLCEnuUU1MYPcw5L5v42es9R7HtSMD6mjjjVyV7y0RANsidNAPPx+QyMJE4niFDcfmnc
 Z8DiK6sSrH2ha0Whpg0QyMaAldv79zXpJZld1tCG7BZ2FBzBkuTv/Nuo9C71apn98/eU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h14bKMOQBNLCQzyIY4IdU0QBPaALy4bJops0QLCnyqE=; b=ka2h8+UaiqdyOLIZqPBnKC6JMJ
 PNg4N6gcwZtVe4xYaT5JJYCvn9N5O5QAwhtW/sNPMsB8e9odiefpND8j+f/uLkoifBgmnskeFOC5x
 mbHFI5bG5xosKYT2PAuF/nHaVQL/qD3+NdW/O/Y7HdvbTnQmeznKnoBVZzdagXhxwAeU=;
Received: from mail-eopbgr1320057.outbound.protection.outlook.com
 ([40.107.132.57] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lMN75-00028Y-LW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 03:44:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bv6Xs2AZSlGtt/pJ+bJ6BtRAD2f1sPQP/vfjl1oJAtGWmFuLWFgWQxqnLjHCoBl9I+3Qljh4tM4OMy39O4gJw5ALFzo7Ic94tP4ugNDKOCE7AJT8mR5flBl5ej9Ay95YdI2D7AimVksH+DqzZkutZOuRqUkpAB33vPWL+jFepN1OBQdgcmTBckaIidogUNeA8mnMYZcIYXv/B70qnbbvaiMlsbw5aORwuknF/Ulapq9QiQvEtNbZM97xzf+hC+yYcADjDOPtuYcNQvhuelg4SzEEdizu2PBSZ1k7eFc+Bt91mKmJ4nArr4meoHIbWWsMFJ5lkXOjKIray1SpTZHTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIlShN/N1pApuZAVuJH1rTZJsK3GZwwKIDrL7F5htRA=;
 b=m8HuIUJHRudj2u2jConhGPzqtms0dlXaA5fJe6xCBOssa+aRUiih5abCVmtHSN81lUK8SYx0qzRUaf6Wxkm+sYANsJBavh7tmCKH5zDkZ8aV9K97f4Fh2Izbe/te/RRVayDdB7R1eNMFIL83lGRqcnEqQv98r0AjwbhpZhOZ4p2JNwT7bR4079ttbYX5zo3SzKg04cRiMxZkNDyNRHJjXzDxXFPG6kzWox5qg2K11gkGv/EzUJDgcvG9mQYlnaw8zCqevyM14Umip8e/LMgi3P9zud9ReavMSnKaYhgAGGVqk4YXfngIe3EfMSV14E473o1xH/6HrHmpfZtX3hRYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIlShN/N1pApuZAVuJH1rTZJsK3GZwwKIDrL7F5htRA=;
 b=hQxpz8LdfeVUk9Agk/8OFFL6siqG/KqF0cYRtNmCbaOWE6AI3t1AI6ztXiBHOKz7jlje+sej7pajlMAoD/r5IwkTEtbNYXpRmHlLvrYb5YcC7ZJCAfgGIHTy5jOmHTpM3XiXJBjlsB62cvMlyBSoiY/VVp9BTGGRSbK3DX4jn+w=
Authentication-Results: oppo.com; dkim=none (message not signed)
 header.d=none;oppo.com; dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK2PR0201MB2257.apcprd02.prod.outlook.com (2603:1096:202:6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 03:44:39 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2%2]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 03:44:38 +0000
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org, chao@kernel.org
References: <1615900522-20747-1-git-send-email-guoweichao@oppo.com>
 <88f444a3-0fc4-8b8b-4ab3-2c744fc06e01@huawei.com>
Message-ID: <4bdacbe3-d220-db51-dcba-4443a83a1473@oppo.com>
Date: Wed, 17 Mar 2021 11:44:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <88f444a3-0fc4-8b8b-4ab3-2c744fc06e01@huawei.com>
X-Originating-IP: [58.252.5.74]
X-ClientProxiedBy: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.119.35.139] (58.252.5.74) by
 HK2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:202::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.9 via Frontend Transport; Wed, 17 Mar 2021 03:44:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53ad49b1-be23-4f58-1afe-08d8e8f6fd4e
X-MS-TrafficTypeDiagnostic: HK2PR0201MB2257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR0201MB22571821B5970D601024FD36B66A9@HK2PR0201MB2257.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96/oz2Vf7DDIq30EErbZJc1LEjXDzS+ZgJ/wPWIKeHJLREEdXmIc+RGgOsjTl6DrMcC/0ONt6+FE/BO9eX28NRxV/62WAxIFikwJYvj8Me4W35n6Mwz8no+iykvjEwsKHa0ueV0MPx0Z5iVE1Fevv/d8aDIKE+SKPZNHWtF0LkLz3whsv0K0FqmhFKTwyhvuG6hoHAil6Yq4O/dSyx/gbdm2ReaR4FUxvYHxpNJ3Wile5xAAdgxrckge1z/rbKfuYU8CwszoQZhco/HZt/U6cbKbaSzs9C2a9T37RKmmAyvgMLRYL+35wC4uieqfEupGPryLlImY6UE49E4atrXTW/KVXAYBqAHaUnOL0AsY35/+FKFYmuYsTqTbemj3KJVcHV7eGoPSSKVfnbFEuRyMLogH4NtGdkWQwMeMsKwY4qljRWNPlFSfbRxoPKZ+vzH2HipefGEA6q21xv4A1wTvxZh2O2gAM0kQDkNh7EiRncvK0H516gq7Avu5nxEJcTRJ+m9pC+TdeP+naO62iOiDAdzBXtU2Sa8cz+5Ea3I22h3b889JtjZRuLs4WQArYZCDURMbwA8Vku+eDzK1M/4ODgHxeSGUyr69zHZ6tDpVeb2zOkEErMmI4RBT0c+tql1qdJ18SAYLy6V84DL9H3jdAXcuAkUergmSNU19WqRfXoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(6486002)(26005)(86362001)(52116002)(316002)(53546011)(16526019)(2906002)(16576012)(5660300002)(186003)(956004)(66476007)(66946007)(31686004)(66556008)(36756003)(107886003)(8676002)(31696002)(8936002)(478600001)(2616005)(4326008)(83380400001)(11606007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?3HNoqUKK3dXdAScnx+yZZLP1tsVtyOUAyNzKoEhxvhldKg38SrN8V3a/?=
 =?Windows-1252?Q?3TOyDC7M+GZJuoGawZefKPYx90GFWbghSmF4MDN0w2YKzGqmH1BWcJrx?=
 =?Windows-1252?Q?D6g9jd54GH82vFxpcCbnSOX5UhoZDUuwUVqTvzhTMPycT/QuOtONTWr1?=
 =?Windows-1252?Q?KeVwJWnbUlQ1vMlzy3bG3qHaR6okEAfcXYphJ9S3usckmlALLWvzA2JP?=
 =?Windows-1252?Q?/R0GpWGSTO5zqMarRu6ugFqgkPLkO4ACLapFJFseJKoYt7kkXHeMsugp?=
 =?Windows-1252?Q?l429aF0clz4afaw2tJsvPQ1+lSoP4MOxfYdVuebCiWgfdL46TwH+xTva?=
 =?Windows-1252?Q?qpsovHtmCsSZTAXQLXcpUhwbdJMOnoooAd1qksvYVfqeRxb7hQmAiNLl?=
 =?Windows-1252?Q?XV3nn5GxqASmKH779ESEjgq+7Pg/9o5R2hpqe4biSPslzk6tgaEzMKUr?=
 =?Windows-1252?Q?p60cZu1kuQ6wrNoJ3RmlzWhBKgc0za1AklMvRzfJfTI31+VwkkppX/1S?=
 =?Windows-1252?Q?4O+MVrBw9CKxJMi+jpUr8YdsSTU1fVcybJWKcvDkb28qVKD6ERiU4G+/?=
 =?Windows-1252?Q?JX/FrkxBumnwg2UT7Zva+GgCOHBsRG60a9E4dEtLmIA1RTio0bj2Jz41?=
 =?Windows-1252?Q?vWy8XLtNykIuAV6QCNYoJN1C2flK8OXMXC4RGIcXqy+S4QFyfrsh0jOZ?=
 =?Windows-1252?Q?Pt3UsR8SjNvu3mzfBVSlZVwcI7jcxDOWbi+4d/9+AddBO7Fi+1PA2QMz?=
 =?Windows-1252?Q?pM1S5qeXgtoxnHMpuSwwIK0B4GFOx0vcvPaXVlktoVk9pRuI3CBmm7u8?=
 =?Windows-1252?Q?J8zteeyYLggGvlflqX8GgATqPk+sKn6gsjXKUQYjEuaxuyO8qRw1X8Q+?=
 =?Windows-1252?Q?U+laT/QV5oITQbJIjU6oUF8DDEAV6rdBwzGAfQOkpnrIhw/z83Nu6ZIC?=
 =?Windows-1252?Q?NWM/5k5LyjS/L+kSJISmJiaSfZXErLXQTArQxDfJtVkPoPVqpvWYEXZ5?=
 =?Windows-1252?Q?g1G50qy2c/np8WbFr8rrwy1CUFLhg8yIq66oL1Cw4xv9TiTbkRSWyRrM?=
 =?Windows-1252?Q?g7w8vljzy6hFPK8GdwKXzDej2mihCp1oQiAg0aGh8hr5A/r+NfbMx1hD?=
 =?Windows-1252?Q?NkCusfZmb5RsIx5u8HRp87f+89BIYlDJKJP8g8kA9IK4Yb2XzwBXhb9T?=
 =?Windows-1252?Q?JgcYLjlae4bQN8wNfuV3qVrKFppxKWy7Lwo9p/bc1/gsB0oOaxT6ka7d?=
 =?Windows-1252?Q?gd6TTh6ktEhlVpwpUnDtWaLuTEyOZaT6WGs7L0jI8S3CCBKGvhamf9Om?=
 =?Windows-1252?Q?8nXdHmBycWqrcuQqnm5YL3eja3dnud3jGgjG0LrO6efyBmnwdngM152u?=
 =?Windows-1252?Q?y4adXcgI57hxf0PZqhHD24cvASzS5fJ43012OqVVq2yPoFxTUR1SHbFC?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ad49b1-be23-4f58-1afe-08d8e8f6fd4e
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 03:44:38.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7YhtfwwMTavnBnvnTwNxcbO8KIVI+25vDEkbtFlA9ALP48WlnnUk4JNg2+DEwMlPmsCGWgMJ4gOD1kHHtMFgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0201MB2257
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.57 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lMN75-00028Y-LW
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


On 2021/3/17 10:40, Chao Yu wrote:
> On 2021/3/16 21:15, Weichao Guo via Linux-f2fs-devel wrote:
>> CURSEG_ALL_DATA_ATGC is introduced by age threshold based GC for better
>> hot/cold data seperation and avoiding free segment cost. However, LFS
>> write mode is preferred in the scenario of foreground or urgent GC, =

>> which
>> should be finished ASAP. So, let's only use CURSEG_ALL_DATA_ATGC when =

>> not
>> urgent in background GC.
>
> Weichao,
>
> select_gc_type()
>
> =A0=A0=A0=A0case GC_URGENT_HIGH:
> =A0=A0=A0=A0=A0=A0=A0 gc_mode =3D GC_GREEDY;
>
> We have selected 'greedy' algorithm rather than 'atgc' algorithm for high
> urgent gc, did you mean we should use 'greedy' for low urgent gc as well?

Hi Chao,

I mean in the target victim selection, we use AT_SSR mode if only =

atgc_enabled

regardless of the gc mode. My point is:

1. AT_SSR is good, but LFS mode is perferred in the scenario of =

foreground GC (at least)

& high urgent background GC, which should be finished ASAP.

2. For other GC scenarios using 'greedy' algorithm, I think either =

AT_SSR or LFS mode is OK.

Because the source victim has few valid blocks & may be not cold.

3. And for GC scenarios using CB/ATGC algorithm, I think AT_SSR mode is =

better.

Thanks,

Weichao

>
> Thanks,
>
>>
>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>> Signed-off-by: Huang Jianan <huangjianan@oppo.com>
>> ---
>> =A0 fs/f2fs/gc.c=A0=A0=A0=A0=A0 | 3 ++-
>> =A0 fs/f2fs/segment.c | 4 +++-
>> =A0 2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 86ba8ed..ee42f6e 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1120,7 +1120,8 @@ static int move_data_block(struct inode *inode, =

>> block_t bidx,
>> =A0=A0=A0=A0=A0 block_t newaddr;
>> =A0=A0=A0=A0=A0 int err =3D 0;
>> =A0=A0=A0=A0=A0 bool lfs_mode =3D f2fs_lfs_mode(fio.sbi);
>> -=A0=A0=A0 int type =3D fio.sbi->am.atgc_enabled ?
>> +=A0=A0=A0 int type =3D fio.sbi->am.atgc_enabled && gc_type =3D=3D BG_GC=
 &&
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio.sbi->gc_mode < GC_URG=
ENT_HIGH ?
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CURSEG_ALL_DATA_ATGC=
 : CURSEG_COLD_DATA;
>> =A0 =A0=A0=A0=A0=A0 /* do not read out */
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 32b915e..cbfb0d1 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3264,7 +3264,9 @@ static int __get_segment_type_6(struct =

>> f2fs_io_info *fio)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 struct inode *inode =3D fio->page->mapping->=
host;
>> =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (is_cold_data(fio->page)) {
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (fio->sbi->am.atgc_enabled)
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (fio->sbi->am.atgc_enabled &&
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio->io_type =3D=3D FS_DA=
TA_IO &&
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio->sbi->gc_mode < GC_UR=
GENT_HIGH)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return CURSEG_ALL_DA=
TA_ATGC;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return CURSEG_COLD_D=
ATA;
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
