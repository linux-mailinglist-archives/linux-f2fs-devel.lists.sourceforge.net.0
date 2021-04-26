Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6436B66A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Apr 2021 18:03:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lb3iE-00072i-CI; Mon, 26 Apr 2021 16:03:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lb3i6-00071L-6D
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 16:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6nZR+ga+DoBgx11ePYZqRZsmfKLTrfrjowbymtTVYRg=; b=XHSwk8uOIaAKzXMj+6lEpg8R1f
 D25f1l+R+rsa3WjJO1dCZY4+cXvCNKLxINBdfW5AZLIGmLeH6L37tgg25NCkryR4H1iZGOElodQq0
 svbOlu+OVUawLwxZcFp89x75GcPjXAt2rnXNFdVTyQ4/YZBF4JdX9iMrjNDibD748yT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6nZR+ga+DoBgx11ePYZqRZsmfKLTrfrjowbymtTVYRg=; b=A7SBjfjYtcXWrAG4PXoTm49gCT
 ui2u27GK2EgLCnhWbQI5OAyDouM0IHU+ZK2FzI+ROn+wZ3TeSs65sXpbhN1xCLknOnSaYiudw0Jg3
 oDqiwgyzYZ6w169dzz4sRi+YjhHc8USqsx5URsZhgv/Rd7I5REPmw5/INNs5JaKLGvyc=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lb3i2-0008RX-MS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Apr 2021 16:03:46 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55725ABB1;
 Mon, 26 Apr 2021 15:46:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C7AF41E0CB7; Mon, 26 Apr 2021 17:46:39 +0200 (CEST)
Date: Mon, 26 Apr 2021 17:46:39 +0200
From: Jan Kara <jack@suse.cz>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20210426154639.GB23895@quack2.suse.cz>
References: <20210423171010.12-1-jack@suse.cz>
 <20210423173018.23133-2-jack@suse.cz>
 <20210423230449.GC1990290@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423230449.GC1990290@dread.disaster.area>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lb3i2-0008RX-MS
Subject: Re: [f2fs-dev] [PATCH 02/12] mm: Protect operations adding pages to
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
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Ted Tso <tytso@mit.edu>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, Steve French <sfrench@samba.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat 24-04-21 09:04:49, Dave Chinner wrote:
> On Fri, Apr 23, 2021 at 07:29:31PM +0200, Jan Kara wrote:
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
> .....
> > diff --git a/fs/inode.c b/fs/inode.c
> > index a047ab306f9a..43596dd8b61e 100644
> > --- a/fs/inode.c
> > +++ b/fs/inode.c
> > @@ -191,6 +191,9 @@ int inode_init_always(struct super_block *sb, struct inode *inode)
> >  	mapping_set_gfp_mask(mapping, GFP_HIGHUSER_MOVABLE);
> >  	mapping->private_data = NULL;
> >  	mapping->writeback_index = 0;
> > +	init_rwsem(&mapping->invalidate_lock);
> > +	lockdep_set_class(&mapping->invalidate_lock,
> > +			  &sb->s_type->invalidate_lock_key);
> >  	inode->i_private = NULL;
> >  	inode->i_mapping = mapping;
> >  	INIT_HLIST_HEAD(&inode->i_dentry);	/* buggered by rcu freeing */
> 
> Oh, lockdep. That might be a problem here.
> 
> The XFS_MMAPLOCK has non-trivial lockdep annotations so that it is
> tracked as nesting properly against the IOLOCK and the ILOCK. When
> you end up using xfs_ilock(XFS_MMAPLOCK..) to lock this, XFS will
> add subclass annotations to the lock and they are going to be
> different to the locking that the VFS does.
> 
> We'll see this from xfs_lock_two_inodes() (e.g. in
> xfs_swap_extents()) and xfs_ilock2_io_mmap() during reflink
> oper.....

Thanks for the pointer. I was kind of wondering what lockdep nesting games
XFS plays but then forgot to look into details. Anyway, I've preserved the
nesting annotations in XFS and fstests run on XFS passed without lockdep
complaining so there isn't at least an obvious breakage. Also as far as I'm
checking the code XFS usage in and lock nesting of MMAPLOCK should be
compatible with the nesting VFS enforces (also see below)...
 
> Oooooh. The page cache copy done when breaking a shared extent needs
> to lock out page faults on both the source and destination, but it
> still needs to be able to populate the page cache of both the source
> and destination file.....
> 
> .... and vfs_dedupe_file_range_compare() has to be able to read
> pages from both the source and destination file to determine that
> the contents are identical and that's done while we hold the
> XFS_MMAPLOCK exclusively so the compare is atomic w.r.t. all other
> user data modification operations being run....

So I started wondering why fstests passed when reading this :) The reason
is that vfs_dedupe_get_page() does not use standard page cache filling path
(neither readahead API nor filemap_read()), instead it uses
read_mapping_page() and so gets into page cache filling path below the
level at which we get invalidate_lock and thus everything works as it
should. So read_mapping_page() is similar to places like e.g.
block_truncate_page() or block_write_begin() which may end up filling in
page cache contents but they rely on upper layers to already hold
appropriate locks. I'll add a comment to read_mapping_page() about this.
Once all filesystems are converted to use invalidate_lock, I also want to
add WARN_ON_ONCE() to various places verifying that invalidate_lock is held
as it should...
 
> I now have many doubts that this "serialise page faults by locking
> out page cache instantiation" method actually works as a generic
> mechanism. It's not just page cache invalidation that relies on
> being able to lock out page faults: copy-on-write and deduplication
> both require the ability to populate the page cache with source data
> while page faults are locked out so the data can be compared/copied
> atomically with the extent level manipulations and so user data
> modifications cannot occur until the physical extent manipulation
> operation has completed.

Hum, that is a good point. So there are actually two different things you
want to block at different places:

1) You really want to block page cache instantiation for operations such as
hole punch as that operation mutates data and thus contents would become
stale.

2) You want to block page cache *modification* for operations such as
dedupe while keeping page cache in place. This is somewhat different
requirement but invalidate_lock can, in principle, cover it as well.
Basically we just need to keep invalidate_lock usage in .page_mkwrite
helpers. The question remains whether invalidate_lock is still a good name
with this usage in mind and I probably need to update a documentation to
reflect this usage.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
