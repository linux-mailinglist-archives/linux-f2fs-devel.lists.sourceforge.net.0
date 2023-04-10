Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750B6DC775
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 15:53:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plrxL-0008MQ-R4;
	Mon, 10 Apr 2023 13:53:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plrxK-0008MC-LB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 13:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7IjlcpX2/Yv5c+wHLxJ5k8LiVyvP2Y6HlvOQiYpJPeM=; b=BOzHt66QtaFiGrko9Fldo30Q5w
 mmxUnpZvAvs3r5yK9g3n8M+dGfJOcTFkJUtVTLvZgNbUBSXgv7FA+ZxzmRnQH2tMLT49Jfv4DHMeg
 lbgDOEL2YJVgHMA+hd6E8+ZUnJRAbX76bLLj9BpS7GW3UHIPfoKr9vwXwdDo/or7rI/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7IjlcpX2/Yv5c+wHLxJ5k8LiVyvP2Y6HlvOQiYpJPeM=; b=FcaL/c7xYqm8IX4BMk1Ve9iXrJ
 mqKJ7rAIZxN4tbYnhaUuZOGpRm/2z0pqxTnBKrWlKUxk0LJRTOof/2f65/DCt6bkVOONfWA/9IaRQ
 xfKKNp1KWV/4bh09bSE1yWy2E4GVtw9qB9ITEOCAoc3i3Uej+zTtjCprOMC7EfSE79RM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plrxD-002wIr-TY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 13:53:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3D9E60ED8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 13:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861BCC433D2;
 Mon, 10 Apr 2023 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681134777;
 bh=MiBRI1IjJJKvf3dOcpSwiYgL1iNNZCu/5VtsQEm9a1Q=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=khoEVsj5SJ+iGxEz4qgNP57tIqNFyTUdFKRgnRszpdrkbit+r+E0sSSUuiwc/0qbf
 XqtwtXWF75to1/+aQjRmgf16yaY8DqJhrjHpDcIDFYXfyxwIpNdddTV4PffGZ1uzRW
 3F2i/HEf7o+MlvKnUvjQr56DyxtZ1Qayv2lskB2gr54+rxfJCHeJ87el/Ub5jQ5E/t
 nR9xhoAA1Ajuug6/RbuhACpYWtcQ2JO8tQxOcDF6MPO5cLCNVmGJ9ueKRTaU+xKm93
 f9D7EaGHUjG3AHbN65LvE44rAOiXwLpLw24TvoQt7RoZ5t0WR3OX783FtzHT51wpmt
 SBO3gESRtT/Sw==
Message-ID: <f4ae2b3a-0aff-8941-4081-9dc53334c590@kernel.org>
Date: Mon, 10 Apr 2023 21:52:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230324071028.336982-1-chao@kernel.org>
 <ZCyZGgf4RSEjyHTF@google.com>
 <a4e49177-3959-eb2b-996c-5d07b7390495@kernel.org>
 <ZC2aA+i5+HpdJ6M2@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZC2aA+i5+HpdJ6M2@google.com>
