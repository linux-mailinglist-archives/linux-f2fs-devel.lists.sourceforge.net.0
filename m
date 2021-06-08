Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E243A06B2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jun 2021 00:18:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqk3U-0007wM-6s; Tue, 08 Jun 2021 22:18:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1lqk3S-0007w8-Rd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 22:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+VIRpBztYnAXts1rrmomfPLpQ0zvs6yHM3q1X+TRblk=; b=M0YbxXNruMOWVPMa3idZXn1Ywx
 Fg15kD05PjK2Ks070fK36z97ufK9nOSKlCQ0hrZDZizTziKCb1TdnAZ9YRKvY7FytetsYl3ccZs8/
 maTuYy9S+HtVdIBCgjpVkUMJ52xjO0n9fa0cEVv75EYtMsFoECldpLuJnNOTBOLIAgQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+VIRpBztYnAXts1rrmomfPLpQ0zvs6yHM3q1X+TRblk=; b=ET+OdA5XoomLI9PfagLlzKvVY8
 YKyZn0msNbO9QtfmE/I7+/b6f8cLvSKfTVoZVHLep/FOwI2a32KEd6+FakxhEV/F923YJcM7ScwUm
 SiO/47aRqTZGPf1dwTcWZGwT6NJdMDQp3KReQOmUmGnqA5iLftGWDjOIlSZ5PZ9GR34k=;
Received: from mail110.syd.optusnet.com.au ([211.29.132.97])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1lqk3J-0000FD-Tw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 22:18:38 +0000
Received: from dread.disaster.area (pa49-179-138-183.pa.nsw.optusnet.com.au
 [49.179.138.183])
 by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id 31D2F10625F;
 Wed,  9 Jun 2021 08:18:16 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1lqk35-00AXg4-VK; Wed, 09 Jun 2021 08:18:15 +1000
Date: Wed, 9 Jun 2021 08:18:15 +1000
From: Dave Chinner <david@fromorbit.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210608221815.GM664593@dread.disaster.area>
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-7-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607145236.31852-7-jack@suse.cz>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0
 a=MnllW2CieawZLw/OcHE/Ng==:117 a=MnllW2CieawZLw/OcHE/Ng==:17
 a=kj9zAlcOel0A:10 a=r6YtysWOX24A:10 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8
 a=7-415B0cAAAA:8 a=wL01ZgEgnFvSBV24lgMA:9 a=CjuIK1q_8ugA:10
 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1lqk3J-0000FD-Tw
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
Cc: linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
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

On Mon, Jun 07, 2021 at 04:52:17PM +0200, Jan Kara wrote:
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
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/xfs/xfs_inode.c | 39 +++++++++++++++++++++++++++++++--------
>  fs/xfs/xfs_inode.h | 21 ++++++++++++++-------
>  2 files changed, 45 insertions(+), 15 deletions(-)

As a standalone patch, this is overly elaborate and way more complex
than it needs to be. It's not really just a refactor, either,
because of the unnecessary shifting games it adds.

> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 0369eb22c1bb..6247977870bd 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -342,9 +342,34 @@ xfs_ilock_demote(
>  }
>  
>  #if defined(DEBUG) || defined(XFS_WARN)
> -int
> +static inline bool
> +__xfs_rwsem_islocked(
> +	struct rw_semaphore	*rwsem,
> +	int			lock_flags,
> +	int			shift)
> +{
> +	lock_flags >>= shift;
> +
> +	if (!debug_locks)
> +		return rwsem_is_locked(rwsem);
> +	/*
> +	 * If the shared flag is not set, pass 0 to explicitly check for
> +	 * exclusive access to the lock. If the shared flag is set, we typically
> +	 * want to make sure the lock is at least held in shared mode
> +	 * (i.e., shared | excl) but we don't necessarily care that it might
> +	 * actually be held exclusive. Therefore, pass -1 to check whether the
> +	 * lock is held in any mode rather than one of the explicit shared mode
> +	 * values (1 or 2)."
> +	 */
> +	if (lock_flags & (1 << XFS_SHARED_LOCK_SHIFT)) {
> +		return lockdep_is_held_type(rwsem, -1);
> +	}
> +	return lockdep_is_held_type(rwsem, 0);
> +}

Pass in a boolean value for shared/exclusive and
you can get rid of passing in the lock flags as well.

