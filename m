Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA032B454D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Sep 2019 03:42:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iA2Vw-0006wB-PF; Tue, 17 Sep 2019 01:42:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iA2Vu-0006w4-Vr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Sep 2019 01:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MOp8lD6PqppcpemLwr7LftJTUKqcsWrYliH5KGEA75Q=; b=mQ1BYI0PjIe9+KOvI8WO64GDvD
 98ldOPU1fiZkAsimh4OB4K2VWfBZhT/ojwZGbmTq7BjBt0s3SexNooTZFBaULbqoPdXwO08bUn6sf
 RpLPvyKuzKjipoUDrqFf0vAm73nulrcA+X2mf1+Is/EriEdBbiQ4nTXkOljU70mOgXsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MOp8lD6PqppcpemLwr7LftJTUKqcsWrYliH5KGEA75Q=; b=LbGerFAsYUacbjuMQCuF/E8Mo0
 ZuCrWbsnZblarVfJ19HQ3kqHuCOLSbCEmwpvPzZMed8hF3rRK4wqvZVfbLg2MYs0Ake5xKsBpsnGW
 VCrDgqasJAjNHnwJ/SWeSHJ6cuqCOPrRwgmxyEAMZ/aX9ly7KRhAPm0K8PCb1YSKJmEI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1iA2Vt-008JiT-3Q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Sep 2019 01:42:42 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2CBF6CCC4611D44823A1;
 Tue, 17 Sep 2019 09:42:34 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 17 Sep
 2019 09:42:33 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
 <20190909080654.GD21625@jaegeuk-macbookpro.roam.corp.google.com>
 <97237da2-897a-8420-94de-812e94aa751f@huawei.com>
 <20190909120443.GA31108@jaegeuk-macbookpro.roam.corp.google.com>
 <27725e65-53fe-5731-0201-9959b8ef6b49@huawei.com>
 <20190916153736.GA2493@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ab9561c9-db27-2967-e6fc-accd9bc58747@huawei.com>
Date: Tue, 17 Sep 2019 09:42:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190916153736.GA2493@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iA2Vt-008JiT-3Q
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: do not select same victim right
 again
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

On 2019/9/16 23:37, Jaegeuk Kim wrote:
> On 09/16, Chao Yu wrote:
>> On 2019/9/9 20:04, Jaegeuk Kim wrote:
>>> On 09/09, Chao Yu wrote:
>>>> On 2019/9/9 16:06, Jaegeuk Kim wrote:
>>>>> On 09/09, Chao Yu wrote:
>>>>>> On 2019/9/9 9:25, Jaegeuk Kim wrote:
>>>>>>> GC must avoid select the same victim again.
>>>>>>
>>>>>> Blocks in previous victim will occupy addition free segment, I doubt after this
>>>>>> change, FGGC may encounter out-of-free space issue more frequently.
>>>>>
>>>>> Hmm, actually this change seems wrong by sec_usage_check().
>>>>> We may be able to avoid this only in the suspicious loop?
>>>>>
>>>>> ---
>>>>>  fs/f2fs/gc.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>>> index e88f98ddf396..5877bd729689 100644
>>>>> --- a/fs/f2fs/gc.c
>>>>> +++ b/fs/f2fs/gc.c
>>>>> @@ -1326,7 +1326,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>>>>>  		round++;
>>>>>  	}
>>>>>  
>>>>> -	if (gc_type == FG_GC)
>>>>> +	if (gc_type == FG_GC && seg_freed)
>>>>
>>>> That's original solution Sahitya provided to avoid infinite loop of GC, but I
>>>> suggest to find the root cause first, then we added .invalid_segmap for that
>>>> purpose.
>>>
>>> I've checked the Sahitya's patch. So, it seems the problem can happen due to
>>> is_alive or atomic_file.
>>
>> For some conditions, this doesn't help, for example, two sections contain the
>> same fewest valid blocks, it will cause to loop selecting them if it fails to
>> migrate blocks.
>>
>> How about keeping it as it is to find potential bug.
> 
> I think it'd be fine to merge this. Could you check the above scenario in more
> detail?

I haven't saw this in real scenario yet.

What I mean is if there is a bug (maybe in is_alive()) failing us to GC on one
section, when that bug happens in two candidates, there could be the same
condition that GC will run into loop (select A, fail to migrate; select B, fail
to migrate, select A...).

But I guess the benefit of this change is, if FGGC fails to migrate block due to
i_gc_rwsem race, selecting another section and later retrying previous one may
avoid lock race, right?

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>  		sbi->cur_victim_sec = NULL_SEGNO;
>>>>>  
>>>>>  	if (sync)
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
