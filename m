Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D02531944EA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 18:02:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHVtQ-0007q9-5j; Thu, 26 Mar 2020 17:02:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1jHVtN-0007pu-UB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 17:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pibj/X96koAOQtvyytCPGypFhpQqQaKFfVQSWyYBUqE=; b=WszAZ58eHrPcC+y1O8r8gMLUf2
 QiYVxksAFuyHnK0x+pcHytDQ/4wyGQKbnMHohz0JTMoXJvDaTpvUw0Ai5oYL4q82S/6/SJLDwbc9D
 jWVbh5azEg8X1YKhUGpvrFk40ISPr7d0TCZLqqt6QFXDq2BGG3mgm+CF3jLXV9vrh0+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pibj/X96koAOQtvyytCPGypFhpQqQaKFfVQSWyYBUqE=; b=cjla3Xt939UAouHq5Nr7DjijtO
 E+g5+0dbo3VQmhX1qPriHJQBRJ99XzpRS/k5/awOA6iWvdB85y0R2NQ9mJgj7p1qjG6qL+Cfmlfsi
 +PtU17mEFzX+gZnqNTHRx132cl/AtEBnjKlGuKRFMZL5L2r4tttF10PhJL9Ipwxxivk8=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jHVtI-000mRH-Ob
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 17:02:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45C90227A81; Thu, 26 Mar 2020 18:01:45 +0100 (CET)
Date: Thu, 26 Mar 2020 18:01:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200326170145.GA6387@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
 <20200325122825.1086872-3-hch@lst.de>
 <20200326032212.GN10776@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326032212.GN10776@dread.disaster.area>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [213.95.11.211 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jHVtI-000mRH-Ob
Subject: Re: [f2fs-dev] [PATCH 2/4] fs: avoid double-writing the inode on a
 lazytime expiration
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
Cc: Eric Biggers <ebiggers@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 26, 2020 at 02:22:12PM +1100, Dave Chinner wrote:
> On Wed, Mar 25, 2020 at 01:28:23PM +0100, Christoph Hellwig wrote:
> > In the case that an inode has dirty timestamp for longer than the
> > lazytime expiration timeout (or if all such inodes are being flushed
> > out due to a sync or syncfs system call), we need to inform the file
> > system that the inode is dirty so that the inode's timestamps can be
> > copied out to the on-disk data structures.  That's because if the file
> > system supports lazytime, it will have ignored the dirty_inode(inode,
> > I_DIRTY_TIME) notification when the timestamp was modified in memory.q
> > Previously, this was accomplished by calling mark_inode_dirty_sync(),
> > but that has the unfortunate side effect of also putting the inode the
> > writeback list, and that's not necessary in this case, since we will
> > immediately call write_inode() afterwards.  Replace the call to
> > mark_inode_dirty_sync() with a new lazytime_expired method to clearly
> > separate out this case.
> 
> 
> hmmm. Doesn't this cause issues with both iput() and
> vfs_fsync_range() because they call mark_inode_dirty_sync() on
> I_DIRTY_TIME inodes to move them onto the writeback list so they are
> appropriately expired when the inode is written back.

True, we'd need to call ->lazytime_expired in the fsync path as well.
While looking into this I've also noticed that lazytime is "enabled"
unconditionally without a file system opt-in.  That means for file systems
that don't rely on ->dirty_inode it kinda "just works" except that both
Teds original fix and this one break that in one way or another.  This
series just cleanly disables it, but Ted's two patches would fail to
pass I_DIRTY_SYNC to ->write_inode.

This whole area is such a mess..


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
