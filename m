Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3F1979A4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Mar 2020 12:52:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jIs1R-0001r9-CI; Mon, 30 Mar 2020 10:52:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jIs1Q-0001qy-1q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 10:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rgOD6aeT8WtqVoT6YXk/ZiDx0nZmxZFsJZyfSTMpz5A=; b=gADiw3qZPr0DpyzV8ksgVsfimb
 ICu4jyp5OHULAq6QJQo0FDQSw445+XuyKZqEUL4dFr31o/lal3babeEpKgt+xBtPeZ/wNaR+tC+3Z
 Ghr/vSlwEEfhn3T0LzF7eR9gddmr1kTSCbQXXx26rmUbBbNbAGTk2KxYK2/NgGMHV6Ew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rgOD6aeT8WtqVoT6YXk/ZiDx0nZmxZFsJZyfSTMpz5A=; b=j8+R4R28HDFrBatLCeDTQxGZIF
 zTU3Ox5xvmPG9WnvuW+OtgV6mlG8YqN9t1/IUj0kIxzDuJEFyzah7KXHnmPAREk5ZFZyoOFli+nS3
 AH4D4NDL6j9RAQxrMmiE7UKQPuaGDynVwlQhR0x6DXMNb7W+uf0DlWqIxChq2XbE7Rgo=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jIs1G-001KzJ-Ue
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 10:51:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585565514; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=rgOD6aeT8WtqVoT6YXk/ZiDx0nZmxZFsJZyfSTMpz5A=;
 b=lDleIl5KZ4q7aam8/nQnAIaZkBfkqKQldNSJ+mNuPDcZFaFs9Km6iI90BrQ1h/E53GAFU+f3
 Am1oETSJ23+HuZrS2AI7QmpzDP33d3p5bvf8TRyEZ2bzn3ERGqrPj2QyOLs8JmN6l3IHSq4K
 dIAa1WJHxsx8cNAsK6E5/9tYb7U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e81cf38.7f9ac95852d0-smtp-out-n02;
 Mon, 30 Mar 2020 10:51:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 990E3C43636; Mon, 30 Mar 2020 10:51:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B17FC433F2;
 Mon, 30 Mar 2020 10:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B17FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 30 Mar 2020 16:21:22 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200330105122.GV20234@codeaurora.org>
References: <1584506689-5041-1-git-send-email-stummala@codeaurora.org>
 <29d4adc4-482d-3d92-1470-3405989ea231@huawei.com>
 <20200326133700.GR20234@codeaurora.org>
 <2b0d8d4c-a981-4edc-d8ca-fe199a63ea79@huawei.com>
 <20200327030542.GS20234@codeaurora.org>
 <20200330065335.GT20234@codeaurora.org>
 <9adc5c7e-7936-bac7-58b1-50631f8ac5eb@huawei.com>
 <5ec3b2e1-162c-e62d-1834-100c8ae39ff7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ec3b2e1-162c-e62d-1834-100c8ae39ff7@huawei.com>
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
X-Headers-End: 1jIs1G-001KzJ-Ue
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

