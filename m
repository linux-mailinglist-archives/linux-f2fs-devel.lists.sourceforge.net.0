Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B551DECF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 May 2022 20:13:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nn2SG-0003cl-Js; Fri, 06 May 2022 18:13:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nn2SG-0003cf-1c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 18:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qs7n0UQ2yBCDBK8vYDPMsFR+nhOosgRpOTKpq64ZxU8=; b=Jg+LeEcA6AO7Q2qrAzV7jmF9Br
 ds9Yuf5DeOIUMw199TtQ8njN4P7me4dGIAk7FcAKuxFksoaLwz+XR+MrN9baivTQxotujxNANru7Y
 7uOMPnfVTqgiPm+W4Gb4obAyGZUEyUyAtLk+r7/8l0z8kG+OABfX9Aiudr6XPsPo+YPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qs7n0UQ2yBCDBK8vYDPMsFR+nhOosgRpOTKpq64ZxU8=; b=DfuA1qCDeLxL5nyRBHr4TzMnO1
 3mUZ/nAAXH6fSxqiOfPcF9HUcTKencbeONDdsfhzAUpk3tJ/qgiryDHEDQnzNmFDr22tb1n47pOso
 zQr3VTSDqkxRQIIUraKbqxkaNzOvD7WDg/NIXnh5ddkgb78iIY339T+2xlRh0mWVgTEw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nn2SE-0001t6-1f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 18:13:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4738B838BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  6 May 2022 18:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7820BC385A8;
 Fri,  6 May 2022 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651860798;
 bh=fbyhZMmkilOXsKYBJBdj/kDrggST+SDzEYXa+vgaI/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FeW6T9IvzdP9MKjN/+6EdJLoDxHuC3gOQ77VaUeI7kx0OglQZb2pFCxStSBUqyKED
 1FroRiP2wK4/j+slSWPzyjk8mEVrGou97+p0S5a5BwWyPtmIcJSnUZNFhnyj1hr9TA
 2YuQ79vLIQDXFXDh16a4YFeQ2BQHiM3AAlu6Q62ooIprSebwJ981s/0zT1L6SEljEN
 Z7tJQ9njGz96sx26NV/2LTVH4hnRABZdwDAa6CxVKURy/1qIeoB5QKS50wGkIZVv4L
 4haPObMcCm5mMkwuhq8/WeqQJxIVwjxYrpHi//g0VuFDkWqvt5rpobP6iQ453y0yQs
 jj1DKCF33sVOw==
Date: Fri, 6 May 2022 11:13:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YnVlPEWzV6PykN2u@google.com>
References: <20220506115800.2605-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220506115800.2605-1-chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/06,
 Chao Yu wrote: > From: Jaegeuk Kim <jaegeuk@kernel.org>
 > > The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
 > chckpoint, we call f2fs_gc() with NULL_SEGNO which sel [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nn2SE-0001t6-1f
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: avoid to select pinned section
 during checkpoint=disable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/06, Chao Yu wrote:
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
> chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
> segment as a victim all the time, resulting in checkpoint=disable failure.
> Let's pick another one, if we fail to collect it.

I'm concerning more like the generic cases where GC will get the same victim
having the pinned space resulting in EAGAIN all the time.

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v4:
> - use sec_freed instead of total_freed
>  fs/f2fs/f2fs.h    |  2 +-
>  fs/f2fs/file.c    |  8 ++++----
>  fs/f2fs/gc.c      | 17 +++++++++++------
>  fs/f2fs/segment.c |  2 +-
>  fs/f2fs/super.c   |  2 +-
>  5 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 56adc3b68e14..0f8c426aed50 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3787,7 +3787,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi);
>  void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
>  block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
>  int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background, bool force,
> -			unsigned int segno);
> +			unsigned int segno, unsigned int nr_section);
>  void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
>  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
>  int __init f2fs_create_garbage_collection_cache(void);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e4cf8b7b23aa..07d2fa6c774b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1684,7 +1684,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  		if (has_not_enough_free_secs(sbi, 0,
>  			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
>  			f2fs_down_write(&sbi->gc_lock);
> -			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
> +			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO, 0);
>  			if (err && err != -ENODATA && err != -EAGAIN)
>  				goto out_err;
>  		}
> @@ -2472,7 +2472,7 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
>  		f2fs_down_write(&sbi->gc_lock);
>  	}
>  
> -	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO);
> +	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO, 0);
>  out:
>  	mnt_drop_write_file(filp);
>  	return ret;
> @@ -2509,7 +2509,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>  	}
>  
>  	ret = f2fs_gc(sbi, range->sync, true, false,
> -				GET_SEGNO(sbi, range->start));
> +				GET_SEGNO(sbi, range->start), 0);
>  	if (ret) {
>  		if (ret == -EBUSY)
>  			ret = -EAGAIN;
> @@ -2966,7 +2966,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>  		sm->last_victim[GC_CB] = end_segno + 1;
>  		sm->last_victim[GC_GREEDY] = end_segno + 1;
>  		sm->last_victim[ALLOC_NEXT] = end_segno + 1;
> -		ret = f2fs_gc(sbi, true, true, true, start_segno);
> +		ret = f2fs_gc(sbi, true, true, true, start_segno, 0);
>  		if (ret == -EAGAIN)
>  			ret = 0;
>  		else if (ret < 0)
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 3009c0a97ab4..d13a86272e8b 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -142,7 +142,7 @@ static int gc_thread_func(void *data)
>  			sync_mode = false;
>  
>  		/* if return value is not zero, no victim was selected */
> -		if (f2fs_gc(sbi, sync_mode, !foreground, false, NULL_SEGNO))
> +		if (f2fs_gc(sbi, sync_mode, !foreground, false, NULL_SEGNO, 0))
>  			wait_ms = gc_th->no_gc_sleep_time;
>  
>  		if (foreground)
> @@ -1754,7 +1754,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>  }
>  
>  int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> -			bool background, bool force, unsigned int segno)
> +			bool background, bool force, unsigned int segno,
> +			unsigned int nr_section)
>  {
>  	int gc_type = sync ? FG_GC : BG_GC;
>  	int sec_freed = 0, seg_freed = 0, total_freed = 0;
> @@ -1841,11 +1842,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>  	if (gc_type == FG_GC)
>  		sbi->cur_victim_sec = NULL_SEGNO;
>  
> -	if (sync)
> -		goto stop;
> -
> -	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
> +	if (sync || !has_not_enough_free_secs(sbi, sec_freed, 0)) {
> +		/*
> +		 * f2fs_disable_checkpoint() needs to migrate enough section
> +		 * before f2fs_gc() exits.
> +		 */
> +		if (sec_freed < nr_section)
> +			goto gc_more;
>  		goto stop;
> +	}
>  
>  	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8c17fed8987e..3a3e2cec2ac4 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -524,7 +524,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>  			finish_wait(&sbi->gc_thread->fggc_wq, &wait);
>  		} else {
>  			f2fs_down_write(&sbi->gc_lock);
> -			f2fs_gc(sbi, false, false, false, NULL_SEGNO);
> +			f2fs_gc(sbi, false, false, false, NULL_SEGNO, 0);
>  		}
>  	}
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d06a577a1208..2f0ad9ffbf17 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2076,7 +2076,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  
>  	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
>  		f2fs_down_write(&sbi->gc_lock);
> -		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
> +		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO, 1);
>  		if (err == -ENODATA) {
>  			err = 0;
>  			break;
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
