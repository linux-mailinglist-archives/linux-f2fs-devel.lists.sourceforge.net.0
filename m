Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD41863F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2020 04:53:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDgoR-0005m1-A2; Mon, 16 Mar 2020 03:53:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jDgoP-0005lu-DU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 03:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dX/HmR6sozhxPO42JTLUS5ksGpbvHKOZ+PUUche2qGQ=; b=RoSE/hKP226lE2UaT7SxVkjATg
 B6p2QXScZb3nYWTgWs0FF7HPrlkq9vb9hezz+varBJWeTyjvZKgcOyOQHJu6Qb5yaQjBurO0UN6pr
 YYhVLvuDlxufr5HElBzfDXqaFGdwtBJ1FXodFicKzCtAVSEjlfz78O8rlY+ZwUO7dXfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dX/HmR6sozhxPO42JTLUS5ksGpbvHKOZ+PUUche2qGQ=; b=Zd/t1ZZ4QBybINoxYwQ/mcfq0t
 wwSrSP/AZERg39wTC6p8RToMs1QDKgahnMJ1FOifCRyyEI08lzjQbTmPkq7Vy6dKGHfV2PQLc4q99
 6IroiP1N58cxS176iRBT64Ibsu5LqtFzQ8yiJbwMsJsFjquCxATAMbn5eLiDFSgc1Vg0=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jDgoF-008UB9-Il
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 03:53:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584330781; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=dX/HmR6sozhxPO42JTLUS5ksGpbvHKOZ+PUUche2qGQ=;
 b=maVSUvagCe4DVQ8rYzL9QomjVJyV7ZVt05PBuJpsl214IdLBxLwY//hnwNbRuO77bRckiTep
 2Wgo2urj/ZbflAeIQTCeAylnpFcKn68L/prc742prFCtF9+Q7C/izI31sFDvhiSX92uCgoXB
 y3xlayIKNCJXSff8e10vXP7tJMg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6ef809.7fea4562bf10-smtp-out-n05;
 Mon, 16 Mar 2020 03:52:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6B720C4478F; Mon, 16 Mar 2020 03:52:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AD61DC4478C;
 Mon, 16 Mar 2020 03:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD61DC4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 16 Mar 2020 09:22:33 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200316035233.GM20234@codeaurora.org>
References: <1584011671-20939-1-git-send-email-stummala@codeaurora.org>
 <fa7d88ee-01e2-e82c-6c79-f24b90fbd472@huawei.com>
 <20200313033912.GJ20234@codeaurora.org>
 <a8f01157-0b1b-d83a-488d-bb48cf8954ab@huawei.com>
 <20200313110846.GL20234@codeaurora.org>
 <20d3b7ef-b216-6e46-58fd-7f1c96d4a8d3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20d3b7ef-b216-6e46-58fd-7f1c96d4a8d3@huawei.com>
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
X-Headers-End: 1jDgoF-008UB9-Il
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

