Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AC2F1896
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:46:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyySb-0003nv-JH; Mon, 11 Jan 2021 14:46:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyySa-0003nh-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=igwhTWH6zHolkq1l9RtyKVpnHE+u4wZKfmznjLT6j1o=; b=i5L72kVGySYQxGl7EXoPWrLK1t
 T2aqSLOJVXsRrCZ1ickhrdOXqjJubrtbzwWJHhBRI7QElApV4RtqwsFhVhepB59qUAJ0c0XD/N/Gl
 oG51xUCRhlAEb/90EczqshKh4vpFrmQ6dxn/2A7KjjyrSy7FaeVE+oXJYU20ZfBuFY9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=igwhTWH6zHolkq1l9RtyKVpnHE+u4wZKfmznjLT6j1o=; b=ZbqTwgMnCn+jNYIQJmeb1LbMIz
 n+yEp0GN0n3tms0y4PINjuiJUlygj6L2VcYvmF1iMFWLdtSMFQHDp1h8KxZAi/0QgHhQxt8l3HjiE
 pexXwlvt7zesnyeRH7c/hDj4fMvMApfIG8gsSHhlX9/5YUn3JEdHRvlOsgmLZeemFQTU=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyySW-009Yfw-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:46:20 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99D83AB3E;
 Mon, 11 Jan 2021 14:46:00 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 509B81E0807; Mon, 11 Jan 2021 15:46:00 +0100 (CET)
Date: Mon, 11 Jan 2021 15:46:00 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111144600.GC808@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-2-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyySW-009Yfw-Kc
Subject: Re: [f2fs-dev] [PATCH v2 01/12] fs: fix lazytime expiration
 handling in __writeback_single_inode()
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
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 08-01-21 23:58:52, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When lazytime is enabled and an inode is being written due to its
> in-memory updated timestamps having expired, either due to a sync() or
> syncfs() system call or due to dirtytime_expire_interval having elapsed,
> the VFS needs to inform the filesystem so that the filesystem can copy
> the inode's timestamps out to the on-disk data structures.
> 
> This is done by __writeback_single_inode() calling
> mark_inode_dirty_sync(), which then calls ->dirty_inode(I_DIRTY_SYNC).
> 
> However, this occurs after __writeback_single_inode() has already
> cleared the dirty flags from ->i_state.  This causes two bugs:
> 
> - mark_inode_dirty_sync() redirties the inode, causing it to remain
>   dirty.  This wastefully causes the inode to be written twice.  But
>   more importantly, it breaks cases where sync_filesystem() is expected
>   to clean dirty inodes.  This includes the FS_IOC_REMOVE_ENCRYPTION_KEY
>   ioctl (as reported at
>   https://lore.kernel.org/r/20200306004555.GB225345@gmail.com), as well
>   as possibly filesystem freezing (freeze_super()).
> 
> - Since ->i_state doesn't contain I_DIRTY_TIME when ->dirty_inode() is
>   called from __writeback_single_inode() for lazytime expiration,
>   xfs_fs_dirty_inode() ignores the notification.  (XFS only cares about
>   lazytime expirations, and it assumes that I_DIRTY_TIME will contain
>   i_state during those.)  Therefore, lazy timestamps aren't persisted by
>   sync(), syncfs(), or dirtytime_expire_interval on XFS.
> 
> Fix this by moving the call to mark_inode_dirty_sync() to earlier in
> __writeback_single_inode(), before the dirty flags are cleared from
> i_state.  This makes filesystems be properly notified of the timestamp
> expiration, and it avoids incorrectly redirtying the inode.
> 
> This fixes xfstest generic/580 (which tests
> FS_IOC_REMOVE_ENCRYPTION_KEY) when run on ext4 or f2fs with lazytime
> enabled.  It also fixes the new lazytime xfstest I've proposed, which
> reproduces the above-mentioned XFS bug
> (https://lore.kernel.org/r/20210105005818.92978-1-ebiggers@kernel.org).
> 
> Alternatively, we could call ->dirty_inode(I_DIRTY_SYNC) directly.  But
> due to the introduction of I_SYNC_QUEUED, mark_inode_dirty_sync() is the
> right thing to do because mark_inode_dirty_sync() now knows not to move
> the inode to a writeback list if it is currently queued for sync.
> 
> Fixes: 0ae45f63d4ef ("vfs: add support for a lazytime mount option")
> Cc: stable@vger.kernel.org
> Depends-on: 5afced3bf281 ("writeback: Avoid skipping inode writeback")
> Suggested-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Thanks for writing this fix! It looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fs-writeback.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index acfb55834af23..c41cb887eb7d3 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1474,21 +1474,25 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  	}
>  
>  	/*
> -	 * Some filesystems may redirty the inode during the writeback
> -	 * due to delalloc, clear dirty metadata flags right before
> -	 * write_inode()
> +	 * If the inode has dirty timestamps and we need to write them, call
> +	 * mark_inode_dirty_sync() to notify the filesystem about it and to
> +	 * change I_DIRTY_TIME into I_DIRTY_SYNC.
>  	 */
> -	spin_lock(&inode->i_lock);
> -
> -	dirty = inode->i_state & I_DIRTY;
>  	if ((inode->i_state & I_DIRTY_TIME) &&
> -	    ((dirty & I_DIRTY_INODE) ||
> -	     wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
> +	    (wbc->sync_mode == WB_SYNC_ALL || wbc->for_sync ||
>  	     time_after(jiffies, inode->dirtied_time_when +
>  			dirtytime_expire_interval * HZ))) {
> -		dirty |= I_DIRTY_TIME;
>  		trace_writeback_lazytime(inode);
> +		mark_inode_dirty_sync(inode);
>  	}
> +
> +	/*
> +	 * Some filesystems may redirty the inode during the writeback
> +	 * due to delalloc, clear dirty metadata flags right before
> +	 * write_inode()
> +	 */
> +	spin_lock(&inode->i_lock);
> +	dirty = inode->i_state & I_DIRTY;
>  	inode->i_state &= ~dirty;
>  
>  	/*
> @@ -1509,8 +1513,6 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  
>  	spin_unlock(&inode->i_lock);
>  
> -	if (dirty & I_DIRTY_TIME)
> -		mark_inode_dirty_sync(inode);
>  	/* Don't write the inode if only I_DIRTY_PAGES was set */
>  	if (dirty & ~I_DIRTY_PAGES) {
>  		int err = write_inode(inode, wbc);
> -- 
> 2.30.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
