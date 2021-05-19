Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E91E388C33
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 May 2021 12:57:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ljJtT-0002MS-Ss; Wed, 19 May 2021 10:57:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1ljJtR-0002MK-VE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 May 2021 10:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5RwXlNTFTROAhTUuGmyqEqzhTd2dRi4xl3I2fjWbu/U=; b=D5jRw9YTrGTnOUWeMi0bB0wYGw
 mMqLnL5hAOiBIUVqmRnRBbT09Iu3HpMxzp6/mtHKI8yOnl4c4km02VMXrJu7AeWMrrrXwSNZEkuMo
 llparccimEdwmc/4qDICIWDYwRHPhys5eq+yVySizas7uDLWUlynrJjpaqvIv5YfIJCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5RwXlNTFTROAhTUuGmyqEqzhTd2dRi4xl3I2fjWbu/U=; b=byu6HwEMqCGnlZJ6v/Lwnt2xe6
 Qkibwm+ldWIiEbjpjDwY0Xrg4HeSiOXgNQBbqJCEBBJt9Iod/CZIFvL+k8Vq5aC4iTfmkZ6PNwnsg
 eZLfvBd41mPOxHuTigk7AkoVfkeDn1YhYiOOixMe9nUi/DduvuLHi6w4y1bZ3MAwycaU=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ljJtF-00Ewes-HG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 May 2021 10:57:38 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6396AC4B;
 Wed, 19 May 2021 10:57:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 086AA1F2C9C; Wed, 19 May 2021 12:57:14 +0200 (CEST)
Date: Wed, 19 May 2021 12:57:14 +0200
From: Jan Kara <jack@suse.cz>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20210519105713.GA26250@quack2.suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-3-jack@suse.cz>
 <20210512152345.GE8606@magnolia>
 <20210513174459.GH2734@quack2.suse.cz>
 <20210513185252.GB9675@magnolia>
 <20210513231945.GD2893@dread.disaster.area>
 <20210514161730.GL9675@magnolia>
 <20210518223637.GJ2893@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518223637.GJ2893@dread.disaster.area>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ljJtF-00Ewes-HG
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
 linux-ext4@vger.kernel.org, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Steve French <sfrench@samba.org>,
 Jeff Layton <jlayton@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Ted Tso <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 19-05-21 08:36:37, Dave Chinner wrote:
> On Fri, May 14, 2021 at 09:17:30AM -0700, Darrick J. Wong wrote:
> > On Fri, May 14, 2021 at 09:19:45AM +1000, Dave Chinner wrote:
> > > On Thu, May 13, 2021 at 11:52:52AM -0700, Darrick J. Wong wrote:
> > > > On Thu, May 13, 2021 at 07:44:59PM +0200, Jan Kara wrote:
> > > > > On Wed 12-05-21 08:23:45, Darrick J. Wong wrote:
> > > > > > On Wed, May 12, 2021 at 03:46:11PM +0200, Jan Kara wrote:
> > > > > > > +->fallocate implementation must be really careful to maintain page cache
> > > > > > > +consistency when punching holes or performing other operations that invalidate
> > > > > > > +page cache contents. Usually the filesystem needs to call
> > > > > > > +truncate_inode_pages_range() to invalidate relevant range of the page cache.
> > > > > > > +However the filesystem usually also needs to update its internal (and on disk)
> > > > > > > +view of file offset -> disk block mapping. Until this update is finished, the
> > > > > > > +filesystem needs to block page faults and reads from reloading now-stale page
> > > > > > > +cache contents from the disk. VFS provides mapping->invalidate_lock for this
> > > > > > > +and acquires it in shared mode in paths loading pages from disk
> > > > > > > +(filemap_fault(), filemap_read(), readahead paths). The filesystem is
> > > > > > > +responsible for taking this lock in its fallocate implementation and generally
> > > > > > > +whenever the page cache contents needs to be invalidated because a block is
> > > > > > > +moving from under a page.
> > > > > > > +
> > > > > > > +->copy_file_range and ->remap_file_range implementations need to serialize
> > > > > > > +against modifications of file data while the operation is running. For blocking
> > > > > > > +changes through write(2) and similar operations inode->i_rwsem can be used. For
> > > > > > > +blocking changes through memory mapping, the filesystem can use
> > > > > > > +mapping->invalidate_lock provided it also acquires it in its ->page_mkwrite
> > > > > > > +implementation.
> > > > > > 
> > > > > > Question: What is the locking order when acquiring the invalidate_lock
> > > > > > of two different files?  Is it the same as i_rwsem (increasing order of
> > > > > > the struct inode pointer) or is it the same as the XFS MMAPLOCK that is
> > > > > > being hoisted here (increasing order of i_ino)?
> > > > > > 
> > > > > > The reason I ask is that remap_file_range has to do that, but I don't
> > > > > > see any conversions for the xfs_lock_two_inodes(..., MMAPLOCK_EXCL)
> > > > > > calls in xfs_ilock2_io_mmap in this series.
> > > > > 
> > > > > Good question. Technically, I don't think there's real need to establish a
> > > > > single ordering because locks among different filesystems are never going
> > > > > to be acquired together (effectively each lock type is local per sb and we
> > > > > are free to define an ordering for each lock type differently). But to
> > > > > maintain some sanity I guess having the same locking order for doublelock
> > > > > of i_rwsem and invalidate_lock makes sense. Is there a reason why XFS uses
> > > > > by-ino ordering? So that we don't have to consider two different orders in
> > > > > xfs_lock_two_inodes()...
> > > > 
> > > > I imagine Dave will chime in on this, but I suspect the reason is
> > > > hysterical raisins^Wreasons.
> > > 
> > > It's the locking rules that XFS has used pretty much forever.
> > > Locking by inode number always guarantees the same locking order of
> > > two inodes in the same filesystem, regardless of the specific
> > > in-memory instances of the two inodes.
> > > 
> > > e.g. if we lock based on the inode structure address, in one
> > > instancex, we could get A -> B, then B gets recycled and
> > > reallocated, then we get B -> A as the locking order for the same
> > > two inodes.
> > > 
> > > That, IMNSHO, is utterly crazy because with non-deterministic inode
> > > lock ordered like this you can't make consistent locking rules for
> > > locking the physical inode cluster buffers underlying the inodes in
> > > the situation where they also need to be locked.
> > 
> > <nod> That's protected by the ILOCK, correct?
> > 
> > > We've been down this path before more than a decade ago when the
> > > powers that be decreed that inode locking order is to be "by
> > > structure address" rather than inode number, because "inode number
> > > is not unique across multiple superblocks".
> > > 
> > > I'm not sure that there is anywhere that locks multiple inodes
> > > across different superblocks, but here we are again....
> > 
> > Hm.  Are there situations where one would want to lock multiple
> > /mappings/ across different superblocks?  The remapping code doesn't
> > allow cross-super operations, so ... pipes and splice, maybe?  I don't
> > remember that code well enough to say for sure.
> 
> Hmmmm. Doing read IO into a buffer that is mmap()d from another
> file, and we take a page fault on it inside the read IO path? We're
> copying from a page in one mapping and taking a fault in another
> mapping and hence taking the invalidate_lock to populate the page
> cache for the second mapping...
> 
> I haven't looked closely enough at where the invalidate_lock is held
> in the read path to determine if this is an issue, but if it is then
> it is also a potential deadlock scenario...

I was careful enough to avoid this problem - we first bring pages into
pages cache (under invalidate_lock), then drop invalidate lock, just
keep page refs, and copy page cache content into the buffer (which may grab
invalidate_lock from another mapping as you say).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
