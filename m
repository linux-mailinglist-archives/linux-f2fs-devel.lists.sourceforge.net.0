Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C2184036
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2020 06:13:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCcdV-0007QF-2X; Fri, 13 Mar 2020 05:13:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jCcdR-0007Q5-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Mar 2020 05:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EvnTMH+qZB325+j+Mam9+Ki9mILaWC3EQ/KKtvEmMkM=; b=JB2JszaKCjboyHh/+KphaXirw6
 1Ir/99MEH7X8EzlvFkdjNWAhzn7PIM6QclxzZehVCNivWhC1R9Sy/LAsGDGFRhAT9dLx8sJUvl2Vv
 VfG5eADRUbt9WK32dwdFVjXCmKR85EgTIsrLyMjPLx2ccP70UEq3CjwIz66qXqdOtJ2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EvnTMH+qZB325+j+Mam9+Ki9mILaWC3EQ/KKtvEmMkM=; b=dW09I7jxGZsO4V6AYryTkCxoXm
 yqvrqvQjQ6E00JBRAIfulz/Ktlc+m9cjyC7Vtzy0wOVJwuf41mSx/nVj33Dmndh6ElnYiBYo8IlaY
 PaKR1kEW+S2jDcFZON6YliHVtc3oWaRcuxK+3vu/DDIlUx1EjKVFB9zHhsT+uW9/cJ6I=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jCcdC-006HxG-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Mar 2020 05:13:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584076392; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=EvnTMH+qZB325+j+Mam9+Ki9mILaWC3EQ/KKtvEmMkM=;
 b=RX7q34ygCeAqKaFaHj2NJaVaCQWlqFzcf3arEzSQQ8DB8ek0bvc/NfwDSGXF0Y8juM0Nm6Fv
 aXdwwAXK8m5GSHFOyiFdRx+6yEs2UMRWVEYf9zRgjsfGcOtT8ALAOcj4KWgyK7JS8U+Ehx7p
 5wzl9xmtFWfPnF1pgYhiulARZqk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b1655.7faf8b92a228-smtp-out-n02;
 Fri, 13 Mar 2020 05:12:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD944C432C2; Fri, 13 Mar 2020 05:12:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EFD02C433D2;
 Fri, 13 Mar 2020 05:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFD02C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Fri, 13 Mar 2020 10:42:46 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200313051245.GK20234@codeaurora.org>
References: <1584011671-20939-1-git-send-email-stummala@codeaurora.org>
 <20200312170242.GA185506@google.com>
 <20200313012604.GI20234@codeaurora.org>
 <20200313014535.GA72547@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313014535.GA72547@google.com>
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
X-Headers-End: 1jCcdC-006HxG-Tl
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 12, 2020 at 06:45:35PM -0700, Jaegeuk Kim wrote:
> On 03/13, Sahitya Tummala wrote:
> > On Thu, Mar 12, 2020 at 10:02:42AM -0700, Jaegeuk Kim wrote:
> > > On 03/12, Sahitya Tummala wrote:
> > > > F2FS already has a default timeout of 5 secs for discards that
> > > > can be issued during umount, but it can take more than the 5 sec
> > > > timeout if the underlying UFS device queue is already full and there
> > > > are no more available free tags to be used. In that case, submit_bio()
> > > > will wait for the already queued discard requests to complete to get
> > > > a free tag, which can potentially take way more than 5 sec.
> > > > 
> > > > Fix this by submitting the discard requests with REQ_NOWAIT
> > > > flags during umount. This will return -EAGAIN for UFS queue/tag full
> > > > scenario without waiting in the context of submit_bio(). The FS can
> > > > then handle these requests by retrying again within the stipulated
> > > > discard timeout period to avoid long latencies.
> > > > 
> > > > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > > > ---
> > > >  fs/f2fs/segment.c | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > index fb3e531..a06bbac 100644
> > > > --- a/fs/f2fs/segment.c
> > > > +++ b/fs/f2fs/segment.c
> > > > @@ -1124,10 +1124,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > > >  	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> > > >  	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
> > > >  					&(dcc->fstrim_list) : &(dcc->wait_list);
> > > > -	int flag = dpolicy->sync ? REQ_SYNC : 0;
> > > > +	int flag;
> > > >  	block_t lstart, start, len, total_len;
> > > >  	int err = 0;
> > > >  
> > > > +	flag = dpolicy->sync ? REQ_SYNC : 0;
> > > > +	flag |= dpolicy->type == DPOLICY_UMOUNT ? REQ_NOWAIT : 0;
> > > > +
> > > >  	if (dc->state != D_PREP)
> > > >  		return 0;
> > > >  
> > > > @@ -1203,6 +1206,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
> > > >  		bio->bi_end_io = f2fs_submit_discard_endio;
> > > >  		bio->bi_opf |= flag;
> > > >  		submit_bio(bio);
> > > > +		if ((flag & REQ_NOWAIT) && (dc->error == -EAGAIN)) {
> > > > +			dc->state = D_PREP;
> > > > +			err = dc->error;
> > > > +			break;
> > > > +		}
> > > >  
> > > >  		atomic_inc(&dcc->issued_discard);
> > > >  
> > > > @@ -1510,6 +1518,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
> > > >  			}
> > > >  
> > > >  			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
> > > > +			if (dc->error == -EAGAIN) {
> > > > +				congestion_wait(BLK_RW_ASYNC, HZ/50);
> > > 
> > > 						--> need to be DEFAULT_IO_TIMEOUT
> > 
> > Yes, i will update it.
> > 
> > > 
> > > > +				__relocate_discard_cmd(dcc, dc);
> > > 
> > > It seems we need to submit bio first, and then move dc to wait_list, if there's
> > > no error, in __submit_discard_cmd().
> > 
> > Yes, that is not changed and it still happens for the failed request
> > that is re-queued here too when it gets submitted again later.
> > 
> > I am requeuing the discard request failed with -EAGAIN error back to 
> > dcc->pend_list[] from wait_list. It will call submit_bio() for this request
> > and also move to wait_list when it calls __submit_discard_cmd() again next
> > time. Please let me know if I am missing anything?
> 
> This patch has no problem, but I'm thinking that __submit_discard_cmd() needs
> to return with any values by assumption where the waiting list should have
> submitted commands.

I think dc->queued will indicated that dc is moved to wait_list. This can be
used along with return value to take right action. Can you check if this
works?

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a06bbac..91df060 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1478,7 +1478,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
        struct list_head *pend_list;
        struct discard_cmd *dc, *tmp;
        struct blk_plug plug;
-       int i, issued = 0;
+       int i, err, issued = 0;
        bool io_interrupted = false;

        if (dpolicy->timeout != 0)
@@ -1517,8 +1517,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
                                break;
                        }

-                       __submit_discard_cmd(sbi, dpolicy, dc, &issued);
-                       if (dc->error == -EAGAIN) {
+                       err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
+                       if (err && err != -EAGAIN) {
+                               __remove_discard_cmd(sbi, dc);
+                       } else if (err == -EAGAIN && dc->queued) {
                                congestion_wait(BLK_RW_ASYNC, HZ/50);
                                __relocate_discard_cmd(dcc, dc);
                        }

thanks,
> 
> > 
> > Thanks,
> > 
> > > 
> > > > +			}
> > > >  
> > > >  			if (issued >= dpolicy->max_requests)
> > > >  				break;
> > > > -- 
> > > > Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> > > > Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> > 
> > -- 
> > --
> > Sent by a consultant of the Qualcomm Innovation Center, Inc.
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