On Mon, Mar 16, 2020 at 08:52:25AM +0800, Chao Yu wrote:
> On 2020/3/13 19:08, Sahitya Tummala wrote:
> > On Fri, Mar 13, 2020 at 02:30:55PM +0800, Chao Yu wrote:
> >> On 2020/3/13 11:39, Sahitya Tummala wrote:
> >>> On Fri, Mar 13, 2020 at 10:20:04AM +0800, Chao Yu wrote:
> >>>> On 2020/3/12 19:14, Sahitya Tummala wrote:
> >>>>> F2FS already has a default timeout of 5 secs for discards that
> >>>>> can be issued during umount, but it can take more than the 5 sec
> >>>>> timeout if the underlying UFS device queue is already full and there
> >>>>> are no more available free tags to be used. In that case, submit_bio()
> >>>>> will wait for the already queued discard requests to complete to get
> >>>>> a free tag, which can potentially take way more than 5 sec.
> >>>>>
> >>>>> Fix this by submitting the discard requests with REQ_NOWAIT
> >>>>> flags during umount. This will return -EAGAIN for UFS queue/tag full
> >>>>> scenario without waiting in the context of submit_bio(). The FS can
> >>>>> then handle these requests by retrying again within the stipulated
> >>>>> discard timeout period to avoid long latencies.
> >>>>>
> >>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> >>>>> ---
> >>>>>  fs/f2fs/segment.c | 14 +++++++++++++-
> >>>>>  1 file changed, 13 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >>>>> index fb3e531..a06bbac 100644
> >>>>> --- a/fs/f2fs/segment.c
> >>>>> +++ b/fs/f2fs/segment.c
> >>>>> @@ -1124,10 +1124,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >>>>>  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> >>>>>  	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
> >>>>>  					&(dcc->fstrim_list) : &(dcc->wait_list);
> >>>>> -	int flag = dpolicy->sync ? REQ_SYNC : 0;
> >>>>> +	int flag;
> >>>>>  	block_t lstart, start, len, total_len;
> >>>>>  	int err = 0;
> >>>>>  
> >>>>> +	flag = dpolicy->sync ? REQ_SYNC : 0;
> >>>>> +	flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;
> >>>>> +
> >>>>>  	if (dc->state != D_PREP)
> >>>>>  		return 0;
> >>>>>  
> >>>>> @@ -1203,6 +1206,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> >>>>>  		bio->bi_end_io = f2fs_submit_discard_endio;
> >>>>>  		bio->bi_opf |= flag;
> >>>>>  		submit_bio(bio);
> >>>>> +		if ((flag & REQ_NOWAIT) && (dc->error == -EAGAIN)) {
> >>>>
> >>>> If we want to update dc->state, we need to cover it with dc->lock.
> >>>
> >>> Sure, will update it.
> >>>
> >>>>
> >>>>> +			dc->state = D_PREP;
> >>>>
> >>>> BTW, one dc can be referenced by multiple bios, so dc->state could be updated to
> >>>> D_DONE later by f2fs_submit_discard_endio(), however we just relocate it to
> >>>> pending list... which is inconsistent status.
> >>>
> >>> In that case dc->bio_ref will reflect it and until it becomes 0, the dc->state
> >>> will not be updated to D_DONE in f2fs_submit_discard_endio()?
> >>
> >> __submit_discard_cmd()
> >>  lock()
> >>  dc->state = D_SUBMIT;
> >>  dc->bio_ref++;
> >>  unlock()
> >> ...
> >>  submit_bio()
> >> 				f2fs_submit_discard_endio()
> >> 				 dc->error = -EAGAIN;
> >> 				 lock()
> >> 				 dc->bio_ref--;
> >>
> >>  dc->state = D_PREP;
> >>
> >> 				 dc->state = D_DONE;
> >> 				 unlock()
> >>
> >> So finally, dc's state is D_DONE, and it's in wait list, then will be relocated
> >> to pending list.
> > 
> > In case of queue full, f2fs_submit_discard_endio() will not be called
> 
> I guess the case is there are multiple bios related to one dc and partially callback
> of bio is called asynchronously and the other is called synchronously, so the race
> condition could happen.

You are right. Let me review that case and try to fix it.

Thanks,

> 
> Thanks,
> 
> > asynchronously. It will be called in the context of submit_bio() itself.
> > So by the time, submit_bio returns dc->error will be -EAGAIN and dc->state
> > will be D_DONE. 
> > 
> > submit_bio()
> > ->blk_mq_make_request
> > ->blk_mq_get_request()
> >   ->bio_wouldblock_error() (called due to queue full)
> >     ->bio_endio()
> >     
> > Thanks,
> >>
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>> +			err = dc->error;
> >>>>> +			break;
> >>>>> +		}
> >>>>>  
> >>>>>  		atomic_inc(&dcc->issued_discard);
> >>>>>  
> >>>>> @@ -1510,6 +1518,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> >>>>>  			}
> >>>>>  
> >>>>>  			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
> >>>>> +			if (dc->error == -EAGAIN) {
> >>>>> +				congestion_wait(BLK_RW_ASYNC, HZ/50);
> >>>>> +				__relocate_discard_cmd(dcc, dc);
> >>>>> +			}
> >>>>>  
> >>>>>  			if (issued >= dpolicy->max_requests)
> >>>>>  				break;
> >>>>>
> >>>
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
