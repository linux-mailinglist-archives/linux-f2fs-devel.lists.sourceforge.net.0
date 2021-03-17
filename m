Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA0433E9FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Mar 2021 07:42:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMPsf-0004w1-8z; Wed, 17 Mar 2021 06:42:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lMPsd-0004vZ-Dv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 06:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p/1kz9ksQl+vWL7mk381zfNwnDKsnNSc5s5rCqhwP8M=; b=UvFfrtV0h/MzcgVVGIxQ5udlk9
 r4MRpw5KptLFbwYlwie899hE4Yp2+ihYQXnn5pUuGzPwDjDQw4P/EqiahzeofzVxcDeab+8vx4n7l
 3gzOZCZKqbEmYdb8KR5NwdcojHaTtuTSsuztyGe+yzr726EkrKX4bnD9tEctWAxWLCcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p/1kz9ksQl+vWL7mk381zfNwnDKsnNSc5s5rCqhwP8M=; b=XQ9zNswDMs84iHbaTVjJ0eDZZ2
 LD5bSI4jzxEcLdyrB0m7/j4HR+JS7zn2tU0vyZZCANQu0pxi8O2uQrzUHNTBUZ5Sdt3HGPP/UPqdk
 LN8wvnEEcYd8i7EOqCogJo5dxtjLO4dyandHyhvMPLGrq8XfqdKy+XttpE6QAQ+tIEpo=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lMPsX-009Rgr-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 06:42:07 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F0gVh73KvzmY6y;
 Wed, 17 Mar 2021 14:39:24 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 17 Mar
 2021 14:41:43 +0800
To: Weichao Guo <guoweichao@oppo.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <1615900522-20747-1-git-send-email-guoweichao@oppo.com>
 <88f444a3-0fc4-8b8b-4ab3-2c744fc06e01@huawei.com>
 <4bdacbe3-d220-db51-dcba-4443a83a1473@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bc15c136-7e20-289d-c1a2-65dc1bfcdf43@huawei.com>
Date: Wed, 17 Mar 2021 14:41:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4bdacbe3-d220-db51-dcba-4443a83a1473@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lMPsX-009Rgr-Jd
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
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/17 11:44, Weichao Guo wrote:
> =

> On 2021/3/17 10:40, Chao Yu wrote:
>> On 2021/3/16 21:15, Weichao Guo via Linux-f2fs-devel wrote:
>>> CURSEG_ALL_DATA_ATGC is introduced by age threshold based GC for better
>>> hot/cold data seperation and avoiding free segment cost. However, LFS
>>> write mode is preferred in the scenario of foreground or urgent GC,
>>> which
>>> should be finished ASAP. So, let's only use CURSEG_ALL_DATA_ATGC when
>>> not
>>> urgent in background GC.
>>
>> Weichao,
>>
>> select_gc_type()
>>
>>  =A0=A0=A0=A0case GC_URGENT_HIGH:
>>  =A0=A0=A0=A0=A0=A0=A0 gc_mode =3D GC_GREEDY;
>>
>> We have selected 'greedy' algorithm rather than 'atgc' algorithm for high
>> urgent gc, did you mean we should use 'greedy' for low urgent gc as well?
> =

> Hi Chao,
> =

> I mean in the target victim selection, we use AT_SSR mode if only
> atgc_enabled
> =

> regardless of the gc mode. My point is:

Yup,

> =

> 1. AT_SSR is good, but LFS mode is perferred in the scenario of
> foreground GC (at least)
> =

> & high urgent background GC, which should be finished ASAP.
> =

> 2. For other GC scenarios using 'greedy' algorithm, I think either
> AT_SSR or LFS mode is OK.
> =

> Because the source victim has few valid blocks & may be not cold.
> =

> 3. And for GC scenarios using CB/ATGC algorithm, I think AT_SSR mode is
> better.

Alright, it's fine to me to change policy like this.

One more concern is, if user trigger GC_URGENT_LOW, we don't need to
force GC to use non-AT_SSR allocation, right? as now GC_URGENT_LOW only
controls IO awareness of discard/GC thread.

+       if (sbi->gc_mode =3D=3D GC_URGENT_LOW &&
+                       (type =3D=3D DISCARD_TIME || type =3D=3D GC_TIME))
+               return true;

Thanks,

> =

> Thanks,
> =

> Weichao
> =

>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>> Signed-off-by: Huang Jianan <huangjianan@oppo.com>
>>> ---
>>>  =A0 fs/f2fs/gc.c=A0=A0=A0=A0=A0 | 3 ++-
>>>  =A0 fs/f2fs/segment.c | 4 +++-
>>>  =A0 2 files changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index 86ba8ed..ee42f6e 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1120,7 +1120,8 @@ static int move_data_block(struct inode *inode,
>>> block_t bidx,
>>>  =A0=A0=A0=A0=A0 block_t newaddr;
>>>  =A0=A0=A0=A0=A0 int err =3D 0;
>>>  =A0=A0=A0=A0=A0 bool lfs_mode =3D f2fs_lfs_mode(fio.sbi);
>>> -=A0=A0=A0 int type =3D fio.sbi->am.atgc_enabled ?
>>> +=A0=A0=A0 int type =3D fio.sbi->am.atgc_enabled && gc_type =3D=3D BG_G=
C &&
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio.sbi->gc_mode < GC_UR=
GENT_HIGH ?
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CURSEG_ALL_DATA_AT=
GC : CURSEG_COLD_DATA;
>>>  =A0 =A0=A0=A0=A0=A0 /* do not read out */
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 32b915e..cbfb0d1 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -3264,7 +3264,9 @@ static int __get_segment_type_6(struct
>>> f2fs_io_info *fio)
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 struct inode *inode =3D fio->page->mapping=
->host;
>>>  =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (is_cold_data(fio->page)) {
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (fio->sbi->am.atgc_enabled)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (fio->sbi->am.atgc_enabled &&
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio->io_type =3D=3D FS_D=
ATA_IO &&
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fio->sbi->gc_mode < GC_U=
RGENT_HIGH)
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return CURSEG_ALL_=
DATA_ATGC;
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 else
>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return CURSEG_COLD=
_DATA;
>>>
> .
> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
