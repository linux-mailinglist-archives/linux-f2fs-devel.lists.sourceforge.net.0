Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CF390BBA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 23:41:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lleo4-0001wP-Mo; Tue, 25 May 2021 21:41:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <djwong@kernel.org>) id 1lleo3-0001wI-G8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 21:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n8mmJErlK1/R0AjpnjEWfYoV3Zlq3ariIqAZo6Hblb4=; b=Ane27OUIw0pklMfKITJlUy+2/V
 vrB4BhVwmsmbfemUScD2RKp7qE+JmbndeOtcCsH7/dD/4jec4Mi7IGooHMtbnZGogpw35qguW0HIV
 AL2ORerGTQzO9t5be8jE+yGluSxcDJKNA1CmHrEfPK7I9Eumid9Hpzd0F8QQI3A9E6kY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n8mmJErlK1/R0AjpnjEWfYoV3Zlq3ariIqAZo6Hblb4=; b=d/jSo9zqP2+zC2sHggKE/ir8dO
 pKuRWrjMbdmOq7jDDwpTp5FYHds7y7+3EPo5l1Dwv217sGi1MpFFaX3+uAJAyx4wVelK7W04z4uGS
 WlTb1AlrRgX0qmSG+7r41mDVQSNNjDaSR8mUwEqOLG+mUiI4tThq/fj1oNrZQhSgmxd0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1llenv-0005fq-Ht
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 21:41:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E649613D5;
 Tue, 25 May 2021 21:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621978891;
 bh=Ff90q5Kz0o+BMBRcQ7Rxn+PAVevoQMBbngm/RLK1s+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7WwcUxQKZjNrqh4HMAxGnxr7VCwquen6SJALt7e7iV5i4bX++9K8LxIOp1kIRs5O
 9fLtSBpQdakVBftuhgpL4oFWpbo2sKjHVDMeZOcc+U/LPb3YEm1cZdPkvOb0fKwTph
 M7CkrFhzVExeTD7ns32hjrV6zpJlDrxFTt9gbb60Izc+41it5zfmeLQz6mn6Gmtyky
 Z7dqmDRkehTVa27itdEh+TeMb8S9UMmgOs0+FuntutheBG+gJkAyxxmHiwhTkWY0Cc
 EBpA5J63DL/mPwj7geODr3bz9PnyoVwd/6rImPFri9U0i1awZLAnS97c2mKicyRopd
 oJevdxgpT8cog==
