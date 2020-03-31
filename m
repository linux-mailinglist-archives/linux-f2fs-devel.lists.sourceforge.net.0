Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2E198FCD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2020 11:06:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJCr8-0008AI-Jm; Tue, 31 Mar 2020 09:06:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jJCr6-0008AB-UI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 09:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OlOD3aygKk+kpGLkhsVi4IEdqcNCdHsjR4aqyj00l7I=; b=BUTS8PKkAVjho9P84R5WkJfj+E
 +mOsbzqlXsBhLx7QBna34ixk+PbKL6z2UGP6pGqNEzlMIjsxLsz/MUdzgJrRyqzd0y21c7QTckQB9
 GgnwfMLEbTHQvn+X5fNDQEwb4k3tBzSap/WdE/uVEp8tLxtO+CJTdmVNgfkJp3bxs7dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OlOD3aygKk+kpGLkhsVi4IEdqcNCdHsjR4aqyj00l7I=; b=K9UXRm6uSkOUVofKPogjsUQ/zj
 24fWzGBAT2cGzIahb9G2aRMRlWn3I/XI3Z/WPlY6jq7hFLw2im6n39zrRbZY/KSWYMKBoYpjvZ4qy
 Goe0HY+Kxvox5NJX3pnD6JiWgBJJjIgiBCBDpi1NCHEoAYDOQUODrW94dshAbFBGCbpc=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJCqw-002iJO-RE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 09:06:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585645596; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=OlOD3aygKk+kpGLkhsVi4IEdqcNCdHsjR4aqyj00l7I=;
 b=qxAmKx+Iga9dL2Opd0PPe6zfFxxFwOW3C96qEfJeVtfeEKxW440TvTM2gBPhhhCmf3/32oyU
 fOhhG9pm02lmSW8sWkaMEI5b+u6E1ce212DAlds/ZsmxrLaIMwu6Fr1FuIFnf46wZe6KXN4v
 ZytLnugoLawJPWsbbM5RMtrh080=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e830809.7f3e5f693ca8-smtp-out-n03;
 Tue, 31 Mar 2020 09:06:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 44737C433F2; Tue, 31 Mar 2020 09:06:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 52DABC433D2;
 Tue, 31 Mar 2020 09:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52DABC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Tue, 31 Mar 2020 14:36:08 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200331090608.GZ20234@codeaurora.org>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200331035419.GB79749@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331035419.GB79749@google.com>
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
X-Headers-End: 1jJCqw-002iJO-RE
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

On Mon, Mar 30, 2020 at 08:54:19PM -0700, Jaegeuk Kim wrote:
> On 03/26, Sahitya Tummala wrote:
> > allocate_segment_for_resize() can cause metapage updates if
> > it requires to change the current node/data segments for resizing.
> > Stop these meta updates when there is a checkpoint already
> > in progress to prevent inconsistent CP data.
> 
> I'd prefer to use f2fs_lock_op() in bigger coverage.

Do you mean to cover the entire free_segment_range() function within
f2fs_lock_op()? Please clarify.

Thanks,

> 
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> >  fs/f2fs/gc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 5bca560..6122bad 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1399,8 +1399,10 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
> >  	int err = 0;
> >  
> >  	/* Move out cursegs from the target range */
> > +	f2fs_lock_op(sbi);
> >  	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
> >  		allocate_segment_for_resize(sbi, type, start, end);
> > +	f2fs_unlock_op(sbi);
> >  
> >  	/* do GC to move out valid blocks in the range */
> >  	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
> > -- 
> > Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> > Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
