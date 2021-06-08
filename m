Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6639F649
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 14:19:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqaha-0005Ji-Uz; Tue, 08 Jun 2021 12:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1lqahZ-0005Ja-GN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 12:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gX+FqIGbLzH7Df0aDpilgfPqa5jp+2x0O0Dq2GScA/w=; b=HfD+EBeEYQQ3QgjehIYpVivIcp
 iR2axZas3u/sS6+lzOvqDVapQ9tMYyO+2Ix0q6piSCllTZtwcgu0mjfxjRO7YFtArMHsjPkiPeW5e
 vB+6zG3yMGp+A7+O5iGB2o3cxWOQ/C9s8Y/Pji8t6vXRO/5Mpio27KFcgRIVu8xFMR+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gX+FqIGbLzH7Df0aDpilgfPqa5jp+2x0O0Dq2GScA/w=; b=PhXP81Pss1iRFmLAjYC4XR10b9
 Cus6G187bG8OFVCXJ/g0dAEBuDwG5xkskBYEDVSNoml0gdnL8NnbjCnsZoc6ee1x9S25UxP3qVeYx
 gFTlcRlGkRge89OsCX5DP7IDFfAF1UIRDN32ssvUaoJt76Q9yldQAK1l5jAmUxNP8gPI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lqahY-0005QJ-2I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 12:19:25 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8DB101FD46;
 Tue,  8 Jun 2021 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623154755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gX+FqIGbLzH7Df0aDpilgfPqa5jp+2x0O0Dq2GScA/w=;
 b=KmRVHQ5+eR/D68RNgyB5xqEUQDaqcQqU3/DEnGMciUAKR23nxPjvOV8jc9mUj+j4mpbKkR
 Lv+ZgNiPi3HkId2Fw9ZdzoixgegRoPUsKgKc6PqFoywzWqoPqQ05G/Vtr2p/bP/v7A9DUJ
 iAW7WgczZtH9yytwp+giynzFLBLau4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623154755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gX+FqIGbLzH7Df0aDpilgfPqa5jp+2x0O0Dq2GScA/w=;
 b=j7Q267F20vgcAERTkfcT3mAjx5Fvz3Q43MRpV441Cp/5gRV1if/+naEY6l28Qaymueg/Ex
 tPMoFbA1xdeL5vDA==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 4ABA8A3B84;
 Tue,  8 Jun 2021 12:19:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2C36B1F2C94; Tue,  8 Jun 2021 14:19:15 +0200 (CEST)
Date: Tue, 8 Jun 2021 14:19:15 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210608121915.GG5562@quack2.suse.cz>
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-3-jack@suse.cz>
 <20210607160922.GA2945763@locust>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607160922.GA2945763@locust>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lqahY-0005QJ-2I
Subject: Re: [f2fs-dev] [PATCH 03/14] mm: Protect operations adding pages to
 page cache with invalidate_lock
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Ted Tso <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 07-06-21 09:09:22, Darrick J. Wong wrote:
> On Mon, Jun 07, 2021 at 04:52:13PM +0200, Jan Kara wrote:
> > Currently, serializing operations such as page fault, read, or readahead
> > against hole punching is rather difficult. The basic race scheme is
> > like:
> > 
> > fallocate(FALLOC_FL_PUNCH_HOLE)			read / fault / ..
> >   truncate_inode_pages_range()
> > 						  <create pages in page
> > 						   cache here>
> >   <update fs block mapping and free blocks>
> > 
> > Now the problem is in this way read / page fault / readahead can
> > instantiate pages in page cache with potentially stale data (if blocks
> > get quickly reused). Avoiding this race is not simple - page locks do
> > not work because we want to make sure there are *no* pages in given
> > range. inode->i_rwsem does not work because page fault happens under
> > mmap_sem which ranks below inode->i_rwsem. Also using it for reads makes
> > the performance for mixed read-write workloads suffer.
> > 
> > So create a new rw_semaphore in the address_space - invalidate_lock -
> > that protects adding of pages to page cache for page faults / reads /
> > readahead.
> > 
> > Signed-off-by: Jan Kara <jack@suse.cz>
...
> > +->fallocate implementation must be really careful to maintain page cache
> > +consistency when punching holes or performing other operations that invalidate
> > +page cache contents. Usually the filesystem needs to call
> > +truncate_inode_pages_range() to invalidate relevant range of the page cache.
> > +However the filesystem usually also needs to update its internal (and on disk)
> > +view of file offset -> disk block mapping. Until this update is finished, the
> > +filesystem needs to block page faults and reads from reloading now-stale page
> > +cache contents from the disk. VFS provides mapping->invalidate_lock for this
> > +and acquires it in shared mode in paths loading pages from disk
> > +(filemap_fault(), filemap_read(), readahead paths). The filesystem is
> > +responsible for taking this lock in its fallocate implementation and generally
> > +whenever the page cache contents needs to be invalidated because a block is
> > +moving from under a page.
> 
> Having a page cache invalidation lock isn't optional anymore, so I think
> these last two sentences could be condensed:
> 
> "...from reloading now-stale page cache contents from disk.  Since VFS
> acquires mapping->invalidate_lock in shared mode when loading pages from
> disk (filemap_fault(), filemap_read(), readahead), the fallocate
> implementation must take the invalidate_lock to prevent reloading."
> 
> > +
> > +->copy_file_range and ->remap_file_range implementations need to serialize
> > +against modifications of file data while the operation is running. For
> > +blocking changes through write(2) and similar operations inode->i_rwsem can be
> > +used. For blocking changes through memory mapping, the filesystem can use
> > +mapping->invalidate_lock provided it also acquires it in its ->page_mkwrite
> > +implementation.
> 
> Following the same line of reasoning, if taking the invalidate_lock is
> no longer optional, then the conditional language in this last sentence
> is incorrect.  How about:
> 
> "To block changes to file contents via a memory mapping during the
> operation, the filesystem must take mapping->invalidate_lock to
> coordinate with ->page_mkwrite."
> 
> The code changes look fine to me, though I'm no mm expert. ;)

OK, I've updated the documentation as you suggested. Thanks for review.

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
