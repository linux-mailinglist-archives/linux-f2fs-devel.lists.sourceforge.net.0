Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E9841412
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 21:15:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUY20-0006bN-Px;
	Mon, 29 Jan 2024 20:15:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rUY1z-0006bG-4Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zv9TYg0/xFuYql5KyJylTF+K+sGwEm24+RlHCtPibRY=; b=XyzaHwqDjrj9gD0YXo7xl8Kx2p
 wvV3dYPV28rAApgqa7rkaJ2tGWsWVoU25Jvic8Vh/9BG22n9xdBH9XWXtCfarDwiT6GaktMwfAi59
 jmgj+tf6t/6rMKe2Tsi+R+EoRPGQifrRV7Q1E1XEfhk+uulCrFXXZxrT4x185Q7E4TyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zv9TYg0/xFuYql5KyJylTF+K+sGwEm24+RlHCtPibRY=; b=nQL4Q9aFB1zurObo0rXdhid38+
 ZDLCoaxnsEoub3M0D6pPZ7XqOTypZWquh9wgFeU+HrW06tCfKPucsAcmh6IT7/jgKvdPyCprgxyyv
 hJ8bhS7t9vMseg0GQ5tqA8+Z+oruAyLngEUeVW2mgg2QiEKtqOwbcRpnCzfPWYwBTCN0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUY1u-0007pi-4O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 20:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0946CCE1711;
 Mon, 29 Jan 2024 20:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23ECBC433C7;
 Mon, 29 Jan 2024 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706559282;
 bh=G7jPJoVglCJBC3aIlhcJjk7Qk1Pnte9iX0g08G2UsDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fliyiqeRYipHM2bplBbR+CpzIbOYJQu7wjMuWkWq4m2EiB3dNm2LW6Ee/VNV2P6bB
 wXcqmz4F9yKgyg2zqWSE+xQJD80aGOrV7WGTPcuUFe5FmEi6RNKro5Mmu+A5nUZl4V
 xut3BE2RLjq/ymZ22D1mYsgqjGXpWExWUmq63pC2/Q8PExdY56RJ6e5BHVW6suv6Hd
 kBs73nZoB78scs9bEotReHYxNuJ54HNZN07nk//zW+vXWwo9afJIypeglrjyR1HUw+
 K293HMzWVTvdBbLuh55/2oUObDYkUKRsgv/KN3L8Ia0WgFQnSlztyug7csy3qKg0I0
 00ZERpbZYrzEw==
Date: Mon, 29 Jan 2024 12:14:40 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <ZbgHMKoDowzNEy1V@google.com>
References: <20240126221845.265859-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240126221845.265859-1-drosen@google.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/26, Daniel Rosenberg wrote: > Since we may not know
 the block size when initializing sparse files, we > should assume that the
 sparse file's blocksize is correct. > > Signed-off-by: Daniel Rosen [...]
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUY1u-0007pi-4O
Subject: Re: [f2fs-dev] [PATCH 1/2] libf2fs: Accept Sparse files with non 4K
 Blocksize
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
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/26, Daniel Rosenberg wrote:
> Since we may not know the block size when initializing sparse files, we
> should assume that the sparse file's blocksize is correct.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fsck/mount.c     | 20 +++++++++++++-------
>  lib/libf2fs_io.c | 11 +++++++----
>  2 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 30c6228..7bbec3f 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -995,6 +995,10 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
>  		return -1;
>  
>  	blocksize = 1 << get_sb(log_blocksize);
> +	if (c.sparse_mode && F2FS_BLKSIZE != blocksize) {
> +		MSG(0, "Invalid blocksize (%u), does not equal sparse file blocksize (%u)",
> +			F2FS_BLKSIZE);

Applied with the below fix.
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -997,7 +997,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
        blocksize = 1 << get_sb(log_blocksize);
        if (c.sparse_mode && F2FS_BLKSIZE != blocksize) {
                MSG(0, "Invalid blocksize (%u), does not equal sparse file blocksize (%u)",
-                       F2FS_BLKSIZE);
+                       F2FS_BLKSIZE, blocksize);
        }


> +	}
>  	if (blocksize < F2FS_MIN_BLKSIZE || blocksize > F2FS_MAX_BLKSIZE) {
>  		MSG(0, "Invalid blocksize (%u), must be between 4KB and 16KB\n",
>  			blocksize);
> @@ -3965,20 +3969,22 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
>  	sbi->active_logs = NR_CURSEG_TYPE;
>  	ret = validate_super_block(sbi, SB0_ADDR);
>  	if (ret) {
> -		/* Assuming 4K Block Size */
> -		c.blksize_bits = 12;
> -		c.blksize = 1 << c.blksize_bits;
> -		MSG(0, "Looking for secondary superblock assuming 4K Block Size\n");
> +		if (!c.sparse_mode) {
> +			/* Assuming 4K Block Size */
> +			c.blksize_bits = 12;
> +			c.blksize = 1 << c.blksize_bits;
> +			MSG(0, "Looking for secondary superblock assuming 4K Block Size\n");
> +		}
>  		ret = validate_super_block(sbi, SB1_ADDR);
> -		if (ret) {
> +		if (ret && !c.sparse_mode) {
>  			/* Trying 16K Block Size */
>  			c.blksize_bits = 14;
>  			c.blksize = 1 << c.blksize_bits;
>  			MSG(0, "Looking for secondary superblock assuming 16K Block Size\n");
>  			ret = validate_super_block(sbi, SB1_ADDR);
> -			if (ret)
> -				return -1;
>  		}
> +		if (ret)
> +			return -1;
>  	}
>  	sb = F2FS_RAW_SUPER(sbi);
>  	c.cache_config.num_cache_entry = num_cache_entry;
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index d76da83..97c91ef 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -662,14 +662,17 @@ int f2fs_init_sparse_file(void)
>  		if (!f2fs_sparse_file)
>  			return -1;
>  
> +		c.blksize = sparse_file_block_size(f2fs_sparse_file);
> +		c.blksize_bits = log_base_2(c.blksize);
> +		if (c.blksize_bits == -1) {
> +			MSG(0, "\tError: Sparse file blocksize not a power of 2.\n");
> +			return -1;
> +		}
> +
>  		c.device_size = sparse_file_len(f2fs_sparse_file, 0, 0);
>  		c.device_size &= (~((uint64_t)(F2FS_BLKSIZE - 1)));
>  	}
>  
> -	if (sparse_file_block_size(f2fs_sparse_file) != F2FS_BLKSIZE) {
> -		MSG(0, "\tError: Corrupted sparse file\n");
> -		return -1;
> -	}
>  	blocks_count = c.device_size / F2FS_BLKSIZE;
>  	blocks = calloc(blocks_count, sizeof(char *));
>  	if (!blocks) {
> 
> base-commit: bf5100606d63f6928799846b7322aa6f3f158bcf
> -- 
> 2.43.0.429.g432eaa2c6b-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
