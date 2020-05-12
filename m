Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 794761CEB52
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2020 05:24:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYLXI-0007fR-EB; Tue, 12 May 2020 03:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jYLXH-0007fK-8L
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 03:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XDT1JiH4njp6d2kEuGmh24JhkZhY0TRfGch01/KdQXw=; b=dZ1ubtzrdZQStDSj1XxJwG0EZK
 LBuXw4iUncLhv92+RhQ01nVe3SpOSt6h8TtlMFnapgz6YWe9+hgfn2C8c9y1q5LLGFYq/EK4liNMR
 +zI3spW9srdmntcy7TCmruX/U1+v0UySq6+oHFq0aGsj3wt51JCPaPKjZzJ9K+i3tshI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XDT1JiH4njp6d2kEuGmh24JhkZhY0TRfGch01/KdQXw=; b=bYG/5UHTAe7OD9pOya3jDNb24F
 wrzauXw2+jsiX/HZlvhSzI5vItu8E87LTX94LS2qcO4z/Lq+sN2trRKbyLiyWuzytqyyqVSfMm7pC
 Z1Npd2Nwe13/B/UT52nAtiKOypDM7oA6yfLI9xuEqzTPA2cuvjmHsusd3iqlzFOGp8RM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYLXB-00AIy8-1h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 03:24:51 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94229206B7;
 Tue, 12 May 2020 03:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589253879;
 bh=tzL90nTP6g/zTwNPhG6apawkix6NIfY0N0HNMdEjGYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QycjEauTaceGwBhK7LqwBoEbj1QgjomzsaTwK7A9hOh2e478iJefOQ24es3lzhcTd
 lx5UqxeWgspwgni45J7X8/rce/K7+kHOrr8aJ4w75YaYyJJ2PfCdYyiV1dDJoMJQLo
 mY6scp0j1rX8WSzAhfPhhRCuZZEyDd4prbIWRTuI=
Date: Mon, 11 May 2020 20:24:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200512032439.GA216359@google.com>
References: <1588244309-1468-1-git-send-email-sayalil@codeaurora.org>
 <20200508161052.GA49579@google.com>
 <0902037e-998d-812e-53e7-90ea7b9957eb@huawei.com>
 <20200509190342.GA11239@google.com>
 <fbb5ef1e-214d-f34a-e1a0-32534c765e56@huawei.com>
 <20200511221100.GA171700@google.com>
 <34a9cdcd-0e3d-8d2a-6b19-6fced3a3aa68@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34a9cdcd-0e3d-8d2a-6b19-6fced3a3aa68@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jYLXB-00AIy8-1h
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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

