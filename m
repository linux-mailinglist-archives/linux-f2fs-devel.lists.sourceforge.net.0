Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596119A482
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Apr 2020 07:08:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJVcP-00058e-0C; Wed, 01 Apr 2020 05:08:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jJVcN-00058X-UX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Apr 2020 05:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IwfMIS6wvEWOjLAjcB816TqdPl4Q5b3pSRnkd6mSmTI=; b=Tf89k+lTyP1H0a3blkd5keuo1Y
 W86KLbqTjIg/gymCvL2b8vliXn1t4Kha5WxhF2LXIHM8HacrmX3IRlhXuPHpDv0L1/JKsG9KLJG1k
 ZMy4KmhXMhUlvEy4wX1tvmHBnXYhsYI0TAb5qzwf62Kl+dy7TTyCJwi9R1ILHZYxDMJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IwfMIS6wvEWOjLAjcB816TqdPl4Q5b3pSRnkd6mSmTI=; b=ICN9M0yTausgRi/pvvuJHFu4g4
 xhpKuYMWm89shInUsdbL7G5st4hYJILtKJdo3M+pFD8gXVJJSupy9YlgQpNLVYrchxxnajLCV43Am
 YuzS1DTN58CWkJR8umKqk3GkbSe/HzSImHQwOgGrugwoWSLBqmX39aM2OInkrHWCG+fg=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJVcK-00F1Hp-36
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Apr 2020 05:08:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585717725; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=IwfMIS6wvEWOjLAjcB816TqdPl4Q5b3pSRnkd6mSmTI=;
 b=SdWxAHYxrrWhOSbTzxuhgndE9ndd9u6wVp/nOdZzcgv87VpPvOPt66Qi7KL3U8iP0XnQidJ3
 SeidjxZM1oFmA65GkRVmnL4gv1jLSCYEzogcH/wYUKq/9lZyHTW1CzONyUN/SBAs7uI6J4fS
 p0r88aIKOB99/l8qNcWk7PB5Fb8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8421cf.7f3399c51b90-smtp-out-n01;
 Wed, 01 Apr 2020 05:08:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F1E9C433BA; Wed,  1 Apr 2020 05:08:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0356C433F2;
 Wed,  1 Apr 2020 05:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0356C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Wed, 1 Apr 2020 10:38:01 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200401050801.GA20234@codeaurora.org>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200331035419.GB79749@google.com>
 <20200331090608.GZ20234@codeaurora.org>
 <20200331184307.GA198665@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331184307.GA198665@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jJVcK-00F1Hp-36
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint
 is in progress
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

Hi Jaegeuk,

Got it.
The diff below looks good to me.
Would you like me to test it and put a patch for this?

Thanks,

