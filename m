Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF25198376
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Mar 2020 20:34:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jIzFB-0006VL-Op; Mon, 30 Mar 2020 18:34:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jIzFB-0006VE-6V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 18:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XwW6elAvL6GIYirVjsM6Hjbw/6asCQ3K8Fpxk8TMN4=; b=FkkaKF5WIsS/kWHmI+bauGaE7l
 XxChDb6/gucR60HNmttDaCGqeDLfkroZ9FDBPmOTGgeySPb77aXkEou/pNfoL06yq5LUCWh0O7XSD
 kSBSEeVQayYnudQZeL1c11gMyo1vx5o5JHhg1dJCHNEHSa1yuu2jko1G78LnLjEsWLHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7XwW6elAvL6GIYirVjsM6Hjbw/6asCQ3K8Fpxk8TMN4=; b=Ov0FYR1/hy07FZzY3ciL9dJa3+
 NoMdljMcT4OjaL5ijV1Ao9PN/AiRzUTtFWiu3o4bRmagy+T+MtYxbDvnCufmkdFQJ6a5Hes/8dtmE
 Vip+7QOeUbbBD/HnbgAoF4mYRgLDunV290916d78ilxf1fxdcOMlTN6RQXsm6/kSdRZg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jIzF7-00Fbzz-Af
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 18:34:41 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79DF420714;
 Mon, 30 Mar 2020 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585593271;
 bh=D6kjymPrenC+cUpVAxVDQtqw5/rOWTUihU++6B1ZeFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIBk3nfFe2y8VbA1NQzUnWZT11JhlPqtqfg8BaGqW6IT9KIdkO8f9/r0up3hi+fjq
 fJMZ0Nb+EJm3mH9EVcyt++iiG0gx1nDhZlRDJ0VeRiN/k/HmqilWbJA1OzL1O3Z2nN
 uyYdB86aqeyMwZVfFmymtIxZS0ZAKEBRD9sP/rAI=
Date: Mon, 30 Mar 2020 11:34:31 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20200330183431.GA34947@google.com>
References: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
 <20200327192412.GA186975@google.com>
 <397da8a6-fdb4-9637-c6ea-803492c408a2@huawei.com>
 <20200330084033.GU20234@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330084033.GU20234@codeaurora.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jIzF7-00Fbzz-Af
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

On 03/30, Sahitya Tummala wrote:
> On Sat, Mar 28, 2020 at 04:38:00PM +0800, Chao Yu wrote:
> > Hi all,
> > 
> > On 2020/3/28 3:24, Jaegeuk Kim wrote:
> > > Hi Sahitya,
> > > 
> > > On 03/26, Sahitya Tummala wrote:
> > >> allocate_segment_for_resize() can cause metapage updates if
> > >> it requires to change the current node/data segments for resizing.
> > >> Stop these meta updates when there is a checkpoint already
> > >> in progress to prevent inconsistent CP data.
> > > 
> > > Doesn't freeze|thaw_bdev(sbi->sb->s_bdev); work for you?
> > 
> > That can avoid foreground ops racing? rather than background ops like
> > balance_fs() from kworker?
> > 
> 
> Yes, that can only prevent foreground ops but not the background ops
> invoked in the context of kworker thread.
> 
> > BTW, I found that {freeze,thaw}_bdev is not enough to freeze all
> > foreground fs ops, it needs to use {freeze,thaw}_super instead.
> > 
> 
> Yes, I agree.

sgtm. :)

> 
> Thanks,
> 
> > ---
> >  fs/f2fs/gc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 26248c8936db..acdc8b99b543 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1538,7 +1538,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> >  		return -EINVAL;
> >  	}
> > 
> > -	freeze_bdev(sbi->sb->s_bdev);
> > +	freeze_super(sbi->sb);
> > 
> >  	shrunk_blocks = old_block_count - block_count;
> >  	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> > @@ -1551,7 +1551,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> >  		sbi->user_block_count -= shrunk_blocks;
> >  	spin_unlock(&sbi->stat_lock);
> >  	if (err) {
> > -		thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> > +		thaw_super(sbi->sb);
> >  		return err;
> >  	}
> > 
> > @@ -1613,6 +1613,6 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> >  	}
> >  	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
> >  	mutex_unlock(&sbi->resize_mutex);
> > -	thaw_bdev(sbi->sb->s_bdev, sbi->sb);
> > +	thaw_super(sbi->sb);
> >  	return err;
> >  }
> > -- 
> > 2.18.0.rc1
> > 
> > > 
> > >>
> > >> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > >> ---
> > >>  fs/f2fs/gc.c | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > >> index 5bca560..6122bad 100644
> > >> --- a/fs/f2fs/gc.c
> > >> +++ b/fs/f2fs/gc.c
> > >> @@ -1399,8 +1399,10 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
> > >>  	int err = 0;
> > >>  
> > >>  	/* Move out cursegs from the target range */
> > >> +	f2fs_lock_op(sbi);
> > >>  	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
> > >>  		allocate_segment_for_resize(sbi, type, start, end);
> > >> +	f2fs_unlock_op(sbi);
> > >>  
> > >>  	/* do GC to move out valid blocks in the range */
> > >>  	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
> > >> -- 
> > >> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> > >> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> > > .
> > > 
> 
> -- 
> --
> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
