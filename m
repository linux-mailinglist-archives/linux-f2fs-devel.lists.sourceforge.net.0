Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B80771A2D99
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Apr 2020 04:29:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jMMwn-0000hH-CR; Thu, 09 Apr 2020 02:29:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jMMwm-0000h9-UM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 02:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hoERfSuCeegM6x6JDw7/8/lFL9SfXFkqpdnHeYqT5wE=; b=T8LNXqycOuBwrI8r3XS+ssfmse
 naVCc4c7jrMB8PXE2uzqSdlZEjgbGqz4E0uJiLeOTRrl4kD4PykxOf7g4QZTzirCZdmmd+YA6WwZ+
 G9JBXxdvrbfPnspg7VEWFS8/xHxRYWp9zZO48q6ScYjopJBjJCGxJLLwPgvuowaNsDcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hoERfSuCeegM6x6JDw7/8/lFL9SfXFkqpdnHeYqT5wE=; b=FArypgu+99vrxSDasDtU5aeINj
 qZaV/pso2NWCtSUrHaDO2TPu87lhRnA6+ueOOjr7slWqNBYaTMgfnXJ7N6R1uahns2PR8huPrhJt+
 ZUPneMMnK07CeW0yekWdi3EyjpKcM3BKNJZBNIZmBmKb1wN/1RfCzvLS6WGGaC8z1Chc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jMMwg-008pHl-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 02:29:40 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E652B2074F;
 Thu,  9 Apr 2020 02:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586399369;
 bh=9Ma3L1fySRklm6bl3YO+KuHY8W+LytPch+IbfWBH+hI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEUZYZI8/imbFcKtWY8Uo61UnKnOctE8fpj2Pkg7qOnWKjlUOYGZMmDeOlSFms/LP
 KfuC/geIH4tHOLl+PWoZ4kQEdQNTL8WVG+1P6lmPlWdQ+mbl5tJmccZn7QvbSkymi8
 Mtz/hyIXl7VjQk2J5DR+aVNywFl737bIAg5RkfB4=
Date: Wed, 8 Apr 2020 19:29:28 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20200409022928.GD110440@google.com>
References: <1585550730-1858-1-git-send-email-stummala@codeaurora.org>
 <20200331184655.GB198665@google.com>
 <20200401092201.GB20234@codeaurora.org>
 <20200403171943.GC68460@google.com>
 <20200408090024.GC20234@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408090024.GC20234@codeaurora.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jMMwg-008pHl-Jv
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix long latency due to discard
 during umount
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

