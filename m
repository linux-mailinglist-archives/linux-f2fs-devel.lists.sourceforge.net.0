Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A8527807
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 May 2022 16:26:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqFCn-0005SD-5b; Sun, 15 May 2022 14:26:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nqFCl-0005S7-MH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 May 2022 14:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fo75Vi/czwqIas67Jbj1VvxzT65evSRNCtI1QO83gY4=; b=ZyKKae2SpGIfZRJKebLj4KISHX
 MmaTwFnW/Xrf0UTFZLoQ8bXXVxVEsY3FJ+xLe304PHihTof/3ITCPKy1JfvbjRhAYtVHCl1tp4EVG
 RBikKDjGgQVT9dvmDKhvVZ4Adi4OcIvtHHtYRrHlrzuJ66QcpUXknmWLkvKeMfukrMYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fo75Vi/czwqIas67Jbj1VvxzT65evSRNCtI1QO83gY4=; b=i15Vi4iBySu8/M3h3JzooSFeNi
 qU4WSGAciurPzYG7jzrufIDbhLS+n0tdlUtEQC3cPzhQQKENGeH16pDuPl+86isRRrKH3MmjZ/m+x
 rvu/ew758HDWXU6l6kNgQL0L97X0ApSEGjxbzC7PDGEUHyB+brF4cpO1IylUb5W09cV0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqFCd-00EywR-VC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 15 May 2022 14:26:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A49AB80D0E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 May 2022 14:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08214C385B8;
 Sun, 15 May 2022 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652624783;
 bh=SGNq/0CIjjXJLoruFRX372xgbkcA0eccmxedWyD7NGA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=MWlbK74dr032jPmkHdl4YVN0qyGcnFLn+odt7kKOj0vAbXcfyM3HI3GwU/+j36MJr
 hp6/Jon7DpbMNQvzQajjfXNeytiMJ0eeRDMoS40maIClp6cCVG8BXbzdTmh//9xEgp
 APRYpQKI+r2H1E7cKqE6k4FzC+YFFpADDPFpxOoaBt2kH1+eu0G857J5YlhfDqhvKR
 2zp1gFjgRJa5kKyElCOFvID0Jb40ho3rH3G2AXnZbrzAv/XsduCyXrzV/h352aH4YL
 YY7RS7FlQ6TJ+2Ln4FDWv++u6fRVvMTJ3aBTA16jHK5mrQCWL00eybEBM+IknKNqbk
 pfyrs4amFxuDw==
