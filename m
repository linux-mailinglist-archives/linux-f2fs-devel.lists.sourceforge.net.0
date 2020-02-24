Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D022816B375
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 23:00:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6LmN-0000nC-IT; Mon, 24 Feb 2020 22:00:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j6LmL-0000n4-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 22:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ruu/Rn4hMv8v5OeE3t24iof8dSYHpCJXLEq2Majx4cc=; b=V/dD1BBt6iP1guG85omsyymTvo
 +xhKiIZCDIWZlkq6xjh0JOHEBtdds4S4IzDta2Kr+gXnzYGGcJsf5pA9psOzpnQAKug+5CRRitAVm
 UWHRnsAygFT+cNfNoPuXBqlbxI26IPbPFp+PbhN7Dnl12FoWkkRbHTVeVMMVhXVAOauE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ruu/Rn4hMv8v5OeE3t24iof8dSYHpCJXLEq2Majx4cc=; b=EczYLfHiHvqZj8j+OE3BTGSJLI
 TDN+SPA5uK+6JvA1PM6+/2twv3w3nrMjD+Oqq3l0zThw3eqqZuB7k1+xy/JlD4Q/4Xu/6yu+JNb3M
 BscdoO/5WtnvEJ5QzYm7TWNe2Pz0f2NXkN1PVZ6/UnWlAaiPkCHwMX9BhzBx6B9D12T4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6LmJ-008zEG-DB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 22:00:41 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DD0120CC7;
 Mon, 24 Feb 2020 22:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582581632;
 bh=EZ+Ei0mMz9aXg3foEaWmEi27b7awpExGYB0AFFAuoqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g0MIX48mZqh7MT751Vhna3OD982qJJ5UTkzxOZbW23WmZhEVMyMaAgEy6GR85ShQY
 MHxPab2CLyyQ6oJO+pLL5YlNbtDt7e3pw1yr8mRUi30r1jQqo/NRNHPI+4NTbb5z5x
 n82nVdimza2L8+HJKyGBjmGN4g2OgB6DaVVPCJkM=
Date: Mon, 24 Feb 2020 14:00:31 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200224220031.GC77839@google.com>
References: <20200218102136.32150-1-yuchao0@huawei.com>
 <20200218102136.32150-3-yuchao0@huawei.com>
 <20200219025154.GB96609@google.com>
 <576f8389-ba27-b461-5466-cc62e84b5c92@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <576f8389-ba27-b461-5466-cc62e84b5c92@huawei.com>
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
X-Headers-End: 1j6LmJ-008zEG-DB
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: avoid unneeded barrier in
 do_checkpoint()
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
> On 2020/2/19 10:51, Jaegeuk Kim wrote:
> > On 02/18, Chao Yu wrote:
> >> We don't need to wait all dirty page submitting IO twice,
> >> remove unneeded wait step.
> > 
> > What happens if checkpoint and other meta writs are reordered?
> 
> checkpoint can be done as following:
> 
> 1. All meta except last cp-park of checkpoint area.
> 2. last cp-park of checkpoint area
> 
> So we only need to keep barrier in between step 1 and 2, we don't need
> to care about the write order of meta in step 1, right?

Ah, let me integrate this patch into Sahitya's patch.

f2fs: fix the panic in do_checkpoint()

> 
> Thanks,
> 
> > 
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >>  fs/f2fs/checkpoint.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >> index 751815cb4c2b..9c88fb3d255a 100644
> >> --- a/fs/f2fs/checkpoint.c
> >> +++ b/fs/f2fs/checkpoint.c
> >> @@ -1384,8 +1384,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> >>  
> >>  	/* Flush all the NAT/SIT pages */
> >>  	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
> >> -	/* Wait for all dirty meta pages to be submitted for IO */
> >> -	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
> >>  
> >>  	/*
> >>  	 * modify checkpoint
> >> -- 
> >> 2.18.0.rc1
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
