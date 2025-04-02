Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4ECA785BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Apr 2025 02:34:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzm3l-0008Hd-4N;
	Wed, 02 Apr 2025 00:34:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1tzm3Y-0008Gw-Aw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 00:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bk/0LcdqaEI4WvG6iz1Guz9e7ybfi2TuUEKTxWANAYE=; b=Ky6mVXz0CJBIs/ZJaMwXlP+9Wq
 0PToK20wi5IgAgMMC24k0aU4uCqCyloWdtamCovqED8cKGyp6vqXoXydo12F/PnCnDZFZdA893L38
 yYlkMR42sfO3KiEstLLmOMsZcx8qLOn9qDmChNDjxfn58UabjM0QKoMTtnL1/fvCGuuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bk/0LcdqaEI4WvG6iz1Guz9e7ybfi2TuUEKTxWANAYE=; b=NP+JFV5m1dd/z5dt0mutCDTWLG
 JJe4q6Bm8jRE/bBV0WX+6IPsL9vkyMXaou2Nrg7Ay/qpMOgTG0+88JnAtH0mValJoOGyN3q/e39bX
 oFmHsTkH/KAUWkbYdhLSsHABSU4qy1AX9ifdUFQ0HvKTbR4anfnib/6AwuCYq6vv3Wvg=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tzm3G-0007gz-3q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 00:34:11 +0000
