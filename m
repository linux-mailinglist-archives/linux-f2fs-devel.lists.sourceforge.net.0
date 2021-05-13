Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D537FE5A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 May 2021 21:40:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhHC7-0007Y4-Pk; Thu, 13 May 2021 19:40:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1lhHC5-0007Xw-RN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 19:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O8VUCTzxVSvxa3wVLPh12tovGUEtpcQQ1uxw15XLCZg=; b=Pd7IH2h+3C+0myH6gkQFNKpLdt
 rSyGPBCOaISAA2cCvyOOMAoqCldgsKvGVz8qeLZYW1PTMOkizWk2rGJzIqTozSCevyOKQ+1cQEHTH
 EC9JbNZTNzSneUfeb4eORSsB3y8LSQ2/9Wv1cyOaXXKKgSXLUxsHl1AL0ret1sMsi4jc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O8VUCTzxVSvxa3wVLPh12tovGUEtpcQQ1uxw15XLCZg=; b=cDl2E/k8gKMRQthu2TjF2EcWXp
 WemwGpxPCqh4jA2XcvF/ISlj1rjn7CSwk2cc/MNhVEZscMy+/b35FB/MTelEpq3W1cYLV+LJHeZTi
 CKdCObd7RHD3VJJeAVU1Q5GsxkukAlYX3NxhiLWJSeszpAqPaWpqR8GiS4IgIro5V7eA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lhHC1-0005Ka-OH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 19:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O8VUCTzxVSvxa3wVLPh12tovGUEtpcQQ1uxw15XLCZg=; b=S6oimQ+wSggkHbM04qw7qRcCif
 KxJ6s1XOGzoOpDq2Ik3+iRiwQfDzyBbe0DuWvzC9OR6jXy0kTrw+5iOA+LaoPKGquDRsAkhwtB1fn
 RAzftQHw1WIHsSHGyasEKCqK6uNc5md/QTdqO/gAX92LY/xjc3aThySb167Hsk1QbFODw0SI99hZD
 FJ7grq8hsbbFuQNaq3roe74z070sMG/wQF5s2VcKbYsspDgU3/f5jnSJCnX9ybUtPMZoBzeRLnZAR
 rt44B26yeOFUgC3PP1bOEdl/6GZRpu188I1tXE0mY9mkIB2XhLxPk/VtnEIL19/rPQgwFkGk1TQkJ
 GlbkDIiw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lhHAV-009iZc-F6; Thu, 13 May 2021 19:39:06 +0000
Date: Thu, 13 May 2021 20:38:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YJ2AR0IURFzz+52G@casper.infradead.org>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-3-jack@suse.cz>
 <YJvo1bGG1tG+gtgC@casper.infradead.org>
 <20210513190114.GJ2734@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513190114.GJ2734@quack2.suse.cz>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lhHC1-0005Ka-OH
Subject: Re: [f2fs-dev] [PATCH 03/11] mm: Protect operations adding pages to
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
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 13, 2021 at 09:01:14PM +0200, Jan Kara wrote:
> On Wed 12-05-21 15:40:21, Matthew Wilcox wrote:
> > Remind me (or, rather, add to the documentation) why we have to hold the
> > invalidate_lock during the call to readpage / readahead, and we don't just
> > hold it around the call to add_to_page_cache / add_to_page_cache_locked
> > / add_to_page_cache_lru ?  I appreciate that ->readpages is still going
> > to suck, but we're down to just three implementations of ->readpages now
> > (9p, cifs & nfs).
> 
> There's a comment in filemap_create_page() trying to explain this. We need
> to protect against cases like: Filesystem with 1k blocksize, file F has
> page at index 0 with uptodate buffer at 0-1k, rest not uptodate. All blocks
> underlying page are allocated. Now let read at offset 1k race with hole
> punch at offset 1k, length 1k.
> 
> read()					hole punch
> ...
>   filemap_read()
>     filemap_get_pages()
>       - page found in the page cache but !Uptodate
>       filemap_update_page()
> 					  locks everything
> 					  truncate_inode_pages_range()
> 					    lock_page(page)
> 					    do_invalidatepage()
> 					    unlock_page(page)
>         locks page
>           filemap_read_page()

Ah, this is the partial_start case, which means that page->mapping
is still valid.  But that means that do_invalidatepage() was called
with (offset 1024, length 1024), immediately after we called
zero_user_segment().  So isn't this a bug in the fs do_invalidatepage()?
The range from 1k-2k _is_ uptodate.  It's been zeroed in memory,
and if we were to run after the "free block" below, we'd get that
memory zeroed again.

>             ->readpage()
>               block underlying offset 1k
> 	      still allocated -> map buffer
> 					  free block under offset 1k
> 	      submit IO -> corrupted data
> 
> If you think I should expand it to explain more details, please tell.
> Or maybe I can put more detailed discussion like above into the changelog?

> > Why not:
> > 
> > 	__init_rwsem(&mapping->invalidate_lock, "mapping.invalidate_lock",
> > 			&sb->s_type->invalidate_lock_key);
> 
> I replicated what we do for i_rwsem but you're right, this is better.
> Updated.

Hmm, there's a few places we should use __init_rwsem() ... something
for my "when bored" pile of work.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