On Tue, Mar 31, 2020 at 11:43:07AM -0700, Jaegeuk Kim wrote:
> On 03/31, Sahitya Tummala wrote:
> > On Mon, Mar 30, 2020 at 08:54:19PM -0700, Jaegeuk Kim wrote:
> > > On 03/26, Sahitya Tummala wrote:
> > > > allocate_segment_for_resize() can cause metapage updates if
> > > > it requires to change the current node/data segments for resizing.
> > > > Stop these meta updates when there is a checkpoint already
> > > > in progress to prevent inconsistent CP data.
> > > 
> > > I'd prefer to use f2fs_lock_op() in bigger coverage.
> > 
> > Do you mean to cover the entire free_segment_range() function within
> > f2fs_lock_op()? Please clarify.
> 
> I didn't test tho, something like this?
> 
> ---
>  fs/f2fs/checkpoint.c        |  6 ++++--
>  fs/f2fs/f2fs.h              |  2 +-
>  fs/f2fs/gc.c                | 28 ++++++++++++++--------------
>  fs/f2fs/super.c             |  1 -
>  include/trace/events/f2fs.h |  4 +++-
>  5 files changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 852890b72d6ac..531995192b714 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1553,7 +1553,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  			return 0;
>  		f2fs_warn(sbi, "Start checkpoint disabled!");
>  	}
> -	mutex_lock(&sbi->cp_mutex);
> +	if (cpc->reason != CP_RESIZE)
> +		mutex_lock(&sbi->cp_mutex);
>  
>  	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
>  		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
> @@ -1622,7 +1623,8 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	f2fs_update_time(sbi, CP_TIME);
>  	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish checkpoint");
>  out:
> -	mutex_unlock(&sbi->cp_mutex);
> +	if (cpc->reason != CP_RESIZE)
> +		mutex_unlock(&sbi->cp_mutex);
>  	return err;
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c84442eefc56d..7c98dca3ec1d6 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -193,6 +193,7 @@ enum {
>  #define	CP_DISCARD	0x00000010
>  #define CP_TRIMMED	0x00000020
>  #define CP_PAUSE	0x00000040
> +#define CP_RESIZE 	0x00000080
>  
>  #define MAX_DISCARD_BLOCKS(sbi)		BLKS_PER_SEC(sbi)
>  #define DEF_MAX_DISCARD_REQUEST		8	/* issue 8 discards per round */
> @@ -1417,7 +1418,6 @@ struct f2fs_sb_info {
>  	unsigned int segs_per_sec;		/* segments per section */
>  	unsigned int secs_per_zone;		/* sections per zone */
>  	unsigned int total_sections;		/* total section count */
> -	struct mutex resize_mutex;		/* for resize exclusion */
>  	unsigned int total_node_count;		/* total node block count */
>  	unsigned int total_valid_node_count;	/* valid node block count */
>  	loff_t max_file_blocks;			/* max block index of file */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 26248c8936db0..1e5a06fda09d3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1402,8 +1402,9 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
>  static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>  							unsigned int end)
>  {
> -	int type;
>  	unsigned int segno, next_inuse;
> +	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
> +	int type;
>  	int err = 0;
>  
>  	/* Move out cursegs from the target range */
> @@ -1417,16 +1418,14 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
>  			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>  		};
>  
> -		down_write(&sbi->gc_lock);
>  		do_garbage_collect(sbi, segno, &gc_list, FG_GC);
> -		up_write(&sbi->gc_lock);
>  		put_gc_inode(&gc_list);
>  
>  		if (get_valid_blocks(sbi, segno, true))
>  			return -EAGAIN;
>  	}
>  
> -	err = f2fs_sync_fs(sbi->sb, 1);
> +	err = f2fs_write_checkpoint(sbi, &cpc);
>  	if (err)
>  		return err;
>  
> @@ -1502,6 +1501,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  {
>  	__u64 old_block_count, shrunk_blocks;
> +	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
>  	unsigned int secs;
>  	int gc_mode, gc_type;
>  	int err = 0;
> @@ -1538,7 +1538,9 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		return -EINVAL;
>  	}
>  
> -	freeze_bdev(sbi->sb->s_bdev);
> +	freeze_super(sbi->sb);
> +	down_write(&sbi->gc_lock);
> +	mutex_lock(&sbi->cp_mutex);
>  
>  	shrunk_blocks = old_block_count - block_count;
>  	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> @@ -1551,11 +1553,12 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		sbi->user_block_count -= shrunk_blocks;
>  	spin_unlock(&sbi->stat_lock);
>  	if (err) {
> -		thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> +		mutex_unlock(&sbi->cp_mutex);
> +		up_write(&sbi->gc_lock);
> +		thaw_super(sbi->sb);
>  		return err;
>  	}
>  
> -	mutex_lock(&sbi->resize_mutex);
>  	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
>  
>  	mutex_lock(&DIRTY_I(sbi)->seglist_lock);
> @@ -1587,17 +1590,13 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		goto out;
>  	}
>  
> -	mutex_lock(&sbi->cp_mutex);
>  	update_fs_metadata(sbi, -secs);
>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
>  	set_sbi_flag(sbi, SBI_IS_DIRTY);
> -	mutex_unlock(&sbi->cp_mutex);
>  
> -	err = f2fs_sync_fs(sbi->sb, 1);
> +	err = f2fs_write_checkpoint(sbi, &cpc);
>  	if (err) {
> -		mutex_lock(&sbi->cp_mutex);
>  		update_fs_metadata(sbi, secs);
> -		mutex_unlock(&sbi->cp_mutex);
>  		update_sb_metadata(sbi, secs);
>  		f2fs_commit_super(sbi, false);
>  	}
> @@ -1612,7 +1611,8 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  		spin_unlock(&sbi->stat_lock);
>  	}
>  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
> -	mutex_unlock(&sbi->resize_mutex);
> -	thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> +	mutex_unlock(&sbi->cp_mutex);
> +	up_write(&sbi->gc_lock);
> +	thaw_super(sbi->sb);
>  	return err;
>  }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b83b17b54a0a6..1e7b1d21d0177 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3412,7 +3412,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	init_rwsem(&sbi->gc_lock);
>  	mutex_init(&sbi->writepages);
>  	mutex_init(&sbi->cp_mutex);
> -	mutex_init(&sbi->resize_mutex);
>  	init_rwsem(&sbi->node_write);
>  	init_rwsem(&sbi->node_change);
>  
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index d97adfc327f03..f5eb03c54e96f 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -50,6 +50,7 @@ TRACE_DEFINE_ENUM(CP_RECOVERY);
>  TRACE_DEFINE_ENUM(CP_DISCARD);
>  TRACE_DEFINE_ENUM(CP_TRIMMED);
>  TRACE_DEFINE_ENUM(CP_PAUSE);
> +TRACE_DEFINE_ENUM(CP_RESIZE);
>  
>  #define show_block_type(type)						\
>  	__print_symbolic(type,						\
> @@ -126,7 +127,8 @@ TRACE_DEFINE_ENUM(CP_PAUSE);
>  		{ CP_RECOVERY,	"Recovery" },				\
>  		{ CP_DISCARD,	"Discard" },				\
>  		{ CP_PAUSE,	"Pause" },				\
> -		{ CP_TRIMMED,	"Trimmed" })
> +		{ CP_TRIMMED,	"Trimmed" },				\
> +		{ CP_RESIZE,	"Resize" })
>  
>  #define show_fsync_cpreason(type)					\
>  	__print_symbolic(type,						\
> -- 
> 2.26.0.rc2.310.g2932bb562d-goog
> 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
