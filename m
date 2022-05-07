Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5451E3D0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 05:33:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnBC9-0005Ep-TX; Sat, 07 May 2022 03:33:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nnBC8-0005Ej-7W
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 03:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zrzNtevNln+oMCIIIPfsYaPSBWYyq1XQAPSlxY2ys1E=; b=lIzqhJioghLWwUEPfwhNPNQX13
 s094GYD7iZ3+h8zSlLPjgzRFT0Z+PVJJM5GGpC+XNxZjmgHLVM/voasFggYevPgw7E8tXygn5Sp3E
 Sie6ZFyk4KN8KcGn7WkN0x/DSG2bbC4kl+DAqDNONKs8EzxkuScVvVu2FtkfSUo8IwRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zrzNtevNln+oMCIIIPfsYaPSBWYyq1XQAPSlxY2ys1E=; b=bDzBWkXGOiyheGr7zGRgMYUQ1z
 EQs7yR4Nba68706MWE/isJ0KWI0wvHo9soHMlOLph5RJgHmw0QVV6gOP5fsnw66GE5lEeF55AoAFE
 vU9oFEnMhxWfDG/te9p3sHVDLQHJHy2R9jby90ijVI20VZ0Tv/UmtHuGcK4RVFu9/2wg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnBC3-0000Hq-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 03:33:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37355B8399F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 May 2022 03:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4E8C385A6;
 Sat,  7 May 2022 03:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651894384;
 bh=F6uOs6JKmtFPrC0u+Dq3rbzRNK4TUBZwnsuyQBD+tuA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VjIfQZxJeJgAySK9Zp+qBDHogH7JqXWZ6b0ZHuHW2pCbAvrMVI5fAiC7wM6+5oe5M
 +vDYxfn5ekDspV2dlpAuqUg1OekEQBHP3hT6CNhsQw3FaE91C5YMYdPdXAQpH1bzme
 7y/6D9MZC068oiCOJO2bGNkyRqihKbfPmmK+ecGlLIgy4GpXIJ4cNtJzPdrm7524fX
 u7g/2xwQlnidX5viG6FsjnBHl1+E9ZFijXjn0sYG8JzwAEWR/L/pLtAoKyy+2H+Xov
 5Jw1QDMXYHOVxdeepEphG3Pgp6Wp4qSzna00b4Usp4ysyrP70S4X91RzeF7YPEZA65
 moOkYNRXzOVzA==
