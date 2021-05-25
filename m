Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C70390BB2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 23:41:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llenM-0007oX-OP; Tue, 25 May 2021 21:41:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1llenL-0007oJ-5N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 21:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bbjCz45W5uvuNQEtbLzlCktXAhycsJoQ4pu29jG3UdA=; b=fgN7MeAUS7CsGynFG+RFpoFjXE
 oZ2dlu7yl6LeJo18/QYmz/KU2KfQKXCtWiDsRr+2Wr6UpNS2lr34atjUP3067/MAylqyolhFO/VwL
 IPtJT6i9p17+x4EpvuYU+pomCpHVsGfhlpUDb9Zqq1XOPjRb5SQwatYyQ+bg6kze/qe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bbjCz45W5uvuNQEtbLzlCktXAhycsJoQ4pu29jG3UdA=; b=L6RmMMGeW4xWTXFiT8HUTKyA/h
 z+0974ITI+cWUz6GdGj5c8naolOaaXhhO8KFxX/zdM7bAbZU+IqPSBptoS8VrkxzLG8PB6QUct0Wu
 1jSxO9DGVhi0bovAjXrzHn+KKfXPDLClD7iu9VkTcW70Lx8hjGhNMhP8T8RmUhbPopZI=;
Received: from mail109.syd.optusnet.com.au ([211.29.132.80])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1llenH-005pXr-8A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 21:40:59 +0000
Received: from dread.disaster.area (pa49-180-230-185.pa.nsw.optusnet.com.au
 [49.180.230.185])
 by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id F04E9671F3;
 Wed, 26 May 2021 07:40:43 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1llen3-005CSi-MJ; Wed, 26 May 2021 07:40:41 +1000
Date: Wed, 26 May 2021 07:40:41 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210525214041.GJ664593@dread.disaster.area>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-7-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525135100.11221-7-jack@suse.cz>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Tu+Yewfh c=1 sm=1 tr=0
 a=dUIOjvib2kB+GiIc1vUx8g==:117 a=dUIOjvib2kB+GiIc1vUx8g==:17
 a=kj9zAlcOel0A:10 a=5FLXtPjwQuUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=7-415B0cAAAA:8 a=YRNIVghP3Sa-aXUPf-oA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1llenH-005pXr-8A
Subject: Re: [f2fs-dev] [PATCH 07/13] xfs: Convert to use invalidate_lock
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
 "Darrick J. Wong" <darrick.wong@oracle.com>, Steve French <sfrench@samba.org>,
 Jeff Layton <jlayton@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 25, 2021 at 03:50:44PM +0200, Jan Kara wrote:
> Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
> purpose of invalidate_lock is exactly the same. Note that the locking in
> __xfs_filemap_fault() slightly changes as filemap_fault() already takes
> invalidate_lock.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> CC: <linux-xfs@vger.kernel.org>
> CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/xfs/xfs_file.c  | 12 ++++++-----
>  fs/xfs/xfs_inode.c | 52 ++++++++++++++++++++++++++--------------------
>  fs/xfs/xfs_inode.h |  1 -
>  fs/xfs/xfs_super.c |  2 --
>  4 files changed, 36 insertions(+), 31 deletions(-)
> 
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index 396ef36dcd0a..dc9cb5c20549 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -1282,7 +1282,7 @@ xfs_file_llseek(
>   *
>   * mmap_lock (MM)
>   *   sb_start_pagefault(vfs, freeze)
> - *     i_mmaplock (XFS - truncate serialisation)
> + *     invalidate_lock (vfs/XFS_MMAPLOCK - truncate serialisation)
>   *       page_lock (MM)
>   *         i_lock (XFS - extent map serialisation)
>   */
> @@ -1303,24 +1303,26 @@ __xfs_filemap_fault(
>  		file_update_time(vmf->vma->vm_file);
>  	}
>  
> -	xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
>  	if (IS_DAX(inode)) {
>  		pfn_t pfn;
>  
> +		xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
>  		ret = dax_iomap_fault(vmf, pe_size, &pfn, NULL,
>  				(write_fault && !vmf->cow_page) ?
>  				 &xfs_direct_write_iomap_ops :
>  				 &xfs_read_iomap_ops);
>  		if (ret & VM_FAULT_NEEDDSYNC)
>  			ret = dax_finish_sync_fault(vmf, pe_size, pfn);
> +		xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
>  	} else {
> -		if (write_fault)
> +		if (write_fault) {
> +			xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
>  			ret = iomap_page_mkwrite(vmf,
>  					&xfs_buffered_write_iomap_ops);
> -		else
> +			xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
> +		} else
>  			ret = filemap_fault(vmf);
>  	}
> -	xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);

This seems kinda messy. filemap_fault() basically takes the
invalidate lock around the entire operation, it runs, so maybe it
would be cleaner to implement it as:

filemap_fault_locked(vmf)
{
	/* does the filemap fault work */
}

filemap_fault(vmf)
{
	filemap_invalidate_down_read(...)
	ret = filemap_fault_locked(vmf)
	filemap_invalidate_up_read(...)
	return ret;
}

And that means XFS could just call filemap_fault_locked() and not 
have to do all this messy locking just to avoid holding the lock
that filemap_fault has now internalised.

> @@ -355,8 +358,11 @@ xfs_isilocked(
>  
>  	if (lock_flags & (XFS_MMAPLOCK_EXCL|XFS_MMAPLOCK_SHARED)) {
>  		if (!(lock_flags & XFS_MMAPLOCK_SHARED))
> -			return !!ip->i_mmaplock.mr_writer;
> -		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
> +			return !debug_locks ||
> +				lockdep_is_held_type(
> +					&VFS_I(ip)->i_mapping->invalidate_lock,
> +					0);
> +		return rwsem_is_locked(&VFS_I(ip)->i_mapping->invalidate_lock);
>  	}

<sigh>

And so here we are again, losing more of our read vs write debug
checks on debug kernels when lockdep is not enabled....

Can we please add rwsem_is_locked_read() and rwsem_is_locked_write()
wrappers that just look at the rwsem counter value to determine how
the lock is held? Then the mrlock_t can go away entirely....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