static bool
__xfs_rwsem_islocked(
	struct rw_semaphore	*rwsem,
	bool			shared)
{
	if (!debug_locks)
		return rwsem_is_locked(rwsem);

	if (!shared)
		return lockdep_is_held_type(rwsem, 0);

	/*
	 * We are checking that the lock is held at least in shared
	 * mode but don't care that it might be held exclusively
	 * (i.e. shared | excl). Hence we check if the lock is held
	 * in any mode rather than an explicit shared mode.
	 */
	return lockdep_is_held_type(rwsem, -1);
}

> +
> +bool
>  xfs_isilocked(
> -	xfs_inode_t		*ip,
> +	struct xfs_inode	*ip,
>  	uint			lock_flags)
>  {
>  	if (lock_flags & (XFS_ILOCK_EXCL|XFS_ILOCK_SHARED)) {
> @@ -359,15 +384,13 @@ xfs_isilocked(
>  		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
>  	}
>  
> -	if (lock_flags & (XFS_IOLOCK_EXCL|XFS_IOLOCK_SHARED)) {
> -		if (!(lock_flags & XFS_IOLOCK_SHARED))
> -			return !debug_locks ||
> -				lockdep_is_held_type(&VFS_I(ip)->i_rwsem, 0);
> -		return rwsem_is_locked(&VFS_I(ip)->i_rwsem);
> +	if (lock_flags & (XFS_IOLOCK_EXCL | XFS_IOLOCK_SHARED)) {
> +		return __xfs_rwsem_islocked(&VFS_I(ip)->i_rwsem, lock_flags,
> +				XFS_IOLOCK_FLAG_SHIFT);

Then this is simply:

		return __xfs_rwsem_islocked(&VFS_I(ip)->i_rwsem,
				(lock_flags & XFS_IOLOCK_SHARED));

And the conversion for the MMAPLOCK in the next patch is equally
simple.


> diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
> index ca826cfba91c..1c0e15c480bc 100644
> --- a/fs/xfs/xfs_inode.h
> +++ b/fs/xfs/xfs_inode.h
> @@ -262,12 +262,19 @@ static inline bool xfs_inode_has_bigtime(struct xfs_inode *ip)
>   * Bit ranges:	1<<1  - 1<<16-1 -- iolock/ilock modes (bitfield)
>   *		1<<16 - 1<<32-1 -- lockdep annotation (integers)
>   */
> -#define	XFS_IOLOCK_EXCL		(1<<0)
> -#define	XFS_IOLOCK_SHARED	(1<<1)
> -#define	XFS_ILOCK_EXCL		(1<<2)
> -#define	XFS_ILOCK_SHARED	(1<<3)
> -#define	XFS_MMAPLOCK_EXCL	(1<<4)
> -#define	XFS_MMAPLOCK_SHARED	(1<<5)
> +
> +#define XFS_IOLOCK_FLAG_SHIFT	0
> +#define XFS_ILOCK_FLAG_SHIFT	2
> +#define XFS_MMAPLOCK_FLAG_SHIFT	4
> +
> +#define XFS_SHARED_LOCK_SHIFT	1
> +
> +#define XFS_IOLOCK_EXCL		(1 << XFS_IOLOCK_FLAG_SHIFT)
> +#define XFS_IOLOCK_SHARED	(XFS_IOLOCK_EXCL << XFS_SHARED_LOCK_SHIFT)
> +#define XFS_ILOCK_EXCL		(1 << XFS_ILOCK_FLAG_SHIFT)
> +#define XFS_ILOCK_SHARED	(XFS_ILOCK_EXCL << XFS_SHARED_LOCK_SHIFT)
> +#define XFS_MMAPLOCK_EXCL	(1 << XFS_MMAPLOCK_FLAG_SHIFT)
> +#define XFS_MMAPLOCK_SHARED	(XFS_MMAPLOCK_EXCL << XFS_SHARED_LOCK_SHIFT)
>  
>  #define XFS_LOCK_MASK		(XFS_IOLOCK_EXCL | XFS_IOLOCK_SHARED \
>  				| XFS_ILOCK_EXCL | XFS_ILOCK_SHARED \

And all this shifting goes away and the change is much, much
simpler. If/when other changes are made to this code that require
shifting like this, then we can make these modifications. But in
this patch for this usage they don't really make much sense at all..

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
