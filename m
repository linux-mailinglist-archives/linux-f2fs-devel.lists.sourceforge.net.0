Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F0905DF1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 23:47:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHVok-0005gA-Ro;
	Wed, 12 Jun 2024 21:47:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1sHVoi-0005g1-CW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 21:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8XWTB9Q5UMgehRUn0ltvFsNs3q24ratroJApNOks8P0=; b=BATGOGG5FnznRLs5Sl7LYWlU5p
 FBKrQXIGhclqqFLIeZyAWVGbxjHoyJrIhAdftuVLJSH5n8sxtTSwGE/SjcKk9I3n4PPN1D3j4gkJu
 FN5CSt9cFl1e8tbcN2YhKtJCGhyOc6r2HjqNCLTwrAsK8IABgJ+s88Hrvc+Z1YV0R1vc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8XWTB9Q5UMgehRUn0ltvFsNs3q24ratroJApNOks8P0=; b=XWquzvcWWfG1hoXLXLpMDfdRZW
 9uHBjugI9/nanacDsRmxUuLpsiHGJTd9gFkPKtiydyStcGM9BdnB7p5uIfQ/Q/zEUD/JtjmofHFIS
 rYoCn0La2Rlurdl5PY3fEN2c0wjWm0VwkWIFxp2M1R9F+9qgYywUoaYFL9foG1PohBqk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHVoj-0003qI-G8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 21:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 273C560C22;
 Wed, 12 Jun 2024 21:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA68EC116B1;
 Wed, 12 Jun 2024 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718228849;
 bh=+/VTydx8DuKC+hBaP5Tnh04ofGemNXKWLfDD9tjXUwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QffqexAzs3KBLfngWw5SiR/LiYM9HWTJ+9du9kZ9zv+i8sSzY98yBnmXrjNyOZabB
 U/ck13+Vg9ga/wkTZMgvz071bhJcm6aAO+VOId0A4vJ1tpoYrK0Pxr9sZIFO1z+/55
 jNf0LSzjZcN81fAo7//dsmA5wDLGof5rgYgtaMIPuvCUrl6fQwiMApmoVoFmgUnKAM
 IB6Gc/ysLm/Z5qm7rDoqVGb73GLOZIqfGt2hdqleDljCHOeHg0mjybbOeSgAKoiO6a
 mZFQ2+6LCc8Rc70AZeesAubTqd5BfCNqrO3eX17/kjNmxlfQO8rv/YjLcY5VA31NSD
 6fOIRtOCqzeEg==
