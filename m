Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E9718260C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 00:54:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCBB8-0006iD-FE; Wed, 11 Mar 2020 23:54:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jCBB6-0006hx-Sv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 23:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/3cJmG4JORUJUm7i1m+DGHfSYqVnIBxd5+4ugijVlU=; b=cjLM+6rnM+aFhGkFAP0ZxqqBSN
 r+I690RRYhpvm2T6/JEZiabzvE5sadMkqeFMOHq8MAdUnNHnWbyZEfzzre6/j8u4pOcsJQEw5AYxu
 MuE4voU10GoX7FsWHEYcQGTmnT66CP4LBjHSlQUYTHcDYFhdeWHHTq7gyLJa+Fedb0YI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l/3cJmG4JORUJUm7i1m+DGHfSYqVnIBxd5+4ugijVlU=; b=Ipy2pQijOpRXXyOSTMuQBuU3Rc
 1XeUp67Qj3j0sYT9zQod1E7idSq/dDLYikjB/ErIJkarzUTPcmDHhcuUFVyc1m5ReVbiggeVnxji6
 n1ai0I4RelAb6N27v+D0TOu3mhqG/sQVZJtysmDVWdqtqWDQKG43EBhIEdtYJKu+IxFk=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jCBB4-0056wS-MV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 23:54:20 +0000
Received: from dread.disaster.area (pa49-195-202-68.pa.nsw.optusnet.com.au
 [49.195.202.68])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 6FB1C3A2B28;
 Thu, 12 Mar 2020 10:54:10 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jCBAu-0005Ez-JZ; Thu, 12 Mar 2020 10:54:08 +1100
Date: Thu, 12 Mar 2020 10:54:08 +1100
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200311235408.GX10737@dread.disaster.area>
References: <20200306004555.GB225345@gmail.com>
 <20200307020043.60118-1-tytso@mit.edu>
 <20200311032009.GC46757@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311032009.GC46757@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=mqTaRPt+QsUAtUurwE173Q==:117 a=mqTaRPt+QsUAtUurwE173Q==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=SS2py6AdgQ4A:10
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7-415B0cAAAA:8 a=tSSHeJGq2Hsi8ItP-fQA:9
 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jCBB4-0056wS-MV
Subject: Re: [f2fs-dev] [PATCH] writeback: avoid double-writing the inode on
 a lazytime expiration
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
Cc: Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 10, 2020 at 08:20:09PM -0700, Eric Biggers wrote:
> On Fri, Mar 06, 2020 at 09:00:43PM -0500, Theodore Ts'o wrote:
> > In the case that an inode has dirty timestamp for longer than the
> > lazytime expiration timeout (or if all such inodes are being flushed
> > out due to a sync or syncfs system call), we need to inform the file
> > system that the inode is dirty so that the inode's timestamps can be
> > copied out to the on-disk data structures.  That's because if the file
> > system supports lazytime, it will have ignored the dirty_inode(inode,
> > I_DIRTY_TIME) notification when the timestamp was modified in memory.q
> > 
> > Previously, this was accomplished by calling mark_inode_dirty_sync(),
> > but that has the unfortunate side effect of also putting the inode the
> > writeback list, and that's not necessary in this case, since we will
> > immediately call write_inode() afterwards.
> > 
> > Eric Biggers noticed that this was causing problems for fscrypt after
> > the key was removed[1].
> > 
> > [1] https://lore.kernel.org/r/20200306004555.GB225345@gmail.com
> > 
> > Reported-by: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> > ---
> >  fs/fs-writeback.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> > index 76ac9c7d32ec..32101349ba97 100644
> > --- a/fs/fs-writeback.c
> > +++ b/fs/fs-writeback.c
> > @@ -1504,8 +1504,9 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
> >  
> >  	spin_unlock(&inode->i_lock);
> >  
> > -	if (dirty & I_DIRTY_TIME)
> > -		mark_inode_dirty_sync(inode);
> > +	/* This was a lazytime expiration; we need to tell the file system */
> > +	if (dirty & I_DIRTY_TIME_EXPIRED && inode->i_sb->s_op->dirty_inode)
> > +		inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_TIME_EXPIRED);
> >  	/* Don't write the inode if only I_DIRTY_PAGES was set */
> >  	if (dirty & ~I_DIRTY_PAGES) {
> >  		int err = write_inode(inode, wbc);
> > -- 
> 
> Thanks Ted!  This fixes the fscrypt test failure.
> 
> However, are you sure this works correctly on all filesystems?  I'm not sure
> about XFS.  XFS only implements ->dirty_inode(), not ->write_inode(), and in its
> ->dirty_inode() it does:
> 
> 	static void
> 	xfs_fs_dirty_inode(
> 		struct inode                    *inode,
> 		int                             flag)
> 	{
> 		struct xfs_inode                *ip = XFS_I(inode);
> 		struct xfs_mount                *mp = ip->i_mount;
> 		struct xfs_trans                *tp;
> 
> 		if (!(inode->i_sb->s_flags & SB_LAZYTIME))
> 			return;
> 		if (flag != I_DIRTY_SYNC || !(inode->i_state & I_DIRTY_TIME))
> 			return;
> 
> 		if (xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp))
> 			return;
> 		xfs_ilock(ip, XFS_ILOCK_EXCL);
> 		xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
> 		xfs_trans_log_inode(tp, ip, XFS_ILOG_TIMESTAMP);
> 		xfs_trans_commit(tp);
> 	}
> 
> 
> So flag=I_DIRTY_TIME_EXPIRED will be a no-op.
> 
> Maybe you should be using I_DIRTY_SYNC instead?  Or perhaps XFS should be
> checking for either I_DIRTY_TIME_EXPIRED or I_DIRTY_SYNC?

Right, XFS does not use the VFS inode writeback code at all - we
track all metadata changes internally via journalling. The VFS uses
I_DIRTY_SYNC to indicate and inode is metadata dirty and a writeback
candidate. Hence if we need to mark an inode dirty for integrity
purposes for _any reason_, then I_DIRTY_SYNC is the correct flag to
be passing to ->dirty_inode.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
