Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B820C692946
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Feb 2023 22:30:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pQayU-0005ls-0r;
	Fri, 10 Feb 2023 21:30:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pQayS-0005lm-T1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vN55a8g+6QA63PY0FK39xnboB7aqA9KqKN6mkH+przg=; b=mRktda0s/wJZQe82Km2Es9q/n0
 csO25scpo3uCkSutOO2HVR/IfFeVPkXhqxrr0WGaad/Hx29KcNa+kMDMXlVvDDl/vu1XxYi59q1ez
 9aoWzS/O7YT2HYoxBuIfQYv8nmMxHUNZHgDK0ccMjW9Ir++fMtrr1B5xHRCXnjqMrPys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vN55a8g+6QA63PY0FK39xnboB7aqA9KqKN6mkH+przg=; b=k9+QHoPX0VjJNFbJrlJefLzXk9
 +iWQcft+fCkqYgX6gRe2u+OuNiwTJ42bvWM9drMrSBh4wN8na7S53BL6ATjC/pVA9OL9fXf+hTCqC
 PPtDQueHvGQ1RRyrkEoJj9SaAIImDRNI2G7LW2WIzE335OnT5Cqsm91XNKbSa/AHiWQw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pQayR-00Ha6m-9X for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:30:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5F5C61E87;
 Fri, 10 Feb 2023 21:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081AFC4339B;
 Fri, 10 Feb 2023 21:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676064621;
 bh=RM5rm9wA7Rfifn+Mrc6jfNB4qyZD8rHzGfvx3pLS7yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZcN8NnV99nOnLoFDljaTLX3uPvXOpaUnHJxXruHhtZyNXnQfEJwoo+g0dO/m3dsa3
 x55Vb1j0H6QCXqsg3339Z9M2Dvo2Apfb7QFABa/mviCAl/LOiiI+6DmhMQIR3ncxP2
 kf9HgrCU44DB98ycvoJcqpBLz2wsXC6nT9R4SOlVtosJ0OkD25/erNHfCVQjc7+2cF
 NVEtCBoRHllZtO6vGw3mLj3EIEnVDLYLj/UGv6jMKVHgSvoxj1HbgTADOAXyahWa3E
 xY2L0pC5pk8FUakkhOmIsM4QOx+l9vGasdo4hf5ZaVfum4PfGq7EduqyU0/c06wRZB
 8q8Sct5rGReTw==
