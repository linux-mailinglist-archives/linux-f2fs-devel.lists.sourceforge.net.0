Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62CA78964
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Apr 2025 10:00:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzt1k-0002tX-Mr;
	Wed, 02 Apr 2025 08:00:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1tzt1i-0002tQ-Un
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 08:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQnkSVlwesSiNN4H8ySXLTK3odmEoo+EewHhIwvt+Uk=; b=ejZVX5fLWzLXNaZiyQEp0YoiLV
 jH8mmNkxN8k3eQQdxfKk3tIYJPfivhPuzC8TYAItfLrZ3m0bTmlHCD9QibB5/R4hF8VRnt7zVoHck
 hDda0XVll4xzwMMsuvcwCG/WaG1nP/AxEPmQM3DAebb9uw09b6TQS8Z/cgfh2VeGkYoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KQnkSVlwesSiNN4H8ySXLTK3odmEoo+EewHhIwvt+Uk=; b=amx2xu7cbEkOlPl1yb2IsWRHZk
 CdkvbhAuFauwaQHYCrI4n+aNFgL9hOefPUyTip+7niwEuL3fVvJep2Jhjxx5KoJz8nGvJ2hvVrAsN
 rYhx+9NDXutsGLOWspLDB7Y/9XwOje20gBdjIJHhbjNkI6L7OS95V0KDxC6aFaRBmAdI=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tzt1R-0005MV-SY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 08:00:47 +0000
