Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF0193FE4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 14:37:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHShU-0005Z9-NJ; Thu, 26 Mar 2020 13:37:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jHShS-0005Ys-OP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 13:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uOZHpRxzIqpO+4L0DPl+n7SjA8LxbZT7/KDDzbU/i5g=; b=QP2BEyhxlAcuNtVWZ+tdvW/haA
 x58+IRxXnvF2cmFEJQGgWh5+juf/svpt/y5hbQ9nmoi58bSmTA6M3m3Inv8aWSIvF55yIqrimjOXz
 OI5B/+xg/2lcddvINsAvcI2DX+IJm9VScShUwN/0DppYQ2t7OxJYGS97E6WroTESl5VM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOZHpRxzIqpO+4L0DPl+n7SjA8LxbZT7/KDDzbU/i5g=; b=ASTa4jd2tS8+D6mL83D+AKuMl2
 JUG3Z29T+sRgtWH53UINj3ElAKnH9jC1haqg4gmEYPYWR/YvLwlass1HD8C20HysWN+haDfpqDa/D
 Ha5cz1EHGPq8swovkNfiX/G0HfFrFIcjgp7mnBqBIrvx2g+Il4wAxxB/s+USlN5a3RmI=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jHShJ-000ZxT-Fm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 13:37:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585229848; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=uOZHpRxzIqpO+4L0DPl+n7SjA8LxbZT7/KDDzbU/i5g=;
 b=DBRgx0Xh8yXrqgIfhfK733V4hoZeecL3DKtC3DZaKUdahsDp4LDNAVuLkouoKHCDe8tyMKBe
 IaWXDNJGb4R9mboddOTVabUoUeKoVq3z3AA6h4XTv36m2mhX2TF/c0yPFbOibXwj8fW9F2GE
 MnWG/9caT07WlMvgXMY5wsJqUsc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7cb004.7f07de559ab0-smtp-out-n01;
 Thu, 26 Mar 2020 13:37:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41C49C433D2; Thu, 26 Mar 2020 13:37:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4965DC433F2;
 Thu, 26 Mar 2020 13:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4965DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Thu, 26 Mar 2020 19:07:00 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200326133700.GR20234@codeaurora.org>