X-AuditID: a67dfc59-03fff7000000aab6-c9-67ec85e5bf2c
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  2 Apr 2025 09:33:39 +0900
Message-ID: <20250402003340.2685-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <de99eee5-abb6-4645-b1f1-3154866f40a4@kernel.org>
References: <de99eee5-abb6-4645-b1f1-3154866f40a4@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXC9ZZnoe6z1jfpBk93sFqcnnqWyeLJ+lnM
 Fl+uXmO3uLTI3eLyrjlsDqweO2fdZffYtKqTzWP3gs9MHp83yQWwRHHZpKTmZJalFunbJXBl
 nGzfz17QnVFx93kPewPju+AuRk4OCQETiev7vzDC2Pu65zKD2GwCGhJ/envBbBEBLYmJDX+B
 arg4mAU6GSXWH/zMCuIIC2xmlPj7eiJYFYuAqsSjqXPAJvEKmEl8vv2MBWKqpsSOL+eZuhg5
 ODgF7CTOPiwBMYUEbCWWLI6BqBaUODnzCVg1s4C8RPPW2cwg4yUEetgkNp/fBnWcpMTBFTdY
 JjDyz0LSMwtJzwJGplWMIpl5ZbmJmTnGesXZGZV5mRV6yfm5mxiBIbms9k/kDsZvF4IPMQpw
 MCrx8DbwvkkXYk0sK67MPcQowcGsJMIb8fVluhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFeo2/l
 KUIC6YklqdmpqQWpRTBZJg5OqQbGZQ7FmiZvvJhbX20uK7jnGFnclf4jxWj95VnZMwttbza3
 7+U/H/g4v529VJb10ZfH4UsjD/z0eJuS76fabxzx5vAt5fjOU5Z9W289SYz+YNyUXL3XVofp
 r8vL5bW7vqYl92TLBh53v7hx7q/60MwazhY5bm7mmwe+zU+xnlYdxVmWr8iRNkmJpTgj0VCL
 uag4EQDenHrCRQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsXCNUNlju7T1jfpBnPuWFqcnnqWyeLJ+lnM
 Fl+uXmO3uLTI3eLyrjlsFhPmXmWyeL/1HqMDu8fOWXfZPTat6mTz2L3gM5PHt9seHp83yQWw
 RnHZpKTmZJalFunbJXBlnGzfz17QnVFx93kPewPju+AuRk4OCQETiX3dc5lBbDYBDYk/vb1g
 toiAlsTEhr+MXYxcHMwCnYwS6w9+ZgVxhAU2M0r8fT0RrIpFQFXi0dQ5jCA2r4CZxOfbz1gg
 pmpK7PhynqmLkYODU8BO4uzDEhBTSMBWYsniGIhqQYmTM5+AVTMLyEs0b53NPIGRZxaS1Cwk
 qQWMTKsYRTLzynITM3PM9IqzMyrzMiv0kvNzNzECg2xZ7Z9JOxi/XXY/xCjAwajEw9vA+yZd
 iDWxrLgy9xCjBAezkghvxNeX6UK8KYmVValF+fFFpTmpxYcYpTlYlMR5vcJTE4QE0hNLUrNT
 UwtSi2CyTBycUg2M9hNepoYzSG/nvvo2dts3/W8vvhSevrJzu8p5lsVHhS4drOV+nSF05sWW
 aUV/HpcePBa9lqnYf+8ymfS07AV/Uz9ErOvYkTQ9y/3oG8/md/KLEyP+XzM26Ij4sWvq/8US
 M8P23Y/T1g+pbufp8F9SyjG3XDIidMYNvsyZ+4Tv7zvBfFfpTJOtkBJLcUaioRZzUXEiAFsI
 LQ0uAgAA
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: >>>>>>>>>>>>>>>> When selecting a victim using
 next_victim_seg
 in a large >>>>>>>>>>>>>>>> section, the selected section might already have
 been >>>>>>>>>>>>>>>> cleared and designated as the new curr [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tzm3G-0007gz-3q
Subject: [f2fs-dev] [External Mail] Re: [External Mail] Re: [External Mail]
 Re: [PATCH] f2fs: prevent the current section from being selected as a
 victim during garbage collection
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
Cc: jyh429@gmail.com, linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


>>>>>>>>>>>>>>>> When selecting a victim using next_victim_seg in a large
>>>>>>>>>>>>>>>> section, the selected section might already have been
>>>>>>>>>>>>>>>> cleared and designated as the new current section,
>>>>>>>>>>>>>>>> making it actively in
>>>>>>>>> use.
>>>>>>>>>>>>>>>> This behavior causes inconsistency between the SIT and SSA.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Hi, does this fix your issue?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> This is an issue that arises when dividing a large section
>>>>>>>>>>>>>> into segments for garbage collection.
>>>>>>>>>>>>>> caused by the background GC (garbage collection) thread in
>>>>>>>>>>>>>> large section
>>>>>>>>>>>>>> f2fs_gc(victim_section) ->
>>>>>>>>>>>>>> f2fs_clear_prefree_segments(victim_section)->
>>>>>>>>>>>>>> cursec(victim_section) -> f2fs_gc(victim_section by
>>>>>>>>>>>>>> next_victim_seg)
>>>>>>>>>>>>>
>>>>>>>>>>>>> I didn't get it, why f2fs_get_victim() will return section
>>>>>>>>>>>>> which is used by curseg? It should be avoided by checking
>>>>>>>>>>>>> w/
>>>>>>> sec_usage_check().
>>>>>>>>>>>>>
>>>>>>>>>>>>> Or we missed to check gcing section which next_victim_seg
>>>>>>>>>>>>> points to during get_new_segment()?
>>>>>>>>>>>>>
>>>>>>>>>>>>> Can this happen?
>>>>>>>>>>>>>
>>>>>>>>>>>>> e.g.
>>>>>>>>>>>>> - bggc selects sec #0
>>>>>>>>>>>>> - next_victim_seg: seg #0
>>>>>>>>>>>>> - migrate seg #0 and stop
>>>>>>>>>>>>> - next_victim_seg: seg #1
>>>>>>>>>>>>> - checkpoint, set sec #0 free if sec #0 has no valid blocks
>>>>>>>>>>>>> - allocate seg #0 in sec #0 for curseg
>>>>>>>>>>>>> - curseg moves to seg #1 after allocation
>>>>>>>>>>>>> - bggc tries to migrate seg #1
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>> That's correct
>>>>>>>>>>>> In f2fs_get_victim, we use next_victim_seg to directly jump
>>>>>>>>>>>> to got_result, thereby bypassing sec_usage_check What do you
>>>>>>>>>>>> think about this change?
>>>>>>>>>>>>
>>>>>>>>>>>> @@ -850,15 +850,20 @@ int f2fs_get_victim(struct
>>>>>>>>>>>> f2fs_sb_info *sbi,
>>>>>>>>>>> unsigned int *result,
>>>>>>>>>>>>                            p.min_segno = sbi->next_victim_seg[BG_GC];
>>>>>>>>>>>>                            *result = p.min_segno;
>>>>>>>>>>>>                            sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>>>>>>>>>> -                       goto got_result;
>>>>>>>>>>>>                    }
>>>>>>>>>>>>                    if (gc_type == FG_GC &&
>>>>>>>>>>>>
>>>>>>>>>>>> sbi->next_victim_seg[FG_GC] != NULL_SEGNO)
>>>>>>> {
>>>>>>>>>>>>                            p.min_segno = sbi->next_victim_seg[FG_GC];
>>>>>>>>>>>>                            *result = p.min_segno;
>>>>>>>>>>>>                            sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>>>>>>>>>> -                       goto got_result;
>>>>>>>>>>>>                    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +               secno = GET_SEC_FROM_SEG(sbi, segno);
>>>>>>>>>>>> +
>>>>>>>>>>>> +               if (sec_usage_check(sbi, secno))
>>>>>>>>>>>> +                       goto next;
>>>>>>>>>>>> +
>>>>>>>>>>>> +               goto got_result;
>>>>>>>>>>>>            }
>>>>>>>>>>>
>>>>>>>>>>> But still allocator can assign this segment after
>>>>>>>>>>> sec_usage_check() in race condition, right?
>>>>>>>>>> Since the BG GC using next_victim  takes place after the SIT
>>>>>>>>>> update in do_checkpoint, it seems unlikely that a race
>>>>>>>>>> condition with
>>>>>>>>> sec_usage_check will occur.
>>>>>>>>>
>>>>>>>>> I mean this:
>>>>>>>>>
>>>>>>>>> - gc_thread
>>>>>>>>>    - f2fs_gc
>>>>>>>>>     - f2fs_get_victim
>>>>>>>>>      - sec_usage_check --- segno #1 is not used in any cursegs
>>>>>>>>> 					- f2fs_allocate_data_block
>>>>>>>>> 					 - new_curseg
>>>>>>>>> 					  - get_new_segment find segno #1
>>>>>>>>>
>>>>>>>>>     - do_garbage_collect
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> 						  do_checkpoint sec0 free
>>>>>>>> 						  If sec0 is not freed, then
>>>>>>> segno1 within sec0 cannot be
>>>>>>>> allocated
>>>>>>>> - gc_thread
>>>>>>>>    - f2fs_gc
>>>>>>>>     - f2fs_get_victim
>>>>>>>>      - sec_usage_check  --- segno #1 is not used in any cursegs
>>>>>>>> (but
>>>>>>>> sec0
>>>>>>> is already used)
>>>>>>>> 							-
>f2fs_allocate_data_block
>>>>>>>> 							- new_curseg
>>>>>>>> 							- get_new_segment find
>>>>>>> segno #1
>>>>>>>>
>>>>>>>>     - do_garbage_collect
>>>>>>>>
>>>>>>>> I appreciate your patch, it is under testing.
>>>>>>>> but I'm wondering if there's a risk of a race condition in this
>>>>>>>> situation
>>>>>>>
>>>>>>> Oh, yes, I may missed that get_new_segment can return a free
>>>>>>> segment in partial used section.
>>>>>>>
>>>>>>> So what do you think of this?
>>>>>>> - check CURSEG() in do_garbage_collect() and get_victim()
>>>>>>> - reset next_victim_seg[] in get_new_segment() and
>>>>>>> __set_test_and_free() during checkpoint.
>>>>>>>
>>>>>>> Thanks,
>>>>>>
>>>>>> How about using victim_secmap?
>>>>>> gc_thread
>>>>>> 				mutex_lock(&DIRTY_I(sbi)->seglist_lock);
>>>>>> 				__set_test_and_free
>>>>>> 				check cur section next_victim clear
>>>>>> 				mutex_unlock(&dirty_i->seglist_lock);
>>>>>>
>>>>>> mutex_lock(&dirty->seglist_lock);
>>>>>> f2fs_get_victim
>>>>>> mutex_unlock(&dirty_i->seglist_lock);
>>>>>>
>>>>>> static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>>>>>                 if (next >= start_segno + usable_segs) {
>>>>>>                         if (test_and_clear_bit(secno, free_i->free_secmap))
>>>>>>                                 free_i->free_sections++;
>>>>>> +
>>>>>> +                       if (test_and_clear_bit(secno, dirty_i-
>>>> victim_secmap))
>>>>>> +                               sbi->next_victim_seg[BG_GC] =
>>>>>> + NULL_SEGNO;
>>>>>
>>>>> Can this happen?
>>>>>
>>>>> segs_per_sec=2
>>>>>
>>>>> - seg#0 and seg#1 are all dirty
>>>>> - all valid blocks are removed in seg#1
>>>>> - checkpoint -> seg#1 becomes free
>>>>> - gc select this sec and next_victim_seg=seg#0
>>>>> - migrate seg#0, next_victim_seg=seg#1
>>>>> - allocator assigns seg#1 to curseg
>>>>> - gc tries to migrate seg#1
>>>
>>> I meant for above case, below change still can not catch it, right?
>>> since next_victim_seg[] was assigned after checkpoint.
>>>
>>> +	if (test_and_clear_bit(secno, dirty_i->victim_secmap))
>>> +		sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>
>>> Thanks,
>>>
>> I understood what you said.
>> It seems that without a checkpoint,
>> we won't be able to allocate seg#1 in sec0 because when requesting a
>> segment allocation, if it's not within the same section, it checks in
>> a new secmap.
>> please let me know, if there's anything I've missed
>
>Oh, I see, it always try to allocate segments sequentially in a large
>section-size image, thanks for your explanation. :)
>
>static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>{ ...
>	if (__is_large_section(sbi)) {
>...
>		return curseg->segno;
>...
>}
>
>static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
>{ ...
>	segno = __get_next_segno(sbi, type);
>	ret = get_new_segment(sbi, &segno, new_sec, pinning); ...
>}
>
>BTW, I guess it could be more efficient if we can reuse free segment in
>dirty section for conventional device.a
It might cause file fragmentation, so we should consider it
>
>> Thanks
>>
>> static int get_new_segment(struct f2fs_sb_info *sbi,
>> 			unsigned int *newseg, bool new_sec, bool pinning)
>>
>> 	if (!new_sec && ((*newseg + 1) % SEGS_PER_SEC(sbi))) {
>> 		segno = find_next_zero_bit(free_i->free_segmap,
>> 			GET_SEG_FROM_SEC(sbi, hint + 1), *newseg + 1);
>> 		if (segno < GET_SEG_FROM_SEC(sbi, hint + 1))
>> 			goto got_it;
>> 	}
>>
>> find_other_zone:
>> 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi),
>> hint);
>>
>>>>>
>>>>> Thanks,
>>>> The detailed scenario
>>>> segs_per_sec=2
>>>> - seg#0 and seg#1 are all dirty
>>>> - all valid blocks are removed in seg#1
>>>> - gc select this sec and next_victim_seg=seg#0
>>>> - migrate seg#0, next_victim_seg=seg#1
>>>> - checkpoint -> sec(seg#0, seg#1)  becomes free
>
>So, for this case, we can handle it only in checkpoint.
>
>>> +	if (test_and_clear_bit(secno, dirty_i->victim_secmap))
>>> +		sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>
>Do we need to handle sbi->next_victim_seg[FG_GC] as well?
I'll add it and submit the patch. 
Thanks.
>
>Thanks,
>
>>>> - allocator assigns sec(seg#0, seg#1) to curseg
>>>> - gc tries to migrate seg#1
>>>>>
>>>>>>                 }
>>>>>>         }
>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> IMO, we can clear next_victim_seg[] once section is free in
>>>>>>>>>>> __set_test_and_free()? something like this:
>>>>>>>>>> I will test it according to your suggestion.
>>>>>>>>>> If there are no issues, can I submit it again with the patch?
>>>>>>>>>> Thanks
>>>>>>>>>>>
>>>>>>>>>>> ---
>>>>>>>>>>>     fs/f2fs/segment.h | 13 ++++++++++---
>>>>>>>>>>>     1 file changed, 10 insertions(+), 3 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
>>>>>>>>>>> 0465dc00b349..826e37999085 100644
>>>>>>>>>>> --- a/fs/f2fs/segment.h
>>>>>>>>>>> +++ b/fs/f2fs/segment.h
>>>>>>>>>>> @@ -473,9 +473,16 @@ static inline void
>>>>>>>>>>> __set_test_and_free(struct f2fs_sb_info *sbi,
>>>>>>>>>>>     			goto skip_free;
>>>>>>>>>>>     		next = find_next_bit(free_i->free_segmap,
>>>>>>>>>>>     				start_segno + SEGS_PER_SEC(sbi),
>>>>>>> start_segno);
>>>>>>>>>>> -		if (next >= start_segno + usable_segs) {
>>>>>>>>>>> -			if (test_and_clear_bit(secno, free_i-
>>>>>> free_secmap))
>>>>>>>>>>> -				free_i->free_sections++;
>>>>>>>>>>> +		if ((next >= start_segno + usable_segs) &&
>>>>>>>>>>> +			test_and_clear_bit(secno, free_i->free_secmap))
>>>>> {
>>>>>>>>>>> +			free_i->free_sections++;
>>>>>>>>>>> +
>>>>>>>>>>> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC])
>>>>> ==
>>>>>>>>>>> +									secno)
>>>>>>>>>>> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>>>>>>>>> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC])
>>>>> ==
>>>>>>>>>>> +									secno)
>>>>>>>>>>> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>>>>>>>>>     		}
>>>>>>>>>>>     	}
>>>>>>>>>>>     skip_free:
>>>>>>>>>>> --
>>>>>>>>>>> 2.40.1
>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Because the call stack is different, I think that in order
>>>>>>>>>>>>>> to handle everything at once, we need to address it within
>>>>>>>>>>>>>> do_garbage_collect, or otherwise include it on both sides.
>>>>>>>>>>>>>> What do you think?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> [30146.337471][ T1300] F2FS-fs (dm-54): Inconsistent
>>>>>>>>>>>>>> segment
>>>>>>>>>>>>>> (70961) type [0, 1] in SSA and SIT [30146.346151][ T1300]
>>>>>>>>>>>>>> Call
>>>>>>> trace:
>>>>>>>>>>>>>> [30146.346152][ T1300]  dump_backtrace+0xe8/0x10c
>>>>>>>>>>>>>> [30146.346157][ T1300]  show_stack+0x18/0x28
>>>>>>>>>>>>>> [30146.346158][ T1300] dump_stack_lvl+0x50/0x6c
>>>>>>>>>>>>>> [30146.346161][ T1300]
>>>>>>>>>>>>>> dump_stack+0x18/0x28 [30146.346162][ T1300]
>>>>>>>>>>>>>> f2fs_stop_checkpoint+0x1c/0x3c [30146.346165][ T1300]
>>>>>>>>>>>>>> do_garbage_collect+0x41c/0x271c [30146.346167][ T1300]
>>>>>>>>>>>>>> f2fs_gc+0x27c/0x828 [30146.346168][ T1300]
>>>>>>>>>>>>>> gc_thread_func+0x290/0x88c [30146.346169][ T1300]
>>>>>>>>>>>>>> kthread+0x11c/0x164 [30146.346172][ T1300]
>>>>>>>>>>>>>> ret_from_fork+0x10/0x20
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> struct curseg_info : 0xffffff803f95e800 {
>>>>>>>>>>>>>> 	segno        : 0x11531 : 70961
>>>>>>>>>>>>>> }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> struct f2fs_sb_info : 0xffffff8811d12000 {
>>>>>>>>>>>>>> 	next_victim_seg[0] : 0x11531 : 70961 }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> https://lore.kernel.org/linux-f2fs-devel/20250325080646.3
>>>>>>>>>>>>>>> 29
>>>>>>>>>>>>>>> 19
>>>>>>>>>>>>>>> 47
>>>>>>>>>>>>>>> -2
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> chao@kernel.org
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>     fs/f2fs/gc.c | 4 ++++
>>>>>>>>>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
>>>>>>>>>>>>>>>> 2b8f9239bede..4b5d18e395eb 100644
>>>>>>>>>>>>>>>> --- a/fs/f2fs/gc.c
>>>>>>>>>>>>>>>> +++ b/fs/f2fs/gc.c
>>>>>>>>>>>>>>>> @@ -1926,6 +1926,10 @@ int f2fs_gc(struct f2fs_sb_info
>>>>>>>>>>>>>>>> *sbi, struct
>>>>>>>>>>>>>>> f2fs_gc_control *gc_control)
>>>>>>>>>>>>>>>>     		goto stop;
>>>>>>>>>>>>>>>>     	}
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> +	if (__is_large_section(sbi) &&
>>>>>>>>>>>>>>>> +			IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi,
>>> segno)))
>>>>>>>>>>>>>>>> +		goto stop;
>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>     	seg_freed = do_garbage_collect(sbi, segno,
>>>>>>>>>>>>>>>> &gc_list,
>>>>> gc_type,
>>>>>>>>>>>>>>>>     				gc_control->should_migrate_blocks,
>>>>>>>>>>>>>>>>     				gc_control->one_time);
>>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>
>>>>
>>>>
>>
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