X-AuditID: a67dfc59-03fff7000000aab6-f3-67ecee91e7d3
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  2 Apr 2025 17:00:14 +0900
Message-ID: <20250402080015.2794-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <7440d324-03f4-44a6-b6bf-4f569c829214@kernel.org>
References: <7440d324-03f4-44a6-b6bf-4f569c829214@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsXC9ZZnke7Ed2/SDfo/81icnnqWyeLJ+lnM
 FpcWuVtc3jWHzYHFY9OqTjaP3Qs+M3l83iQXwBzFZZOSmpNZllqkb5fAldFw8jZ7wQWxivbH
 F5gbGM8IdTFyckgImEhMmzKPBcZesnonI4jNJqAh8ae3lxnEFhHQkpjY8BcszixQKtH7fBmY
 LSwQIrFsw3G2LkYODhYBVYlv05JBTF4BM4kfPU4QEzUldnw5zwRicwrYSXz9twXMFhKwlVh3
 oAFsK6+AoMTJmU9YIKbLSzRvnQ20lQuo9yurxPVdc5ghBklKHFxxg2UCI/8sJD2zkPQsYGRa
 xSiSmVeWm5iZY6xXnJ1RmZdZoZecn7uJERh6y2r/RO5g/HYh+BCjAAejEg9vA++bdCHWxLLi
 ytxDjBIczEoivEVngUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jb6VpwgJpCeWpGanphakFsFk
 mTg4pRoYE2fMTXjyJPzrf1O7B9flb8z/q7tNQ0HhyIJjxftvTN58M2JfmvqmFPsaS4V7uf9Y
 19idUSg/rmV5pIop67LppjR75mq351xzXxx1bu0oZvuy0+PefAtTpvxaX4mM6xPvOAh73sq+
 fDnLJ/x8t93ZANXvF9JjWSbFtDnxyLy32vXcVyBoffsrJZbijERDLeai4kQAnvz5WDkCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LhmqEyR3fiuzfpBt17GS1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
 t0vgymg4eZu94IJYRfvjC8wNjGeEuhg5OSQETCSWrN7JCGKzCWhI/OntZQaxRQS0JCY2/AWL
 MwuUSvQ+XwZmCwuESCzbcJyti5GDg0VAVeLbtGQQk1fATOJHjxPERE2JHV/OM4HYnAJ2El//
 bQGzhQRsJdYdaGABsXkFBCVOznzCAjFdXqJ562zmCYw8s5CkZiFJLWBkWsUokplXlpuYmWOm
 V5ydUZmXWaGXnJ+7iREYTMtq/0zawfjtsvshRgEORiUe3gbeN+lCrIllxZW5hxglOJiVRHiL
 zgKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ83qFpyYICaQnlqRmp6YWpBbBZJk4OKUaGJddeSnN
 ryPEcWmiUfqLu+a7lu96cCrmoKfqAi819ie3JM9tzGgUtu1ewTWLL0YjhHX3EV2mnv1v2UJW
 tH689qioTIqxPNQh0s3xwbRK49bpT/iObm9rm7a5tPrfvmMlVXzfyn87tQs+l7Dhr+E9wxAy
 Q3j537e7Pj6dWHWm671N8vQGvVNrriixFGckGmoxFxUnAgCqi8jCIgIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 4/2/25 08:52,
 yohan.joung wrote: >> When selecting a victim
 using next_victim_seg in a large section, the >> selected section might already
 have been cleared and designated as the >> new current s [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1tzt1R-0005MV-SY
Subject: [f2fs-dev] f2fs: prevent the current section from being selected as
 a victim during GC
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 4/2/25 08:52, yohan.joung wrote:
>> When selecting a victim using next_victim_seg in a large section, the
>> selected section might already have been cleared and designated as the
>> new current section, making it actively in use.
>> This behavior causes inconsistency between the SIT and SSA.
>>
>> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and
>> SIT Call trace:
>> dump_backtrace+0xe8/0x10c
>> show_stack+0x18/0x28
>> dump_stack_lvl+0x50/0x6c
>> dump_stack+0x18/0x28
>> f2fs_stop_checkpoint+0x1c/0x3c
>> do_garbage_collect+0x41c/0x271c
>> f2fs_gc+0x27c/0x828
>> gc_thread_func+0x290/0x88c
>> kthread+0x11c/0x164
>> ret_from_fork+0x10/0x20
>>
>> issue scenario
>> segs_per_sec=2
>> - seg#0 and seg#1 are all dirty
>> - all valid blocks are removed in seg#1
>> - gc select this sec and next_victim_seg=seg#0
>> - migrate seg#0, next_victim_seg=seg#1
>> - checkpoint -> sec(seg#0, seg#1)  becomes free
>> - allocator assigns sec(seg#0, seg#1) to curseg
>> - gc tries to migrate seg#1
>>
>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/segment.h | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h index
>> 0465dc00b349..14d18bcf3559 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -460,6 +460,7 @@ static inline void __set_test_and_free(struct
>f2fs_sb_info *sbi,
>>  		unsigned int segno, bool inmem)
>>  {
>>  	struct free_segmap_info *free_i = FREE_I(sbi);
>> +	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>>  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>>  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>>  	unsigned int next;
>> @@ -476,6 +477,11 @@ static inline void __set_test_and_free(struct
>f2fs_sb_info *sbi,
>>  		if (next >= start_segno + usable_segs) {
>>  			if (test_and_clear_bit(secno, free_i->free_secmap))
>>  				free_i->free_sections++;
>> +
>> +			if (test_and_clear_bit(secno, dirty_i->victim_secmap))
>{
>> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
>> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>
>sbi->next_victim_seg[FG_GC] relies on sbi->cur_victim_sec?
right  
>
>If sbi->next_victim_seg[BG_GC] is not equal to secno, will we still need to
>nullify sbi->next_victim_seg[BG_GC]?
Changed to remove only when equal
>
>We have cleared bit in victim_secmap after we tag a section as prefree,
>right?
You are right 
change victim_secmap to not be used
In the end, I think I'll have to do this to directly compare segno, 
as you suggested.
I tested this and it worked fine.

Thanks
>
>- locate_dirty_segment
> - __locate_dirty_segment
> - __remove_dirty_segment
>  - clear_bit(GET_SEC_FROM_SEG(sbi, segno), dirty_i->victim_secmap);
>
>Thanks,
>
>> +			}
>>  		}
>>  	}
>>  skip_free:



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
