Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 412DD163AB9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:04:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Ff6-0003Kf-Sx; Wed, 19 Feb 2020 03:04:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j4Ff6-0003KU-Dy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iimCKSN/g8a45Jz1erph2nYH3ncQRgnAGvQNHP71nS4=; b=H41CAZ+06MQFAO+HmPoG9jFpud
 Zb+RSqC48J4DzMEIjsVvtuIhEGxFpJW379AWADsH76mPePG/ChYLIob4V5LsuYmbnooHg66Ye554D
 npRt8MMd7LRBjaUKyBIkhOAbm4p9x0cpOz+MzcM18p4SoVL1zlty4hdVK7W6vdhhi/pc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iimCKSN/g8a45Jz1erph2nYH3ncQRgnAGvQNHP71nS4=; b=CeCsfkIenwVspDbFmwrKJSqfgA
 muVr20qyshDvYhy4LTTA3DG7YKVPIyDEK0r6rdjRdgWfZkTFWxs5/+JBAN4mHsXJYdk/JiRNN1Y5O
 IU4+7kDe+SXH133xOsmT1wbJMXsjqzeV3ydSZUpRue3ZazHt4OSlxk6BKKNNnWpc3FRo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Ff5-00H9e7-6E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:04:32 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8900922B48;
 Wed, 19 Feb 2020 03:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582081465;
 bh=DP/qxwF6iAUNhhTZiDV7zdMbqJqUcrKE5bdIhYfJA54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KIysn+oagpaBb+AHuGgZhZhrqZcEQaF08vrhLBy6xj0C06c1F2Jebp2DRmUlirUxQ
 dNN+D5EmdaVhGtm0iKUtXaQXpbD64a5LjhElZbGtO2GLQZwvdSNH3VGB9U4SSKi5kb
 BRAvRxSitohp/AKScApFzKGtbozpq2qqKQjejc6U=
Date: Tue, 18 Feb 2020 19:04:25 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200219030425.GA102063@google.com>
References: <20200214185855.217360-1-jaegeuk@kernel.org>
 <20200214185855.217360-3-jaegeuk@kernel.org>
 <9c497f3e-3399-e4a6-f81c-6c4a1f35e5bb@huawei.com>
 <20200218232714.GB10213@google.com>
 <117a927f-7128-b5a1-a961-22934bb62ec5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <117a927f-7128-b5a1-a961-22934bb62ec5@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-Headers-End: 1j4Ff5-00H9e7-6E
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: skip migration only when BG_GC is
 called
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

On 02/19, Chao Yu wrote:
> On 2020/2/19 7:27, Jaegeuk Kim wrote:
> > On 02/17, Chao Yu wrote:
> >> On 2020/2/15 2:58, Jaegeuk Kim wrote:
> >>> FG_GC needs to move entire section more quickly.
> >>>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>>  fs/f2fs/gc.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >>> index bbf4db3f6bb4..1676eebc8c8b 100644
> >>> --- a/fs/f2fs/gc.c
> >>> +++ b/fs/f2fs/gc.c
> >>> @@ -1203,7 +1203,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
> >>>  
> >>>  		if (get_valid_blocks(sbi, segno, false) == 0)
> >>>  			goto freed;
> >>> -		if (__is_large_section(sbi) &&
> >>> +		if (gc_type == BG_GC && __is_large_section(sbi) &&
> >>>  				migrated >= sbi->migration_granularity)
> >>
> >> I knew migrating one large section is a more efficient way, but this can
> >> increase long-tail latency of f2fs_balance_fs() occasionally, especially in
> >> extreme fragmented space.
> > 
> > FG_GC requires to wait for whole section migration which shows the entire
> > latency.
> 
> That will cause long-tail latency for single f2fs_balance_fs() procedure,
> which it looks a very long hang when userspace call f2fs syscall, so why
> not splitting total elapsed time into several f2fs_balance_fs() to avoid that.

Then, other ops can easily make more dirty segments. The intention of FG_GC is
to block everything and make min. free segments as a best shot.

> 
> Thanks,
> 
> > 
> >>
> >> Thanks,
> >>
> >>>  			goto skip;
> >>>  		if (!PageUptodate(sum_page) || unlikely(f2fs_cp_error(sbi)))
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
