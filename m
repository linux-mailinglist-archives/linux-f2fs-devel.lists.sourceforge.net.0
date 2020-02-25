Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035016B7B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 03:24:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Pth-0004SU-89; Tue, 25 Feb 2020 02:24:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6Ptg-0004SI-83
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 02:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ie0rcHKBUPKzmY7gNw3Dru1ib6rsWNijTWDguKZGKqs=; b=L9FPv2au5BvBPsx4+KxPbfKx2x
 0/pdsSSJrvooUM1vv5fYiy+WnOblEKEhyFmL5N3pLqaukjfg19PeKdKHy3ciCacXUld2pRVw8hDTV
 nrXIfJ5JhJw4z38HHgff5fps97kXYyFrXvGB1DoyGsvg5x9uPMVY+uNq5yBBpxwx8TfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ie0rcHKBUPKzmY7gNw3Dru1ib6rsWNijTWDguKZGKqs=; b=C1TV2uouWhKTmo5ZT9XGgFXWCe
 8VSRn3tWb++swB559atRriBjPSQ20xClKTcA/E3F36mHhz8glKUX0K2S3pPOD1SuzTZ5fHgNcBx3c
 +nallC8u3uuYhzEYFN6EkNUfG4AQmKqm0SgetHrWVNJly3jQafzYkHvVG8PtMJuOfeDU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Pte-0097ew-5i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 02:24:32 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C865638C72DDFA78731F;
 Tue, 25 Feb 2020 10:24:20 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 25 Feb
 2020 10:24:17 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200214185855.217360-1-jaegeuk@kernel.org>
 <20200214185855.217360-3-jaegeuk@kernel.org>
 <9c497f3e-3399-e4a6-f81c-6c4a1f35e5bb@huawei.com>
 <20200218232714.GB10213@google.com>
 <117a927f-7128-b5a1-a961-22934bb62ec5@huawei.com>
 <20200219030425.GA102063@google.com>
 <266f233b-e084-cccd-d07e-96d8438d5b74@huawei.com>
 <20200224215341.GB77839@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <141fb1b0-b527-1ef8-0fce-dcdf0170a987@huawei.com>
Date: Tue, 25 Feb 2020 10:24:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200224215341.GB77839@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6Pte-0097ew-5i
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: skip migration only when BG_GC is
 called
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/2/25 5:53, Jaegeuk Kim wrote:
> On 02/19, Chao Yu wrote:
>> On 2020/2/19 11:04, Jaegeuk Kim wrote:
>>> On 02/19, Chao Yu wrote:
>>>> On 2020/2/19 7:27, Jaegeuk Kim wrote:
>>>>> On 02/17, Chao Yu wrote:
>>>>>> On 2020/2/15 2:58, Jaegeuk Kim wrote:
>>>>>>> FG_GC needs to move entire section more quickly.
>>>>>>>
>>>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>>>> ---
>>>>>>>  fs/f2fs/gc.c | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>>>>> index bbf4db3f6bb4..1676eebc8c8b 100644
>>>>>>> --- a/fs/f2fs/gc.c
>>>>>>> +++ b/fs/f2fs/gc.c
>>>>>>> @@ -1203,7 +1203,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>>>>>>>  
>>>>>>>  		if (get_valid_blocks(sbi, segno, false) == 0)
>>>>>>>  			goto freed;
>>>>>>> -		if (__is_large_section(sbi) &&
>>>>>>> +		if (gc_type == BG_GC && __is_large_section(sbi) &&
>>>>>>>  				migrated >= sbi->migration_granularity)
>>>>>>
>>>>>> I knew migrating one large section is a more efficient way, but this can
>>>>>> increase long-tail latency of f2fs_balance_fs() occasionally, especially in
>>>>>> extreme fragmented space.
>>>>>
>>>>> FG_GC requires to wait for whole section migration which shows the entire
>>>>> latency.
>>>>
>>>> That will cause long-tail latency for single f2fs_balance_fs() procedure,
>>>> which it looks a very long hang when userspace call f2fs syscall, so why
>>>> not splitting total elapsed time into several f2fs_balance_fs() to avoid that.
>>>
>>> Then, other ops can easily make more dirty segments. The intention of FG_GC is
>>
>> Yup, that's a problem, if there are more dirty datas being made, reserved segments
>> may be ran out during FG_GC.
>>
>>> to block everything and make min. free segments as a best shot.
>>
>> I just try to simulate write GC's logic in FTL to mitigate single op's max latency,
>> otherwise benchmark looks hang during FG_GC (in a 500mb+ section).

Oh, if we want to FG_GC only migrate on segment on time, it needs to change
has_not_enough_free_secs() condition as well, so previous logic is broken.

Nvm, please add:

Reviewed-by: Chao Yu <yuchao0@huawei.com>

> 
> Hmm, I think we may need to think another way like doing BG_GC more aggressively.

Agreed, I guess SMR scenario may need such policy: higher trigger frequency on bggc
when free space decreases, but less block migration for each bggc cycle.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>>>  			goto skip;
>>>>>>>  		if (!PageUptodate(sum_page) || unlikely(f2fs_cp_error(sbi)))
>>>>>>>
>>>>> .
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
