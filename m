Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O3gM3Rzr2lPZgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:27:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC1F243922
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2J+M0Irw4D7TqGi6R++vd8PUZra0J0IHvj8MFk4XLuE=; b=VoD5o3bMix7y5T3EAR9hkSiHN1
	9/DhgdIgEdQDT+2DlmtXzYHckOJT4IaVR6tAZAPN2HBN/bVDloAAP3t8cWbZJ4friWZBjd5+Jlcte
	6z9VW37hVnZF6W2TwoI+0BsUSou00PtfZRKSjFH5t1prCKzIOfgDtOiN2U9tmPM/puHI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzlsO-0001Kl-Gx;
	Tue, 10 Mar 2026 01:27:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzlsN-0001Kf-DQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEQmy51pQ5B+rdrGuXEZi1js+wolX3Rvh5rj62qumuw=; b=SdgH1VRAyOww6Lqmu429VrWF5o
 vHNe3L+AijZVTX1Im6gotwjDJvf46LdP5ZO/Z9gQjDVLHjwyIHgyw5XhG3WRuFvmtXTncJfVf4qLL
 5Zzg0AgoLETOP9piYHzCX6zBRVXRrDIlhyP5NC2h4Q59Z/cM6399KozrKH5YdGq8QsEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fEQmy51pQ5B+rdrGuXEZi1js+wolX3Rvh5rj62qumuw=; b=DLGRbTYQjzCQeA7ASawX5Jti6p
 7UPBlOpBuiEOD3/6AlKff+BlB/LZHyKi3EDCaZ8gGOLLCKQsJRVoKpZCVoxfkQOcoKuybwjzLTElS
 9lDP3aDWsC9/+dep5jYtg5+sf3yXAer2+nv1cs1F5bXTddwZwQioMRvFluLSj7bzTOJM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzlsM-00082O-Bq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 62F7060127;
 Tue, 10 Mar 2026 01:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11365C4CEF7;
 Tue, 10 Mar 2026 01:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773106019;
 bh=XYuL0s/3ghHcNyyFhXK6wAkVMIsq38Ttz7AhsTwTF0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LiuGG/OqsOKupsa5VxFvRrs1C8K2q36yVIiFdSv22lxT2ecs4MXpu6sqaHyuRly8x
 CGtkAs1wLF8JbqqeKsHO8qrn4ayTYx5rMS4Dr6U5sEUYJ/5aO0XH9pewMASJMNkUwg
 uANE5av7dPWKeEIvPHTVjILFrWKoS3c12E/PwyhO/qdq4fdBs6tJyGVDoUBtYA2CA9
 tjZEz6xz5O9ZCfdnxNG/f0wree1TrACOefy7X8y9Gxb6fnPK7WxPGoprKkPiTyiDWO
 dqvQq5Fv52XIlLVOBpYvq3mzHwOZ6Ri541+e8XK9o9NIDW87L3B7oz2NLHcHkcZfQp
 HSVO+NgeA3ZCQ==