References: <1584506689-5041-1-git-send-email-stummala@codeaurora.org>
 <29d4adc4-482d-3d92-1470-3405989ea231@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29d4adc4-482d-3d92-1470-3405989ea231@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jHShJ-000ZxT-Fm
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix long latency due to discard during
 umount
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Thu, Mar 26, 2020 at 05:00:18PM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2020/3/18 12:44, Sahitya Tummala wrote:
> > F2FS already has a default timeout of 5 secs for discards that
> > can be issued during umount, but it can take more than the 5 sec
> > timeout if the underlying UFS device queue is already full and there
> > are no more available free tags to be used. In that case, submit_bio()
> > will wait for the already queued discard requests to complete to get
> > a free tag, which can potentially take way more than 5 sec.
> > 
> > Fix this by submitting the discard requests with REQ_NOWAIT
> > flags during umount. This will return -EAGAIN for UFS queue/tag full
> > scenario without waiting in the context of submit_bio(). The FS can
> > then handle these requests by retrying again within the stipulated
> > discard timeout period to avoid long latencies.
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> > v2:
> > - Handle the case where a dc can have multiple bios associated with it
> > 
> >  fs/f2fs/f2fs.h    |  1 +
> >  fs/f2fs/segment.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-------
> >  2 files changed, 74 insertions(+), 10 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 12a197e..67b8dcc 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -340,6 +340,7 @@ struct discard_cmd_control {
> >  	struct list_head pend_list[MAX_PLIST_NUM];/* store pending entries */
> >  	struct list_head wait_list;		/* store on-flushing entries */
> >  	struct list_head fstrim_list;		/* in-flight discard from fstrim */
> > +	struct list_head retry_list;		/* list of cmds to retry */
> >  	wait_queue_head_t discard_wait_queue;	/* waiting queue for wake-up */
> >  	unsigned int discard_wake;		/* to wake up discard thread */
> >  	struct mutex cmd_lock;
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index fb3e531..4162c76 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -1029,13 +1029,16 @@ static void f2fs_submit_discard_endio(struct bio *bio)
> >  	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
> >  	unsigned long flags;
> >  
> > -	dc->error = blk_status_to_errno(bio->bi_status);
> > -
> >  	spin_lock_irqsave(&dc->lock, flags);
> > +	if (!dc->error)
> > +		dc->error = blk_status_to_errno(bio->bi_status);
> > +
> >  	dc->bio_ref--;
> > -	if (!dc->bio_ref && dc->state == D_SUBMIT) {
> > -		dc->state = D_DONE;
> > -		complete_all(&dc->wait);
> > +	if (!dc->bio_ref) {
> > +		if (dc->error || dc->state == D_SUBMIT) {
> > +			dc->state = D_DONE;
> > +			complete_all(&dc->wait);
> > +		}
> >  	}
> >  	spin_unlock_irqrestore(&dc->lock, flags);
> >  	bio_put(bio);
> > @@ -1124,10 +1127,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> >  	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
> >  					&(dcc->fstrim_list) : &(dcc->wait_list);
> > -	int flag = dpolicy->sync ? REQ_SYNC : 0;
> > -	block_t lstart, start, len, total_len;
> > +	int flag;
> > +	block_t lstart, start, len, total_len, orig_len;
> >  	int err = 0;
> >  
> > +	flag = dpolicy->sync ? REQ_SYNC : 0;
> > +	flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;
> > +
> >  	if (dc->state != D_PREP)
> >  		return 0;
> >  
> > @@ -1139,7 +1145,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >  	lstart = dc->lstart;
> >  	start = dc->start;
> >  	len = dc->len;
> > -	total_len = len;
> > +	orig_len = total_len = len;
> >  
> >  	dc->len = 0;
> >  
> > @@ -1203,6 +1209,14 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >  		bio->bi_end_io = f2fs_submit_discard_endio;
> >  		bio->bi_opf |= flag;
> >  		submit_bio(bio);
> > +		if (flag & REQ_NOWAIT) {
> > +			if (dc->error == -EAGAIN) {
> > +				dc->len = orig_len;
> > +				list_move(&dc->list, &dcc->retry_list);
> > +				err = dc->error;
> 
> I encounter lots of dmesg, which should be printed by __remove_discard_cmd()
> 
> F2FS-fs (dm-0): Issue discard(23552, 23552, 2) failed, ret: -11
> 
> This should happen only if we didn't handle all discard in 5 seconds during
> umount.
> 
> So I doubt we failed to move dc to retry_list, because after submit_bio(),
> end_io() is not called synchronously as the bio was just pluged?
> 
This can happen if a discard cmd has multiple bios and at least 1 bio is 
already submitted and when submitting other bios, we encounter -EAGAIN.
In this case, this dc will be moved to retry_list and will be moved back
to dcc->pend_list only if the dc->bio_ref becomes 0 within 5 sec timeout.
If it doesn't become zero, then it will be left in retry_list itself, which
will be later removed from retry_list. Before removing from retry_list we 
will however ensure that submitted bio is done i.e., dc->bio_ref is 0, but
dc->error will be -EAGAIN as this dc could not be requeued/retried.

So this is expected, where it only means that this dc could not be
submitted/retried again within timeout. I think we can ignore
this -EAGAIN error in __remove_discard_cmd().

Thanks,

> Thanks,
> 
> > +				break;
> > +			}
> > +		}
> >  
> >  		atomic_inc(&dcc->issued_discard);
> >  
> > @@ -1463,6 +1477,40 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> >  	return issued;
> >  }
> >  
> > +static bool __should_discard_retry(struct f2fs_sb_info *sbi,
s> > +		struct discard_policy *dpolicy)
> > +{
> > +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> > +	struct discard_cmd *dc, *tmp;
> > +	bool retry = false;
> > +	unsigned long flags;
> > +
> > +	if (dpolicy->type != DPOLICY_UMOUNT)
> > +		f2fs_bug_on(sbi, 1);
> > +
> > +	mutex_lock(&dcc->cmd_lock);
> > +	list_for_each_entry_safe(dc, tmp, &(dcc->retry_list), list) {
> > +		if (dpolicy->timeout != 0 &&
> > +			f2fs_time_over(sbi, dpolicy->timeout)) {
> > +			retry = false;
> > +			break;
> > +		}
> > +
> > +		spin_lock_irqsave(&dc->lock, flags);
> > +		if (!dc->bio_ref) {
> > +			dc->state = D_PREP;
> > +			dc->error = 0;
> > +			reinit_completion(&dc->wait);
> > +			__relocate_discard_cmd(dcc, dc);
> > +			retry = true;
> > +		}
> > +		spin_unlock_irqrestore(&dc->lock, flags);
> > +	}
> > +	mutex_unlock(&dcc->cmd_lock);
> > +
> > +	return retry;
> > +}
> > +
> >  static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >  					struct discard_policy *dpolicy)
> >  {
> > @@ -1470,12 +1518,13 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >  	struct list_head *pend_list;
> >  	struct discard_cmd *dc, *tmp;
> >  	struct blk_plug plug;
> > -	int i, issued = 0;
> > +	int i, err, issued = 0;
> >  	bool io_interrupted = false;
> >  
> >  	if (dpolicy->timeout != 0)
> >  		f2fs_update_time(sbi, dpolicy->timeout);
> >  
> > +retry:
> >  	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
> >  		if (dpolicy->timeout != 0 &&
> >  				f2fs_time_over(sbi, dpolicy->timeout))
> > @@ -1509,7 +1558,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >  				break;
> >  			}
> >  
> > -			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
> > +			err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
> > +			if (err == -EAGAIN)
> > +				congestion_wait(BLK_RW_ASYNC,
> > +						DEFAULT_IO_TIMEOUT);
> >  
> >  			if (issued >= dpolicy->max_requests)
> >  				break;
> > @@ -1522,6 +1574,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >  			break;
> >  	}
> >  
> > +	if (!list_empty(&dcc->retry_list) &&
> > +		__should_discard_retry(sbi, dpolicy))
> > +		goto retry;
> > +
> >  	if (!issued && io_interrupted)
> >  		issued = -1;
> >  
> > @@ -1613,6 +1669,12 @@ static unsigned int __wait_discard_cmd_range(struct f2fs_sb_info *sbi,
> >  		goto next;
> >  	}
> >  
> > +	if (dpolicy->type == DPOLICY_UMOUNT &&
> > +		!list_empty(&dcc->retry_list)) {
> > +		wait_list = &dcc->retry_list;
> > +		goto next;
> > +	}
> > +
> >  	return trimmed;
> >  }
> >  
> > @@ -2051,6 +2113,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
> >  	for (i = 0; i < MAX_PLIST_NUM; i++)
> >  		INIT_LIST_HEAD(&dcc->pend_list[i]);
> >  	INIT_LIST_HEAD(&dcc->wait_list);
> > +	INIT_LIST_HEAD(&dcc->retry_list);
> >  	INIT_LIST_HEAD(&dcc->fstrim_list);
> >  	mutex_init(&dcc->cmd_lock);
> >  	atomic_set(&dcc->issued_discard, 0);
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