On 04/08, Sahitya Tummala wrote:
> Hi Jaegeuk,
> 
> On Fri, Apr 03, 2020 at 10:19:43AM -0700, Jaegeuk Kim wrote:
> > On 04/01, Sahitya Tummala wrote:
> > > Hi Jaegeuk,
> > > 
> > > On Tue, Mar 31, 2020 at 11:46:55AM -0700, Jaegeuk Kim wrote:
> > > > On 03/30, Sahitya Tummala wrote:
> > > > > F2FS already has a default timeout of 5 secs for discards that
> > > > > can be issued during umount, but it can take more than the 5 sec
> > > > > timeout if the underlying UFS device queue is already full and there
> > > > > are no more available free tags to be used. In that case, submit_bio()
> > > > > will wait for the already queued discard requests to complete to get
> > > > > a free tag, which can potentially take way more than 5 sec.
> > > > > 
> > > > > Fix this by submitting the discard requests with REQ_NOWAIT
> > > > > flags during umount. This will return -EAGAIN for UFS queue/tag full
> > > > > scenario without waiting in the context of submit_bio(). The FS can
> > > > > then handle these requests by retrying again within the stipulated
> > > > > discard timeout period to avoid long latencies.
> > > > 
> > > > Sorry, Sahitya, but, do we really need to do like this? How about just
> > > > controlling # of outstanding discarding bios in __issue_discard_cmd()?
> > > 
> > > Do you mean something like this?
> > > 
> > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > index 1a62b27..860dd43 100644
> > > --- a/fs/f2fs/segment.c
> > > +++ b/fs/f2fs/segment.c
> > > @@ -1099,7 +1099,7 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
> > >         } else if (discard_type == DPOLICY_FSTRIM) {
> > >                 dpolicy->io_aware = false;
> > >         } else if (discard_type == DPOLICY_UMOUNT) {
> > > -               dpolicy->max_requests = UINT_MAX;
> > > +               dpolicy->max_requests = 30;
> > 
> > Can we use max queue depth of the block device?
> 
> I think it should be limited to 8 or 16 as Chao suggested, so that we can have
> better control on the given timeout value? Thoughts?

Where is 8 or 16 coming from? What about SSD? Sorry, it's unclear to me.

> 
> Thanks,
> 
> > 
> > >                 dpolicy->io_aware = false;
> > >                 /* we need to issue all to keep CP_TRIMMED_FLAG */
> > >                 dpolicy->granularity = 1;
> > > @@ -1470,12 +1470,14 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> > >         struct list_head *pend_list;
> > >         struct discard_cmd *dc, *tmp;
> > >         struct blk_plug plug;
> > > -       int i, issued = 0;
> > > +       int i, issued;
> > >         bool io_interrupted = false;
> > > 
> > >         if (dpolicy->timeout != 0)
> > >                 f2fs_update_time(sbi, dpolicy->timeout);
> > > 
> > > +retry:
> > > +       issued = 0;
> > >         for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
> > >                 if (dpolicy->timeout != 0 &&
> > >                                 f2fs_time_over(sbi, dpolicy->timeout))
> > > @@ -1522,6 +1524,11 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> > >                         break;
> > >         }
> > > 
> > > +       if (dpolicy->type == DPOLICY_UMOUNT && issued) {
> > > +               __wait_all_discard_cmd(sbi, dpolicy);
> > > +               goto retry;
> > > +       }
> > > +
> > >         if (!issued && io_interrupted)
> > >                 issued = -1;
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > > > > ---
> > > > > v3:
> > > > > -Handle the regression reported by Chao with v2.
> > > > > -simplify the logic to split the dc with multiple bios incase any bio returns
> > > > >  EAGAIN and retry those new dc within 5 sec timeout.
> > > > > 
> > > > >  fs/f2fs/segment.c | 65 +++++++++++++++++++++++++++++++++++++++++++------------
> > > > >  1 file changed, 51 insertions(+), 14 deletions(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > index fb3e531..55d18c7 100644
> > > > > --- a/fs/f2fs/segment.c
> > > > > +++ b/fs/f2fs/segment.c
> > > > > @@ -1029,13 +1029,16 @@ static void f2fs_submit_discard_endio(struct bio *bio)
> > > > >  	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
> > > > >  	unsigned long flags;
> > > > >  
> > > > > -	dc->error = blk_status_to_errno(bio->bi_status);
> > > > > -
> > > > >  	spin_lock_irqsave(&dc->lock, flags);
> > > > > +	if (!dc->error)
> > > > > +		dc->error = blk_status_to_errno(bio->bi_status);
> > > > > +
> > > > >  	dc->bio_ref--;
> > > > > -	if (!dc->bio_ref && dc->state == D_SUBMIT) {
> > > > > -		dc->state = D_DONE;
> > > > > -		complete_all(&dc->wait);
> > > > > +	if (!dc->bio_ref) {
> > > > > +		if (dc->error || dc->state == D_SUBMIT) {
> > > > > +			dc->state = D_DONE;
> > > > > +			complete_all(&dc->wait);
> > > > > +		}
> > > > >  	}
> > > > >  	spin_unlock_irqrestore(&dc->lock, flags);
> > > > >  	bio_put(bio);
> > > > > @@ -1124,10 +1127,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > > > >  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> > > > >  	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
> > > > >  					&(dcc->fstrim_list) : &(dcc->wait_list);
> > > > > -	int flag = dpolicy->sync ? REQ_SYNC : 0;
> > > > > +	int flag;
> > > > >  	block_t lstart, start, len, total_len;
> > > > >  	int err = 0;
> > > > >  
> > > > > +	flag = dpolicy->sync ? REQ_SYNC : 0;
> > > > > +	flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;
> > > > > +
> > > > >  	if (dc->state != D_PREP)
> > > > >  		return 0;
> > > > >  
> > > > > @@ -1192,10 +1198,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > > > >  		dc->bio_ref++;
> > > > >  		spin_unlock_irqrestore(&dc->lock, flags);
> > > > >  
> > > > > -		atomic_inc(&dcc->queued_discard);
> > > > > -		dc->queued++;
> > > > > -		list_move_tail(&dc->list, wait_list);
> > > > > -
> > > > >  		/* sanity check on discard range */
> > > > >  		__check_sit_bitmap(sbi, lstart, lstart + len);
> > > > >  
> > > > > @@ -1203,6 +1205,29 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > > > >  		bio->bi_end_io = f2fs_submit_discard_endio;
> > > > >  		bio->bi_opf |= flag;
> > > > >  		submit_bio(bio);
> > > > > +		if (flag & REQ_NOWAIT) {
> > > > > +			if (dc->error == -EAGAIN) {
> > > > > +				spin_lock_irqsave(&dc->lock, flags);
> > > > > +				dc->len -= len;
> > > > > +				if (!dc->len) {
> > > > > +					dc->len = total_len;
> > > > > +					dc->state = D_PREP;
> > > > > +					reinit_completion(&dc->wait);
> > > > > +				} else {
> > > > > +					dcc->undiscard_blks -= total_len;
> > > > > +					if (dc->state == D_PARTIAL)
> > > > > +						dc->state = D_SUBMIT;
> > > > > +				}
> > > > > +				err = dc->error;
> > > > > +				dc->error = 0;
> > > > > +				spin_unlock_irqrestore(&dc->lock, flags);
> > > > > +				break;
> > > > > +			}
> > > > > +		}
> > > > > +
> > > > > +		atomic_inc(&dcc->queued_discard);
> > > > > +		dc->queued++;
> > > > > +		list_move_tail(&dc->list, wait_list);
> > > > >  
> > > > >  		atomic_inc(&dcc->issued_discard);
> > > > >  
> > > > > @@ -1214,8 +1239,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > > > >  		len = total_len;
> > > > >  	}
> > > > >  
> > > > > -	if (!err && len)
> > > > > -		__update_discard_tree_range(sbi, bdev, lstart, start, len);
> > > > > +	if ((!err || err == -EAGAIN) && total_len && dc->start != start)
> > > > > +		__update_discard_tree_range(sbi, bdev, lstart, start,
> > > > > +					total_len);
> > > > >  	return err;
> > > > >  }
> > > > >  
> > > > > @@ -1470,12 +1496,15 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> > > > >  	struct list_head *pend_list;
> > > > >  	struct discard_cmd *dc, *tmp;
> > > > >  	struct blk_plug plug;
> > > > > -	int i, issued = 0;
> > > > > +	int i, err, issued = 0;
> > > > >  	bool io_interrupted = false;
> > > > > +	bool retry;
> > > > >  
> > > > >  	if (dpolicy->timeout != 0)
> > > > >  		f2fs_update_time(sbi, dpolicy->timeout);
> > > > >  
> > > > > +retry:
> > > > > +	retry = false;
> > > > >  	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
> > > > >  		if (dpolicy->timeout != 0 &&
> > > > >  				f2fs_time_over(sbi, dpolicy->timeout))
> > > > > @@ -1509,7 +1538,12 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> > > > >  				break;
> > > > >  			}
> > > > >  
> > > > > -			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
> > > > > +			err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
> > > > > +			if (err == -EAGAIN) {
> > > > > +				congestion_wait(BLK_RW_ASYNC,
> > > > > +						DEFAULT_IO_TIMEOUT);
> > > > > +				retry = true;
> > > > > +			}
> > > > >  
> > > > >  			if (issued >= dpolicy->max_requests)
> > > > >  				break;
> > > > > @@ -1522,6 +1556,9 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> > > > >  			break;
> > > > >  	}
> > > > >  
> > > > > +	if (retry)
> > > > > +		goto retry;
> > > > > +
> > > > >  	if (!issued && io_interrupted)
> > > > >  		issued = -1;
> > > > >  
> > > > > -- 
> > > > > Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> > > > > Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> > > 
> > > -- 
> > > --
> > > Sent by a consultant of the Qualcomm Innovation Center, Inc.
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
> 
> -- 
> --
> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
