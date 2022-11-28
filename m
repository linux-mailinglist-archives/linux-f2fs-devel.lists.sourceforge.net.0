Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 427DF63B4A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 23:10:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozmKM-0007kY-Bf;
	Mon, 28 Nov 2022 22:10:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ozmKG-0007kN-6C
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 22:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xav8drGmXvnNtqZzl8SVyY6jOtKyfYlHRso1+74OqLE=; b=T68y4tLSIOH/7CS+5HUTI5wiE8
 BamyopfKF0eFw2LfdOFwK9V063mpI9nkONhWkVzO3BfHfHPr5VMNuc6+xR/Zv6T1CyU8YN5KYD1wP
 5MyQTMHj4eT9+z2zkbmOxZc1U/OPNM9p69ek6xrGGz3bSzX/uP9bQ2ipiKgxgLCP21bQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xav8drGmXvnNtqZzl8SVyY6jOtKyfYlHRso1+74OqLE=; b=ZGiMQ92rJujWfChs8wpircTAnF
 cFeeAAyt5dgwewGkEQZoiO4GooDibIVhcM2h0Gp1/jkyjSCmCPmDt1M1Es9WrNoTNiydPkRlltPeH
 0XCsJx2LlJNgXfqmi0RjlgWLOh37biKHMhWuhQ2HiVeOOvGHVvEa3HBFR2WnxrMHDPio=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozmKB-0006uL-6n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 22:10:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA3F8614A6;
 Mon, 28 Nov 2022 22:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B987C433D7;
 Mon, 28 Nov 2022 22:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669673397;
 bh=bqj9g+jLTDji4I+GdGiDgNX5c3aziUxLgv0yWrH7unI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qIla2H6y76Y5sfcMxSJteSS74PM6efM3vqzdoeThZYkS2QkzWX4vbIz+ZXNYwXkth
 NxX/nLO94jKO0kATGgYeozLSM9F5yv1yK5WpkWlcTTiQMy12JZ8nce8qesA4i2q2ff
 y4jlI82UN+C4TfTed8RIwjqkIC5vAmIFKt106yKrRlDUyNB9uh/FT5gdIc7IBNDsn5
 xx8vPG5mgZBbvNwteX+78mJB0O7dVRZH4imrk0pR5giAxqaAkMxMaSB0zuPjQOV2WZ
 IssGnrdT+PvLd0MJXe5P06SkvgqOAoHIHZsWUTqQHvoXq2iJ2qK/6pFSmZWI4CmCGd
 NOiYzLr1lR8DA==
