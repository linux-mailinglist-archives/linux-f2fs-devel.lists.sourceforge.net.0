Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA4B5914C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 10:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qV/NlraMWVjEqHORhpF8zmV3ctzL7LmsQ2pjGn5rMnQ=; b=Ij99TqAtqbm9Hbkhf1lorGgDNW
	q5UPEU08+0KF28gzZX+yEENDC3zn3gQUr5fr1TIdyyXrCQt0PTP/UfjNMx1uJTQekRyo0zAgrBncJ
	zHMmv88lwqcMhuGI/MajLCTB6nVhiHOlEvIRJxQMGx3axmF2hEq1DgkQ++krxg7mgkEM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyRNv-0001nd-UG;
	Tue, 16 Sep 2025 08:49:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uyRNu-0001nT-CC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 08:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PdEBUIh7wao5nxH5oPh3HO2bc+Azn2L1+kW4FVe3zxM=; b=eYdgJ1HP8vNn+fSuvbtlldmLSj
 udurCxirfcrWjtrQOVGIvqqRvEWCLO4mfZfZwOMGSE5IZB40yaWhQS3YW61r9MzXlJNXMdKMdz5Qv
 OeZF3O4o0QpcLGNZmtwTNKonPwxuhcaHGT3bRSOhSqIkr5XvXwK0D3iqW5J2EkAZv2WI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PdEBUIh7wao5nxH5oPh3HO2bc+Azn2L1+kW4FVe3zxM=; b=XmjUeLQp2AluwxkNrZcgyn8R1h
 pMYEY1CwP4fbVpOGHXkA81xzJNAOKJz19P6r1guXmGQIJU4aDiOLJrvXvNPPfF42khq7mAzDvEWnY
 1ijzh9EOFFQx8E7dlaAR6gptkZVyeQoXI0svkE8K3rNKvz9zgEXaQlTrmQBW+MIJU22o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyRNt-0008Gz-R2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 08:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A949401F0;
 Tue, 16 Sep 2025 08:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA543C4CEF7;
 Tue, 16 Sep 2025 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758012587;
 bh=XT//xB5BsnRO7b9jA3tUjxJE+zfdPQurSrN5Zvz4B3Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BJgZut2qAlkxZAS9VUYSV1hQA79kL0GWqKpx93cvtyqS77qm8TSmM5IFpozAzjO7w
 9hM2deFeG+FD7ueKaDc9Smr5NfpUn2I41xzEC6mrMepmEV/m8e3xduBFYphwebj0YM
 a1HI+zTsSeuVXnSJFxFnmiJ2aVhPJVGlqaT5e0euwQ2+SbbaBRRORnte3CBX16yKvA
 Fnubac0uwSkAxthvRiJZ5GN16uLHhuscLnhPa4FjfckbsrKfc7PDNtwshOCtQxqOVG
 wFycZFmgC4FKr1dnwbrkdOUxis4ttb70dg2R3tsqi+zuGijKs6lysSc0GT3cYT0bLi
 2uw9ObTw3oA8Q==
