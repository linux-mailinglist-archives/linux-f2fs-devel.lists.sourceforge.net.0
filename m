Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D02C9642
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 05:09:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjwyo-0007P4-Dd; Tue, 01 Dec 2020 04:09:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kjwyn-0007Ox-7K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GoymDqMXMI1SjeruHkrssFe8m43IsINeSvrn43fMIPM=; b=ORTf3FK3cBG+SZcVBXYq8YxQRU
 xp+eGtXZwtLwSlwNKkXvmYi+YG6i87GjbEvAc/e8bleD+ERxtkTtQZxFZtrjzEAHPeK7MoCxOAtrE
 JFMh2EC3Du4E1Of/tH6hh+A+HMe4rF0ibWhkaS7Tx3Xu+8HwptWj68Olw5Rj1D8eOPgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GoymDqMXMI1SjeruHkrssFe8m43IsINeSvrn43fMIPM=; b=eGp+miN2HDLyUVGpovsDcEJEw/
 6J32FEudkw6rU4+aAJL63YUIVM56SeAmH8GMP1AyiugVY5ppH+1gWWFHWXMCrgk4dEhORRP2kkgEm
 oVj2JTRtNk3+duhXeOHz0BZQPTi54XPonUhNPreIKwMuX+yH2vRoPCvWk6TkkbrnBxmI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjwyb-008MyI-5B
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:09:29 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 949F3206F9;
 Tue,  1 Dec 2020 04:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606795746;
 bh=yTT1WYFhXIaKG2neZB72+2e2pwf7+UMUsEInFXo4pSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vzrH+W+lga4QzFg6HFd5f7UCVvoITNS7x8pvYd3+5zCpEvBBGhNVwIVe9PEYPr/UB
 l04Zhsl+xLX1+apwOx1BD6xOYeJLEp3SziQbJl8Fe7c5UNHu0wklTKom8zj8S0kHnY
 bCPS6E3Syw8b1kG7XeEDgnx/nHo/4iPi5LsGbRH8=
Date: Mon, 30 Nov 2020 20:09:04 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, kernel-team@android.com
Message-ID: <20201201040904.GA3858797@google.com>
References: <20201126022416.3068426-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126022416.3068426-1-jaegeuk@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kjwyb-008MyI-5B
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: rename logical_to_blk and
 blk_to_logical
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
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Forgot to add f2fs mailing list.

On 11/25, Jaegeuk Kim wrote:
> This patch renames two functions like below having u64.
>  - logical_to_blk to bytes_to_blks
>  - blk_to_logical to blks_to_bytes
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index be4da52604ed..a8612c6f40ab 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1808,14 +1808,14 @@ static int get_data_block_bmap(struct inode *inode, sector_t iblock,
>  						NO_CHECK_TYPE, create);
>  }
>  
> -static inline sector_t logical_to_blk(struct inode *inode, loff_t offset)
> +static inline u64 bytes_to_blks(struct inode *inode, u64 bytes)
>  {
> -	return (offset >> inode->i_blkbits);
> +	return (bytes >> inode->i_blkbits);
>  }
>  
> -static inline loff_t blk_to_logical(struct inode *inode, sector_t blk)
> +static inline u64 blks_to_bytes(struct inode *inode, u64 blks)
>  {
> -	return (blk << inode->i_blkbits);
> +	return (blks << inode->i_blkbits);
>  }
>  
>  static int f2fs_xattr_fiemap(struct inode *inode,
> @@ -1843,7 +1843,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
>  			return err;
>  		}
>  
> -		phys = (__u64)blk_to_logical(inode, ni.blk_addr);
> +		phys = blks_to_bytes(inode, ni.blk_addr);
>  		offset = offsetof(struct f2fs_inode, i_addr) +
>  					sizeof(__le32) * (DEF_ADDRS_PER_INODE -
>  					get_inline_xattr_addrs(inode));
> @@ -1875,7 +1875,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
>  			return err;
>  		}
>  
> -		phys = (__u64)blk_to_logical(inode, ni.blk_addr);
> +		phys = blks_to_bytes(inode, ni.blk_addr);
>  		len = inode->i_sb->s_blocksize;
>  
>  		f2fs_put_page(page, 1);
> @@ -1945,18 +1945,18 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  			goto out;
>  	}
>  
> -	if (logical_to_blk(inode, len) == 0)
> -		len = blk_to_logical(inode, 1);
> +	if (bytes_to_blks(inode, len) == 0)
> +		len = blks_to_bytes(inode, 1);
>  
> -	start_blk = logical_to_blk(inode, start);
> -	last_blk = logical_to_blk(inode, start + len - 1);
> +	start_blk = bytes_to_blks(inode, start);
> +	last_blk = bytes_to_blks(inode, start + len - 1);
>  
>  next:
>  	memset(&map_bh, 0, sizeof(struct buffer_head));
>  	map_bh.b_size = len;
>  
>  	if (compr_cluster)
> -		map_bh.b_size = blk_to_logical(inode, cluster_size - 1);
> +		map_bh.b_size = blks_to_bytes(inode, cluster_size - 1);
>  
>  	ret = get_data_block(inode, start_blk, &map_bh, 0,
>  					F2FS_GET_BLOCK_FIEMAP, &next_pgofs);
> @@ -1967,7 +1967,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	if (!buffer_mapped(&map_bh)) {
>  		start_blk = next_pgofs;
>  
> -		if (blk_to_logical(inode, start_blk) < blk_to_logical(inode,
> +		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
>  						max_inode_blocks(inode)))
>  			goto prep_next;
>  
> @@ -1993,9 +1993,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		compr_cluster = false;
>  
>  
> -		logical = blk_to_logical(inode, start_blk - 1);
> -		phys = blk_to_logical(inode, map_bh.b_blocknr);
> -		size = blk_to_logical(inode, cluster_size);
> +		logical = blks_to_bytes(inode, start_blk - 1);
> +		phys = blks_to_bytes(inode, map_bh.b_blocknr);
> +		size = blks_to_bytes(inode, cluster_size);
>  
>  		flags |= FIEMAP_EXTENT_ENCODED;
>  
> @@ -2013,14 +2013,14 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		goto prep_next;
>  	}
>  
> -	logical = blk_to_logical(inode, start_blk);
> -	phys = blk_to_logical(inode, map_bh.b_blocknr);
> +	logical = blks_to_bytes(inode, start_blk);
> +	phys = blks_to_bytes(inode, map_bh.b_blocknr);
>  	size = map_bh.b_size;
>  	flags = 0;
>  	if (buffer_unwritten(&map_bh))
>  		flags = FIEMAP_EXTENT_UNWRITTEN;
>  
> -	start_blk += logical_to_blk(inode, size);
> +	start_blk += bytes_to_blks(inode, size);
>  
>  prep_next:
>  	cond_resched();
> @@ -3903,7 +3903,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>  	 * to be very smart.
>  	 */
>  	cur_lblock = 0;
> -	last_lblock = logical_to_blk(inode, i_size_read(inode));
> +	last_lblock = bytes_to_blks(inode, i_size_read(inode));
>  	len = i_size_read(inode);
>  
>  	while (cur_lblock <= last_lblock && cur_lblock < sis->max) {
> @@ -3925,7 +3925,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>  			goto err_out;
>  
>  		pblock = map_bh.b_blocknr;
> -		nr_pblocks = logical_to_blk(inode, map_bh.b_size);
> +		nr_pblocks = bytes_to_blks(inode, map_bh.b_size);
>  
>  		if (cur_lblock + nr_pblocks >= sis->max)
>  			nr_pblocks = sis->max - cur_lblock;
> -- 
> 2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
