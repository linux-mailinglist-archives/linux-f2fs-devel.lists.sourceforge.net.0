Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A764AA9B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 23:47:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4ra3-0000I5-Jz;
	Mon, 12 Dec 2022 22:47:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p4ra2-0000Hy-K0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 22:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PewIUQL1JbYpXAps2B7psyQSqMzu23rDGpbeocdAbiE=; b=igAc1QjzUr6WlE1RUcfQC2BU2b
 LwHk1u0kGtxAcbI6NWxJJ45HoN28yVNtPkFJImU8gil4a//dCQPMmA3ULTCTnR+AM6BCb1RxJYZCT
 av758IXU3HoLDrxKSqpFj4/5ieDyrahgJOFLoo8ZDKMiv/FUOKB/5JYvxwlzop6+qPNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PewIUQL1JbYpXAps2B7psyQSqMzu23rDGpbeocdAbiE=; b=MeVdRr1V2XGFSrucctFqkL61eG
 S6PB6Bbg8InxoCyUI25ekxLXY5V4ZXJ+9Q7RZMiznTrrmFjzhMwowtkHU/hd35z/avbY+FKcC5cZ4
 q7v71lMJYIr+TR5cMq8vJeQ1ncTyMbUljRnkvOEwyY0n6UtjG3a2Q9PWLFcYjbBsKQ/o=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4ra1-0005GO-Ir for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 22:47:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4EC16B80E9C;
 Mon, 12 Dec 2022 22:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8897FC433F0;
 Mon, 12 Dec 2022 22:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670885236;
 bh=4/6SuCNcBrCMb/LiBQ8O3Kf5f2TLbj+uxIKFNs10M08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dtsJNDNYtTaS7ugd/RUtYb1IRNMuwxpI1uxMVPgWcVH8jzD6VKz/RFks0gYXS9jSr
 MQKQIOUpwXq5vWFdJgSz6maWW1plOp6YboLgsIHJzpu7BQHnSHVHT8DEqlLBKuGTGz
 Ae6tCf4nPw2LP82hOvZmUtkOpgGyplUGHy3yioBWkoMBWDUc6KR1HEuY6UylV2BOTk
 oZp4MWN07gub0vEG/hZle1ALG7/GRY+tItwwh6P9h4WHtG8OmYpYsd0YTNvPqBc1aW
 lVZKkoMeHGztuD7FBu+P8IgaGoq00UCh4tb8Yg9s94mFBKYiuioBTT0Fj++TJgg6KX
 SHkSMUklTq0yg==