Message-ID: <71872583-0d81-48a4-a148-184963a24fd4@kernel.org>
Date: Tue, 16 Sep 2025 16:49:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>
References: <62d7f4d3-cc9c-429f-8b7e-0e80e2aa24e4@kernel.org>
 <20250916082636.237935-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250916082636.237935-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/16/25 16:26, wangzijie wrote: >> On 9/16/25 15:09,
 wangzijie
 wrote: >>>> On 9/16/25 13:22, wangzijie wrote: >>>>>> On 09/15, wangzijie
 wrote: >>>>>>> When we get wrong extent info data, and look [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyRNt-0008Gz-R2
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix infinite loop in
 __insert_extent_tree()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/16/25 16:26, wangzijie wrote:
>> On 9/16/25 15:09, wangzijie wrote:
>>>> On 9/16/25 13:22, wangzijie wrote:
>>>>>> On 09/15, wangzijie wrote:
>>>>>>> When we get wrong extent info data, and look up extent_node in rb tree,
>>>>>>> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by
>>>>>>> return NULL.
>>>>>>
>>>>>> This is the exact buggy case which we should fix the original one. Have
>>>>>> you seen this error? In that case, can we consider writing some kernel
>>>>>> message and handle the error properly?
>>>>>
>>>>> Hi Jaegeuk,
>>>>> The original one is the bug I mentioned in the first patch of this patch set
>>>>> ("f2fs: fix zero-sized extent for precache extents"). 
>>>>
>>>> Zijie,
>>>>
>>>> Did you suffer this problem in product? right?
>>>
>>> Hi Chao,
>>> Yes, and I can confirm that infinite loop cases I suffered are caused by the bug I
>>> mentioned in the first patch of this patch set. But I'm not sure if there are
>>> other cases that can cause this infinite loop.
>>>
>>>>>
>>>>> When we use a wrong extent_info(zero-sized) to do update, and there exists a
>>>>> extent_node which has same fofs as the wrong one, we will skip "invalidate all extent
>>>>> nodes in range [fofs, fofs + len - 1]"(en->ei.fofs = end = tei->fofs + tei->len = tei->fofs),
>>>>> which cause the infinite loop in __insert_extent_tree().
>>>>>
>>>>> So we can add f2fs_bug_on() when there occurs zero-sized extent
>>>>> in f2fs_update_read_extent_cache_range(), and give up this zero-sized
>>>>> extent update to handle other unknown buggy cases. Do you think this will be better?
>>>>>
>>>>> And do we need to solve this infinite loop?
>>>>
>>>> IMO, it's worth to end such loop if there is any corrupted extent in rbtree to
>>>> avoid kernel hang, no matter it is caused by software bug or hardware flaw
>>>> potentially.
>>>>
>>>> Thanks,
>>>
>>> And do you think we need this?
>>> "add f2fs_bug_on() when there occurs zero-sized extent in f2fs_update_read_extent_cache_range(),
>>> and give up this zero-sized extent update to handle other unknown buggy cases".
>>
>> Oh, I was testing below patch..., does this what you want to do?
>>
>> I think we can keep all your patches, and appending below patch to detect any
>> potential cases who will update a zero-sized extent.
>>
>> >From 439d61ef3715fafa5c9f2d1b7f8026cdd2564ca7 Mon Sep 17 00:00:00 2001
>> From: Chao Yu <chao@kernel.org>
>> Date: Tue, 16 Sep 2025 11:52:30 +0800
>> Subject: [PATCH] f2fs: add sanity check on ei.len in
>> __update_extent_tree_range()
>>
>> Add a sanity check in __update_extent_tree_range() to detect any
>> zero-sized extent update.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> fs/f2fs/extent_cache.c | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>> index 199c1e7a83ef..9544323767be 100644
>> --- a/fs/f2fs/extent_cache.c
>> +++ b/fs/f2fs/extent_cache.c
>> @@ -664,6 +664,15 @@ static void __update_extent_tree_range(struct inode *inode,
>> 	if (!et)
>> 		return;
>>
>> +	if (unlikely(len == 0)) {
>> +		f2fs_bug_on(sbi, 1);
>> +		f2fs_err_ratelimited(sbi, "%s: extent len is zero, type: %d, "
>> +			"extent [%u, %u, %u], age [%llu, %llu]",
>> +			__func__, type, tei->fofs, tei->blk, tei->len,
>> +			tei->age, tei->last_blocks);
>> +		return;
>> +	}
>> +
>> 	if (type == EX_READ)
>> 		trace_f2fs_update_read_extent_tree_range(inode, fofs, len,
>> 						tei->blk, 0);
>> -- 
>> 2.49.0
> 
> Yes, that's exactly what I want to do.
> Maybe we should relocate f2fs_bug_on()?
> 
> 	if (unlikely(len == 0)) {
> 		f2fs_err_ratelimited(sbi, "%s: extent len is zero, type: %d, "
> 			"extent [%u, %u, %u], age [%llu, %llu]",
> 			__func__, type, tei->fofs, tei->blk, tei->len,
> 			tei->age, tei->last_blocks);
> 		f2fs_bug_on(sbi, 1);
> 		return;
> 	}

Yeah, looks better.

I don't see any problem in my test, will send a formal patch, let me add
Signed-off-by of you if you don't mind. :)

Thanks,

> 
>>>
>>>
>>>
>>>>>
>>>>>
>>>>>>>
>>>>>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>>>>>> ---
>>>>>>>  fs/f2fs/extent_cache.c | 1 +
>>>>>>>  1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>>>>>> index 199c1e7a8..6ed6f3d1d 100644
>>>>>>> --- a/fs/f2fs/extent_cache.c
>>>>>>> +++ b/fs/f2fs/extent_cache.c
>>>>>>> @@ -605,6 +605,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>>>>>>>  			leftmost = false;
>>>>>>>  		} else {
>>>>>>>  			f2fs_bug_on(sbi, 1);
>>>>>>> +			return NULL;
>>>>>>>  		}
>>>>>>>  	}
>>>>>>>  
>>>>>>> -- 
>>>>>>> 2.25.1
>>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
