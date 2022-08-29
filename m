Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F35A5350
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Aug 2022 19:37:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSihR-0004hc-8H;
	Mon, 29 Aug 2022 17:37:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oSihQ-0004hU-6a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UlxhGPb8rE+iqRpbWbruvjPksxnwrjnX+2SGRdk1akY=; b=PmG2gCtgZKWLeUJVCI9ti2wVpE
 gTV7YpMNGKCRHFanNqUwrznmwxhsGJYc7FE9Od2/xOoqGvaat4802dwHKYTzJIUpfdBnJHJfrgW0n
 w7JTPDDfmWs10DKNCY8dkLIg8h9ei7PIlKUE/dkvZQG1Y1D5nWdueFMXThcKbAF8WWOE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UlxhGPb8rE+iqRpbWbruvjPksxnwrjnX+2SGRdk1akY=; b=SMhTIFyvlSAT6i7nudAKSTTPNt
 QciQa/Q+/reNCZqLYs1q5kx8iY+OXwA+Mi3lLwsBTIC7+CQnQ+RIwilbeGr5QxXAtqZxqtsy0J8br
 cxCS/Hn7syniXhmCFzc3rAwAfH4sFxHcTTs1wLiECdK8xMqqF3eA+u+hp+DcS5SqLiBU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSihP-006dxT-F2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:37:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A645612F3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Aug 2022 17:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8D4C433D6;
 Mon, 29 Aug 2022 17:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661794637;
 bh=VisVfFlNg3guWb1Uh3Rh6ezVhr8O3Y8hEa+38msXgGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GscoSoeOHVKI2lcg0f5zeM49fB/QIFy9fiTWTCM24ECcBNKVvuC0m32uPk3e5oFKo
 pMZ6E+up/GbzVPg1dJXbO9xR2Bgus/Avms0DDSkWmlTfu+6aRTezUAbok040CUktbo
 B5GCoqapE20b37gkxTDLGAt8bvpEka4r0uASk0ZOQf9Vo2MpHIlyzMsszKAj9wUf3g
 WWA31D8ziUOc68kWC/gZ/Kj2ypzzngae32aFQyHFDQzCcy1HqjeniNqhZlq2QoY4tY
 QuPggKT/yWcDn2CTwBq17L9W7rv4Kvy2wll3MU+V1/tFcVQefU4uVZp8BbAdsOZIXr
 fwFwv5Th2Xz9A==
Date: Mon, 29 Aug 2022 10:37:15 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Ywz5Sxu78GRJZUp5@google.com>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <20220827065851.135710-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827065851.135710-6-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/26,
 Eric Biggers wrote: > From: Eric Biggers <ebiggers@google.com>
 > > f2fs_force_buffered_io() is only used in file.c, so move it into there.
 > No behavior change. This makes it easier to revie [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oSihP-006dxT-F2
Subject: Re: [f2fs-dev] [PATCH v5 5/8] f2fs: move f2fs_force_buffered_io()
 into file.c
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

On 08/26, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> f2fs_force_buffered_io() is only used in file.c, so move it into there.
> No behavior change.  This makes it easier to review later patches.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/f2fs.h | 40 ----------------------------------------
>  fs/f2fs/file.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0759da1919f4ad..aea816a133a8f1 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4471,17 +4471,6 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  }
>  
> -static inline int block_unaligned_IO(struct inode *inode,
> -				struct kiocb *iocb, struct iov_iter *iter)
> -{
> -	unsigned int i_blkbits = READ_ONCE(inode->i_blkbits);
> -	unsigned int blocksize_mask = (1 << i_blkbits) - 1;
> -	loff_t offset = iocb->ki_pos;
> -	unsigned long align = offset | iov_iter_alignment(iter);
> -
> -	return align & blocksize_mask;
> -}
> -
>  static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
>  								int flag)
>  {
> @@ -4492,35 +4481,6 @@ static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
>  	return sbi->aligned_blksize;
>  }
>  
> -static inline bool f2fs_force_buffered_io(struct inode *inode,
> -				struct kiocb *iocb, struct iov_iter *iter)
> -{
> -	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	int rw = iov_iter_rw(iter);
> -
> -	if (!fscrypt_dio_supported(inode))
> -		return true;
> -	if (fsverity_active(inode))
> -		return true;
> -	if (f2fs_compressed_file(inode))
> -		return true;
> -
> -	/* disallow direct IO if any of devices has unaligned blksize */
> -	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
> -		return true;
> -
> -	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
> -		if (block_unaligned_IO(inode, iocb, iter))
> -			return true;
> -		if (F2FS_IO_ALIGNED(sbi))
> -			return true;
> -	}
> -	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED))
> -		return true;
> -
> -	return false;
> -}
> -
>  static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
>  {
>  	return fsverity_active(inode) &&
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ce4905a073b3c4..8a9455bf956f16 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -808,6 +808,46 @@ int f2fs_truncate(struct inode *inode)
>  	return 0;
>  }
>  
> +static int block_unaligned_IO(struct inode *inode, struct kiocb *iocb,
> +			      struct iov_iter *iter)
> +{
> +	unsigned int i_blkbits = READ_ONCE(inode->i_blkbits);
> +	unsigned int blocksize_mask = (1 << i_blkbits) - 1;
> +	loff_t offset = iocb->ki_pos;
> +	unsigned long align = offset | iov_iter_alignment(iter);
> +
> +	return align & blocksize_mask;
> +}
> +
> +static bool f2fs_force_buffered_io(struct inode *inode,
> +				   struct kiocb *iocb, struct iov_iter *iter)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	int rw = iov_iter_rw(iter);
> +
> +	if (!fscrypt_dio_supported(inode))
> +		return true;
> +	if (fsverity_active(inode))
> +		return true;
> +	if (f2fs_compressed_file(inode))
> +		return true;
> +
> +	/* disallow direct IO if any of devices has unaligned blksize */
> +	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
> +		return true;
> +
> +	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
> +		if (block_unaligned_IO(inode, iocb, iter))
> +			return true;
> +		if (F2FS_IO_ALIGNED(sbi))
> +			return true;
> +	}
> +	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED))
> +		return true;
> +
> +	return false;
> +}
> +
>  int f2fs_getattr(struct user_namespace *mnt_userns, const struct path *path,
>  		 struct kstat *stat, u32 request_mask, unsigned int query_flags)
>  {
> -- 
> 2.37.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
