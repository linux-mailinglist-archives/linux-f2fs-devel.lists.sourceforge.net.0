Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A51752BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Mar 2020 05:40:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j8csU-0002Ae-3g; Mon, 02 Mar 2020 04:40:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1j8csR-0002AR-SC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 04:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MksOsb05vIoMJy+O+jY+fWaky1s1xPB27dYWvBuRQlo=; b=JAkmZaxw5lVRPEXH41yvBqDSmg
 gn81pnHaZwGWHb4ecAD0JCNUEhslE6Wr7lJHED8koc3hzsx5ubvRe5cGT78UzF2XUBAY2JTX7IOqh
 Gk1jxKpRvZqSnFKj43GuXPAg7dHg1kGe/x67n2uwXo9qunCiCMrY5y827GnI95IxRS4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MksOsb05vIoMJy+O+jY+fWaky1s1xPB27dYWvBuRQlo=; b=cFLkSUcX8sQLdXiWwqhSinRn78
 LyBcak5zwtW8geAjorH4AH2LwSR3yFX0Sh8+WvXLTqjC32ImaCOmAMbZCEpk8Ni1Coc1GwVdSKmNu
 wiM00rd0WftD8j1eKPTdcMdXgb8usVuKjilIVBn0S5yKS0wWo6HQp3SE+bsD58pzBxdw=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j8csG-00EFr9-Hs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Mar 2020 04:40:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583124016; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=MksOsb05vIoMJy+O+jY+fWaky1s1xPB27dYWvBuRQlo=;
 b=jkCOcM9+eRNB9G2lOHAAwN/EqNE1OrEcRpRTD+2dyRrnywsIkF5r06lffL68/OhcrlesJWVT
 JdmWbfZqADC17J52cBb/LylAr+kg/JTYOHKYEyJzZIFg9BhX44qLCbEajjyuLcoJLmOGNClI
 iy0nhgIECHD89O+94UWJ8Y8SpJg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5c8e1b.7fb7f17de8b8-smtp-out-n03;
 Mon, 02 Mar 2020 04:39:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1297EC4479F; Mon,  2 Mar 2020 04:39:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C269C43383;
 Mon,  2 Mar 2020 04:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C269C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 2 Mar 2020 10:09:48 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200302043948.GE20234@codeaurora.org>
References: <1582799978-22277-1-git-send-email-stummala@codeaurora.org>
 <c39e0cf1-dbb1-5f60-50b5-e0eb246782bc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c39e0cf1-dbb1-5f60-50b5-e0eb246782bc@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j8csG-00EFr9-Hs
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Fix mount failure due to SPO after
 a successful online resize FS
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

On Fri, Feb 28, 2020 at 04:35:37PM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> Good catch.
> 
> On 2020/2/27 18:39, Sahitya Tummala wrote:
> > Even though online resize is successfully done, a SPO immediately
> > after resize, still causes below error in the next mount.
> > 
> > [   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
> > [   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint
> > 
> > This is because after FS metadata is updated in update_fs_metadata()
> > if the SBI_IS_DIRTY is not dirty, then CP will not be done to reflect
> > the new user_block_count.
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> >  fs/f2fs/gc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index a92fa49..a14a75f 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1577,6 +1577,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> >  
> >  	update_fs_metadata(sbi, -secs);
> >  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
> 
> Need a barrier here to keep order in between above code and set_sbi_flag(DIRTY)?

I don't think a barrier will help here. Let us say there is a another context
doing CP already, then it races with update_fs_metadata(), so it may or may not
see the resize updates and it will also clear the SBI_IS_DIRTY flag set by resize
(even with a barrier).

I think we need to synchronize this with CP context, so that these resize changes
will be reflected properly. Please see the new diff below and help with the review.

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a14a75f..5554af8 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1467,6 +1467,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
        long long user_block_count =
                                le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);

+       clear_sbi_flag(sbi, SBI_IS_DIRTY);
        SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
        MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
        FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
@@ -1575,9 +1576,12 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
                goto out;
        }

+       mutex_lock(&sbi->cp_mutex);
        update_fs_metadata(sbi, -secs);
        clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
        set_sbi_flag(sbi, SBI_IS_DIRTY);
+       mutex_unlock(&sbi->cp_mutex);
+
        err = f2fs_sync_fs(sbi->sb, 1);
        if (err) {
                update_fs_metadata(sbi, secs);

thanks,

> 
> > +	set_sbi_flag(sbi, SBI_IS_DIRTY);
> >  	err = f2fs_sync_fs(sbi->sb, 1);
> >  	if (err) {
> >  		update_fs_metadata(sbi, secs);
> 
> Do we need to add clear_sbi_flag(, SBI_IS_DIRTY) into update_fs_metadata(), so above
> path can be covered as well?
> 
> Thanks,
> 
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
