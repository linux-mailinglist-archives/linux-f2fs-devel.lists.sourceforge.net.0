Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6019FCF0AA4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 07:28:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTdUhyV/SSejPyHJdekjgAMqFM6hXQgqGRykDVcKiEE=; b=TvrlELgAfuc3F04HuX9z5v+oap
	gfaQSueK0eEd/pqFa2nPu53EybwD0l1QYpsdmLif/FnHoPhimwww8EzyKJwfWUWqlthuWT+vdinIl
	TsOWaJRqObZZ7bLvyNK9aer1lXNvUHBa+5vJa+8tYbwhMbTnDvDNmIuIc6EtMRlGSIPM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcHb0-0002pX-VR;
	Sun, 04 Jan 2026 06:28:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcHaz-0002pQ-Nr
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 06:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+L7rVWgHmYVichT2KJNdVaYriC3Z0K1quYrPysOQH8=; b=ISrAg8i8HPe4y2z8nUD3Ka3AYX
 TpjyB0DGEDIfWO/v+keJ0DCeHDv41+wxhGvvDVlpYHoZszlj9J7jokmqWNByxl+he8Ebq6FHr+JaA
 lCP+ZQqQElpHXNGePc5Cd5bY3rn8+E4Q9kyyzbiXhym0uSmyOfG7qMEGckD5scGlCoFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5+L7rVWgHmYVichT2KJNdVaYriC3Z0K1quYrPysOQH8=; b=ET8E/bUZ4cL6d7Kk3q0VzMbF81
 HtAACvsjC7V6ir610xp+o/sVu4fk66VvRny1R1cxdUVhw9tMkMYBR3tkRuI1FfaAthlWcRbZO0arE
 FbBw42txh3ia4SSPp3dazYA+WnMN480G1X6KND4udvTdetFZT+KI3/BV5Xrq2jhzDdBQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcHay-0004Ja-MW for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 06:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D599429F4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 06:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12702C4CEF7;
 Sun,  4 Jan 2026 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767508083;
 bh=GVimFxRzs7Xf/8ktPlU2Hj7ZpW9EAeSv/yjpvKjyXZU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bgJaKzQA6jOTy+w05kJf+UnILNWpdJtevZJi0d5WIOAOzdLcad/7Y8SoxblJ6jBDE
 U8CEdZ/rudU2QIWtGp2862b0dgqG5FQJqc6fc8a8U+rRPIOsYQm99rh7sEC11xEwlu
 qpNBvg8CUvxsbEF+EYsXVsOTMDjEN9HDhxRgjsAaVjYeToH4/I4+tPiPKQMbexPOCz
 W+Dnkhhm5liQu/zo2xEd3/0dmqWiWqwUi4/20WB5bblVqTYoe56NbEpGZqHzGmE9ML
 5ZE9k2Q/hDwEI6ClGRt3I/qOStJ/FgTMUwWfApwNYkb1fk5RIBGShX4qVxdDTS+2jJ
 x/v5uyY/cfn5Q==
Message-ID: <b949d377-10ab-4b1d-92cd-0052a216f244@kernel.org>
Date: Sun, 4 Jan 2026 14:27:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
 <20260104020729.1064529-6-chao@kernel.org> <aVn8CHlqx9YxpijL@google.com>
 <aVn9utLEXYj63nep@google.com>
Content-Language: en-US
In-Reply-To: <aVn9utLEXYj63nep@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/1/4 13:42, Jaegeuk Kim wrote: > Should be like this?
 > > --- a/fs/f2fs/super.c > +++ b/fs/f2fs/super.c > @@ -2639,12 +2639,12
 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi) > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcHay-0004Ja-MW
Subject: Re: [f2fs-dev] [PATCH 06/14] f2fs: trace elapsed time for gc_lock
 lock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2026/1/4 13:42, Jaegeuk Kim wrote:
> Should be like this?
> 
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2639,12 +2639,12 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>                          .should_migrate_blocks = false,
>                          .err_gc_skipped = true,
>                          .no_bg_gc = true,
> -                       .nr_free_secs = 1 };
> +                       .nr_free_secs = 1,
> +                       .lc };

No need to initialize .lc? f2fs_down_write_trace() will initialize all fields
in lc.