Date: Tue, 25 May 2021 14:41:30 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210525214130.GP202121@locust>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-8-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525135100.11221-8-jack@suse.cz>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1llenv-0005fq-Ht
Subject: Re: [f2fs-dev] [PATCH 08/13] xfs: Convert double locking of
 MMAPLOCK to use VFS helpers
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 25, 2021 at 03:50:45PM +0200, Jan Kara wrote:
> Convert places in XFS that take MMAPLOCK for two inodes to use helper
> VFS provides for it (filemap_invalidate_down_write_two()). Note that
> this changes lock ordering for MMAPLOCK from inode number based ordering
> to pointer based ordering VFS generally uses.
> 
> Signed-off-by: Jan Kara <jack@suse.cz>

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_bmap_util.c | 15 ++++++++-------
>  fs/xfs/xfs_inode.c     | 37 +++++++++++--------------------------
>  2 files changed, 19 insertions(+), 33 deletions(-)
> 
> diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
> index a5e9d7d34023..8a5cede59f3f 100644
> --- a/fs/xfs/xfs_bmap_util.c
> +++ b/fs/xfs/xfs_bmap_util.c
> @@ -1582,7 +1582,6 @@ xfs_swap_extents(
>  	struct xfs_bstat	*sbp = &sxp->sx_stat;
>  	int			src_log_flags, target_log_flags;
>  	int			error = 0;
> -	int			lock_flags;
>  	uint64_t		f;
>  	int			resblks = 0;
>  	unsigned int		flags = 0;
> @@ -1594,8 +1593,8 @@ xfs_swap_extents(
>  	 * do the rest of the checks.
>  	 */
>  	lock_two_nondirectories(VFS_I(ip), VFS_I(tip));
> -	lock_flags = XFS_MMAPLOCK_EXCL;
> -	xfs_lock_two_inodes(ip, XFS_MMAPLOCK_EXCL, tip, XFS_MMAPLOCK_EXCL);
> +	filemap_invalidate_down_write_two(VFS_I(ip)->i_mapping,
> +					  VFS_I(tip)->i_mapping);
>  
>  	/* Verify that both files have the same format */
>  	if ((VFS_I(ip)->i_mode & S_IFMT) != (VFS_I(tip)->i_mode & S_IFMT)) {
> @@ -1667,7 +1666,6 @@ xfs_swap_extents(
>  	 * or cancel will unlock the inodes from this point onwards.
>  	 */
>  	xfs_lock_two_inodes(ip, XFS_ILOCK_EXCL, tip, XFS_ILOCK_EXCL);
> -	lock_flags |= XFS_ILOCK_EXCL;
>  	xfs_trans_ijoin(tp, ip, 0);
>  	xfs_trans_ijoin(tp, tip, 0);
>  
> @@ -1786,13 +1784,16 @@ xfs_swap_extents(
>  	trace_xfs_swap_extent_after(ip, 0);
>  	trace_xfs_swap_extent_after(tip, 1);
>  
> +out_unlock_ilock:
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +	xfs_iunlock(tip, XFS_ILOCK_EXCL);
>  out_unlock:
> -	xfs_iunlock(ip, lock_flags);
> -	xfs_iunlock(tip, lock_flags);
> +	filemap_invalidate_up_write_two(VFS_I(ip)->i_mapping,
> +					VFS_I(tip)->i_mapping);
>  	unlock_two_nondirectories(VFS_I(ip), VFS_I(tip));
>  	return error;
>  
>  out_trans_cancel:
>  	xfs_trans_cancel(tp);
> -	goto out_unlock;
> +	goto out_unlock_ilock;
>  }
> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 53bb5fc33621..11616c9b37f8 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -537,12 +537,10 @@ xfs_lock_inodes(
>  }
>  
>  /*
> - * xfs_lock_two_inodes() can only be used to lock one type of lock at a time -
> - * the mmaplock or the ilock, but not more than one type at a time. If we lock
> - * more than one at a time, lockdep will report false positives saying we have
> - * violated locking orders.  The iolock must be double-locked separately since
> - * we use i_rwsem for that.  We now support taking one lock EXCL and the other
> - * SHARED.
> + * xfs_lock_two_inodes() can only be used to lock ilock. The iolock and
> + * mmaplock must be double-locked separately since we use i_rwsem and
> + * invalidate_lock for that. We now support taking one lock EXCL and the
> + * other SHARED.
>   */
>  void
>  xfs_lock_two_inodes(
> @@ -560,15 +558,8 @@ xfs_lock_two_inodes(
>  	ASSERT(hweight32(ip1_mode) == 1);
>  	ASSERT(!(ip0_mode & (XFS_IOLOCK_SHARED|XFS_IOLOCK_EXCL)));
>  	ASSERT(!(ip1_mode & (XFS_IOLOCK_SHARED|XFS_IOLOCK_EXCL)));
> -	ASSERT(!(ip0_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
> -	       !(ip0_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
> -	ASSERT(!(ip1_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
> -	       !(ip1_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
> -	ASSERT(!(ip1_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
> -	       !(ip0_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
> -	ASSERT(!(ip0_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)) ||
> -	       !(ip1_mode & (XFS_ILOCK_SHARED|XFS_ILOCK_EXCL)));
> -
> +	ASSERT(!(ip0_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)));
> +	ASSERT(!(ip1_mode & (XFS_MMAPLOCK_SHARED|XFS_MMAPLOCK_EXCL)));
>  	ASSERT(ip0->i_ino != ip1->i_ino);
>  
>  	if (ip0->i_ino > ip1->i_ino) {
> @@ -3731,11 +3722,8 @@ xfs_ilock2_io_mmap(
>  	ret = xfs_iolock_two_inodes_and_break_layout(VFS_I(ip1), VFS_I(ip2));
>  	if (ret)
>  		return ret;
> -	if (ip1 == ip2)
> -		xfs_ilock(ip1, XFS_MMAPLOCK_EXCL);
> -	else
> -		xfs_lock_two_inodes(ip1, XFS_MMAPLOCK_EXCL,
> -				    ip2, XFS_MMAPLOCK_EXCL);
> +	filemap_invalidate_down_write_two(VFS_I(ip1)->i_mapping,
> +					  VFS_I(ip2)->i_mapping);
>  	return 0;
>  }
>  
> @@ -3745,12 +3733,9 @@ xfs_iunlock2_io_mmap(
>  	struct xfs_inode	*ip1,
>  	struct xfs_inode	*ip2)
>  {
> -	bool			same_inode = (ip1 == ip2);
> -
> -	xfs_iunlock(ip2, XFS_MMAPLOCK_EXCL);
> -	if (!same_inode)
> -		xfs_iunlock(ip1, XFS_MMAPLOCK_EXCL);
> +	filemap_invalidate_up_write_two(VFS_I(ip1)->i_mapping,
> +					VFS_I(ip2)->i_mapping);
>  	inode_unlock(VFS_I(ip2));
> -	if (!same_inode)
> +	if (ip1 != ip2)
>  		inode_unlock(VFS_I(ip1));
>  }
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
