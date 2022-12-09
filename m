Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F171664895A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Dec 2022 21:00:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3jXx-0002dy-Hq;
	Fri, 09 Dec 2022 20:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p3jXd-0002dh-1X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 20:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=95pXkxHljlYeVmRVcwQFGH+jo1+QSVEg5A0tThEkG9E=; b=LXqIZrRW+dXBC3lAed3QixFf2H
 dKbsDziDtKwcTdEFuG3EXZ7Hhn+54fUhnkLEdhViDG9ZfLmsQVSqcpKAVwBUr42qqwRVC9y9p5OeN
 bDkakXqZ2MQJG5lAV1xsYGGatcsMsANC0JJcbCreb38NJ5OjTPbV4lfu/JbguK552lZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=95pXkxHljlYeVmRVcwQFGH+jo1+QSVEg5A0tThEkG9E=; b=fvOxoipsRj4VH50P/kztWla2xJ
 94lisgYviHYSAjjxFlK0agRorDAuOSQ7l8Lta7kES4VrndexhB7Q7HZZLILJEMNiZcr1e8CKUVdyD
 7a/7rRWXPjpt9su9VvujAl8nDTBB/RgoVb4ES5MvON5zXYrmp7VdqzbeG7iSehmRfbZM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3jXU-0002ee-Rx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 20:00:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FBE6B82908;
 Fri,  9 Dec 2022 19:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98C2C433D2;
 Fri,  9 Dec 2022 19:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670615993;
 bh=APLv10D7XtvFX9HKL9kA1ew1UoIKNDoxYrNVlNz/a9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HU7eLdrCjm/yeqpgdeUBFy6gC10h2B/Nk4VFkmYHJoom8T6VJ7ne1nWPzWrL9KoQq
 qWTU6/56nCoP8fdgUMvaDe8N9mzqTL45k7ffuIuXDv5efg/VCpY6VquAUWGZZI5CM6
 2qYrtbMQwJ/+dgEptJbHJ2K0eYbcW8IIAsk/ItkfPqXJy+b9639gy7leS8Z0Za1QRw
 UJblWdPiYHz7gP0MgxBJ74cYb77hJHUF+/nV4B1TMqBxctp9pIvBZhiOIVxYy8PWGA
 t+6G7ueb/h2LMXZ1dZGUEO5HCBBgWLYAZ/ZU7xZmhVr8opcWGugXZ18c0FVLVhEwU6
 TWzZpoQx0+WcQ==
Date: Fri, 9 Dec 2022 11:59:52 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y5OTuCcESNrxhv1l@google.com>
References: <20221129041524.81235-1-frank.li@vivo.com>
 <20221129041524.81235-2-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129041524.81235-2-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/29, Yangtao Li wrote: > This patch adds support for
 counting the average time of submit discard > command, and we can see its
 value in debugfs. What about peak latencies as well? > > Signed-off-by:
 Yangtao
 Li <frank.li@vivo.com> > --- > fs/f2fs/debug.c | 7 +++++-- > fs/f2fs/f2fs.h
 | 5 +++++ > fs/f2fs/segment.c | 18 ++++++++++++++++-- > 3 files changed,
 26 insertions(+), 4 dele [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p3jXU-0002ee-Rx
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add support for counting the
 average time of submit discard cmd
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

On 11/29, Yangtao Li wrote:
> This patch adds support for counting the average time of submit discard
> command, and we can see its value in debugfs.

What about peak latencies as well?

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/debug.c   |  7 +++++--
>  fs/f2fs/f2fs.h    |  5 +++++
>  fs/f2fs/segment.c | 18 ++++++++++++++++--
>  3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 733b1bd37404..eed3edfc5faf 100644
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
> @@ -510,8 +513,8 @@ static int stat_show(struct seq_file *s, void *v)
>  			   si->nr_wb_cp_data, si->nr_wb_data,
>  			   si->nr_flushing, si->nr_flushed,
>  			   si->flush_list_empty);
> -		seq_printf(s, "Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
> -			   si->nr_discarding, si->nr_discarded,
> +		seq_printf(s, "Discard: (%4d %4d, avg:%4lldns)) cmd: %4d undiscard:%4u\n",
> +			   si->nr_discarding, si->nr_discarded, ktime_to_us(si->discard_avg),
>  			   si->nr_discard_cmd, si->undiscard_blks);
>  		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
>  			   si->aw_cnt, si->max_aw_cnt);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index eb8c27c4e5fc..5a99759d10ac 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -370,6 +370,8 @@ struct discard_cmd {
>  	int error;			/* bio error */
>  	spinlock_t lock;		/* for state/bio_ref updating */
>  	unsigned short bio_ref;		/* bio reference count */
> +	struct discard_cmd_control *dcc; /* global discard cmd control */
> +	ktime_t submit_start;		/* submit start time */
>  };
>  
>  enum {
> @@ -414,6 +416,8 @@ struct discard_cmd_control {
>  	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
>  	unsigned int undiscard_blks;		/* # of undiscard blocks */
>  	unsigned int next_pos;			/* next discard position */
> +	spinlock_t discard_time_lock;	/* for discard time statistics */
> +	ktime_t discard_time_avg;		/* issued discard cmd avg time */
>  	atomic_t issued_discard;		/* # of issued discard */
>  	atomic_t queued_discard;		/* # of queued discard */
>  	atomic_t discard_cmd_cnt;		/* # of cached cmd count */
> @@ -3882,6 +3886,7 @@ struct f2fs_stat_info {
>  	int nr_dio_read, nr_dio_write;
>  	unsigned int io_skip_bggc, other_skip_bggc;
>  	int nr_flushing, nr_flushed, flush_list_empty;
> +	ktime_t	discard_avg;
>  	int nr_discarding, nr_discarded;
>  	int nr_discard_cmd;
>  	unsigned int undiscard_blks;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 9486ca49ecb1..bc96b1afb308 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -931,6 +931,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
>  	list_add_tail(&dc->list, pend_list);
>  	spin_lock_init(&dc->lock);
>  	dc->bio_ref = 0;
> +	dc->dcc = dcc;
>  	atomic_inc(&dcc->discard_cmd_cnt);
>  	dcc->undiscard_blks += len;
>  
> @@ -1000,9 +1001,13 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
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
> @@ -1012,6 +1017,14 @@ static void f2fs_submit_discard_endio(struct bio *bio)
>  	}
>  	spin_unlock_irqrestore(&dc->lock, flags);
>  	bio_put(bio);
> +
> +	spin_lock_irqsave(&dcc->discard_time_lock, flags);
> +	nr_discarded = atomic_read(&dcc->issued_discard);
> +	dcc->discard_time_avg = div_u64(ktime_add(nr_discarded * dcc->discard_time_avg,
> +										submit_time),
> +									nr_discarded + 1);
> +	atomic_inc(&dcc->issued_discard);
> +	spin_unlock_irqrestore(&dcc->discard_time_lock, flags);
>  }
>  
>  static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
> @@ -1160,6 +1173,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  		 * right away
>  		 */
>  		spin_lock_irqsave(&dc->lock, flags);
> +		dc->submit_start = ktime_get();
>  		if (last)
>  			dc->state = D_SUBMIT;
>  		else
> @@ -1179,8 +1193,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  		bio->bi_opf |= flag;
>  		submit_bio(bio);
>  
> -		atomic_inc(&dcc->issued_discard);
> -
>  		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
>  
>  		lstart += len;
> @@ -2070,9 +2082,11 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
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