Date: Wed, 12 Jun 2024 14:47:29 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: John Garry <john.g.garry@oracle.com>
Message-ID: <20240612214729.GL2764752@frogsfrogsfrogs>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
 <20240607143919.2622319-4-john.g.garry@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607143919.2622319-4-john.g.garry@oracle.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 07, 2024 at 02:39:00PM +0000, John Garry wrote:
 > Currently iomap->io_block_size is set to the i_blocksize() value for the
 > inode. > > Expand the sub-fs block size zeroing to now cover RT [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHVoj-0003qI-G8
Subject: Re: [f2fs-dev] [PATCH v4 03/22] xfs: Use extent size granularity
 for iomap->io_block_size
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
Cc: ritesh.list@gmail.com, gfs2@lists.linux.dev,
 mikulas@artax.karlin.mff.cuni.cz, hch@lst.de, agruenba@redhat.com,
 miklos@szeredi.hu, linux-ext4@vger.kernel.org, catherine.hoang@oracle.com,
 linux-block@vger.kernel.org, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 axboe@kernel.dk, brauner@kernel.org, tytso@mit.edu, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, mcgrof@kernel.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, chandan.babu@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 07, 2024 at 02:39:00PM +0000, John Garry wrote:
> Currently iomap->io_block_size is set to the i_blocksize() value for the
> inode.
> 
> Expand the sub-fs block size zeroing to now cover RT extents, by calling
> setting iomap->io_block_size as xfs_inode_alloc_unitsize().
> 
> In xfs_iomap_write_unwritten(), update the unwritten range fsb to cover
> this extent granularity.
> 
> In xfs_file_dio_write(), handle a write which is not aligned to extent
> size granularity as unaligned. Since the extent size granularity need not
> be a power-of-2, handle this also.
> 
> Signed-off-by: John Garry <john.g.garry@oracle.com>
> ---
>  fs/xfs/xfs_file.c  | 24 +++++++++++++++++++-----
>  fs/xfs/xfs_inode.c | 17 +++++++++++------
>  fs/xfs/xfs_inode.h |  1 +
>  fs/xfs/xfs_iomap.c |  8 +++++++-
>  4 files changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> index b240ea5241dc..24fe3c2e03da 100644
> --- a/fs/xfs/xfs_file.c
> +++ b/fs/xfs/xfs_file.c
> @@ -601,7 +601,7 @@ xfs_file_dio_write_aligned(
>  }
>  
>  /*
> - * Handle block unaligned direct I/O writes
> + * Handle unaligned direct IO writes.
>   *
>   * In most cases direct I/O writes will be done holding IOLOCK_SHARED, allowing
>   * them to be done in parallel with reads and other direct I/O writes.  However,
> @@ -630,9 +630,9 @@ xfs_file_dio_write_unaligned(
>  	ssize_t			ret;
>  
>  	/*
> -	 * Extending writes need exclusivity because of the sub-block zeroing
> -	 * that the DIO code always does for partial tail blocks beyond EOF, so
> -	 * don't even bother trying the fast path in this case.
> +	 * Extending writes need exclusivity because of the sub-block/extent
> +	 * zeroing that the DIO code always does for partial tail blocks
> +	 * beyond EOF, so don't even bother trying the fast path in this case.

Hummm.  So let's say the fsblock size is 4k, the rt extent size is 16k,
and you want to write bytes 8192-12287 of a file.  Currently we'd use
xfs_file_dio_write_aligned for that, but now we'd use
xfs_file_dio_write_unaligned?  Even though we don't need zeroing or any
of that stuff?

>  	 */
>  	if (iocb->ki_pos > isize || iocb->ki_pos + count >= isize) {
>  		if (iocb->ki_flags & IOCB_NOWAIT)
> @@ -698,11 +698,25 @@ xfs_file_dio_write(
>  	struct xfs_inode	*ip = XFS_I(file_inode(iocb->ki_filp));
>  	struct xfs_buftarg      *target = xfs_inode_buftarg(ip);
>  	size_t			count = iov_iter_count(from);
> +	bool			unaligned;
> +	u64			unitsize;
>  
>  	/* direct I/O must be aligned to device logical sector size */
>  	if ((iocb->ki_pos | count) & target->bt_logical_sectormask)
>  		return -EINVAL;
> -	if ((iocb->ki_pos | count) & ip->i_mount->m_blockmask)
> +
> +	unitsize = xfs_inode_alloc_unitsize(ip);
> +	if (!is_power_of_2(unitsize)) {
> +		if (isaligned_64(iocb->ki_pos, unitsize) &&
> +		    isaligned_64(count, unitsize))
> +			unaligned = false;
> +		else
> +			unaligned = true;
> +	} else {
> +		unaligned = (iocb->ki_pos | count) & (unitsize - 1);
> +	}

Didn't I already write this?

> +	if (unaligned)

	if (!xfs_is_falloc_aligned(ip, iocb->ki_pos, count))

>  		return xfs_file_dio_write_unaligned(ip, iocb, from);
>  	return xfs_file_dio_write_aligned(ip, iocb, from);
>  }
> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 58fb7a5062e1..93ad442f399b 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -4264,15 +4264,20 @@ xfs_break_layouts(
>  	return error;
>  }
>  
> -/* Returns the size of fundamental allocation unit for a file, in bytes. */

Don't delete the comment, it has useful return type information.

/*
 * Returns the size of fundamental allocation unit for a file, in
 * fsblocks.
 */

>  unsigned int
> -xfs_inode_alloc_unitsize(
> +xfs_inode_alloc_unitsize_fsb(
>  	struct xfs_inode	*ip)
>  {
> -	unsigned int		blocks = 1;
> -
>  	if (XFS_IS_REALTIME_INODE(ip))
> -		blocks = ip->i_mount->m_sb.sb_rextsize;
> +		return ip->i_mount->m_sb.sb_rextsize;
> +
> +	return 1;
> +}
>  
> -	return XFS_FSB_TO_B(ip->i_mount, blocks);
> +/* Returns the size of fundamental allocation unit for a file, in bytes. */
> +unsigned int
> +xfs_inode_alloc_unitsize(
> +	struct xfs_inode	*ip)
> +{
> +	return XFS_FSB_TO_B(ip->i_mount, xfs_inode_alloc_unitsize_fsb(ip));
>  }
> diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
> index 292b90b5f2ac..90d2fa837117 100644
> --- a/fs/xfs/xfs_inode.h
> +++ b/fs/xfs/xfs_inode.h
> @@ -643,6 +643,7 @@ int xfs_inode_reload_unlinked(struct xfs_inode *ip);
>  bool xfs_ifork_zapped(const struct xfs_inode *ip, int whichfork);
>  void xfs_inode_count_blocks(struct xfs_trans *tp, struct xfs_inode *ip,
>  		xfs_filblks_t *dblocks, xfs_filblks_t *rblocks);
> +unsigned int xfs_inode_alloc_unitsize_fsb(struct xfs_inode *ip);
>  unsigned int xfs_inode_alloc_unitsize(struct xfs_inode *ip);
>  
>  struct xfs_dir_update_params {
> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index ecb4cae88248..fbe69f747e30 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c
> @@ -127,7 +127,7 @@ xfs_bmbt_to_iomap(
>  	}
>  	iomap->offset = XFS_FSB_TO_B(mp, imap->br_startoff);
>  	iomap->length = XFS_FSB_TO_B(mp, imap->br_blockcount);
> -	iomap->io_block_size = i_blocksize(VFS_I(ip));
> +	iomap->io_block_size = xfs_inode_alloc_unitsize(ip);

Oh, I see.  So io_block_size causes iomap to write zeroes to the storage
backing surrounding areas of the file range.  In this case, for direct
writes to the unwritten middle 4k of an otherwise written 16k extent,
we'll write zeroes to 0-4k and 8k-16k even though that wasn't what the
caller asked for?

IOWs, if you start with:

WWuW

write to the "U", then it'll write zeroes to the "W" areas?  That
doesn't sound good...

>  	if (mapping_flags & IOMAP_DAX)
>  		iomap->dax_dev = target->bt_daxdev;
>  	else
> @@ -577,11 +577,17 @@ xfs_iomap_write_unwritten(
>  	xfs_fsize_t	i_size;
>  	uint		resblks;
>  	int		error;
> +	unsigned int	rounding;
>  
>  	trace_xfs_unwritten_convert(ip, offset, count);
>  
>  	offset_fsb = XFS_B_TO_FSBT(mp, offset);
>  	count_fsb = XFS_B_TO_FSB(mp, (xfs_ufsize_t)offset + count);
> +	rounding = xfs_inode_alloc_unitsize_fsb(ip);
> +	if (rounding > 1) {
> +		offset_fsb = rounddown_64(offset_fsb, rounding);
> +		count_fsb = roundup_64(count_fsb, rounding);
> +	}

...and then the ioend handler is supposed to be smart enough to know
that iomap quietly wrote to other parts of the disk.

Um, does this cause unwritten extent conversion for entire rtextents
after writeback to a rtextsize > 1fsb file?

Or am I really misunderstanding what's going on here with the io paths?

--D

>  	count_fsb = (xfs_filblks_t)(count_fsb - offset_fsb);
>  
>  	/*
> -- 
> 2.31.1
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