X-Spam-Score: -8.4 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/5 23:55, Jaegeuk Kim wrote: > On 04/05, Chao Yu
 wrote: >> On 2023/4/5 5:39, Jaegeuk Kim wrote: >>> Can we do like this? >>>
 >>> From 9a58f0e59364241aa31b555cfe793d278e39b0dc Mon Sep 17 00:00 [...] 
 Content analysis details:   (-8.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plrxD-002wIr-TY
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to trigger a checkpoint in the end
 of foreground garbage collection
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/5 23:55, Jaegeuk Kim wrote:
> On 04/05, Chao Yu wrote:
>> On 2023/4/5 5:39, Jaegeuk Kim wrote:
>>> Can we do like this?
>>>
>>>   From 9a58f0e59364241aa31b555cfe793d278e39b0dc Mon Sep 17 00:00:00 2001
>>> From: Jaegeuk Kim <jaegeuk@kernel.org>
>>> Date: Tue, 4 Apr 2023 14:36:00 -0700
>>> Subject: [PATCH] f2fs: do checkpoint when there's not enough free sections
>>>
>>> We didn't do checkpoint in FG_GC case, which may cause losing to reclaim prefree
>>> sctions in time.
>>>
>>> Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>    fs/f2fs/gc.c | 24 +++++++++++-------------
>>>    1 file changed, 11 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index 56c53dbe05c9..f1d0dd9c5a6c 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1806,6 +1806,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>>    	};
>>>    	unsigned int skipped_round = 0, round = 0;
>>>    	unsigned int upper_secs;
>>> +	bool stop_gc = false;
>>>    	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
>>>    				gc_control->nr_free_secs,
>>> @@ -1876,19 +1877,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>>    				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
>>>    		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
>>>    			goto go_gc_more;
>>> -		goto stop;
>>> -	}
>>> -
>>> -	/* FG_GC stops GC by skip_count */
>>> -	if (gc_type == FG_GC) {
>>> +		stop_gc = true;
>>
>> I guess below condition is for emergency recycle of prefree segments during
>> foreground GC, in order to avoid exhausting free sections due to to many
>> metadata allocation during CP.
>>
>> 	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
>> 				prefree_segments(sbi)) {
>>
>> But for common case, free_sections() is close to reserved_segments(), and
>> upper_secs + NR_GC_CHECKPOINT_SECS value may be far smaller than free_sections(),
>> so checkpoint may not be trggered as expected, IIUC.
>>
>> So it's fine to just trigger CP in the end of foreground garbage collection?
> 
> My major concern is to avoid unnecessary checkpointing given multiple FG_GC
> requests were pending in parallel. And, I don't want to add so many combination
> which gives so many corner cases, and feel f2fs_gc() needs to call checkpoint
> automatically in the worst case scenario only.

Alright.

> 
> By the way, do we just need to call checkpoint here including FG_GC as well?

I didn't get it, do you mean?

- f2fs_balance_fs()
  - f2fs_gc() creates prefree segments but not call checkpoint to reclaim

- f2fs_balance_fs()
  - f2fs_gc()
   - detect prefree segments created by last f2fs_balance_fs, then call
f2fs_write_checkpoint to reclaim

Or could you please provide a draft patch? :-P

Thanks,

> 
> 1832
> 1833         if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
> 1834                 /*
> 1835                  * For example, if there are many prefree_segments below given
> 1836                  * threshold, we can make them free by checkpoint. Then, we
> 1837                  * secure free segments which doesn't need fggc any more.
> 1838                  */
> 1839                 if (prefree_segments(sbi)) {
> 1840                         ret = f2fs_write_checkpoint(sbi, &cpc);
> 1841                         if (ret)
> 1842                                 goto stop;
> 1843                 }
> 1844                 if (has_not_enough_free_secs(sbi, 0, 0))
> 1845                         gc_type = FG_GC;
> 1846         }
> 
>>
>> One other concern is for those path as below:
>> - disable_checkpoint
>> - ioc_gc
>> - ioc_gc_range
>> - ioc_resize
>> ...
> 
> I think the upper caller should decide to call checkpoint, if they want to
> reclaim the prefree likewise f2fs_disable_checkpoint.
> 
>>
>> We've passed gc_type as FG_GC, but the demand here is to migrate block in time,
>> rather than dirtying blocks, and callers don't expect checkpoint in f2fs_gc(),
>> instead the callers will do the checkpoit as it needs.
>>
>> That means it's better to decouple FG_GC and write_checkpoint behavior, so I
>> added another parameter .reclaim_space to just let f2fs_balance_fs() to trigger
>> checkpoit in the end of f2fs_gc().
> 
>>
>> Thanks,
>>
>>> +	} else if (gc_type == FG_GC) {
>>> +		/* FG_GC stops GC by skip_count */
>>>    		if (sbi->skipped_gc_rwsem)
>>>    			skipped_round++;
>>>    		round++;
>>>    		if (skipped_round > MAX_SKIP_GC_COUNT &&
>>> -				skipped_round * 2 >= round) {
>>> -			ret = f2fs_write_checkpoint(sbi, &cpc);
>>> -			goto stop;
>>> -		}
>>> +				skipped_round * 2 >= round)
>>> +			stop_gc = true;
>>>    	}
>>>    	__get_secs_required(sbi, NULL, &upper_secs, NULL);
>>> @@ -1901,12 +1898,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>>    				prefree_segments(sbi)) {
>>>    		ret = f2fs_write_checkpoint(sbi, &cpc);
>>>    		if (ret)
>>> -			goto stop;
>>> +			stop_gc = true;
>>>    	}
>>>    go_gc_more:
>>> -	segno = NULL_SEGNO;
>>> -	goto gc_more;
>>> -
>>> +	if (!stop_gc) {
>>> +		segno = NULL_SEGNO;
>>> +		goto gc_more;
>>> +	}
>>>    stop:
>>>    	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
>>>    	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