On 05/12, Chao Yu wrote:
> On 2020/5/12 6:11, Jaegeuk Kim wrote:
> > On 05/11, Chao Yu wrote:
> >> On 2020/5/10 3:03, Jaegeuk Kim wrote:
> >>> On 05/09, Chao Yu wrote:
> >>>> On 2020/5/9 0:10, Jaegeuk Kim wrote:
> >>>>> Hi Sayali,
> >>>>>
> >>>>> In order to address the perf regression, how about this?
> >>>>>
> >>>>> >From 48418af635884803ffb35972df7958a2e6649322 Mon Sep 17 00:00:00 2001
> >>>>> From: Jaegeuk Kim <jaegeuk@kernel.org>
> >>>>> Date: Fri, 8 May 2020 09:08:37 -0700
> >>>>> Subject: [PATCH] f2fs: avoid double lock for cp_rwsem during checkpoint
> >>>>>
> >>>>> There could be a scenario where f2fs_sync_node_pages gets
> >>>>> called during checkpoint, which in turn tries to flush
> >>>>> inline data and calls iput(). This results in deadlock as
> >>>>> iput() tries to hold cp_rwsem, which is already held at the
> >>>>> beginning by checkpoint->block_operations().
> >>>>>
> >>>>> Call stack :
> >>>>>
> >>>>> Thread A		Thread B
> >>>>> f2fs_write_checkpoint()
> >>>>> - block_operations(sbi)
> >>>>>  - f2fs_lock_all(sbi);
> >>>>>   - down_write(&sbi->cp_rwsem);
> >>>>>
> >>>>>                         - open()
> >>>>>                          - igrab()
> >>>>>                         - write() write inline data
> >>>>>                         - unlink()
> >>>>> - f2fs_sync_node_pages()
> >>>>>  - if (is_inline_node(page))
> >>>>>   - flush_inline_data()
> >>>>>    - ilookup()
> >>>>>      page = f2fs_pagecache_get_page()
> >>>>>      if (!page)
> >>>>>       goto iput_out;
> >>>>>      iput_out:
> >>>>> 			-close()
> >>>>> 			-iput()
> >>>>>        iput(inode);
> >>>>>        - f2fs_evict_inode()
> >>>>>         - f2fs_truncate_blocks()
> >>>>>          - f2fs_lock_op()
> >>>>>            - down_read(&sbi->cp_rwsem);
> >>>>>
> >>>>> Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
> >>>>> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> >>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>>>> ---
> >>>>>  fs/f2fs/node.c | 4 ++--
> >>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> >>>>> index 1db8cabf727ef..626d7daca09de 100644
> >>>>> --- a/fs/f2fs/node.c
> >>>>> +++ b/fs/f2fs/node.c
> >>>>> @@ -1870,8 +1870,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
> >>>>>  				goto continue_unlock;
> >>>>>  			}
> >>>>>  
> >>>>> -			/* flush inline_data */
> >>>>> -			if (is_inline_node(page)) {
> >>>>> +			/* flush inline_data, if it's not sync path. */
> >>>>> +			if (do_balance && is_inline_node(page)) {
> >>>>
> >>>> IIRC, this flow was designed to avoid running out of free space issue
> >>>> during checkpoint:
> >>>>
> >>>> 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
> >>>>
> >>>> The sceanrio is:
> >>>> 1. create fully node blocks
> >>>> 2. flush node blocks
> >>>> 3. write inline_data for all the node blocks again
> >>>> 4. flush node blocks redundantly
> >>>>
> >>>> I guess this may cause failing one case of fstest.
> >>>
> >>> Yeah, actually I was hitting 204 failure, and thus, revised like this.
> >>> Now, I don't see any regression in fstest.
> >>>
> >>> >From 8f1882acfb0a5fc43e5a2bbd576a8f3c681a7d2c Mon Sep 17 00:00:00 2001
> >>> From: Sayali Lokhande <sayalil@codeaurora.org>
> >>> Date: Thu, 30 Apr 2020 16:28:29 +0530
> >>> Subject: [PATCH] f2fs: Avoid double lock for cp_rwsem during checkpoint
> >>>
> >>> There could be a scenario where f2fs_sync_node_pages gets
> >>> called during checkpoint, which in turn tries to flush
> >>> inline data and calls iput(). This results in deadlock as
> >>> iput() tries to hold cp_rwsem, which is already held at the
> >>> beginning by checkpoint->block_operations().
> >>>
> >>> Call stack :
> >>>
> >>> Thread A		Thread B
> >>> f2fs_write_checkpoint()
> >>> - block_operations(sbi)
> >>>  - f2fs_lock_all(sbi);
> >>>   - down_write(&sbi->cp_rwsem);
> >>>
> >>>                         - open()
> >>>                          - igrab()
> >>>                         - write() write inline data
> >>>                         - unlink()
> >>> - f2fs_sync_node_pages()
> >>>  - if (is_inline_node(page))
> >>>   - flush_inline_data()
> >>>    - ilookup()
> >>>      page = f2fs_pagecache_get_page()
> >>>      if (!page)
> >>>       goto iput_out;
> >>>      iput_out:
> >>> 			-close()
> >>> 			-iput()
> >>>        iput(inode);
> >>>        - f2fs_evict_inode()
> >>>         - f2fs_truncate_blocks()
> >>>          - f2fs_lock_op()
> >>>            - down_read(&sbi->cp_rwsem);
> >>>
> >>> Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
> >>> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>>  fs/f2fs/checkpoint.c |  9 ++++++++-
> >>>  fs/f2fs/f2fs.h       |  4 ++--
> >>>  fs/f2fs/node.c       | 10 +++++-----
> >>>  3 files changed, 15 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >>> index d49f7a01d8a26..928aea4ff663d 100644
> >>> --- a/fs/f2fs/checkpoint.c
> >>> +++ b/fs/f2fs/checkpoint.c
> >>> @@ -1168,6 +1168,12 @@ static int block_operations(struct f2fs_sb_info *sbi)
> >>>  	};
> >>>  	int err = 0, cnt = 0;
> >>>  
> >>> +	/*
> >>> +	 * Let's flush node pages first to flush inline_data.
> >>> +	 * We'll actually guarantee everything below under f2fs_lock_all.
> >>> +	 */
> >>> +	f2fs_sync_node_pages(sbi, &wbc, false, false, FS_CP_NODE_IO);
> >>
> >> It is possible that user write a large number of inline data in between
> >> f2fs_sync_node_pages() and f2fs_lock_all(), it will cause the no-space issue in
> >> race condition.
> >>
> >> Also, if there is huge number of F2FS_DIRTY_IMETA, after this change, we will
> >> flush inode page twice which is unneeded.
> >>
> >> f2fs_sync_node_pages() --- flush dirty inode page
> >> f2fs_lock_all()
> >> ...
> >> f2fs_sync_inode_meta() --- update dirty inode page
> >> f2fs_sync_node_pages() --- flush dirty inode page again.
> >>
> > 
> > Another version:
> > 
> >>From 6b430b72af57c65c20dea7b87f7ba7e9df36be98 Mon Sep 17 00:00:00 2001
> > From: Sayali Lokhande <sayalil@codeaurora.org>
> > Date: Thu, 30 Apr 2020 16:28:29 +0530
> > Subject: [PATCH] f2fs: Avoid double lock for cp_rwsem during checkpoint
> > 
> > There could be a scenario where f2fs_sync_node_pages gets
> > called during checkpoint, which in turn tries to flush
> > inline data and calls iput(). This results in deadlock as
> > iput() tries to hold cp_rwsem, which is already held at the
> > beginning by checkpoint->block_operations().
> > 
> > Call stack :
> > 
> > Thread A		Thread B
> > f2fs_write_checkpoint()
> > - block_operations(sbi)
> >  - f2fs_lock_all(sbi);
> >   - down_write(&sbi->cp_rwsem);
> > 
> >                         - open()
> >                          - igrab()
> >                         - write() write inline data
> >                         - unlink()
> > - f2fs_sync_node_pages()
> >  - if (is_inline_node(page))
> >   - flush_inline_data()
> >    - ilookup()
> >      page = f2fs_pagecache_get_page()
> >      if (!page)
> >       goto iput_out;
> >      iput_out:
> > 			-close()
> > 			-iput()
> >        iput(inode);
> >        - f2fs_evict_inode()
> >         - f2fs_truncate_blocks()
> >          - f2fs_lock_op()
> >            - down_read(&sbi->cp_rwsem);
> > 
> > Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
> > Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/checkpoint.c |  5 +++++
> >  fs/f2fs/f2fs.h       |  1 +
> >  fs/f2fs/node.c       | 51 ++++++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 55 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index d49f7a01d8a26..79e605f38f4fa 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1168,6 +1168,11 @@ static int block_operations(struct f2fs_sb_info *sbi)
> >  	};
> >  	int err = 0, cnt = 0;
> >  
> > +	/*
> > +	 * Let's flush inline_data in dirty node pages.
> > +	 */
> > +	f2fs_flush_inline_data(sbi);
> 
> Still there is a gap, user can write a large number of inline data here...

