Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B322EE7CE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 22:47:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxd7P-0002Tt-VQ; Thu, 07 Jan 2021 21:46:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kxd7N-0002Tm-U2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 21:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mxm9rgdwsfnaXrp+OiFpnswgvxg8h2Kk2EPS9k8j7pA=; b=Ckcyat+v5Cd6bdAJpRZyuUMNEn
 NhaCAbu2YBWvzf2TWnXpmEHyWSYTOWOVLohRFz/Z3yE5p4yNpjRcZ1cY8u3PS8j1C2dSTbkdvxn9j
 NnGfD8VLNVf03qV+8MFOUh3GY5eq5OBizRM9totZNE39wrGwVV+o62KCW4kcBXG+h5K0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mxm9rgdwsfnaXrp+OiFpnswgvxg8h2Kk2EPS9k8j7pA=; b=TPWUB3cwWsmETotnRmdQnL64uJ
 Lk8Xp5cdWfdxV2zA+oPl7G9swibAvnXKyuQKmSIsN7QXHBLDqq/xMkVvee5R3eOYtk27DwGRbpq1v
 AZNVutFyGK7YrqLKSDFn3f8TECrOYHUigFFV/5iN183L5X/2TUx+DU6vjdvTxzf+SK5E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxd7J-00DX5t-Kw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 21:46:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 141AF23600;
 Thu,  7 Jan 2021 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610055999;
 bh=WqYF7Pa6ZpVpCcZ2vNf1J8/EbxAxiMgwAPAYvp5dLDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lk57fWw0z79gwMhVOUES/eP86vzr3eoEI13JEHAquGPwFwas2W3siRt/t7UyvBoKk
 0tZgiXCWpFwJhLr8shFHtvIqoKowelEXDPU6e0dZ6R1u6ARcYKOd9SNWV9g3kC5htf
 kyd9Hg9s3MnfzNZLAPo/fjFL1flAqcHiWzExB12FMq2kEedFYf8VvL20nn1L41t2fi
 pHB2i4b1dJjDkZi0tEzeZKHGdToii/3IgBBrQDDmNIiKyk9yQFabb9H0Q/rRBcRv5O
 UlxdU6I6DRf3tz3BpUzWboGLL0apdDkKuPASRbGjC7Aiv4eZLnpw459FLvyces5yDO
 cQ0QFegKNrszQ==
Date: Thu, 7 Jan 2021 13:46:37 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <X/eBPZ+kLGuz2NDC@gmail.com>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-2-ebiggers@kernel.org>
 <20210107144709.GG12990@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107144709.GG12990@quack2.suse.cz>
X-Spam-Score: -0.3 (/)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kxd7J-00DX5t-Kw
Subject: Re: [f2fs-dev] [PATCH 01/13] fs: avoid double-writing inodes on
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
Cc: Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 07, 2021 at 03:47:09PM +0100, Jan Kara wrote:
> > diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> > index acfb55834af23..081e335cdee47 100644
> > --- a/fs/fs-writeback.c
> > +++ b/fs/fs-writeback.c
> > @@ -1509,11 +1509,22 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
> >  
> >  	spin_unlock(&inode->i_lock);
> >  
> > -	if (dirty & I_DIRTY_TIME)
> > -		mark_inode_dirty_sync(inode);
> >  	/* Don't write the inode if only I_DIRTY_PAGES was set */
> >  	if (dirty & ~I_DIRTY_PAGES) {
> > -		int err = write_inode(inode, wbc);
> > +		int err;
> > +
> > +		/*
> > +		 * If the inode is being written due to a lazytime timestamp
> > +		 * expiration, then the filesystem needs to be notified about it
> > +		 * so that e.g. the filesystem can update on-disk fields and
> > +		 * journal the timestamp update.  Just calling write_inode()
> > +		 * isn't enough.  Don't call mark_inode_dirty_sync(), as that
> > +		 * would put the inode back on the dirty list.
> > +		 */
> > +		if ((dirty & I_DIRTY_TIME) && inode->i_sb->s_op->dirty_inode)
> > +			inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_SYNC);
> > +
> > +		err = write_inode(inode, wbc);
> >  		if (ret == 0)
> >  			ret = err;
> >  	}
> 
> I have to say I dislike this special call of ->dirty_inode(). It works but
> it makes me wonder, didn't we forget about something or won't we forget in
> the future? Because it's very easy to miss this special case...
> 
> I think attached patch (compile-tested only) should actually fix the
> problem as well without this special ->dirty_inode() call. It basically
> only moves the mark_inode_dirty_sync() before inode->i_state clearing.
> Because conceptually mark_inode_dirty_sync() is IMO the right function to
> call. It will take care of clearing I_DIRTY_TIME flag (because we are
> setting I_DIRTY_SYNC), it will also not touch inode->i_io_list if the inode
> is queued for sync (I_SYNC_QUEUED is set in that case). The only problem
> with calling it was that it was called *after* clearing dirty bits from
> i_state... What do you think?
> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