Date: Mon, 9 Mar 2026 18:26:58 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310012658.GF1105363@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-19-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-19-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:33PM +0100, Andrey Albershteyn
 wrote: > Add integration with fs-verity. XFS stores fs-verity descriptor
 and > Merkle tree in the inode data fork at first block aligned to [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzlsM-00082O-Bq
Subject: Re: [f2fs-dev] [PATCH v4 18/25] xfs: add fs-verity support
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 2AC1F243922
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:23:33PM +0100, Andrey Albershteyn wrote:
> Add integration with fs-verity. XFS stores fs-verity descriptor and
> Merkle tree in the inode data fork at first block aligned to 64k past
> EOF.
> 
> The Merkle tree reading/writing is done through iomap interface. The
> data itself is read to the inode's page cache. When XFS reads from this
> region iomap doesn't call into fsverity to verify it against Merkle
> tree. For data, verification is done at ioend completion in a workqueue.
> 
> When fs-verity is enabled on an inode, the XFS_IVERITY_CONSTRUCTION
> flag is set meaning that the Merkle tree is being build. The
> initialization ends with storing of verity descriptor and setting
> inode on-disk flag (XFS_DIFLAG2_VERITY). Lastly, the
> XFS_IVERITY_CONSTRUCTION is dropped and I_VERITY is set on inode.
> 
> The descriptor is stored in a new block aligned to 64k after the last
> Merkle tree block. The size of the descriptor is stored at the end of
> the last descriptor block (descriptor can be multiple blocks).
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/xfs/xfs_bmap_util.c |   8 +
>  fs/xfs/xfs_fsverity.c  | 342 ++++++++++++++++++++++++++++++++++++++++-
>  fs/xfs/xfs_fsverity.h  |   2 +
>  fs/xfs/xfs_message.c   |   4 +
>  fs/xfs/xfs_message.h   |   1 +
>  fs/xfs/xfs_mount.h     |   2 +
>  fs/xfs/xfs_super.c     |   7 +
>  7 files changed, 365 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_bmap_util.c b/fs/xfs/xfs_bmap_util.c
> index 0ab00615f1ad..18348f4fd2aa 100644
> --- a/fs/xfs/xfs_bmap_util.c
> +++ b/fs/xfs/xfs_bmap_util.c
> @@ -31,6 +31,7 @@
>  #include "xfs_rtbitmap.h"
>  #include "xfs_rtgroup.h"
>  #include "xfs_zone_alloc.h"
> +#include <linux/fsverity.h>
>  
>  /* Kernel only BMAP related definitions and functions */
>  
> @@ -553,6 +554,13 @@ xfs_can_free_eofblocks(
>  	if (last_fsb <= end_fsb)
>  		return false;
>  
> +	/*
> +	 * Nothing to clean on fsverity inodes as they don't use prealloc and
> +	 * there no delalloc as only written data is fsverity metadata
> +	 */
> +	if (IS_VERITY(VFS_I(ip)))
> +		return false;
> +
>  	/*
>  	 * Check if there is an post-EOF extent to free.  If there are any
>  	 * delalloc blocks attached to the inode (data fork delalloc
> diff --git a/fs/xfs/xfs_fsverity.c b/fs/xfs/xfs_fsverity.c
> index dc66ffb7d132..e5cd17ec15b6 100644
> --- a/fs/xfs/xfs_fsverity.c
> +++ b/fs/xfs/xfs_fsverity.c
> @@ -4,14 +4,26 @@
>   */
>  #include "xfs_platform.h"
>  #include "xfs_format.h"
> -#include "xfs_inode.h"
>  #include "xfs_shared.h"
>  #include "xfs_trans_resv.h"
>  #include "xfs_mount.h"
>  #include "xfs_fsverity.h"
> +#include "xfs_da_format.h"
> +#include "xfs_da_btree.h"
> +#include "xfs_inode.h"
> +#include "xfs_log_format.h"
> +#include "xfs_bmap_util.h"
> +#include "xfs_log_format.h"
> +#include "xfs_trans.h"
> +#include "xfs_trace.h"
> +#include "xfs_quota.h"
>  #include "xfs_fsverity.h"
> +#include "xfs_iomap.h"
> +#include "xfs_error.h"
> +#include "xfs_health.h"
>  #include <linux/fsverity.h>
>  #include <linux/iomap.h>
> +#include <linux/pagemap.h>
>  
>  /*
>   * At maximum of 8 levels with 128 hashes per block (32 bytes SHA-256) maximum
> @@ -43,3 +55,331 @@ xfs_fsverity_is_file_data(
>  	return fsverity_active(inode) &&
>  	       offset < xfs_fsverity_metadata_offset(ip);
>  }
> +
> +/*
> + * Retrieve the verity descriptor.
> + */
> +static int
> +xfs_fsverity_get_descriptor(
> +	struct inode		*inode,
> +	void			*buf,
> +	size_t			buf_size)
> +{
> +	struct xfs_inode	*ip = XFS_I(inode);
> +	struct xfs_mount	*mp = ip->i_mount;
> +	__be32			d_desc_size;
> +	u32			desc_size;
> +	u64			desc_size_pos;
> +	int			error;
> +	u64			desc_pos;
> +	struct xfs_bmbt_irec	rec;
> +	int			is_empty;
> +	uint32_t		blocksize = i_blocksize(VFS_I(ip));
> +	xfs_fileoff_t		last_block_offset;
> +
> +	ASSERT(inode->i_flags & S_VERITY);
> +	error = xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty);
> +	if (error)
> +		return error;
> +
> +	if (is_empty)
> +		return -ENODATA;
> +
> +	last_block_offset =
> +		XFS_FSB_TO_B(mp, rec.br_startoff + rec.br_blockcount);
> +	if (last_block_offset < xfs_fsverity_metadata_offset(ip))
> +		return -ENODATA;
> +
> +	desc_size_pos = last_block_offset - sizeof(__be32);
> +	error = fsverity_pagecache_read(inode, (char *)&d_desc_size,
> +				  sizeof(d_desc_size), desc_size_pos);
> +	if (error)
> +		return error;
> +
> +	desc_size = be32_to_cpu(d_desc_size);
> +	if (XFS_IS_CORRUPT(mp, desc_size > FS_VERITY_MAX_DESCRIPTOR_SIZE))
> +		return -ERANGE;
> +	if (XFS_IS_CORRUPT(mp, desc_size > desc_size_pos))
> +		return -ERANGE;
> +
> +	if (!buf_size)
> +		return desc_size;
> +
> +	if (XFS_IS_CORRUPT(mp, desc_size > buf_size))
> +		return -ERANGE;
> +
> +	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
> +	error = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);

Hmm so at this point ... the very last u32 mapped in the data fork
contains the size of the fsverity descriptor; and the descriptor itself
is in the bytes just before that u32 size field?

The merkle tree itself is in the bytes between
xfs_fsverity_metadata_offset() and the block(s) consumed by the
descriptor, right?

Eventually it'd be awful nice to see an update to the ondisk format
docs, though it's probably more useful to have me guess at the format
and have you confirm that I got the details right; then at least two
people will know what the ondisk format is for fsverity stuff. :)