Message-ID: <c4a1b40f-469c-8e27-5fef-cd0d3ccd0089@kernel.org>
Date: Sun, 15 May 2022 22:26:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
 <20220506232032.1264078-4-jaegeuk@kernel.org> <Yn1zC6MUZOEbSlWK@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yn1zC6MUZOEbSlWK@google.com>
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/13 4:50, Jaegeuk Kim wrote: > The f2fs_gc uses a
 bitmap to indicate pinned sections, but when disabling > chckpoint, we call
 f2fs_gc() with NULL_SEGNO which selects the same dirty > segment [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqFCd-00EywR-VC
Subject: Re: [f2fs-dev] [PATCH 4/5 v2] f2fs: do not stop GC when requiring a
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

On 2022/5/13 4:50, Jaegeuk Kim wrote:
> The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
> chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
> segment as a victim all the time, resulting in checkpoint=disable failure,
> for example. Let's pick another one, if we fail to collect it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   Change log from v1:
>    - refactor the code path to avoid ambiguous condition like BG_GC/sec_freed
> 
>   fs/f2fs/f2fs.h              |  1 +
>   fs/f2fs/file.c              | 12 ++++++++----
>   fs/f2fs/gc.c                | 14 +++++++++-----
>   fs/f2fs/segment.c           |  3 ++-
>   fs/f2fs/super.c             |  3 ++-
>   include/trace/events/f2fs.h | 11 ++++++++---
>   6 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9920b2d6af8f..492af5b96de1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1271,6 +1271,7 @@ struct f2fs_gc_control {
>   	bool no_bg_gc;			/* check the space and stop bg_gc */
>   	bool should_migrate_blocks;	/* should migrate blocks */
>   	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
> +	unsigned int nr_free_secs;	/* # of free sections to do GC */
>   };
>   
>   /* For s_flag in struct f2fs_sb_info */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d0547bef0851..216081ea8c81 100644
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
> @@ -2350,7 +2351,8 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_gc_control gc_control = { .victim_segno = NULL_SEGNO,
>   			.no_bg_gc = false,
> -			.should_migrate_blocks = false };
> +			.should_migrate_blocks = false,
> +			.nr_free_secs = 0 };
>   	__u32 sync;
>   	int ret;
>   
> @@ -2391,7 +2393,8 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>   			.init_gc_type = range->sync ? FG_GC : BG_GC,
>   			.no_bg_gc = false,
>   			.should_migrate_blocks = false,
> -			.err_gc_skipped = range->sync };
> +			.err_gc_skipped = range->sync,
> +			.nr_free_secs = 0 };
>   	u64 end;
>   	int ret;
>   
> @@ -2837,7 +2840,8 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
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
> index e275b72bc65f..10b24b0f13a5 100644
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
> @@ -1761,6 +1762,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	unsigned int skipped_round = 0, round = 0;
>   
>   	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
> +				gc_control->nr_free_secs,
>   				get_pages(sbi, F2FS_DIRTY_NODES),
>   				get_pages(sbi, F2FS_DIRTY_DENTS),
>   				get_pages(sbi, F2FS_DIRTY_IMETA),
> @@ -1823,12 +1825,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	if (gc_type == FG_GC)
>   		sbi->cur_victim_sec = NULL_SEGNO;
>   
> -	if (gc_control->init_gc_type == FG_GC)
> -		goto stop;
> -
> -	if (!has_not_enough_free_secs(sbi,
> -			(gc_type == FG_GC) ? sec_freed : 0, 0))
> +	if (gc_control->init_gc_type == FG_GC ||
> +	    !has_not_enough_free_secs(sbi,
> +				(gc_type == FG_GC) ? sec_freed : 0, 0)) {

In all gc_control->init_gc_type = BG_GC cases, gc_control->no_bg_gc is true,
if gc_type = BG_GC, then it should break out due to below condition.

	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
	if (gc_type == BG_GC && gc_control->no_bg_gc) {
		ret = -EINVAL;
		goto stop;
	}

Otherwise gc_type should always be FG_GC in
!has_not_enough_free_secs(sbi, (gc_type == FG_GC) ? sec_freed : 0, 0), right?

Thanks,

> +		if (gc_mode == FG_GC && sec_freed < gc_control->nr_free_secs)
> +			goto go_gc_more;
>   		goto stop;
> +	}
>   
>   	/* FG_GC stops GC by skip_count */
>   	if (gc_type == FG_GC) {
> @@ -1849,6 +1852,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		if (ret)
>   			goto stop;
>   	}
> +go_gc_more:
>   	segno = NULL_SEGNO;
>   	goto gc_more;
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8b4f2b1d2cca..0a4180f64291 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -404,7 +404,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
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
> index a28c27eed6d0..63daae67a9d9 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2080,7 +2080,8 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
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
> index 54ec9e543f09..16c67ede85b6 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -645,18 +645,21 @@ TRACE_EVENT(f2fs_background_gc,
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
> @@ -670,6 +673,7 @@ TRACE_EVENT(f2fs_gc_begin,
>   		__entry->dev		= sb->s_dev;
>   		__entry->gc_type	= gc_type;
>   		__entry->no_bg_gc	= no_bg_gc;
> +		__entry->nr_free_secs	= nr_free_secs;
>   		__entry->dirty_nodes	= dirty_nodes;
>   		__entry->dirty_dents	= dirty_dents;
>   		__entry->dirty_imeta	= dirty_imeta;
> @@ -679,12 +683,13 @@ TRACE_EVENT(f2fs_gc_begin,
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
>   		(__entry->gc_type == BG_GC) ? __entry->no_bg_gc : -1,
> +		__entry->nr_free_secs,
>   		__entry->dirty_nodes,
>   		__entry->dirty_dents,
>   		__entry->dirty_imeta,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
