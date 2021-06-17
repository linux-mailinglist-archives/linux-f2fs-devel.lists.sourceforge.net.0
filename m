Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C30253AB960
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 18:17:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltuhQ-0007S4-4Q; Thu, 17 Jun 2021 16:17:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <djwong@kernel.org>) id 1ltuhO-0007Rx-Rh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 16:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6/hoxiRcCMIy+/ZTEO1z5GGswAtDrIjZBHdAvnUF1Sc=; b=GTmTdOeMyr/xhQaHO/tWwO8eol
 5T1VRrL9lV25sLvQuluXwIeWwD7fOSl2UAF6g0QFP966U5btJTtRs/XHIYCENXyfamxbjSqKjkWQH
 1GoH58VobAzo8mGHDeD/5kgkMGEbPXDQJ8B+tK2qBKyg75bICMSopAcEE8EQA0+Ic48k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6/hoxiRcCMIy+/ZTEO1z5GGswAtDrIjZBHdAvnUF1Sc=; b=d+k442hfig9f5D6bCyhlDZIEwl
 /jSI6oQNfFvN5bLFhRD8qSMUprS8zXzKUkkw3/IwZ0qYiZnnv9QSWE1L61FAHAUGHQIbQI/FNI4xg
 urSKnIF0G7rF+sBmO3RZUMS2eADrBsoY0bnt26Yvw81v50PNSVPiBEkG9AMXqdBFTpCA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltuhO-00DxhI-9h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 16:17:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A60761003;
 Thu, 17 Jun 2021 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623946610;
 bh=T4lfd5wWirPw8T9WGSgtzyj6zWPbiu0ej+98GK+qMfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d14K5ONqGwFTZC0h6Gutyhw6/NHGiWbCZnX1Vvi0P3Enobb5ffk6+rfuYIrbGA9XP
 f5HNfhWRWF3bLVIv4VrIt8qVvjbTkPKKq/65ZbsFhbwRTJSYWbqAuxMs+0urbKDZCQ
 H32GuuYU8ENi1iMhoa4yTKRWPX15ngUes52vo6rgSQvS3/BTGHYUMWFtkQAb6198rx
 j7Npvb/c2ysaIQBe0MovR3bfmlqLqy1PrfmZZgin6gfY7wK+WFvfUkF4D6Kl7s0Nv5
 u5aMpcrC5S0ncy9G9HXuZTypVo4C7KRLpbzyo47jC8HRA090z1McTPNYYolsJjxyqF
 f+pc12AyTkRBQ==
Date: Thu, 17 Jun 2021 09:16:49 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210617161649.GO158209@locust>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615091814.28626-7-jack@suse.cz>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ltuhO-00DxhI-9h
Subject: Re: [f2fs-dev] [PATCH 07/14] xfs: Refactor xfs_isilocked()
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, Eric Sandeen <sandeen@redhat.com>,
 Dave Chinner <dchinner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Pavel Reichl <preichl@redhat.com>,
 Johannes Thumshirn <jth@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> From: Pavel Reichl <preichl@redhat.com>
> 
> Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> __xfs_rwsem_islocked() is a helper function which encapsulates checking
> state of rw_semaphores hold by inode.
> 
> Signed-off-by: Pavel Reichl <preichl@redhat.com>
> Suggested-by: Dave Chinner <dchinner@redhat.com>
> Suggested-by: Eric Sandeen <sandeen@redhat.com>
> Suggested-by: Darrick J. Wong <darrick.wong@oracle.com>
> Signed-off-by: Jan Kara <jack@suse.cz>

With the commit message updated,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_inode.c | 34 ++++++++++++++++++++++++++--------
>  fs/xfs/xfs_inode.h |  2 +-
>  2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index e4c2da4566f1..ffd47217a8fa 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -342,9 +342,29 @@ xfs_ilock_demote(
>  }
>  
>  #if defined(DEBUG) || defined(XFS_WARN)
> -int
> +static inline bool
> +__xfs_rwsem_islocked(
> +	struct rw_semaphore	*rwsem,
> +	bool			shared)
> +{
> +	if (!debug_locks)
> +		return rwsem_is_locked(rwsem);
> +
> +	if (!shared)
> +		return lockdep_is_held_type(rwsem, 0);
> +
> +	/*
> +	 * We are checking that the lock is held at least in shared
> +	 * mode but don't care that it might be held exclusively
> +	 * (i.e. shared | excl). Hence we check if the lock is held
> +	 * in any mode rather than an explicit shared mode.
> +	 */
> +	return lockdep_is_held_type(rwsem, -1);
> +}
> +
> +bool
>  xfs_isilocked(
> -	xfs_inode_t		*ip,
> +	struct xfs_inode	*ip,
>  	uint			lock_flags)
>  {
>  	if (lock_flags & (XFS_ILOCK_EXCL|XFS_ILOCK_SHARED)) {
> @@ -359,15 +379,13 @@ xfs_isilocked(
>  		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
>  	}
>  
> -	if (lock_flags & (XFS_IOLOCK_EXCL|XFS_IOLOCK_SHARED)) {
> -		if (!(lock_flags & XFS_IOLOCK_SHARED))
> -			return !debug_locks ||
> -				lockdep_is_held_type(&VFS_I(ip)->i_rwsem, 0);
> -		return rwsem_is_locked(&VFS_I(ip)->i_rwsem);
> +	if (lock_flags & (XFS_IOLOCK_EXCL | XFS_IOLOCK_SHARED)) {
> +		return __xfs_rwsem_islocked(&VFS_I(ip)->i_rwsem,
> +				(lock_flags & XFS_IOLOCK_SHARED));
>  	}
>  
>  	ASSERT(0);
> -	return 0;
> +	return false;
>  }
>  #endif
>  
> diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
> index ca826cfba91c..4659e1568966 100644
> --- a/fs/xfs/xfs_inode.h
> +++ b/fs/xfs/xfs_inode.h
> @@ -410,7 +410,7 @@ void		xfs_ilock(xfs_inode_t *, uint);
>  int		xfs_ilock_nowait(xfs_inode_t *, uint);
>  void		xfs_iunlock(xfs_inode_t *, uint);
>  void		xfs_ilock_demote(xfs_inode_t *, uint);
> -int		xfs_isilocked(xfs_inode_t *, uint);
> +bool		xfs_isilocked(struct xfs_inode *, uint);
>  uint		xfs_ilock_data_map_shared(struct xfs_inode *);
>  uint		xfs_ilock_attr_map_shared(struct xfs_inode *);
>  
> -- 
> 2.26.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