Message-ID: <a0fb04fc-21f6-e417-0160-4c7ef5c0b9c0@kernel.org>
Date: Sat, 7 May 2022 11:33:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-4-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220506232032.1264078-4-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/7 7:20, Jaegeuk Kim wrote: > The f2fs_gc uses a
 bitmap to indicate pinned sections, but when disabling > chckpoint, we call
 f2fs_gc() with NULL_SEGNO which selects the same dirty > segment a [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nnBC3-0000Hq-Gj
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: do not stop GC when requiring a
 free section
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/7 7:20, Jaegeuk Kim wrote:
> The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
> chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
> segment as a victim all the time, resulting in checkpoint=disable failure,
> for example. Let's pick another one, if we fail to collect it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/f2fs.h              |  1 +
>   fs/f2fs/file.c              | 12 ++++++++----
>   fs/f2fs/gc.c                | 11 +++++++----
>   fs/f2fs/segment.c           |  3 ++-
>   fs/f2fs/super.c             |  3 ++-
>   include/trace/events/f2fs.h | 11 ++++++++---
>   6 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d49b9b476592..27871f6efb01 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1282,6 +1282,7 @@ struct f2fs_gc_control {
>   	bool no_bg_gc;			/* check the space and stop bg_gc */
>   	bool should_migrate_blocks;	/* should migrate blocks */
>   	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
> +	unsigned int nr_free_secs;	/* # of free sections to do GC */
>   };
>   
>   /* For s_flag in struct f2fs_sb_info */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 0e7d101c3e65..7072c2b86b2f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1650,7 +1650,8 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>   	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
>   			.init_gc_type = FG_GC,
>   			.should_migrate_blocks = false,
> -			.err_gc_skipped = true };
> +			.err_gc_skipped = true,
> +			.nr_free_secs = 0 };
>   	pgoff_t pg_start, pg_end;
>   	loff_t new_size = i_size_read(inode);
>   	loff_t off_end;
> @@ -2453,7 +2454,8 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
>   			.no_bg_gc = false,
> -			.should_migrate_blocks = false };
> +			.should_migrate_blocks = false,
> +			.nr_free_secs = 0 };
>   	__u32 sync;
>   	int ret;
>   
> @@ -2494,7 +2496,8 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>   			.init_gc_type = range->sync ? FG_GC : BG_GC,
>   			.no_bg_gc = false,
>   			.should_migrate_blocks = false,
> -			.err_gc_skipped = range->sync };
> +			.err_gc_skipped = range->sync,
> +			.nr_free_secs = 0 };
>   	u64 end;
>   	int ret;
>   
> @@ -2940,7 +2943,8 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>   	struct f2fs_gc_control gc_control = {
>   			.init_gc_type = FG_GC,
>   			.should_migrate_blocks = true,
> -			.err_gc_skipped = true };
> +			.err_gc_skipped = true,
> +			.nr_free_secs = 0 };
>   	int ret;
>   
>   	if (!capable(CAP_SYS_ADMIN))
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index ec3f6f876e76..f63576ff1c2d 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -147,6 +147,7 @@ static int gc_thread_func(void *data)
>   
>   		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
>   		gc_control.no_bg_gc = foreground;
> +		gc_control.nr_free_secs = foreground ? 1 : 0;
>   
>   		/* if return value is not zero, no victim was selected */
>   		if (f2fs_gc(sbi, &gc_control))
> @@ -1776,6 +1777,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	unsigned int skipped_round = 0, round = 0;
>   
>   	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
> +				gc_control->nr_free_secs,
>   				get_pages(sbi, F2FS_DIRTY_NODES),
>   				get_pages(sbi, F2FS_DIRTY_DENTS),
>   				get_pages(sbi, F2FS_DIRTY_IMETA),
> @@ -1848,11 +1850,12 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	if (gc_type == FG_GC)
>   		sbi->cur_victim_sec = NULL_SEGNO;
>   
> -	if (gc_control->init_gc_type == FG_GC)
> -		goto stop;
> -
> -	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
> +	if ((gc_control->init_gc_type == FG_GC ||
> +			!has_not_enough_free_secs(sbi, sec_freed, 0))) {
> +		if (sec_freed < gc_control->nr_free_secs)

I missed to reset segno here, it may cause GC failure in next round due to
sec_usage_check() returns true.

segno = NULL_SEGNO;

Thanks,

> +			goto gc_more;
>   		goto stop;
> +	}
>   
>   	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index bc63f0572c64..d6b9231ab0e1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -528,7 +528,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>   				.init_gc_type = BG_GC,
>   				.no_bg_gc = true,
>   				.should_migrate_blocks = false,
> -				.err_gc_skipped = false };
> +				.err_gc_skipped = false,
> +				.nr_free_secs = 1 };
>   			f2fs_down_write(&sbi->gc_lock);
>   			f2fs_gc(sbi, &gc_control);
>   		}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8b23fa6fc6b7..5d5b35067c3d 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2084,7 +2084,8 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>   			.victim_segno = NULL_SEGNO,
>   			.init_gc_type = FG_GC,
>   			.should_migrate_blocks = false,
> -			.err_gc_skipped = true };
> +			.err_gc_skipped = true,
> +			.nr_free_secs = 1 };
>   
>   		f2fs_down_write(&sbi->gc_lock);
>   		err = f2fs_gc(sbi, &gc_control);
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 6699174977a3..349679a72301 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -653,18 +653,21 @@ TRACE_EVENT(f2fs_background_gc,
>   TRACE_EVENT(f2fs_gc_begin,
>   
>   	TP_PROTO(struct super_block *sb, int gc_type, bool no_bg_gc,
> +			unsigned int nr_free_secs,
>   			long long dirty_nodes, long long dirty_dents,
>   			long long dirty_imeta, unsigned int free_sec,
>   			unsigned int free_seg, int reserved_seg,
>   			unsigned int prefree_seg),
>   
> -	TP_ARGS(sb, gc_type, no_bg_gc, dirty_nodes, dirty_dents, dirty_imeta,
> +	TP_ARGS(sb, gc_type, no_bg_gc, nr_free_secs, dirty_nodes,
> +		dirty_dents, dirty_imeta,
>   		free_sec, free_seg, reserved_seg, prefree_seg),
>   
>   	TP_STRUCT__entry(
>   		__field(dev_t,		dev)
>   		__field(int,		gc_type)
>   		__field(bool,		no_bg_gc)
> +		__field(unsigned int,	nr_free_secs)
>   		__field(long long,	dirty_nodes)
>   		__field(long long,	dirty_dents)
>   		__field(long long,	dirty_imeta)
> @@ -678,6 +681,7 @@ TRACE_EVENT(f2fs_gc_begin,
>   		__entry->dev		= sb->s_dev;
>   		__entry->gc_type	= gc_type;
>   		__entry->no_bg_gc	= no_bg_gc;
> +		__entry->nr_free_secs	= nr_free_secs;
>   		__entry->dirty_nodes	= dirty_nodes;
>   		__entry->dirty_dents	= dirty_dents;
>   		__entry->dirty_imeta	= dirty_imeta;
> @@ -687,12 +691,13 @@ TRACE_EVENT(f2fs_gc_begin,
>   		__entry->prefree_seg	= prefree_seg;
>   	),
>   
> -	TP_printk("dev = (%d,%d), gc_type = %s, no_background_GC = %d, nodes = %lld, "
> -		"dents = %lld, imeta = %lld, free_sec:%u, free_seg:%u, "
> +	TP_printk("dev = (%d,%d), gc_type = %s, no_background_GC = %d, nr_free_secs = %u, "
> +		"nodes = %lld, dents = %lld, imeta = %lld, free_sec:%u, free_seg:%u, "
>   		"rsv_seg:%d, prefree_seg:%u",
>   		show_dev(__entry->dev),
>   		show_gc_type(__entry->gc_type),
>   		__entry->no_bg_gc,
> +		__entry->nr_free_secs,
>   		__entry->dirty_nodes,
>   		__entry->dirty_dents,
>   		__entry->dirty_imeta,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