> From 80ccc6a78d1c0532f600b98884f7a64e58333485 Mon Sep 17 00:00:00 2001
> From: Jan Kara <jack@suse.cz>
> Date: Thu, 7 Jan 2021 15:36:05 +0100
> Subject: [PATCH] fs: Make sure inode is clean after __writeback_single_inode()
> 
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/fs-writeback.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index acfb55834af2..b9356f470fae 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1473,22 +1473,25 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  			ret = err;
>  	}
>  
> +	/*
> +	 * If inode has dirty timestamps and we need to write them, call
> +	 * mark_inode_dirty_sync() to notify filesystem about it.
> +	 */
> +	if (inode->i_state & I_DIRTY_TIME &&
> +	    (wbc->for_sync || wbc->sync_mode == WB_SYNC_ALL ||
> +	     time_after(jiffies, inode->dirtied_time_when +
> +			dirtytime_expire_interval * HZ))) {
> +		trace_writeback_lazytime(inode);
> +		mark_inode_dirty_sync(inode);
> +	}
> +
>  	/*
>  	 * Some filesystems may redirty the inode during the writeback
>  	 * due to delalloc, clear dirty metadata flags right before
>  	 * write_inode()
>  	 */
>  	spin_lock(&inode->i_lock);
> -
>  	dirty = inode->i_state & I_DIRTY;
> -	if ((inode->i_state & I_DIRTY_TIME) &&
> -	    ((dirty & I_DIRTY_INODE) ||
> -	     wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
> -	     time_after(jiffies, inode->dirtied_time_when +
> -			dirtytime_expire_interval * HZ))) {
> -		dirty |= I_DIRTY_TIME;
> -		trace_writeback_lazytime(inode);
> -	}
>  	inode->i_state &= ~dirty;
>  
>  	/*
> @@ -1509,8 +1512,6 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  
>  	spin_unlock(&inode->i_lock);
>  
> -	if (dirty & I_DIRTY_TIME)
> -		mark_inode_dirty_sync(inode);
>  	/* Don't write the inode if only I_DIRTY_PAGES was set */
>  	if (dirty & ~I_DIRTY_PAGES) {
>  		int err = write_inode(inode, wbc);

It looks like that's going to work, and it fixes the XFS bug too.

Note that if __writeback_single_inode() is called from writeback_single_inode()
(rather than writeback_sb_inodes()), then the inode might not be queued for
sync, in which case mark_inode_dirty_sync() will move it to a writeback list.

That's okay because afterwards, writeback_single_inode() will delete the inode
from any writeback list if it's been fully cleaned, right?  So clean inodes
won't get left on a writeback list.

It's confusing because there are comments in writeback_single_inode() and above
__writeback_single_inode() that say that the inode must not be moved between
writeback lists.  I take it that those comments are outdated, as they predate
I_SYNC_QUEUED being introduced by commit 5afced3bf281 ("writeback: Avoid
skipping inode writeback")?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
