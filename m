Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA0BFB1F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Sep 2019 23:47:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDbbS-0004VD-7H; Thu, 26 Sep 2019 21:47:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iDbbR-0004V7-0h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Sep 2019 21:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2KPW+2BOz6w12FXjz6iUT802oJg8Rj0OuRk5pQKQYQQ=; b=iiXlNKBMpqFpteZ/mQt3Ytif8x
 45SreE6/P2qL6yVAVJ0uoXmpnbng+rnmLrvQcIa2ZljftUicm5dUux9M/aHU0EA3+RYBFN5eGK1dc
 xGu6DlYC4mTnwKHJ4Gy7iOcTPxT2MNdbGXwllVloNlkzSd3qL4DdKm9XXP0DaGySwi+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2KPW+2BOz6w12FXjz6iUT802oJg8Rj0OuRk5pQKQYQQ=; b=YNfa6yl6UlQdFM1mFb6xlaM/km
 5tZdKtqbpNZoqxS9x3WRU5vO0LHEZ2i/OUSHQz90+cxl4OFHuSnOtKNSEOU+mv2pvkiSopUULP/yB
 yuqbBHD/uhxc7lmU72paegl6HcOY3eohvg3fufEo96j+DTeWuPli5okvqU0DRJljtuLk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDbbN-007oBe-0d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Sep 2019 21:47:08 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87A8520835;
 Thu, 26 Sep 2019 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569534414;
 bh=YFSTeeZZg2BEdjJrQ0yOpq9LuFuTUYJSINpPZwsXoNA=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=HulqdxyFFzYLCuFdB6S8z4wjmKjtrInzlxyS0r7j/rI3lUQ/NKMufJxWyMb4I1Fe8
 DQUy1gQBOQjsiQe+082e8TftblxkJ1A6v8FDtwqcgJZ0lmHuu+wnP+voM3dR+z2YWp
 /+Vcsje0As2K42GFUjvwCmLPw/nZDOAIctfJMo+c=
Date: Thu, 26 Sep 2019 14:46:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190926214653.GA29685@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190816030334.81035-1-yuchao0@huawei.com>
 <20190926203755.GA142676@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926203755.GA142676@gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDbbN-007oBe-0d
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid data corruption by
 forbidding SSR overwrite
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/26, Eric Biggers wrote:
> On Fri, Aug 16, 2019 at 11:03:34AM +0800, Chao Yu wrote:
> > There is one case can cause data corruption.
> > 
> > - write 4k to fileA
> > - fsync fileA, 4k data is writebacked to lbaA
> > - write 4k to fileA
> > - kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet
> > - write 4k to fileB
> > - kworker flush 4k to lbaA due to SSR
> > - SPOR -> dnode with lbaA will be recovered, however lbaA contains fileB's
> > data
> > 
> > One solution is tracking all fsynced file's block history, and disallow
> > SSR overwrite on newly invalidated block on that file.
> > 
> > However, during recovery, no matter the dnode is flushed or fsynced, all
> > previous dnodes until last fsynced one in node chain can be recovered,
> > that means we need to record all block change in flushed dnode, which
> > will cause heavy cost, so let's just use simple fix by forbidding SSR
> > overwrite directly.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fs/f2fs/segment.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 9d9d9a050d59..69b3b553ee6b 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -2205,9 +2205,11 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
> >  		if (!f2fs_test_and_set_bit(offset, se->discard_map))
> >  			sbi->discard_blks--;
> >  
> > -		/* don't overwrite by SSR to keep node chain */
> > -		if (IS_NODESEG(se->type) &&
> > -				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> > +		/*
> > +		 * SSR should never reuse block which is checkpointed
> > +		 * or newly invalidated.
> > +		 */
> > +		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> >  			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
> >  				se->ckpt_valid_blocks++;
> >  		}
> > -- 
> 
> FYI, this commit caused xfstests generic/064 to start failing:

Yup, I was looking at this.

> 
> $ kvm-xfstests -c f2fs generic/064
> ...
> generic/064 3s ... 	[13:36:37][    5.946293] run fstests generic/064 at 2019-09-26 13:36:37
>  [13:36:41]- output mismatch (see /results/f2fs/results-default/generic/064.out.bad)
>     --- tests/generic/064.out	2019-09-18 04:53:46.000000000 -0700
>     +++ /results/f2fs/results-default/generic/064.out.bad	2019-09-26 13:36:41.533018683 -0700
>     @@ -1,2 +1,3 @@
>      QA output created by 064
>      Extent count after inserts is in range
>     +extents mismatched before = 1 after = 50
>     ...
>     (Run 'diff -u /root/xfstests/tests/generic/064.out /results/f2fs/results-default/generic/064.out.bad'  to see the entire diff)
> Ran: generic/064
> Failures: generic/064
> Failed 1 of 1 tests


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