On Mon, Mar 30, 2020 at 06:16:40PM +0800, Chao Yu wrote:
> On 2020/3/30 16:38, Chao Yu wrote:
> > Hi Sahitya,
> > 
> > Bad news, :( I guess we didn't catch the root cause, as after applying v3,
> > I still can reproduce this issue:
> > 
> > generic/003 10s ...  30s
> 
> I use zram as backend device of fstest,
> 
> Call Trace:
>  dump_stack+0x66/0x8b
>  f2fs_submit_discard_endio+0x88/0xa0 [f2fs]
>  generic_make_request_checks+0x70/0x5f0
>  generic_make_request+0x3e/0x2e0
>  submit_bio+0x72/0x140
>  __submit_discard_cmd.isra.50+0x4a8/0x710 [f2fs]
>  __issue_discard_cmd+0x171/0x3a0 [f2fs]
> 
> Does this mean zram uses single queue, so we may always fail to submit 'nowait'
> IO due to below condition:
> 
> 	/*
> 	 * Non-mq queues do not honor REQ_NOWAIT, so complete a bio
> 	 * with BLK_STS_AGAIN status in order to catch -EAGAIN and
> 	 * to give a chance to the caller to repeat request gracefully.
> 	 */
> 	if ((bio->bi_opf & REQ_NOWAIT) && !queue_is_mq(q)) {
> 		status = BLK_STS_AGAIN;
> 		goto end_io;
> 	}
> 

Yes, I have also just figured out that as the reason. But most of the real block
devic drivers support MQ. Can we thus fix this case by checking for MQ status
before enabling REQ_NOWAIT as below? Please share your comments.

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cda7935..e7e2ffe 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1131,7 +1131,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,

        flag = dpolicy->sync ? REQ_SYNC : 0;
-       flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;
+
+       if (sbi->sb->s_bdev->bd_queue && queue_is_mq(sbi->sb->s_bdev->bd_queue))
+               flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;

        if (dc->state != D_PREP)
                return 0;

Thanks,

> 
> 
> > 
> > Thanks,
> > 
> > On 2020/3/30 14:53, Sahitya Tummala wrote:
> >> Hi Chao,
> >>
> >> On Fri, Mar 27, 2020 at 08:35:42AM +0530, Sahitya Tummala wrote:
> >>> On Fri, Mar 27, 2020 at 09:51:43AM +0800, Chao Yu wrote:
> >>>>
> >>>> With this patch, most of xfstest cases cost 5 * n second longer than before.
> >>>>
> >>>> E.g. generic/003, during umount(), we looped into retrying one bio
> >>>> submission.
> >>>>
> >>>> [61279.829724] F2FS-fs (zram1): Found nat_bits in checkpoint
> >>>> [61279.885337] F2FS-fs (zram1): Mounted with checkpoint version = 5cf3cb8e
> >>>> [61281.912832] submit discard bio start [23555,1]
> >>>> [61281.912835] f2fs_submit_discard_endio [23555,1] err:-11
> >>>> [61281.912836] submit discard bio end [23555,1]
> >>>> [61281.912836] move dc to retry list [23555,1]
> >>>>
> >>>> ...
> >>>>
> >>>> [61286.881212] submit discard bio start [23555,1]
> >>>> [61286.881217] f2fs_submit_discard_endio [23555,1] err:-11
> >>>> [61286.881223] submit discard bio end [23555,1]
> >>>> [61286.881224] move dc to retry list [23555,1]
> >>>> [61286.905198] submit discard bio start [23555,1]
> >>>> [61286.905203] f2fs_submit_discard_endio [23555,1] err:-11
> >>>> [61286.905205] submit discard bio end [23555,1]
> >>>> [61286.905206] move dc to retry list [23555,1]
> >>>> [61286.929157] F2FS-fs (zram1): Issue discard(23555, 23555, 1) failed, ret: -11
> >>>>
> >>>> Could you take a look at this issue?
> >>>
> >>> Let me check and get back on this.
> >>
> >> I found the issue. The dc with multiple bios is getting requeued again and
> >> again in case if one of its bio gets -EAGAIN error. Even the successfully
> >> completed bios are getting requeued again resulting into long latency.
> >> I have fixed it by splitting the dc in such case so that we can requeue only
> >> the leftover bios into a new dc and retry that later within the 5 sec timeout.
> >>
> >> Please help to review v3 posted and if it looks good, I would like to request
> >> you to test the earlier regression scenario with it to check the result again?
> >>
> >> thanks,
> >>
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>>> +				break;
> >>>>>>> +			}
> >>>>>>> +		}
> >>>>>>>  
> >>>>>>>  		atomic_inc(&dcc->issued_discard);
> >>>>>>>  
> >>>>>>> @@ -1463,6 +1477,40 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> >>>>>>>  	return issued;
> >>>>>>>  }
> >>>>>>>  
> >>>>>>> +static bool __should_discard_retry(struct f2fs_sb_info *sbi,
> >>>>> s> > +		struct discard_policy *dpolicy)
> >>>>>>> +{
> >>>>>>> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> >>>>>>> +	struct discard_cmd *dc, *tmp;
> >>>>>>> +	bool retry = false;
> >>>>>>> +	unsigned long flags;
> >>>>>>> +
> >>>>>>> +	if (dpolicy->type != DPOLICY_UMOUNT)
> >>>>>>> +		f2fs_bug_on(sbi, 1);
> >>>>>>> +
> >>>>>>> +	mutex_lock(&dcc->cmd_lock);
> >>>>>>> +	list_for_each_entry_safe(dc, tmp, &(dcc->retry_list), list) {
> >>>>>>> +		if (dpolicy->timeout != 0 &&
> >>>>>>> +			f2fs_time_over(sbi, dpolicy->timeout)) {
> >>>>>>> +			retry = false;
> >>>>>>> +			break;
> >>>>>>> +		}
> >>>>>>> +
> >>>>>>> +		spin_lock_irqsave(&dc->lock, flags);
> >>>>>>> +		if (!dc->bio_ref) {
> >>>>>>> +			dc->state = D_PREP;
> >>>>>>> +			dc->error = 0;
> >>>>>>> +			reinit_completion(&dc->wait);
> >>>>>>> +			__relocate_discard_cmd(dcc, dc);
> >>>>>>> +			retry = true;
> >>>>>>> +		}
> >>>>>>> +		spin_unlock_irqrestore(&dc->lock, flags);
> >>>>>>> +	}
> >>>>>>> +	mutex_unlock(&dcc->cmd_lock);
> >>>>>>> +
> >>>>>>> +	return retry;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>  static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >>>>>>>  					struct discard_policy *dpolicy)
> >>>>>>>  {
> >>>>>>> @@ -1470,12 +1518,13 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >>>>>>>  	struct list_head *pend_list;
> >>>>>>>  	struct discard_cmd *dc, *tmp;
> >>>>>>>  	struct blk_plug plug;
> >>>>>>> -	int i, issued = 0;
> >>>>>>> +	int i, err, issued = 0;
> >>>>>>>  	bool io_interrupted = false;
> >>>>>>>  
> >>>>>>>  	if (dpolicy->timeout != 0)
> >>>>>>>  		f2fs_update_time(sbi, dpolicy->timeout);
> >>>>>>>  
> >>>>>>> +retry:
> >>>>>>>  	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
> >>>>>>>  		if (dpolicy->timeout != 0 &&
> >>>>>>>  				f2fs_time_over(sbi, dpolicy->timeout))
> >>>>>>> @@ -1509,7 +1558,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >>>>>>>  				break;
> >>>>>>>  			}
> >>>>>>>  
> >>>>>>> -			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
> >>>>>>> +			err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
> >>>>>>> +			if (err == -EAGAIN)
> >>>>>>> +				congestion_wait(BLK_RW_ASYNC,
> >>>>>>> +						DEFAULT_IO_TIMEOUT);
> >>>>>>>  
> >>>>>>>  			if (issued >= dpolicy->max_requests)
> >>>>>>>  				break;
> >>>>>>> @@ -1522,6 +1574,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >>>>>>>  			break;
> >>>>>>>  	}
> >>>>>>>  
> >>>>>>> +	if (!list_empty(&dcc->retry_list) &&
> >>>>>>> +		__should_discard_retry(sbi, dpolicy))
> >>>>>>> +		goto retry;
> >>>>>>> +
> >>>>>>>  	if (!issued && io_interrupted)
> >>>>>>>  		issued = -1;
> >>>>>>>  
> >>>>>>> @@ -1613,6 +1669,12 @@ static unsigned int __wait_discard_cmd_range(struct f2fs_sb_info *sbi,
> >>>>>>>  		goto next;
> >>>>>>>  	}
> >>>>>>>  
> >>>>>>> +	if (dpolicy->type == DPOLICY_UMOUNT &&
> >>>>>>> +		!list_empty(&dcc->retry_list)) {
> >>>>>>> +		wait_list = &dcc->retry_list;
> >>>>>>> +		goto next;
> >>>>>>> +	}
> >>>>>>> +
> >>>>>>>  	return trimmed;
> >>>>>>>  }
> >>>>>>>  
> >>>>>>> @@ -2051,6 +2113,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
> >>>>>>>  	for (i = 0; i < MAX_PLIST_NUM; i++)
> >>>>>>>  		INIT_LIST_HEAD(&dcc->pend_list[i]);
> >>>>>>>  	INIT_LIST_HEAD(&dcc->wait_list);
> >>>>>>> +	INIT_LIST_HEAD(&dcc->retry_list);
> >>>>>>>  	INIT_LIST_HEAD(&dcc->fstrim_list);
> >>>>>>>  	mutex_init(&dcc->cmd_lock);
> >>>>>>>  	atomic_set(&dcc->issued_discard, 0);
> >>>>>>>
> >>>>>
> >>>
> >>> -- 
> >>> --
> >>> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> >>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
> >>
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