Date: Mon, 12 Dec 2022 14:47:15 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y5evc3D8eZlOjTjI@google.com>
References: <20221212125137.77187-1-frank.li@vivo.com>
 <b76428f8-fd9e-7c4e-52ea-0eeb1ea443af@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b76428f8-fd9e-7c4e-52ea-0eeb1ea443af@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12, Chao Yu wrote: > On 2022/12/12 20:51, Yangtao Li
 wrote: > > This patch adds support for counting the average time and > >
 peak time of submit discard command, and we can see its > > value in [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4ra1-0005GO-Ir
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support for counting time of
 submit discard cmd
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12, Chao Yu wrote:
> On 2022/12/12 20:51, Yangtao Li wrote:
> > This patch adds support for counting the average time and
> > peak time of submit discard command, and we can see its
> > value in debugfs.
> > 
> > It is not sure whether the block layer has recorded these
> > data, and these data are allowed to be accessed by fs,
> > or they are only exported to user space.
> > 
> > On the one hand, I added these data to better understand
> > the current device operating status, and to further control
> > the discard process in a more detailed manner based on the
> > discard submit time in the future.
> 
> Again, w'd better to consider this functionality only when DEBUG_FS is
> enabled.

BTW, why can't we use iostat to get the discard latencies?

> 
> > 
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >   fs/f2fs/debug.c   | 10 +++++++---
> >   fs/f2fs/f2fs.h    |  6 ++++++
> >   fs/f2fs/segment.c | 21 +++++++++++++++++++--
> >   3 files changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> > index 32af4f0c5735..142c256b89d9 100644
> > --- a/fs/f2fs/debug.c
> > +++ b/fs/f2fs/debug.c
> > @@ -120,6 +120,10 @@ static void update_general_status(struct f2fs_sb_info *sbi)
> >   			llist_empty(&SM_I(sbi)->fcc_info->issue_list);
> >   	}
> >   	if (SM_I(sbi)->dcc_info) {
> > +		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> > +
> > +		si->discard_avg = dcc->discard_time_avg;
> > +		si->discard_peak = dcc->discard_time_peak;
> >   		si->nr_discarded =
> >   			atomic_read(&SM_I(sbi)->dcc_info->issued_discard);
> >   		si->nr_discarding =
> > @@ -545,9 +549,9 @@ static int stat_show(struct seq_file *s, void *v)
> >   			   si->nr_wb_cp_data, si->nr_wb_data,
> >   			   si->nr_flushing, si->nr_flushed,
> >   			   si->flush_list_empty);
> > -		seq_printf(s, "Discard: (%4d %4d)) cmd: %4d undiscard:%4u\n",
> > -			   si->nr_discarding, si->nr_discarded,
> > -			   si->nr_discard_cmd, si->undiscard_blks);
> > +		seq_printf(s, "Discard: (%4d %4d, avg:%4lldns, peak:%4lldns)) cmd: %4d undiscard:%4u\n",
> > +			   si->nr_discarding, si->nr_discarded, ktime_to_us(si->discard_avg),
> > +			   ktime_to_us(si->discard_peak), si->nr_discard_cmd, si->undiscard_blks);
> >   		seq_printf(s, "  - atomic IO: %4d (Max. %4d)\n",
> >   			   si->aw_cnt, si->max_aw_cnt);
> >   		seq_printf(s, "  - compress: %4d, hit:%8d\n", si->compress_pages, si->compress_page_hit);
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index e8953c3dc81a..2cd55cb981ff 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -371,6 +371,8 @@ struct discard_cmd {
> >   	int error;			/* bio error */
> >   	spinlock_t lock;		/* for state/bio_ref updating */
> >   	unsigned short bio_ref;		/* bio reference count */
> > +	struct discard_cmd_control *dcc;	/* global discard cmd control */
> > +	ktime_t submit_start;	/* submit start time */
> >   };
> >   enum {
> > @@ -415,6 +417,9 @@ struct discard_cmd_control {
> >   	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
> >   	unsigned int undiscard_blks;		/* # of undiscard blocks */
> >   	unsigned int next_pos;			/* next discard position */
> > +	spinlock_t discard_time_lock;	/* for discard time statistics */
> > +	ktime_t discard_time_avg;		/* issued discard cmd avg time */
> > +	ktime_t discard_time_peak;		/* issued discard cmd peak time */
> >   	atomic_t issued_discard;		/* # of issued discard */
> >   	atomic_t queued_discard;		/* # of queued discard */
> >   	atomic_t discard_cmd_cnt;		/* # of cached cmd count */
> > @@ -3896,6 +3901,7 @@ struct f2fs_stat_info {
> >   	int nr_dio_read, nr_dio_write;
> >   	unsigned int io_skip_bggc, other_skip_bggc;
> >   	int nr_flushing, nr_flushed, flush_list_empty;
> > +	ktime_t discard_avg, discard_peak;
> >   	int nr_discarding, nr_discarded;
> >   	int nr_discard_cmd;
> >   	unsigned int undiscard_blks;
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index a9099a754dd2..73cd05bb3f4a 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -937,6 +937,7 @@ static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
> >   	list_add_tail(&dc->list, pend_list);
> >   	spin_lock_init(&dc->lock);
> >   	dc->bio_ref = 0;
> > +	dc->dcc = dcc;
> >   	atomic_inc(&dcc->discard_cmd_cnt);
> >   	dcc->undiscard_blks += len;
> > @@ -1006,9 +1007,13 @@ static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
> >   static void f2fs_submit_discard_endio(struct bio *bio)
> >   {
> >   	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
> > +	struct discard_cmd_control *dcc = dc->dcc;
> >   	unsigned long flags;
> > +	ktime_t submit_time;
> > +	int nr_discarded;
> >   	spin_lock_irqsave(&dc->lock, flags);
> > +	submit_time = ktime_sub(ktime_get(), dc->submit_start);
> >   	if (!dc->error)
> >   		dc->error = blk_status_to_errno(bio->bi_status);
> >   	dc->bio_ref--;
> > @@ -1018,6 +1023,16 @@ static void f2fs_submit_discard_endio(struct bio *bio)
> >   	}
> >   	spin_unlock_irqrestore(&dc->lock, flags);
> >   	bio_put(bio);
> > +
> > +	spin_lock_irqsave(&dcc->discard_time_lock, flags);
> > +	nr_discarded = atomic_read(&dcc->issued_discard);
> > +	dcc->discard_time_avg = div_u64(ktime_add(nr_discarded * dcc->discard_time_avg,
> > +										submit_time),
> > +									nr_discarded + 1);
> > +	if (dcc->discard_time_avg > dcc->discard_time_peak)
> > +		dcc->discard_time_peak = dcc->discard_time_avg;
> > +	atomic_inc(&dcc->issued_discard);
> > +	spin_unlock_irqrestore(&dcc->discard_time_lock, flags);
> 
> Why not calculating average time only in update_general_status()? and here,
> we just need to account total_{discard_time, discard_count} w/o additional
> spinlock.
> 
> Thanks,
> 
> >   }
> >   static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
> > @@ -1166,6 +1181,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >   		 * right away
> >   		 */
> >   		spin_lock_irqsave(&dc->lock, flags);
> > +		dc->submit_start = ktime_get();
> >   		if (last)
> >   			dc->state = D_SUBMIT;
> >   		else
> > @@ -1185,8 +1201,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >   		bio->bi_opf |= flag;
> >   		submit_bio(bio);
> > -		atomic_inc(&dcc->issued_discard);
> > -
> >   		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);
> >   		lstart += len;
> > @@ -2079,9 +2093,12 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
> >   	INIT_LIST_HEAD(&dcc->wait_list);
> >   	INIT_LIST_HEAD(&dcc->fstrim_list);
> >   	mutex_init(&dcc->cmd_lock);
> > +	spin_lock_init(&dcc->discard_time_lock);
> >   	atomic_set(&dcc->issued_discard, 0);
> >   	atomic_set(&dcc->queued_discard, 0);
> >   	atomic_set(&dcc->discard_cmd_cnt, 0);
> > +	dcc->discard_time_avg = 0;
> > +	dcc->discard_time_peak = 0;
> >   	dcc->nr_discards = 0;
> >   	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
> >   	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
