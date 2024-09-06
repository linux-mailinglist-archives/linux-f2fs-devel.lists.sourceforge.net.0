Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E33A196EAAB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 08:35:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smSYp-0000R7-Gq;
	Fri, 06 Sep 2024 06:35:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1smSYn-0000R0-Uy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 06:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eTRoV0eWhf8iSCt7QJy3ypz7WvkrzQqzv2wi+arTrXU=; b=bZhw5U9Vn8SXtCKAfgffg5BDi7
 S3evfVllweF1F4O/ZdZSo99l4MrW5fD09zU/PNCAHsKOkbGVx4gQN04QAhXs9bx3jF9WY+6uR2Cry
 kPgJCmPfZbCb1npvrQN34/iQnBB7671fHIZCr0nSgXGN017tX2p9YVh3my26x7cllAGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eTRoV0eWhf8iSCt7QJy3ypz7WvkrzQqzv2wi+arTrXU=; b=QI5wN0eEslCb4R0Wf2Mc3EfWCt
 /mMmqCuI6ra4diFy2olHH+rPoSxcyUwfdI0VMxZbaUceX0iTqCgf8VsgxELd4G5G/JbTcLfGG+nxu
 bsXh66jhRmkpwQCzSclWTsBRM4z9vw/XaT3tRV/ba/DDSTJYdpODVAFRmBWLwWuOm460=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smSYn-0002FP-Rp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 06:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CB4A2A446BF;
 Fri,  6 Sep 2024 06:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF12C4CEC4;
 Fri,  6 Sep 2024 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725604498;
 bh=cFZIh7ashMIXVKWV6hq6sOPOO05bRbQ/dRA4j6sUTR0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k3M1OqZwf2gL9dWrp5W66q9ZbyphSzygXI5f87QGVTKesaEpHCxLLD3nIxmgzJ61s
 Kdq+JgvZYe+fKFudleOM1e44h3tT+fqThBINlVsm2L0OISEBQpeh3c1N3papEYbVmr
 xV3ivQRmNAMuHOW1c+ph5Vwj4ZcyCd+UAnOnIF1HDYLrH5YuTnCnnrYrTGZtZERSPM
 3k8TRj+6Z4aknsJJk0lKWWixW4SKFwZC9R9BWICF2/7tcDTTQvLq6WFrwODBWRPcFf
 KFhmGysN9NUHF6jImYuAavB8bXVO7mQ41JlT+bwrJ16FyAfuwJbnb4Hq8CdhLoShSf
 lyHGB0Ax6jE+A==
Message-ID: <807c19f9-f4d6-477d-8728-ab90734a4ebe@kernel.org>
Date: Fri, 6 Sep 2024 14:34:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240829215242.3641502-1-daeho43@gmail.com>
 <20240829215242.3641502-5-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240829215242.3641502-5-daeho43@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/30 5:52, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Under low free section count, we need to use FG_GC
 instead of BG_GC to > recover free sections. > > Signed-off-by: [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1smSYn-0002FP-Rp
Subject: Re: [f2fs-dev] [PATCH 5/7] f2fs: do FG_GC when GC boosting is
 required for zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/30 5:52, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Under low free section count, we need to use FG_GC instead of BG_GC to
> recover free sections.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/f2fs.h |  1 +
>   fs/f2fs/gc.c   | 24 +++++++++++++++++-------
>   2 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5e4db3ba534a..ee1fafc65e95 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1294,6 +1294,7 @@ struct f2fs_gc_control {
>   	bool should_migrate_blocks;	/* should migrate blocks */
>   	bool err_gc_skipped;		/* return EAGAIN if GC skipped */

bool one_time;			/* require one time GC in one migration unit */

In order to avoid unnecessary padding for alignment.

Thanks,

>   	unsigned int nr_free_secs;	/* # of free sections to do GC */
> +	bool one_time;			/* require one time GC in one migration unit */
>   };
>   
>   /*
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index d6d71aab94f3..37b47a8d95f1 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -81,6 +81,8 @@ static int gc_thread_func(void *data)
>   			continue;
>   		}
>   
> +		gc_control.one_time = false;
> +
>   		/*
>   		 * [GC triggering condition]
>   		 * 0. GC is not conducted currently.
> @@ -126,15 +128,19 @@ static int gc_thread_func(void *data)
>   				wait_ms = gc_th->max_sleep_time;
>   		}
>   
> -		if (need_to_boost_gc(sbi))
> +		if (need_to_boost_gc(sbi)) {
>   			decrease_sleep_time(gc_th, &wait_ms);
> -		else
> +			if (f2fs_sb_has_blkzoned(sbi))
> +				gc_control.one_time = true;
> +		} else {
>   			increase_sleep_time(gc_th, &wait_ms);
> +		}
>   do_gc:
>   		stat_inc_gc_call_count(sbi, foreground ?
>   					FOREGROUND : BACKGROUND);
>   
> -		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
> +		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
> +				gc_control.one_time;
>   
>   		/* foreground GC was been triggered via f2fs_balance_fs() */
>   		if (foreground)
> @@ -1701,7 +1707,7 @@ static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
>   static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   				unsigned int start_segno,
>   				struct gc_inode_list *gc_list, int gc_type,
> -				bool force_migrate)
> +				bool force_migrate, bool one_time)
>   {
>   	struct page *sum_page;
>   	struct f2fs_summary_block *sum;
> @@ -1728,7 +1734,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   			sec_end_segno -= SEGS_PER_SEC(sbi) -
>   					f2fs_usable_segs_in_sec(sbi, segno);
>   
> -		if (gc_type == BG_GC) {
> +		if (gc_type == BG_GC || one_time) {
>   			unsigned int migration_granularity =
>   				sbi->migration_granularity;
>   
> @@ -1908,7 +1914,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	}
>   
>   	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
> -				gc_control->should_migrate_blocks);
> +				gc_control->should_migrate_blocks,
> +				gc_control->one_time);
>   	if (seg_freed < 0)
>   		goto stop;
>   
> @@ -1919,6 +1926,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		total_sec_freed++;
>   	}
>   
> +	if (gc_control->one_time)
> +		goto stop;
> +
>   	if (gc_type == FG_GC) {
>   		sbi->cur_victim_sec = NULL_SEGNO;
>   
> @@ -2044,7 +2054,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
>   		};
>   
>   		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
> -						dry_run_sections == 0);
> +						dry_run_sections == 0, false);
>   		put_gc_inode(&gc_list);
>   
>   		if (!dry_run && get_valid_blocks(sbi, segno, true))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