Date: Fri, 10 Feb 2023 13:30:19 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y+a3a0eSkhVUh/RG@google.com>
References: <20230210102019.61193-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210102019.61193-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/10,
 Yangtao Li wrote: > When the released file is reserving
 and the space is insufficient, > the fsck flag is set incorrectly, and lead
 to the file cannot be > reserved and released normally. > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pQayR-00Ha6m-9X
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to release compress file for
 F2FS_IOC_RESERVE_COMPRESS_BLOCKS when has no space
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
Cc: hanqi@vivo.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/10, Yangtao Li wrote:
> When the released file is reserving and the space is insufficient,
> the fsck flag is set incorrectly, and lead to the file cannot be
> reserved and released normally.
> 
> $ mount -t f2fs -o compress_extension=*,compress_mode=user /mnt/9p/f2fs.img
> 	/mnt/f2fs/
> $ dd if=/dev/zero of=/mnt/f2fs/800M bs=1M count=800
> $ dd if=/dev/zero of=/mnt/f2fs/60M bs=1M count=60
> $ f2fs_io compress /mnt/f2fs/60M
> $ ./mnt/9p/my_f2fs_io release_cblocks /mnt/f2fs/60M
> 11520
> $ dd if=/dev/zero of=/mnt/f2fs/30M bs=1M count=30
> $ f2fs_io reserve_cblocks /mnt/f2fs/60M
> [   56.399712] F2FS-fs (loop0): f2fs_reserve_compress_blocks: partial blocks
> 	were released i_ino=cf iblocks=76104, reserved=5220, compr_blocks=5655,
> 	run fsck to fix.
> F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device
> 
> $ ./mnt/9p/my_f2fs_io reserve_cblocks /mnt/f2fs/60M
> 0
> $ ./mnt/9p/my_f2fs_io release_cblocks /mnt/f2fs/60M
> F2FS_IOC_RELEASE_COMPRESS_BLOCKS failed: Invalid argument
> 
> $ rm /mnt/f2fs/30M
> $ ./mnt/9p/my_f2fs_io reserve_cblocks /mnt/f2fs/60M
> 0
> $ ./mnt/9p/my_f2fs_io release_cblocks /mnt/f2fs/60M
> F2FS_IOC_RELEASE_COMPRESS_BLOCKS failed: Invalid argument
> 
> In this case, let's release back the reserved part of the compressed file.
> 
> Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
> Signed-off-by: Qi Han <hanqi@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/file.c | 97 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 63 insertions(+), 34 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 300eae8b5415..8f3f55ac153a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3427,11 +3427,52 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>  	return released_blocks;
>  }
>  
> +static int f2fs_do_release_compress_blocks(struct inode *inode,
> +			pgoff_t page_count, unsigned int *released_blocks)
> +{
> +	pgoff_t page_idx = 0;
> +	int ret;
> +
> +	while (page_idx < page_count) {
> +		struct dnode_of_data dn;
> +		pgoff_t end_offset, count;
> +
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
> +		if (ret) {
> +			if (ret == -ENOENT) {
> +				page_idx = f2fs_get_next_page_offset(&dn,
> +								page_idx);
> +				ret = 0;
> +				continue;
> +			}
> +			break;
> +		}
> +
> +		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> +		count = min(end_offset - dn.ofs_in_node, page_count - page_idx);
> +		count = round_up(count, F2FS_I(inode)->i_cluster_size);
> +
> +		ret = release_compress_blocks(&dn, count);
> +
> +		f2fs_put_dnode(&dn);
> +
> +		if (ret < 0)
> +			break;
> +
> +		page_idx += count;
> +		if (released_blocks)
> +			*released_blocks += ret;
> +	}
> +
> +	return ret;
> +}
> +
>  static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>  {
>  	struct inode *inode = file_inode(filp);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	pgoff_t page_idx = 0, last_idx;
> +	pgoff_t last_idx;
>  	unsigned int released_blocks = 0;
>  	int ret;
>  	int writecount;
> @@ -3481,36 +3522,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>  
>  	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
>  
> -	while (page_idx < last_idx) {
> -		struct dnode_of_data dn;
> -		pgoff_t end_offset, count;
> -
> -		set_new_dnode(&dn, inode, NULL, NULL, 0);
> -		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
> -		if (ret) {
> -			if (ret == -ENOENT) {
> -				page_idx = f2fs_get_next_page_offset(&dn,
> -								page_idx);
> -				ret = 0;
> -				continue;
> -			}
> -			break;
> -		}
> -
> -		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> -		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
> -		count = round_up(count, F2FS_I(inode)->i_cluster_size);
> -
> -		ret = release_compress_blocks(&dn, count);
> -
> -		f2fs_put_dnode(&dn);
> -
> -		if (ret < 0)
> -			break;
> -
> -		page_idx += count;
> -		released_blocks += ret;
> -	}
> +	ret = f2fs_do_release_compress_blocks(inode, last_idx, &released_blocks);
>  
>  	filemap_invalidate_unlock(inode->i_mapping);
>  	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> @@ -3585,8 +3597,22 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>  		if (ret)
>  			return ret;
>  
> -		if (reserved != cluster_size - compr_blocks)
> -			return -ENOSPC;
> +		if (reserved != cluster_size - compr_blocks) {
> +			dec_valid_block_count(sbi, dn->inode, reserved);

This looks breaking the consistency?

> +
> +			for (i = cluster_size - 1; i > 0; i--) {
> +				dn->ofs_in_node--;
> +				blkaddr = f2fs_data_blkaddr(dn);
> +
> +				if (__is_valid_data_blkaddr(blkaddr)) {
> +					dn->ofs_in_node -= i;
> +					return -ENOSPC;
> +				}
> +
> +				dn->data_blkaddr = NULL_ADDR;
> +				f2fs_set_data_blkaddr(dn);
> +			}
> +		}
>  
>  		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, true);
>  
> @@ -3604,6 +3630,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	pgoff_t page_idx = 0, last_idx;
>  	unsigned int reserved_blocks = 0;
> +	struct dnode_of_data dn;
>  	int ret;
>  
>  	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
> @@ -3637,7 +3664,6 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
>  
>  	while (page_idx < last_idx) {
> -		struct dnode_of_data dn;
>  		pgoff_t end_offset, count;
>  
>  		set_new_dnode(&dn, inode, NULL, NULL, 0);
> @@ -3667,6 +3693,9 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  		reserved_blocks += ret;
>  	}
>  
> +	if (ret == -ENOSPC)
> +		f2fs_do_release_compress_blocks(inode, page_idx + dn.ofs_in_node, NULL);
> +
>  	filemap_invalidate_unlock(inode->i_mapping);
>  	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
