Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA2A83827
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 07:15:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2kG6-0008BK-AE;
	Thu, 10 Apr 2025 05:15:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u2kFq-0008Az-RA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZH+yjw5up1iLJ6Hv9Xx8GbvZYtqi0UyX9Cs67uPL/5o=; b=KCdCOyTJXcg08PTrtQ7Rv80IsE
 tNsBipAkvWRA8PWzGLR813oHz0vrxT/AhUFPaK0ZzXUKBVMZlaq2/hNTd1IYWrvunNCkuaNlh082X
 fSAs3BaCMsqnjbTUcYmiUI9/FGre+EuS6Bt8vkS6IOLZpDns2zlXWPKmzpdAk5rWs0C4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZH+yjw5up1iLJ6Hv9Xx8GbvZYtqi0UyX9Cs67uPL/5o=; b=mMIPaFtBOD60ZyWWirt12uIaVx
 1VNVo5YRHozzZLC8fpVqeG+f2pVrU7+taqCRPvIWz5251gLY12TZbPWZedj1mD+nKKTxKmYLvsKJU
 KQhQZ/j6TR4Oalw6GTZpQ04+iXzuZ/MuGTeZSceELYZYRuurljvhIghG5s3L0F9YXv0c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2kFa-00062h-Ex for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 05:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F38F4A173;
 Thu, 10 Apr 2025 05:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21B6C4CEDD;
 Thu, 10 Apr 2025 05:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744262088;
 bh=G9IDuBFDNO/tescOQZOemu/xYi/kWE+EXfWWY74ELwQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OkYQuCENg97JbS/51rEpKAxtGkfiMmQv973Nkc7YN+cUlNAskwdtkx/V/buarYBgc
 U9vQsRDJaIUPQ8LNKTg388nL0bKR9u+2E6gImGT6VEceJ/SWQ2eV4LfpKaQo+WJY4Q
 VWOCAFMPiNU3jAGEQDARsv/VnPQcxxNslyIUaTaVutMrdf1lZsCY/YkyMMWuQ+By+j
 fkxdUCKMp4ZkdGJFTI09J3e79pncjDWhAS7PkzloBww0BUsEE95MvgYNrlgDviu+I1
 OfBcWHw4cILNyzzuBqNR82XaF9z45JuCv41ubJwIgEFcNIZmLDQ+K8hiVtlz0d5ljM
 VyyjFTik1eWLA==
Message-ID: <46dbee1d-c1e9-414c-9f7f-8060bc2f9030@kernel.org>
Date: Thu, 10 Apr 2025 13:14:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250403232107.2960-1-yohan.joung@sk.com>
 <Z_A5SWl1ueMTZxV0@google.com>
 <7059eada-a51d-4f68-b62a-0f2c89c9b01c@kernel.org>
 <87056483-6cf8-4b2e-82f1-dcda31a28afd@kernel.org>
 <Z_dAo3uD1jKraegq@google.com>
Content-Language: en-US
In-Reply-To: <Z_dAo3uD1jKraegq@google.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/10/25 11:53, Jaegeuk Kim wrote: > On 04/07,
 Chao Yu wrote:
 >> On 4/7/25 10:08, Chao Yu wrote: >>> On 4/5/25 03:55, Jaegeuk Kim wrote:
 >>>> Hi Yohan, >>>> >>>> I modified this patch after applying [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u2kFa-00062h-Ex
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: prevent the current section from
 being selected as a victim during GC
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/10/25 11:53, Jaegeuk Kim wrote:
> On 04/07, Chao Yu wrote:
>> On 4/7/25 10:08, Chao Yu wrote:
>>> On 4/5/25 03:55, Jaegeuk Kim wrote:
>>>> Hi Yohan,
>>>>
>>>> I modified this patch after applying the clean up by
>>>>
>>>> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
>>>>
>>>> --- a/fs/f2fs/segment.h
>>>> +++ b/fs/f2fs/segment.h
>>>> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>>>
>>>>         free_i->free_sections++;
>>>>
>>>> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>>>> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>>>> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>
>>> Reviewed-by: Chao Yu <chao@kernel.org>
>>
>> Oh, can we add Fixes line to make it to be merged into stable kernel?
> 
> Which one would be good to add?

I guess this one:

Fixes: e3080b0120a1 ("f2fs: support subsectional garbage collection")

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> Thanks,
>>>
>>>> +
>>>>  unlock_out:
>>>>         spin_unlock(&free_i->segmap_lock);
>>>>  }
>>>>
>>>> On 04/04, yohan.joung wrote:
>>>>> When selecting a victim using next_victim_seg in a large section, the
>>>>> selected section might already have been cleared and designated as the
>>>>> new current section, making it actively in use.
>>>>> This behavior causes inconsistency between the SIT and SSA.
>>>>>
>>>>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
>>>>> Call trace:
>>>>> dump_backtrace+0xe8/0x10c
>>>>> show_stack+0x18/0x28
>>>>> dump_stack_lvl+0x50/0x6c
>>>>> dump_stack+0x18/0x28
>>>>> f2fs_stop_checkpoint+0x1c/0x3c
>>>>> do_garbage_collect+0x41c/0x271c
>>>>> f2fs_gc+0x27c/0x828
>>>>> gc_thread_func+0x290/0x88c
>>>>> kthread+0x11c/0x164
>>>>> ret_from_fork+0x10/0x20
>>>>>
>>>>> issue scenario
>>>>> segs_per_sec=2
>>>>> - seg#0 and seg#1 are all dirty
>>>>> - all valid blocks are removed in seg#1
>>>>> - gc select this sec and next_victim_seg=seg#0
>>>>> - migrate seg#0, next_victim_seg=seg#1
>>>>> - checkpoint -> sec(seg#0, seg#1)  becomes free
>>>>> - allocator assigns sec(seg#0, seg#1) to curseg
>>>>> - gc tries to migrate seg#1
>>>>>
>>>>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>>> ---
>>>>>  fs/f2fs/segment.h | 9 ++++++++-
>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>>>>> index 0465dc00b349..0773283babfa 100644
>>>>> --- a/fs/f2fs/segment.h
>>>>> +++ b/fs/f2fs/segment.h
>>>>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>>>>  		next = find_next_bit(free_i->free_segmap,
>>>>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
>>>>>  		if (next >= start_segno + usable_segs) {
>>>>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
>>>>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
>>>>>  				free_i->free_sections++;
>>>>> +
>>>>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>>>>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>>>> +
>>>>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>>>>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>>>> +			}
>>>>>  		}
>>>>>  	}
>>>>>  skip_free:
>>>>> -- 
>>>>> 2.33.0
>>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