Date: Mon, 28 Nov 2022 14:09:55 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y4UxswxCt/Ew/X/X@google.com>
References: <20221123132502.72078-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221123132502.72078-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Need to run checkpatch? On 11/23, Yangtao Li wrote: > This
 patch adds support for counting the average time of submit discard > command, 
 and we can see its value in debugfs. > > Signed-off-by: Yangtao Li
 <frank.li@vivo.com> [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ozmKB-0006uL-6n
Subject: Re: [f2fs-dev] [PATCH] f2fs: add support for counting the average
 time of submit discard cmd
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

Need to run checkpatch?

On 11/23, Yangtao Li wrote:
> This patch adds support for counting the average time of submit discard
> command, and we can see its value in debugfs.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/debug.c   |  7 +++++--
>  fs/f2fs/f2fs.h    |  5 +++++
>  fs/f2fs/segment.c | 17 +++++++++++++++--
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index a216dcdf6941..ede862cb178d 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -109,6 +109,9 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  			llist_empty(&SM_I(sbi)->fcc_info->issue_list);
>  	}
>  	if (SM_I(sbi)->dcc_info) {
> +		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +
> +		si->discard_avg = dcc->discard_time_avg;
>  		si->nr_discarded =
>  			atomic_read(&SM_I(sbi)->dcc_info->issued_discard);
>  		si->nr_discarding =
> @@ -506,11 +509,11 @@ static int stat_show(struct seq_file *s, void *v)
>  		seq_printf(s, "  - IO_R (Data: %4d, Node: %4d, Meta: %4d\n",
>  			   si->nr_rd_data, si->nr_rd_node, si->nr_rd_meta);
>  		seq_printf(s, "  - IO_W (CP: %4d, Data: %4d, Flush: (%4d %4d %4d), "
> -			"Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
> +					  "Discard: (%4d %4d avg:%4lldns)) cmd: %4d undiscard:%4u\n",
>  			   si->nr_wb_cp_data, si->nr_wb_data,
>  			   si->nr_flushing, si->nr_flushed,
>  			   si->flush_list_empty,
> -			   si->nr_discarding, si->nr_discarded,
> +			   si->nr_discarding, si->nr_discarded, ktime_to_us(si->discard_avg),
>  			   si->nr_discard_cmd, si->undiscard_blks);
>  		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
>  			   si->aw_cnt, si->max_aw_cnt);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f0833638f59e..6891467fdb6a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -372,6 +372,8 @@ struct discard_cmd {
>  	int error;			/* bio error */
>  	spinlock_t lock;		/* for state/bio_ref updating */
>  	unsigned short bio_ref;		/* bio reference count */
> +	struct discard_cmd_control *dcc; /* global discard cmd control */
> +	ktime_t submit_start;		/* submit start time */
>  };
>  
>  enum {
> @@ -415,6 +417,8 @@ struct discard_cmd_control {
>  	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
>  	unsigned int undiscard_blks;		/* # of undiscard blocks */
>  	unsigned int next_pos;			/* next discard position */
> +	spinlock_t discard_time_lock;	/* for discard time statistics */
> +	ktime_t discard_time_avg;		/* issued discard cmd avg time */
>  	atomic_t issued_discard;		/* # of issued discard */
>  	atomic_t queued_discard;		/* # of queued discard */
>  	atomic_t discard_cmd_cnt;		/* # of cached cmd count */
> @@ -3883,6 +3887,7 @@ struct f2fs_stat_info {
>  	int nr_dio_read, nr_dio_write;
>  	unsigned int io_skip_bggc, other_skip_bggc;
>  	int nr_flushing, nr_flushed, flush_list_empty;
> +	ktime_t	discard_avg;
>  	int nr_discarding, nr_discarded;
>  	int nr_discard_cmd;
>  	unsigned int undiscard_blks;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8b0b76550578..dd67e936615a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -936,6 +936,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
>  	list_add_tail(&dc->list, pend_list);
>  	spin_lock_init(&dc->lock);
>  	dc->bio_ref = 0;
> +	dc->dcc = dcc;
>  	atomic_inc(&dcc->discard_cmd_cnt);
>  	dcc->undiscard_blks += len;
>  
> @@ -1005,9 +1006,13 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
>  static void f2fs_submit_discard_endio(struct bio *bio)
>  {
>  	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
> +	struct discard_cmd_control *dcc = dc->dcc;
>  	unsigned long flags;
> +	ktime_t submit_time;
> +	int nr_discarded;
>  
>  	spin_lock_irqsave(&dc->lock, flags);
> +	submit_time = ktime_sub(ktime_get(), dc->submit_start);
>  	if (!dc->error)
>  		dc->error = blk_status_to_errno(bio->bi_status);
>  	dc->bio_ref--;
> @@ -1017,6 +1022,13 @@ static void f2fs_submit_discard_endio(struct bio *bio)
>  	}
>  	spin_unlock_irqrestore(&dc->lock, flags);
>  	bio_put(bio);
> +
> +	spin_lock_irqsave(&dcc->discard_time_lock, flags);
> +	nr_discarded = atomic_read(&dcc->issued_discard);
> +	dcc->discard_time_avg = div_u64(ktime_add(nr_discarded * dcc->discard_time_avg, submit_time),
> +									nr_discarded + 1);
> +	atomic_inc(&dcc->issued_discard);
> +	spin_unlock_irqrestore(&dcc->discard_time_lock, flags);
>  }
>  
>  static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
> @@ -1165,6 +1177,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  		 * right away
>  		 */
>  		spin_lock_irqsave(&dc->lock, flags);
> +		dc->submit_start = ktime_get();
>  		if (last)
>  			dc->state = D_SUBMIT;
>  		else
> @@ -1184,8 +1197,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  		bio->bi_opf |= flag;
>  		submit_bio(bio);
>  
> -		atomic_inc(&dcc->issued_discard);
> -
>  		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
>  
>  		lstart += len;
> @@ -2076,9 +2087,11 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>  	INIT_LIST_HEAD(&dcc->wait_list);
>  	INIT_LIST_HEAD(&dcc->fstrim_list);
>  	mutex_init(&dcc->cmd_lock);
> +	spin_lock_init(&dcc->discard_time_lock);
>  	atomic_set(&dcc->issued_discard, 0);
>  	atomic_set(&dcc->queued_discard, 0);
>  	atomic_set(&dcc->discard_cmd_cnt, 0);
> +	dcc->discard_time_avg = 0;
>  	dcc->nr_discards = 0;
>  	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
>  	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