> +	if (error)
> +		return error;
> +
> +	return desc_size;
> +}
> +
> +static int
> +xfs_fsverity_write_descriptor(
> +	struct file		*file,
> +	const void		*desc,
> +	u32			desc_size,
> +	u64			merkle_tree_size)
> +{
> +	int			error;
> +	struct inode		*inode = file_inode(file);
> +	struct xfs_inode	*ip = XFS_I(inode);
> +	unsigned int		blksize = ip->i_mount->m_attr_geo->blksize;
> +	u64			tree_last_block =
> +		xfs_fsverity_metadata_offset(ip) + merkle_tree_size;
> +	u64			desc_pos = round_up(tree_last_block, 65536);
> +	u64			desc_end = desc_pos + desc_size;
> +	__be32			desc_size_disk = cpu_to_be32(desc_size);
> +	u64			desc_size_pos =
> +			round_up(desc_end + sizeof(desc_size_disk), blksize) -
> +			sizeof(desc_size_disk);
> +
> +	error = iomap_fsverity_write(file, desc_size_pos, sizeof(__be32),
> +				     (const void *)&desc_size_disk,
> +				     &xfs_buffered_write_iomap_ops,
> +				     &xfs_iomap_write_ops);
> +	if (error)
> +		return error;
> +
> +	error = iomap_fsverity_write(file, desc_pos, desc_size, desc,
> +				     &xfs_buffered_write_iomap_ops,
> +				     &xfs_iomap_write_ops);
> +
> +	return error;

This could turn into the shorter "return iomap_fsverity_write()"

I don't see anything objectionable here, but I would like confirmation
that I've sniffed out the ondisk format correctly.

--D

> +}
> +
> +/*
> + * Try to remove all the fsverity metadata after a failed enablement.
> + */
> +static int
> +xfs_fsverity_delete_metadata(
> +	struct xfs_inode	*ip)
> +{
> +	struct xfs_trans	*tp;
> +	struct xfs_mount	*mp = ip->i_mount;
> +	int			error;
> +
> +	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_itruncate, 0, 0, 0, &tp);
> +	if (error)
> +		return error;
> +
> +	xfs_ilock(ip, XFS_ILOCK_EXCL);
> +	xfs_trans_ijoin(tp, ip, 0);
> +
> +	/*
> +	 * We removing post EOF data, no need to update i_size as fsverity
> +	 * didn't move i_size in the first place
> +	 */
> +	error = xfs_itruncate_extents(&tp, ip, XFS_DATA_FORK, XFS_ISIZE(ip));
> +	if (error)
> +		goto err_cancel;
> +
> +	error = xfs_trans_commit(tp);
> +	if (error)
> +		goto err_cancel;
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +
> +	return error;
> +
> +err_cancel:
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +	xfs_trans_cancel(tp);
> +	return error;
> +}
> +
> +
> +/*
> + * Prepare to enable fsverity by clearing old metadata.
> + */
> +static int
> +xfs_fsverity_begin_enable(
> +	struct file		*filp)
> +{
> +	struct inode		*inode = file_inode(filp);
> +	struct xfs_inode	*ip = XFS_I(inode);
> +	int			error;
> +
> +	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
> +
> +	if (IS_DAX(inode))
> +		return -EINVAL;
> +
> +	if (inode->i_size > XFS_FSVERITY_LARGEST_FILE)
> +		return -EFBIG;
> +
> +	/*
> +	 * Flush pagecache before building Merkle tree. Inode is locked and no
> +	 * further writes will happen to the file except fsverity metadata
> +	 */
> +	error = filemap_write_and_wait(inode->i_mapping);
> +	if (error)
> +		return error;
> +
> +	if (xfs_iflags_test_and_set(ip, XFS_VERITY_CONSTRUCTION))
> +		return -EBUSY;
> +
> +	error = xfs_qm_dqattach(ip);
> +	if (error)
> +		return error;
> +
> +	return xfs_fsverity_delete_metadata(ip);
> +}
> +
> +/*
> + * Complete (or fail) the process of enabling fsverity.
> + */
> +static int
> +xfs_fsverity_end_enable(
> +	struct file		*file,
> +	const void		*desc,
> +	size_t			desc_size,
> +	u64			merkle_tree_size)
> +{
> +	struct inode		*inode = file_inode(file);
> +	struct xfs_inode	*ip = XFS_I(inode);
> +	struct xfs_mount	*mp = ip->i_mount;
> +	struct xfs_trans	*tp;
> +	int			error = 0;
> +	loff_t			range_start = xfs_fsverity_metadata_offset(ip);
> +
> +	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
> +
> +	/* fs-verity failed, just cleanup */
> +	if (desc == NULL)
> +		goto out;
> +
> +	error = xfs_fsverity_write_descriptor(file, desc, desc_size,
> +					      merkle_tree_size);
> +	if (error)
> +		goto out;
> +
> +	/*
> +	 * Wait for Merkle tree get written to disk before setting on-disk inode
> +	 * flag and clearing XFS_VERITY_CONSTRUCTION
> +	 */
> +	error = filemap_write_and_wait_range(inode->i_mapping, range_start,
> +					     LLONG_MAX);
> +	if (error)
> +		goto out;
> +
> +	/*
> +	 * Set fsverity inode flag
> +	 */
> +	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_ichange,
> +			0, 0, false, &tp);
> +	if (error)
> +		goto out;
> +
> +	/*
> +	 * Ensure that we've persisted the verity information before we enable
> +	 * it on the inode and tell the caller we have sealed the inode.
> +	 */
> +	ip->i_diflags2 |= XFS_DIFLAG2_VERITY;
> +
> +	xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
> +	xfs_trans_set_sync(tp);
> +
> +	error = xfs_trans_commit(tp);
> +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
> +
> +	if (!error)
> +		inode->i_flags |= S_VERITY;
> +
> +out:
> +	if (error) {
> +		int	error2;
> +
> +		error2 = xfs_fsverity_delete_metadata(ip);
> +		if (error2)
> +			xfs_alert(ip->i_mount,
> +"ino 0x%llx failed to clean up new fsverity metadata, err %d",
> +					ip->i_ino, error2);
> +	}
> +
> +	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
> +	return error;
> +}
> +
> +/*
> + * Retrieve a merkle tree block.
> + */
> +static struct page *
> +xfs_fsverity_read_merkle(
> +	struct inode		*inode,
> +	pgoff_t			index)
> +{
> +	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
> +
> +	return generic_read_merkle_tree_page(inode, index);
> +}
> +
> +/*
> + * Retrieve a merkle tree block.
> + */
> +static void
> +xfs_fsverity_readahead_merkle_tree(
> +	struct inode		*inode,
> +	pgoff_t			index,
> +	unsigned long		nr_pages)
> +{
> +	index += xfs_fsverity_metadata_offset(XFS_I(inode)) >> PAGE_SHIFT;
> +
> +	generic_readahead_merkle_tree(inode, index, nr_pages);
> +}
> +
> +/*
> + * Write a merkle tree block.
> + */
> +static int
> +xfs_fsverity_write_merkle(
> +	struct file		*file,
> +	const void		*buf,
> +	u64			pos,
> +	unsigned int		size,
> +	const u8		*zero_digest,
> +	unsigned int		digest_size)
> +{
> +	struct inode		*inode = file_inode(file);
> +	struct xfs_inode	*ip = XFS_I(inode);
> +	loff_t			position = pos +
> +		xfs_fsverity_metadata_offset(ip);
> +	const char		*p;
> +	unsigned int		i;
> +
> +	if (position + size > inode->i_sb->s_maxbytes)
> +		return -EFBIG;
> +
> +	/*
> +	 * If this is a block full of hashes of zeroed blocks, don't bother
> +	 * storing the block. We can synthesize them later.
> +	 *
> +	 * However, do this only in case Merkle tree block == fs block size.
> +	 * Iomap synthesizes these blocks based on holes in the merkle tree. We
> +	 * won't be able to tell if something need to be synthesizes for the
> +	 * range in the fs block. For example, for 4k filesystem block
> +	 *
> +	 *	[ 1k | zero hashes | zero hashes | 1k ]
> +	 *
> +	 * Iomap won't know about these empty blocks.
> +	 */
> +	for (i = 0, p = buf; i < size; i += digest_size, p += digest_size)
> +		if (memcmp(p, zero_digest, digest_size))
> +			break;
> +	if (i == size && size == ip->i_mount->m_sb.sb_blocksize)
> +		return 0;
> +
> +	return iomap_fsverity_write(file, position, size, buf,
> +				    &xfs_buffered_write_iomap_ops,
> +				    &xfs_iomap_write_ops);
> +}
> +
> +const struct fsverity_operations xfs_fsverity_ops = {
> +	.begin_enable_verity		= xfs_fsverity_begin_enable,
> +	.end_enable_verity		= xfs_fsverity_end_enable,
> +	.get_verity_descriptor		= xfs_fsverity_get_descriptor,
> +	.read_merkle_tree_page		= xfs_fsverity_read_merkle,
> +	.readahead_merkle_tree		= xfs_fsverity_readahead_merkle_tree,
> +	.write_merkle_tree_block	= xfs_fsverity_write_merkle,
> +};
> diff --git a/fs/xfs/xfs_fsverity.h b/fs/xfs/xfs_fsverity.h
> index ec77ba571106..6a981e20a75b 100644
> --- a/fs/xfs/xfs_fsverity.h
> +++ b/fs/xfs/xfs_fsverity.h
> @@ -6,8 +6,10 @@
>  #define __XFS_FSVERITY_H__
>  
>  #include "xfs_platform.h"
> +#include <linux/fsverity.h>
>  
>  #ifdef CONFIG_FS_VERITY
> +extern const struct fsverity_operations xfs_fsverity_ops;
>  loff_t xfs_fsverity_metadata_offset(const struct xfs_inode *ip);
>  bool xfs_fsverity_is_file_data(const struct xfs_inode *ip, loff_t offset);
>  #else
> diff --git a/fs/xfs/xfs_message.c b/fs/xfs/xfs_message.c
> index fd297082aeb8..9818d8f8f239 100644
> --- a/fs/xfs/xfs_message.c
> +++ b/fs/xfs/xfs_message.c
> @@ -153,6 +153,10 @@ xfs_warn_experimental(
>  			.opstate	= XFS_OPSTATE_WARNED_ZONED,
>  			.name		= "zoned RT device",
>  		},
> +		[XFS_EXPERIMENTAL_FSVERITY] = {
> +			.opstate	= XFS_OPSTATE_WARNED_FSVERITY,
> +			.name		= "fsverity",
> +		},
>  	};
>  	ASSERT(feat >= 0 && feat < XFS_EXPERIMENTAL_MAX);
>  	BUILD_BUG_ON(ARRAY_SIZE(features) != XFS_EXPERIMENTAL_MAX);
> diff --git a/fs/xfs/xfs_message.h b/fs/xfs/xfs_message.h
> index 49b0ef40d299..083403944f11 100644
> --- a/fs/xfs/xfs_message.h
> +++ b/fs/xfs/xfs_message.h
> @@ -94,6 +94,7 @@ enum xfs_experimental_feat {
>  	XFS_EXPERIMENTAL_SHRINK,
>  	XFS_EXPERIMENTAL_LARP,
>  	XFS_EXPERIMENTAL_ZONED,
> +	XFS_EXPERIMENTAL_FSVERITY,
>  
>  	XFS_EXPERIMENTAL_MAX,
>  };
> diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
> index c746bc90cf3e..a4885fe7aa3b 100644
> --- a/fs/xfs/xfs_mount.h
> +++ b/fs/xfs/xfs_mount.h
> @@ -583,6 +583,8 @@ __XFS_HAS_FEAT(nouuid, NOUUID)
>  #define XFS_OPSTATE_WARNED_ZONED	19
>  /* (Zoned) GC is in progress */
>  #define XFS_OPSTATE_ZONEGC_RUNNING	20
> +/* Kernel has logged a warning about fsverity support */
> +#define XFS_OPSTATE_WARNED_FSVERITY	21
>  
>  #define __XFS_IS_OPSTATE(name, NAME) \
>  static inline bool xfs_is_ ## name (struct xfs_mount *mp) \
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index abc45f860a73..b7a16dc8de52 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -30,6 +30,7 @@
>  #include "xfs_filestream.h"
>  #include "xfs_quota.h"
>  #include "xfs_sysfs.h"
> +#include "xfs_fsverity.h"
>  #include "xfs_ondisk.h"
>  #include "xfs_rmap_item.h"
>  #include "xfs_refcount_item.h"
> @@ -1686,6 +1687,9 @@ xfs_fs_fill_super(
>  	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
>  #endif
>  	sb->s_op = &xfs_super_operations;
> +#ifdef CONFIG_FS_VERITY
> +	sb->s_vop = &xfs_fsverity_ops;
> +#endif
>  
>  	/*
>  	 * Delay mount work if the debug hook is set. This is debug
> @@ -1939,6 +1943,9 @@ xfs_fs_fill_super(
>  	if (error)
>  		goto out_filestream_unmount;
>  
> +	if (xfs_has_verity(mp))
> +		xfs_warn_experimental(mp, XFS_EXPERIMENTAL_FSVERITY);
> +
>  	root = igrab(VFS_I(mp->m_rootip));
>  	if (!root) {
>  		error = -ENOENT;
> -- 
> 2.51.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
