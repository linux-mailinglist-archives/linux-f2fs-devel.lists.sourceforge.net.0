Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FF52E040
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 May 2022 01:06:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrpDj-0004Vo-SL; Thu, 19 May 2022 23:06:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1nrpDi-0004Ve-7a
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 23:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GC6F8mx9IeX5SXVyAq+B1gZ+pLDEPm6VPWO8QV0VwdE=; b=LAjG1f1m+QD3Dyyd0s+PRL2Ttm
 jqdbFIdsPxNgtRrdSErNxjRJpCyQll6kyKiULOi9+mSQf/+Jv/6m68U5AqqEV2Otp4f/kVCwPrw1v
 xjxd1Wsussb5X6Uvab9Nb8JMnSJUCp7uRP7L/K+kl5eyTt+u+GvA+zpbqbXZGNSiSlPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GC6F8mx9IeX5SXVyAq+B1gZ+pLDEPm6VPWO8QV0VwdE=; b=fhHKutBRlyt2+mTi11ZYrFTw3y
 TBhJamuKTUftrr0CSmaB/N0CZFypmiF45/d8mGQd3uzZ6Bot8qltSPnDpF2V+XNqxaNNddZUXDkNK
 JbJ+SJJJjfkqUvBKVeukH+ECy2PVl6ptKnHtI7VQm3eXyUlLZqUPZVZhuDdX5wvYbjB0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrpDg-0006ja-DR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 23:06:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E7C16171F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 May 2022 23:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BADC34113;
 Thu, 19 May 2022 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653001566;
 bh=KMqSVGwJXZoPClyc0+dns0g5106HUQ8FYrDrNyZ1+Ss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fBlEfGZoJUrD9oClATZzZKLN8ZFJlQB8Dxuz5bkukbY+dXdMi2PGWRdrHIrfMtylZ
 rAm/IQI6ygK94t2HHXYO51oagM4DGsDy6VWUgkZ0YRqX5fb/QlSfRQIB2R6nvprPNd
 2Db0MBMJTladGran2Xl5jsm6oZEanP6WXFxRWT9G2uDo2fFTWfKp208ptQxqQHTlGR
 qkd/+Mmx9fTNs0Nu9YOkfWfR5yS5pFsr9CtBeveGBTnqzfiahvMg7wmLh4jlL5lt8r
 mz8b9uqFZpp/qbZ5cq5VOn9Cr0M1y8iKEEgwhwytFoF4WlY7Q17f6vID4KNjCwS15r
 +n9QH9f76eLrw==
Date: Thu, 19 May 2022 16:06:05 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YobNXbYnhBiqniTH@magnolia>
References: <20220518235011.153058-1-ebiggers@kernel.org>
 <20220518235011.153058-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518235011.153058-2-ebiggers@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 04:50:05PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Traditionally, the conditions
 for when DIO (direct I/O) is supported > were fairly simple: [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrpDg-0006ja-DR
Subject: Re: [f2fs-dev] [RFC PATCH v2 1/7] statx: add I/O alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 04:50:05PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Traditionally, the conditions for when DIO (direct I/O) is supported
> were fairly simple: filesystems either supported DIO aligned to the
> block device's logical block size, or didn't support DIO at all.
> 
> However, due to filesystem features that have been added over time (e.g,
> data journalling, inline data, encryption, verity, compression,
> checkpoint disabling, log-structured mode), the conditions for when DIO
> is allowed on a file have gotten increasingly complex.  Whether a
> particular file supports DIO, and with what alignment, can depend on
> various file attributes and filesystem mount options, as well as which
> block device(s) the file's data is located on.
> 
> XFS has an ioctl XFS_IOC_DIOINFO which exposes this information to
> applications.  However, as discussed
> (https://lore.kernel.org/linux-fsdevel/20220120071215.123274-1-ebiggers@kernel.org/T/#u),
> this ioctl is rarely used and not known to be used outside of
> XFS-specific code.  It also was never intended to indicate when a file
> doesn't support DIO at all, and it only exposes the minimum I/O
> alignment, not the optimal I/O alignment which has been requested too.
> 
> Therefore, let's expose this information via statx().  Add the
> STATX_IOALIGN flag and three fields associated with it:
> 
> * stx_mem_align_dio: the alignment (in bytes) required for user memory
>   buffers for DIO, or 0 if DIO is not supported on the file.
> 
> * stx_offset_align_dio: the alignment (in bytes) required for file
>   offsets and I/O segment lengths for DIO, or 0 if DIO is not supported
>   on the file.  This will only be nonzero if stx_mem_align_dio is
>   nonzero, and vice versa.
> 
> * stx_offset_align_optimal: the alignment (in bytes) suggested for file
>   offsets and I/O segment lengths to get optimal performance.  This
>   applies to both DIO and buffered I/O.  It differs from stx_blocksize
>   in that stx_offset_align_optimal will contain the real optimum I/O
>   size, which may be a large value.  In contrast, for compatibility
>   reasons stx_blocksize is the minimum size needed to avoid page cache
>   read/write/modify cycles, which may be much smaller than the optimum
>   I/O size.  For more details about the motivation for this field, see
>   https://lore.kernel.org/r/20220210040304.GM59729@dread.disaster.area

Hmm.  So I guess this is supposed to be the filesystem's best guess at
the IO size that will minimize RMW cycles in the entire stack?  i.e. if
the user does not want RMW of pagecache pages, of file allocation units
(if COW is enabled), of RAID stripes, or in the storage itself, then it
should ensure that all IOs are aligned to this value?

I guess that means for XFS it's effectively max(pagesize, i_blocksize,
bdev io_opt, sb_width, and (pretend XFS can reflink the realtime volume)
the rt extent size)?  I didn't see a manpage update for statx(2) but
that's mostly what I'm interested in. :)

