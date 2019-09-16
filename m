Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 807D4B3DC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2019 17:37:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i9t4T-00077C-Lo; Mon, 16 Sep 2019 15:37:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i9t4T-000776-6S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 15:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+t85ghaQOe+ZdJQdoXiBPSbjtcGX8CIJYaB96ydLMQ=; b=dS+ETXDsmNu5FKCbr5LfHPBT/5
 dFNx6g85EeYq0LDnxMisXVVhT59kf3x4kpEnIWaEcW4MFXMHKhbci9Iy4vKXZLgm/r3BN5Y87SG3Y
 SMEfsLFiKHNExe3fAD+/ZXhk5Yb3yZBlUXhsDpTi9EZkbBy582jT2AS7jeMaxNQePmas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h+t85ghaQOe+ZdJQdoXiBPSbjtcGX8CIJYaB96ydLMQ=; b=cOQoHrAFL6a+cBQlAsbVBewxOA
 MV1sLg4npCRvYz4r8oW2fme7cSw3mwe+LlkLotQk26LVuZTNpEVhFdbSnUJUzHzwS7WuVoXjv+nd9
 5uqjWXSMWQloGcU0i/cyo2LIXXtM3CYW2Bf/4Otr+l+3sIdFFe3nh8KnD2tyBsNJuZlE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i9t4S-007JDt-0v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 15:37:45 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8477621848;
 Mon, 16 Sep 2019 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568648257;
 bh=XXj6PzzdwbJempAZT8mwyx4CYSvHfLZU4rGUcOLrmg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MqtJ9JNOUsezx8vpaHP7Lx5WlpApry44nZeOLJlg05z0A/RcqEi/L+dvkedGzKZyR
 I3IKnptiqHGvtHW+2heApzs2rczQD2Cc/DcwCAW/XAnwK62ryYFsDV7ZLWBYSeF9aq
 R6j2M4J63vpAmQFs7IuYozNqrm2QCPWzI5+ZBw78=
Date: Mon, 16 Sep 2019 08:37:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190916153736.GA2493@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
 <20190909080654.GD21625@jaegeuk-macbookpro.roam.corp.google.com>
 <97237da2-897a-8420-94de-812e94aa751f@huawei.com>
 <20190909120443.GA31108@jaegeuk-macbookpro.roam.corp.google.com>
 <27725e65-53fe-5731-0201-9959b8ef6b49@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27725e65-53fe-5731-0201-9959b8ef6b49@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i9t4S-007JDt-0v
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: do not select same victim right
 again
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

On 09/16, Chao Yu wrote:
> On 2019/9/9 20:04, Jaegeuk Kim wrote:
> > On 09/09, Chao Yu wrote:
> >> On 2019/9/9 16:06, Jaegeuk Kim wrote:
> >>> On 09/09, Chao Yu wrote:
> >>>> On 2019/9/9 9:25, Jaegeuk Kim wrote:
> >>>>> GC must avoid select the same victim again.
> >>>>
> >>>> Blocks in previous victim will occupy addition free segment, I doubt after this
> >>>> change, FGGC may encounter out-of-free space issue more frequently.
> >>>
> >>> Hmm, actually this change seems wrong by sec_usage_check().
> >>> We may be able to avoid this only in the suspicious loop?
> >>>
> >>> ---
> >>>  fs/f2fs/gc.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >>> index e88f98ddf396..5877bd729689 100644
> >>> --- a/fs/f2fs/gc.c
> >>> +++ b/fs/f2fs/gc.c
> >>> @@ -1326,7 +1326,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >>>  		round++;
> >>>  	}
> >>>  
> >>> -	if (gc_type == FG_GC)
> >>> +	if (gc_type == FG_GC && seg_freed)
> >>
> >> That's original solution Sahitya provided to avoid infinite loop of GC, but I
> >> suggest to find the root cause first, then we added .invalid_segmap for that
> >> purpose.
> > 
> > I've checked the Sahitya's patch. So, it seems the problem can happen due to
> > is_alive or atomic_file.
> 
> For some conditions, this doesn't help, for example, two sections contain the
> same fewest valid blocks, it will cause to loop selecting them if it fails to
> migrate blocks.
> 
> How about keeping it as it is to find potential bug.

I think it'd be fine to merge this. Could you check the above scenario in more
detail?

Thanks,

> 
> Thanks,
> 
> > 
> >>
> >> Thanks,
> >>
> >>>  		sbi->cur_victim_sec = NULL_SEGNO;
> >>>  
> >>>  	if (sync)
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
