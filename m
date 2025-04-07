Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C1A7D209
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Apr 2025 04:11:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u1bxY-0001a3-J4;
	Mon, 07 Apr 2025 02:11:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u1bxW-0001Zu-VE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SmcoSygrKD50UW107whqXmL8PZ2pwDre2ZLocb0kdf0=; b=Z1caNADNHQ/+TkHJA9CnD37yYQ
 wAbEMBJQU9qKnJ6vSf/VgBE4XDPrIcxnvGfZul3vmwrJ5sS/WdKHeBnxth26A29x5Y/QT7vRg79Ie
 mkYFPoJor3GgkAV8WAwOebcHYYyEA8sDQKSDtgBsqfJrugFMzLNfwedVaJyuiCtCXkT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SmcoSygrKD50UW107whqXmL8PZ2pwDre2ZLocb0kdf0=; b=kVUaVBdOSyVwZqbGrU604n+JPm
 LAY+yNgsZx2AjjI/fXa0QTXRBmx3ieWH38MCpKUTq6QZq5fEv94cOe5fMF0mPrthoGz+BOCGRh+TK
 y6uhBJG+UAJaGc9+uVvgoBQtzNp9dY6Mguq7vGLNzBCjs9ZbfVX+IQabh2gIl5kSRZpc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1bxH-0005dl-Lp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 02:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 505D2A44D7D;
 Mon,  7 Apr 2025 02:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F73C4CEE3;
 Mon,  7 Apr 2025 02:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743991873;
 bh=DU2v1Weg3kqbG34VlRjX5pwsMXKz6VDkV0AjhbIo3fY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sMr+NpO7Kv1pPnomvFzVvSJ7uuWF6cslbsJW/pPoaR7xQH5Ms5/bc16oFY1TPDDZ9
 6Qc8ZTX+rVi2o6W862HD6PXV1QruDs69HAsm6PqU43nIIX2ONTEIm5UQtBcxjGbT0M
 CpGBQBAKqeqy86+xk6wWdV5Bp+MMGqe2NcpJ3jXBFCuoTyUJHH8oImwc8Xz7N3dBCz
 nVqKF/85R/FIHKgr+DZbAku0DgyDLkA97hpmYbhVEiFryLBXvKvCAAM5d4S2RGCgaV
 bIUtVFj1FvdYAnAT2xQnD3qROpf73zIl1A5IOfI9q93ME7ej0RUFXROaJu1/nTq5kn
 0BL9asl2YrFIg==
Message-ID: <87056483-6cf8-4b2e-82f1-dcda31a28afd@kernel.org>
Date: Mon, 7 Apr 2025 10:11:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250403232107.2960-1-yohan.joung@sk.com>
 <Z_A5SWl1ueMTZxV0@google.com>
 <7059eada-a51d-4f68-b62a-0f2c89c9b01c@kernel.org>
Content-Language: en-US
In-Reply-To: <7059eada-a51d-4f68-b62a-0f2c89c9b01c@kernel.org>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/7/25 10:08, Chao Yu wrote: > On 4/5/25 03:55, Jaegeuk
 Kim wrote: >> Hi Yohan, >> >> I modified this patch after applying the clean
 up by >> >> https://lore.kernel.org/linux-f2fs-devel/20250404195 [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u1bxH-0005dl-Lp
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

On 4/7/25 10:08, Chao Yu wrote:
> On 4/5/25 03:55, Jaegeuk Kim wrote:
>> Hi Yohan,
>>
>> I modified this patch after applying the clean up by
>>
>> https://lore.kernel.org/linux-f2fs-devel/20250404195442.413945-1-jaegeuk@kernel.org/T/#u
>>
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -486,6 +486,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>
>>         free_i->free_sections++;
>>
>> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>> +               sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>> +       if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>> +               sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

Oh, can we add Fixes line to make it to be merged into stable kernel?

Thanks,

> 
> Thanks,
> 
>> +
>>  unlock_out:
>>         spin_unlock(&free_i->segmap_lock);
>>  }
>>
>> On 04/04, yohan.joung wrote:
>>> When selecting a victim using next_victim_seg in a large section, the
>>> selected section might already have been cleared and designated as the
>>> new current section, making it actively in use.
>>> This behavior causes inconsistency between the SIT and SSA.
>>>
>>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
>>> Call trace:
>>> dump_backtrace+0xe8/0x10c
>>> show_stack+0x18/0x28
>>> dump_stack_lvl+0x50/0x6c
>>> dump_stack+0x18/0x28
>>> f2fs_stop_checkpoint+0x1c/0x3c
>>> do_garbage_collect+0x41c/0x271c
>>> f2fs_gc+0x27c/0x828
>>> gc_thread_func+0x290/0x88c
>>> kthread+0x11c/0x164
>>> ret_from_fork+0x10/0x20
>>>
>>> issue scenario
>>> segs_per_sec=2
>>> - seg#0 and seg#1 are all dirty
>>> - all valid blocks are removed in seg#1
>>> - gc select this sec and next_victim_seg=seg#0
>>> - migrate seg#0, next_victim_seg=seg#1
>>> - checkpoint -> sec(seg#0, seg#1)  becomes free
>>> - allocator assigns sec(seg#0, seg#1) to curseg
>>> - gc tries to migrate seg#1
>>>
>>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>> ---
>>>  fs/f2fs/segment.h | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>>> index 0465dc00b349..0773283babfa 100644
>>> --- a/fs/f2fs/segment.h
>>> +++ b/fs/f2fs/segment.h
>>> @@ -474,8 +474,15 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>>>  		next = find_next_bit(free_i->free_segmap,
>>>  				start_segno + SEGS_PER_SEC(sbi), start_segno);
>>>  		if (next >= start_segno + usable_segs) {
>>> -			if (test_and_clear_bit(secno, free_i->free_secmap))
>>> +			if (test_and_clear_bit(secno, free_i->free_secmap)) {
>>>  				free_i->free_sections++;
>>> +
>>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[BG_GC]) == secno)
>>> +					sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>>> +
>>> +				if (GET_SEC_FROM_SEG(sbi, sbi->next_victim_seg[FG_GC]) == secno)
>>> +					sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>>> +			}
>>>  		}
>>>  	}
>>>  skip_free:
>>> -- 
>>> 2.33.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