Looking ahead, it looks like the ext4/f2fs implementations only seem to
be returning max(i_blocksize, bdev io_opt)?  But not the pagesize?  Did
I misunderstood this, then?

(The plumbing changes in this patch look ok.)

--D

> Note that as with other statx() extensions, if STATX_IOALIGN isn't set
> in the returned statx struct, then these new fields won't be filled in.
> This will happen if the filesystem doesn't support STATX_IOALIGN, or if
> the file isn't a regular file.  (It might be supported on block device
> files in the future.)  It might also happen if the caller didn't include
> STATX_IOALIGN in the request mask, since statx() isn't required to
> return information that wasn't requested.
> 
> This commit adds the VFS-level plumbing for STATX_IOALIGN.  Individual
> filesystems will still need to add code to support it.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/stat.c                 | 3 +++
>  include/linux/stat.h      | 3 +++
>  include/uapi/linux/stat.h | 9 +++++++--
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/stat.c b/fs/stat.c
> index 5c2c94464e8b0..9d477218545b8 100644
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@ -611,6 +611,9 @@ cp_statx(const struct kstat *stat, struct statx __user *buffer)
>  	tmp.stx_dev_major = MAJOR(stat->dev);
>  	tmp.stx_dev_minor = MINOR(stat->dev);
>  	tmp.stx_mnt_id = stat->mnt_id;
> +	tmp.stx_mem_align_dio = stat->mem_align_dio;
> +	tmp.stx_offset_align_dio = stat->offset_align_dio;
> +	tmp.stx_offset_align_optimal = stat->offset_align_optimal;
>  
>  	return copy_to_user(buffer, &tmp, sizeof(tmp)) ? -EFAULT : 0;
>  }
> diff --git a/include/linux/stat.h b/include/linux/stat.h
> index 7df06931f25d8..48b8b1ad1567c 100644
> --- a/include/linux/stat.h
> +++ b/include/linux/stat.h
> @@ -50,6 +50,9 @@ struct kstat {
>  	struct timespec64 btime;			/* File creation time */
>  	u64		blocks;
>  	u64		mnt_id;
> +	u32		mem_align_dio;
> +	u32		offset_align_dio;
> +	u32		offset_align_optimal;
>  };
>  
>  #endif
> diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
> index 1500a0f58041a..f822b23e81091 100644
> --- a/include/uapi/linux/stat.h
> +++ b/include/uapi/linux/stat.h
> @@ -124,9 +124,13 @@ struct statx {
>  	__u32	stx_dev_minor;
>  	/* 0x90 */
>  	__u64	stx_mnt_id;
> -	__u64	__spare2;
> +	__u32	stx_mem_align_dio;	/* Memory buffer alignment for direct I/O */
> +	__u32	stx_offset_align_dio;	/* File offset alignment for direct I/O */
>  	/* 0xa0 */
> -	__u64	__spare3[12];	/* Spare space for future expansion */
> +	__u32	stx_offset_align_optimal; /* Optimal file offset alignment for I/O */
> +	__u32	__spare2;
> +	/* 0xa8 */
> +	__u64	__spare3[11];	/* Spare space for future expansion */
>  	/* 0x100 */
>  };
>  
> @@ -152,6 +156,7 @@ struct statx {
>  #define STATX_BASIC_STATS	0x000007ffU	/* The stuff in the normal stat struct */
>  #define STATX_BTIME		0x00000800U	/* Want/got stx_btime */
>  #define STATX_MNT_ID		0x00001000U	/* Got stx_mnt_id */
> +#define STATX_IOALIGN		0x00002000U	/* Want/got IO alignment info */
>  
>  #define STATX__RESERVED		0x80000000U	/* Reserved for future struct statx expansion */
>  
> -- 
> 2.36.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
