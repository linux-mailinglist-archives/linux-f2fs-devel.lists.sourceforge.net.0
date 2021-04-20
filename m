Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9DB365F29
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Apr 2021 20:26:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYv50-0002an-A6; Tue, 20 Apr 2021 18:26:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lYv4y-0002af-8N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 18:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzH3Ukv+VsMSFLBfooU973P2thpwN6R+a4UmZE0ALVI=; b=d7wq3slty1hYWGsnjT12j+r8sJ
 NteHs8gojyrOdumcPF2Bh6W8ZcThHPONX0u0HY6Ikd6uP0srLMJeWuTfcJi0KzLBqoZq7EtjHh9OL
 yRdUH75j0uyHBSOCY38vo6eJL1VEKxH+LCweXCB388dcuobrPGnYwC3s/7vomIOqyblc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xzH3Ukv+VsMSFLBfooU973P2thpwN6R+a4UmZE0ALVI=; b=K3DSs1stshOb+oOv+c5nBCrWNE
 lZqdscQrN+Hc86Vu8PIleuTq7WTp18YgcfyKFPUYBky/F2NW7onKVuFmvC0gKN+4kwRpdagzjP7aV
 nda77QmWnW1Z1PLV331RIRkSISEXub0OOx1HZCHigYQIgWWUkQejg6RjRUrRMhIAtUeI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lYv4o-0046TX-JA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 18:26:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42F8B613CE;
 Tue, 20 Apr 2021 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618943170;
 bh=c6iMBvteXSLo2ps7WOwHOoMbvk0m6jpJVCFWhxgH69o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g0sHndMS7ZK5/RPC2Bsktxa539LTcmVdpcD9jH8JUH73KqAIJrn4fbX8jX51JB01i
 Ifk/mz0G88iEEDs1yIiH9eOWaFGzG9uUVvCBbCZc1Mp48BwQNhrY8U1cyKMnkLNySw
 eFBq3G03xqCmL+owlApJThjHGukMu8DEFmOWtpkc6FxvhByt9BGP0+MbF1XHbc9Kdu
 RBHMJJ/SdZn0TfQDwS9ajrfSsE1fBL9fEw3TMp5yzH4aEMJUBhONo299lMdaM4l54q
 0T5InSGMitTrigg4A4bbWRdEcRMKfNmtQCFqtYrJnFyVcME1Q0zjdzRX49lS98QtJC
 Ly6g4KZxQe79Q==
Date: Tue, 20 Apr 2021 11:26:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YH8cwK+g2PpjBK0Y@google.com>
References: <20210414012134.128066-1-yuchao0@huawei.com>
 <YH22a55sexxwmGCe@google.com>
 <03dc1c69-9215-1b5f-b1cc-c38454f3b90a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03dc1c69-9215-1b5f-b1cc-c38454f3b90a@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lYv4o-0046TX-JA
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to cover allocate_segment() with
 lock
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

On 04/20, Chao Yu wrote:
> On 2021/4/20 0:57, Jaegeuk Kim wrote:
> > On 04/14, Chao Yu wrote:
> > > As we did for other cases, in fix_curseg_write_pointer(), let's
> > > change as below:
> > > - use callback function s_ops->allocate_segment() instead of
> > > raw function allocate_segment_by_default();
> > > - cover allocate_segment() with curseg_lock and sentry_lock.
> > > 
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >   fs/f2fs/segment.c | 7 ++++++-
> > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > index b2ee6b7791b0..daf9531ec58f 100644
> > > --- a/fs/f2fs/segment.c
> > > +++ b/fs/f2fs/segment.c
> > > @@ -4848,7 +4848,12 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> > >   	f2fs_notice(sbi, "Assign new section to curseg[%d]: "
> > >   		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
> > > -	allocate_segment_by_default(sbi, type, true);
> > > +
> > > +	down_read(&SM_I(sbi)->curseg_lock);
> > > +	down_write(&SIT_I(sbi)->sentry_lock);
> > > +	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
> > > +	up_write(&SIT_I(sbi)->sentry_lock);
> > > +	up_read(&SM_I(sbi)->curseg_lock);
> > 
> > Seems f2fs_allocate_new_section()?
> 
> f2fs_allocate_new_section() will allocate new section only when current
> section has been initialized and has valid block/ckpt_block.
> 
> It looks fix_curseg_write_pointer() wants to force migrating current segment
> to new section whenever write pointer and curseg->next_blkoff is inconsistent.
> 
> So how about adding a parameter to force f2fs_allocate_new_section() to
> allocate new section?

I think that can be doable. Hope to avoid native calls as much as possible.

> 
> Thanks,
> 
> > 
> > >   	/* check consistency of the zone curseg pointed to */
> > >   	if (check_zone_write_pointer(sbi, zbd, &zone))
> > > -- 
> > > 2.29.2
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