I think generic/204 is the case, and I don't hit a panic with this patch.

> 
> Would that be enough? I doubt we can suffer this issue in below pathes
> as well:

I don't think so, since iput is called after f2fs_unlock_all().

> 
> - block_operations
>  - f2fs_sync_dirty_inodes
>   - iput
>  - f2fs_sync_inode_meta
>   - iput
> 
> Thanks,
> 
> > +
> >  retry_flush_quotas:
> >  	f2fs_lock_all(sbi);
> >  	if (__need_flush_quota(sbi)) {
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 2a8ea81c52a15..7f3d259e7e376 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3282,6 +3282,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
> >  struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
> >  struct page *f2fs_get_node_page_ra(struct page *parent, int start);
> >  int f2fs_move_node_page(struct page *node_page, int gc_type);
> > +int f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
> >  int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> >  			struct writeback_control *wbc, bool atomic,
> >  			unsigned int *seq_id);
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 1db8cabf727ef..e632de10aedab 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1807,6 +1807,53 @@ static bool flush_dirty_inode(struct page *page)
> >  	return true;
> >  }
> >  
> > +int f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
> > +{
> > +	pgoff_t index = 0;
> > +	struct pagevec pvec;
> > +	int nr_pages;
> > +	int ret = 0;
> > +
> > +	pagevec_init(&pvec);
> > +
> > +	while ((nr_pages = pagevec_lookup_tag(&pvec,
> > +			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
> > +		int i;
> > +
> > +		for (i = 0; i < nr_pages; i++) {
> > +			struct page *page = pvec.pages[i];
> > +
> > +			if (!IS_DNODE(page))
> > +				continue;
> > +
> > +			lock_page(page);
> > +
> > +			if (unlikely(page->mapping != NODE_MAPPING(sbi))) {
> > +continue_unlock:
> > +				unlock_page(page);
> > +				continue;
> > +			}
> > +
> > +			if (!PageDirty(page)) {
> > +				/* someone wrote it for us */
> > +				goto continue_unlock;
> > +			}
> > +
> > +			/* flush inline_data, if it's async context. */
> > +			if (is_inline_node(page)) {
> > +				clear_inline_node(page);
> > +				unlock_page(page);
> > +				flush_inline_data(sbi, ino_of_node(page));
> > +				continue;
> > +			}
> > +			unlock_page(page);
> > +		}
> > +		pagevec_release(&pvec);
> > +		cond_resched();
> > +	}
> > +	return ret;
> > +}
> > +
> >  int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
> >  				struct writeback_control *wbc,
> >  				bool do_balance, enum iostat_type io_type)
> > @@ -1870,8 +1917,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
> >  				goto continue_unlock;
> >  			}
> >  
> > -			/* flush inline_data */
> > -			if (is_inline_node(page)) {
> > +			/* flush inline_data, if it's async context. */
> > +			if (do_balance && is_inline_node(page)) {
> >  				clear_inline_node(page);
> >  				unlock_page(page);
> >  				flush_inline_data(sbi, ino_of_node(page));
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