> 
> -               f2fs_down_write_trace(&sbi->gc_lock, &lc);
> +               f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
>                  stat_inc_gc_call_count(sbi, FOREGROUND);
>                  err = f2fs_gc(sbi, &gc_control);
> -               f2fs_up_write_trace(&sbi->gc_lock, &lc);
>                  if (err == -ENODATA) {
>                          err = 0;
>                          break;

Ah, right, thanks for the fix!

Thanks,

> 
> On 01/04, Jaegeuk Kim wrote:
>> On 01/04, Chao Yu wrote:
>>> Use f2fs_{down,up}_write_trace for gc_lock to trace lock elapsed time.
>>>
>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>> ---
>>>   fs/f2fs/checkpoint.c        | 10 ++++++----
>>>   fs/f2fs/f2fs.h              | 22 ++++++++++++----------
>>>   fs/f2fs/file.c              | 13 +++++++------
>>>   fs/f2fs/gc.c                | 23 +++++++++++++----------
>>>   fs/f2fs/segment.c           | 11 ++++++-----
>>>   fs/f2fs/super.c             | 15 +++++++++------
>>>   include/trace/events/f2fs.h |  3 ++-
>>>   7 files changed, 55 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>> index dfd54cba1b35..da7bcfa2a178 100644
>>> --- a/fs/f2fs/checkpoint.c
>>> +++ b/fs/f2fs/checkpoint.c
>>> @@ -1930,11 +1930,12 @@ void f2fs_destroy_checkpoint_caches(void)
>>>   static int __write_checkpoint_sync(struct f2fs_sb_info *sbi)
>>>   {
>>>   	struct cp_control cpc = { .reason = CP_SYNC, };
>>> +	struct f2fs_lock_context lc;
>>>   	int err;
>>>   
>>> -	f2fs_down_write(&sbi->gc_lock);
>>> +	f2fs_down_write_trace(&sbi->gc_lock, &lc);
>>>   	err = f2fs_write_checkpoint(sbi, &cpc);
>>> -	f2fs_up_write(&sbi->gc_lock);
>>> +	f2fs_up_write_trace(&sbi->gc_lock, &lc);
>>>   
>>>   	return err;
>>>   }
>>> @@ -2022,11 +2023,12 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
>>>   	cpc.reason = __get_cp_reason(sbi);
>>>   	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC ||
>>>   		sbi->umount_lock_holder == current) {
>>> +		struct f2fs_lock_context lc;
>>>   		int ret;
>>>   
>>> -		f2fs_down_write(&sbi->gc_lock);
>>> +		f2fs_down_write_trace(&sbi->gc_lock, &lc);
>>>   		ret = f2fs_write_checkpoint(sbi, &cpc);
>>> -		f2fs_up_write(&sbi->gc_lock);
>>> +		f2fs_up_write_trace(&sbi->gc_lock, &lc);
>>>   
>>>   		return ret;
>>>   	}
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 3f6278ba620d..5b6e632b37a9 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -178,6 +178,7 @@ enum f2fs_lock_name {
>>>   	LOCK_NAME_CP_RWSEM,
>>>   	LOCK_NAME_NODE_CHANGE,
>>>   	LOCK_NAME_NODE_WRITE,
>>> +	LOCK_NAME_GC_LOCK,
>>>   };
>>>   
>>>   /*
>>> @@ -1408,16 +1409,6 @@ struct atgc_management {
>>>   	unsigned long long age_threshold;	/* age threshold */
>>>   };
>>>   
>>> -struct f2fs_gc_control {
>>> -	unsigned int victim_segno;	/* target victim segment number */
>>> -	int init_gc_type;		/* FG_GC or BG_GC */
>>> -	bool no_bg_gc;			/* check the space and stop bg_gc */
>>> -	bool should_migrate_blocks;	/* should migrate blocks */
>>> -	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
>>> -	bool one_time;			/* require one time GC in one migration unit */
>>> -	unsigned int nr_free_secs;	/* # of free sections to do GC */
>>> -};
>>> -
>>>   struct f2fs_time_stat {
>>>   	unsigned long long total_time;		/* total wall clock time */
>>>   #ifdef CONFIG_64BIT
>>> @@ -1436,6 +1427,17 @@ struct f2fs_lock_context {
>>>   	bool lock_trace;
>>>   };
>>>   
>>> +struct f2fs_gc_control {
>>> +	unsigned int victim_segno;	/* target victim segment number */
>>> +	int init_gc_type;		/* FG_GC or BG_GC */
>>> +	bool no_bg_gc;			/* check the space and stop bg_gc */
>>> +	bool should_migrate_blocks;	/* should migrate blocks */
>>> +	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
>>> +	bool one_time;			/* require one time GC in one migration unit */
>>> +	unsigned int nr_free_secs;	/* # of free sections to do GC */
>>> +	struct f2fs_lock_context lc;	/* lock context for gc_lock */
>>> +};
>>> +
>>>   /*
>>>    * For s_flag in struct f2fs_sb_info
>>>    * Modification on enum should be synchronized with s_flag array
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 1cdbbc2e1005..ce291f152bc3 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1928,7 +1928,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>>>   
>>>   		if (has_not_enough_free_secs(sbi, 0,
>>>   				sbi->reserved_pin_section)) {
>>> -			f2fs_down_write(&sbi->gc_lock);
>>> +			f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
>>>   			stat_inc_gc_call_count(sbi, FOREGROUND);
>>>   			err = f2fs_gc(sbi, &gc_control);
>>>   			if (err && err != -ENODATA) {
>>> @@ -2779,12 +2779,13 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>>>   		return ret;
>>>   
>>>   	if (!sync) {
>>> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>>> +		if (!f2fs_down_write_trylock_trace(&sbi->gc_lock,
>>> +						&gc_control.lc)) {
>>>   			ret = -EBUSY;
>>>   			goto out;
>>>   		}
>>>   	} else {
>>> -		f2fs_down_write(&sbi->gc_lock);
>>> +		f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
>>>   	}
>>>   
>>>   	gc_control.init_gc_type = sync ? FG_GC : BG_GC;
>>> @@ -2824,12 +2825,12 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>>>   
>>>   do_more:
>>>   	if (!range->sync) {
>>> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>>> +		if (!f2fs_down_write_trylock_trace(&sbi->gc_lock, &gc_control.lc)) {
>>>   			ret = -EBUSY;
>>>   			goto out;
>>>   		}
>>>   	} else {
>>> -		f2fs_down_write(&sbi->gc_lock);
>>> +		f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
>>>   	}
>>>   
>>>   	gc_control.victim_segno = GET_SEGNO(sbi, range->start);
>>> @@ -3320,7 +3321,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>>>   	end_segno = min(start_segno + range.segments, dev_end_segno);
>>>   
>>>   	while (start_segno < end_segno) {
>>> -		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>>> +		if (!f2fs_down_write_trylock_trace(&sbi->gc_lock, &gc_control.lc)) {
>>>   			ret = -EBUSY;
>>>   			goto out;
>>>   		}
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index 8999829a9559..391e66064c7e 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -102,21 +102,22 @@ static int gc_thread_func(void *data)
>>>   		if (sbi->gc_mode == GC_URGENT_HIGH ||
>>>   				sbi->gc_mode == GC_URGENT_MID) {
>>>   			wait_ms = gc_th->urgent_sleep_time;
>>> -			f2fs_down_write(&sbi->gc_lock);
>>> +			f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
>>>   			goto do_gc;
>>>   		}
>>>   
>>>   		if (foreground) {
>>> -			f2fs_down_write(&sbi->gc_lock);
>>> +			f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
>>>   			goto do_gc;
>>> -		} else if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>>> +		} else if (!f2fs_down_write_trylock_trace(&sbi->gc_lock,
>>> +							&gc_control.lc)) {
>>>   			stat_other_skip_bggc_count(sbi);
>>>   			goto next;
>>>   		}
>>>   
>>>   		if (!is_idle(sbi, GC_TIME)) {
>>>   			increase_sleep_time(gc_th, &wait_ms);
>>> -			f2fs_up_write(&sbi->gc_lock);
>>> +			f2fs_up_write_trace(&sbi->gc_lock, &gc_control.lc);
>>>   			stat_io_skip_bggc_count(sbi);
>>>   			goto next;
>>>   		}
>>> @@ -125,7 +126,8 @@ static int gc_thread_func(void *data)
>>>   			if (has_enough_free_blocks(sbi,
>>>   				gc_th->no_zoned_gc_percent)) {
>>>   				wait_ms = gc_th->no_gc_sleep_time;
>>> -				f2fs_up_write(&sbi->gc_lock);
>>> +				f2fs_up_write_trace(&sbi->gc_lock,
>>> +							&gc_control.lc);
>>>   				goto next;
>>>   			}
>>>   			if (wait_ms == gc_th->no_gc_sleep_time)
>>> @@ -2046,7 +2048,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>>>   				reserved_segments(sbi),
>>>   				prefree_segments(sbi));
>>>   
>>> -	f2fs_up_write(&sbi->gc_lock);
>>> +	f2fs_up_write_trace(&sbi->gc_lock, &gc_control->lc);
>>>   
>>>   	put_gc_inode(&gc_list);
>>>   
>>> @@ -2264,6 +2266,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>>>   	__u64 old_block_count, shrunk_blocks;
>>>   	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
>>>   	struct f2fs_lock_context lc;
>>> +	struct f2fs_lock_context glc;
>>>   	unsigned int secs;
>>>   	int err = 0;
>>>   	__u32 rem;
>>> @@ -2307,7 +2310,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>>>   	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
>>>   
>>>   	/* stop other GC */
>>> -	if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
>>> +	if (!f2fs_down_write_trylock_trace(&sbi->gc_lock, &glc)) {
>>>   		err = -EAGAIN;
>>>   		goto out_drop_write;
>>>   	}
>>> @@ -2329,7 +2332,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>>>   
>>>   out_unlock:
>>>   	f2fs_unlock_op(sbi, &lc);
>>> -	f2fs_up_write(&sbi->gc_lock);
>>> +	f2fs_up_write_trace(&sbi->gc_lock, &glc);
>>>   out_drop_write:
>>>   	mnt_drop_write_file(filp);
>>>   	if (err)
>>> @@ -2346,7 +2349,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>>>   		return -EROFS;
>>>   	}
>>>   
>>> -	f2fs_down_write(&sbi->gc_lock);
>>> +	f2fs_down_write_trace(&sbi->gc_lock, &glc);
>>>   	f2fs_down_write(&sbi->cp_global_sem);
>>>   
>>>   	spin_lock(&sbi->stat_lock);
>>> @@ -2396,7 +2399,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>>>   	}
>>>   out_err:
>>>   	f2fs_up_write(&sbi->cp_global_sem);
>>> -	f2fs_up_write(&sbi->gc_lock);
>>> +	f2fs_up_write_trace(&sbi->gc_lock, &glc);
>>>   	thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
>>>   	return err;
>>>   }
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index e4a8daf433a8..776b0df828ed 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -462,7 +462,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>>>   			.should_migrate_blocks = false,
>>>   			.err_gc_skipped = false,
>>>   			.nr_free_secs = 1 };
>>> -		f2fs_down_write(&sbi->gc_lock);
>>> +		f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
>>>   		stat_inc_gc_call_count(sbi, FOREGROUND);
>>>   		f2fs_gc(sbi, &gc_control);
>>>   	}
>>> @@ -3373,10 +3373,10 @@ int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
>>>   	f2fs_unlock_op(sbi, &lc);
>>>   
>>>   	if (f2fs_sb_has_blkzoned(sbi) && err == -EAGAIN && gc_required) {
>>> -		f2fs_down_write(&sbi->gc_lock);
>>> +		f2fs_down_write_trace(&sbi->gc_lock, &lc);
>>>   		err = f2fs_gc_range(sbi, 0, sbi->first_seq_zone_segno - 1,
>>>   				true, ZONED_PIN_SEC_REQUIRED_COUNT);
>>> -		f2fs_up_write(&sbi->gc_lock);
>>> +		f2fs_up_write_trace(&sbi->gc_lock, &lc);
>>>   
>>>   		gc_required = false;
>>>   		if (!err)
>>> @@ -3496,6 +3496,7 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>>>   	block_t start_block, end_block;
>>>   	struct cp_control cpc;
>>>   	struct discard_policy dpolicy;
>>> +	struct f2fs_lock_context lc;
>>>   	unsigned long long trimmed = 0;
>>>   	int err = 0;
>>>   	bool need_align = f2fs_lfs_mode(sbi) && __is_large_section(sbi);
>>> @@ -3528,10 +3529,10 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>>>   	if (sbi->discard_blks == 0)
>>>   		goto out;
>>>   
>>> -	f2fs_down_write(&sbi->gc_lock);
>>> +	f2fs_down_write_trace(&sbi->gc_lock, &lc);
>>>   	stat_inc_cp_call_count(sbi, TOTAL_CALL);
>>>   	err = f2fs_write_checkpoint(sbi, &cpc);
>>> -	f2fs_up_write(&sbi->gc_lock);
>>> +	f2fs_up_write_trace(&sbi->gc_lock, &lc);
>>>   	if (err)
>>>   		goto out;
>>>   
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index d8e5e8652d97..abb468eb4394 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -2563,6 +2563,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>>>   	int err = 0;
>>>   	int ret;
>>>   	block_t unusable;
>>> +	struct f2fs_lock_context lc;
>>>   
>>>   	if (s_flags & SB_RDONLY) {
>>>   		f2fs_err(sbi, "checkpoint=disable on readonly fs");
>>> @@ -2588,9 +2589,10 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>>>   			.no_bg_gc = true,
>>>   			.nr_free_secs = 1 };
>>>   
>>> -		f2fs_down_write(&sbi->gc_lock);
>>> +		f2fs_down_write_trace(&sbi->gc_lock, &lc);
>>>   		stat_inc_gc_call_count(sbi, FOREGROUND);
>>>   		err = f2fs_gc(sbi, &gc_control);
>>> +		f2fs_up_write_trace(&sbi->gc_lock, &lc);
>>
>> ^--- this looks wrong?
>>
>>>   		if (err == -ENODATA) {
>>>   			err = 0;
>>>   			break;
>>> @@ -2612,7 +2614,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>>>   	}
>>>   
>>>   skip_gc:
>>> -	f2fs_down_write(&sbi->gc_lock);
>>> +	f2fs_down_write_trace(&sbi->gc_lock, &lc);
>>>   	cpc.reason = CP_PAUSE;
>>>   	set_sbi_flag(sbi, SBI_CP_DISABLED);
>>>   	stat_inc_cp_call_count(sbi, TOTAL_CALL);
>>> @@ -2625,7 +2627,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>>>   	spin_unlock(&sbi->stat_lock);
>>>   
>>>   out_unlock:
>>> -	f2fs_up_write(&sbi->gc_lock);
>>> +	f2fs_up_write_trace(&sbi->gc_lock, &lc);
>>>   restore_flag:
>>>   	sbi->gc_mode = gc_mode;
>>>   	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
>>> @@ -2638,6 +2640,7 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
>>>   	unsigned int nr_pages = get_pages(sbi, F2FS_DIRTY_DATA) / 16;
>>>   	long long start, writeback, lock, sync_inode, end;
>>>   	int ret;
>>> +	struct f2fs_lock_context lc;
>>>   
>>>   	f2fs_info(sbi, "%s start, meta: %lld, node: %lld, data: %lld",
>>>   					__func__,
>>> @@ -2672,12 +2675,12 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
>>>   
>>>   	sync_inode = ktime_get();
>>>   
>>> -	f2fs_down_write(&sbi->gc_lock);
>>> +	f2fs_down_write_trace(&sbi->gc_lock, &lc);
>>>   	f2fs_dirty_to_prefree(sbi);
>>>   
>>>   	clear_sbi_flag(sbi, SBI_CP_DISABLED);
>>>   	set_sbi_flag(sbi, SBI_IS_DIRTY);
>>> -	f2fs_up_write(&sbi->gc_lock);
>>> +	f2fs_up_write_trace(&sbi->gc_lock, &lc);
>>>   
>>>   	f2fs_info(sbi, "%s sync_fs, meta: %lld, imeta: %lld, node: %lld, dents: %lld, qdata: %lld",
>>>   					__func__,
>>> @@ -4893,7 +4896,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>   	sbi->sb = sb;
>>>   
>>>   	/* initialize locks within allocated memory */
>>> -	init_f2fs_rwsem(&sbi->gc_lock);
>>> +	init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
>>>   	mutex_init(&sbi->writepages);
>>>   	init_f2fs_rwsem(&sbi->cp_global_sem);
>>>   	init_f2fs_rwsem_trace(&sbi->node_write, sbi, LOCK_NAME_NODE_WRITE);
>>> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
>>> index e5cfb8ad0d5e..bf353e7e024d 100644
>>> --- a/include/trace/events/f2fs.h
>>> +++ b/include/trace/events/f2fs.h
>>> @@ -188,7 +188,8 @@ TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
>>>   	__print_symbolic(lock,						\
>>>   		{ LOCK_NAME_CP_RWSEM,		"cp_rwsem" },		\
>>>   		{ LOCK_NAME_NODE_CHANGE,	"node_change" },	\
>>> -		{ LOCK_NAME_NODE_WRITE,		"node_write" })
>>> +		{ LOCK_NAME_NODE_WRITE,		"node_write" },		\
>>> +		{ LOCK_NAME_GC_LOCK,		"gc_lock" })
>>>   
>>>   struct f2fs_sb_info;
>>>   struct f2fs_io_info;
>>> -- 
>>> 2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
