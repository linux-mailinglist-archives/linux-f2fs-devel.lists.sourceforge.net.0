Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB821AD9C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:41:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjv8-0006CY-1g; Fri, 10 Jul 2020 03:41:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jtjv5-0006CN-UX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oR/tWBzZ6mA9HMtqRLLm/EDdbE16zxa/5Jg0ucBiRWY=; b=MHq149uEv6PpCzM8FhGE+rz2dv
 vtc/UJwAhmvITNr/pVGLs75t748W2TfR4to320qAPDqv3H0T8CzfcDbNJMyhpHDh9A+u5mwIVoLFq
 M8eFy7jsgmsklyXdYOGIkqIF6MZ2PKDr2CTi4MLyffN/KT1IyhOWa7muOZYC1j4Xy0Sk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oR/tWBzZ6mA9HMtqRLLm/EDdbE16zxa/5Jg0ucBiRWY=; b=MLsq9+N3+tOFk/pr/ybdJq2bqc
 clvK/zlXITtVQWN4tnRGUU1qhdiXzgYawphzS9okx6FrdeWZFbjDwosVUl2UzeLt35lliqGqcDKkd
 xavmf9hTzR2VCFs/JAAHnXWYPasgAsdNCorGEGC6cuh+NksipscMn5mflgC7AsEWE5vE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtjv4-001b9I-Ej
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:41:51 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D1C9AD50D3901E4563EC;
 Fri, 10 Jul 2020 11:41:36 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 10 Jul
 2020 11:41:32 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200709053027.351974-1-jaegeuk@kernel.org>
 <2f4207db-57d1-5b66-f1ee-3532feba5d1f@huawei.com>
 <20200709190545.GA3001066@google.com>
 <ae1a3e8a-6209-8d4b-7235-5c8897076501@huawei.com>
 <20200710032616.GC545837@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <01d0db54-eee1-f6cd-76c3-ebe59a7abae4@huawei.com>
Date: Fri, 10 Jul 2020 11:41:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200710032616.GC545837@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtjv4-001b9I-Ej
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't skip writeback of quota data
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/10 11:26, Jaegeuk Kim wrote:
> On 07/10, Chao Yu wrote:
>> On 2020/7/10 3:05, Jaegeuk Kim wrote:
>>> On 07/09, Chao Yu wrote:
>>>> On 2020/7/9 13:30, Jaegeuk Kim wrote:
>>>>> It doesn't need to bypass flushing quota data in background.
>>>>
>>>> The condition is used to flush quota data in batch to avoid random
>>>> small-sized udpate, did you hit any problem here?
>>>
>>> I suspect this causes fault injection test being stuck by waiting for inode
>>> writeback completion. With this patch, it has been running w/o any issue so far.
>>> I keep an eye on this.
>>
>> Hmmm.. so that this patch may not fix the root cause, and it may hiding the
>> issue deeper.
>>
>> How about just keeping this patch in our private branch to let fault injection
>> test not be stuck? until we find the root cause in upstream codes.
> 
> Well, I don't think this hides something. When the issue happens, I saw inodes
> being stuck due to writeback while only quota has some dirty data. At that time,
> there was no dirty data page from other inodes.

Okay,

> 
> More specifically, I suspect __writeback_inodes_sb_nr() gives WB_SYNC_NONE and
> waits for wb_wait_for_completion().

Did you record any callstack after the issue happened?

Still I'm confused that why directory's data written could be skipped, but
quota's data couldn't, what's the difference?

> 
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>  fs/f2fs/data.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>> index 44645f4f914b6..72e8b50e588c1 100644
>>>>> --- a/fs/f2fs/data.c
>>>>> +++ b/fs/f2fs/data.c
>>>>> @@ -3148,7 +3148,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>>>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>>>>>  		goto skip_write;
>>>>>  
>>>>> -	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
>>>>> +	if (S_ISDIR(inode->i_mode) &&
>>>>>  			wbc->sync_mode == WB_SYNC_NONE &&
>>>>>  			get_dirty_pages(inode) < nr_pages_to_skip(sbi, DATA) &&
>>>>>  			f2fs_available_free_memory(sbi, DIRTY_DENTS))
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
