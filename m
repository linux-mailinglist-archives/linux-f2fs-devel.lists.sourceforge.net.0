Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E872C9644
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 05:09:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjwzD-0007R7-Jl; Tue, 01 Dec 2020 04:09:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kjwz8-0007Qk-PT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YXWXUmy8VnqQOFw+dBpKwfPaZd0e7QZQ0IRCFArdx5E=; b=K6aIUo1Mpx+S5evuteVSfIFYuk
 udkBmyjn95vnG/A1HxQravABbi5qtqTOfZ8f4e1XUTtQPk+kq/fyS19KDEWvotjYiEbLjSNssHQca
 xoYx2vcFTQNBuGulGlxs8oRhvFGkiFPAac3t738+13SvD8PpYvZrT6GdSWBI+ygz7HLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YXWXUmy8VnqQOFw+dBpKwfPaZd0e7QZQ0IRCFArdx5E=; b=PspKOQA2GEGDPCr2EF+/7QqTET
 7d8MN9HaAiDO9yWbC+CmF5cwhlQLDHIpnJ0zpyqisQKQ0L/MU8rAr90LqnfOOMapBB4zUpdkeGqAj
 CAegrK+SI1HocOjrIv59SlH5BiArySQELteF7/RU+k0v32p5jzYLI9xUuddDOS4/+K1c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjwyu-00DJyN-Um
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:09:50 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2440820725;
 Tue,  1 Dec 2020 04:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606795766;
 bh=BAgEpJ6BGLuJ3PtlCbRXJw8ygfJO07p8H3Ol4SFC2FA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vhD0TvkjlBXXwg0prphXu/VmRrzM5lipQjA+/zpaJ1jlQ4oZZ7/rmsQXcj9IHabX+
 4OTLGIsC59PvlhMWrf7sCeZUiC6iR4Wfh1TOGQGeyNugEyHyKrHZCKYzSRWIszlOOS
 MYE/PrxSgFG39nzMSlq7rXbCU+1mory9ryJgdQ14=
Date: Mon, 30 Nov 2020 20:09:24 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, kernel-team@android.com
Message-ID: <20201201040924.GB3858797@google.com>
References: <20201126022416.3068426-1-jaegeuk@kernel.org>
 <20201126022416.3068426-4-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126022416.3068426-4-jaegeuk@kernel.org>
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
X-Headers-End: 1kjwyu-00DJyN-Um
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: remove buffer_head which has
 32bits limit
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
Cc: Light Hsieh <Light.Hsieh@mediatek.com>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25, Jaegeuk Kim wrote:
> This patch removes buffer_head dependency when getting block addresses.
> Light reported there's a 32bit issue in f2fs_fiemap where map_bh.b_size is
> 32bits while len is 64bits given by user. This will give wrong length to
> f2fs_map_block.
> 
> Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 76 ++++++++++++++++++++++----------------------------
>  1 file changed, 34 insertions(+), 42 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index e49c14ccfafe..bfe0d787c9e6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1783,15 +1783,6 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
>  	return err;
>  }
>  
> -static int get_data_block(struct inode *inode, sector_t iblock,
> -			struct buffer_head *bh_result, int create, int flag,
> -			pgoff_t *next_pgofs)
> -{
> -	return __get_data_block(inode, iblock, bh_result, create,
> -							flag, next_pgofs,
> -							NO_CHECK_TYPE, create);
> -}
> -
>  static int get_data_block_dio_write(struct inode *inode, sector_t iblock,
>  			struct buffer_head *bh_result, int create)
>  {
> @@ -1810,14 +1801,6 @@ static int get_data_block_dio(struct inode *inode, sector_t iblock,
>  				false);
>  }
>  
> -static int get_data_block_bmap(struct inode *inode, sector_t iblock,
> -			struct buffer_head *bh_result, int create)
> -{
> -	return __get_data_block(inode, iblock, bh_result, create,
> -						F2FS_GET_BLOCK_BMAP, NULL,
> -						NO_CHECK_TYPE, create);
> -}
> -
>  static int f2fs_xattr_fiemap(struct inode *inode,
>  				struct fiemap_extent_info *fieinfo)
>  {
> @@ -1913,7 +1896,7 @@ static loff_t max_inode_blocks(struct inode *inode)
>  int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		u64 start, u64 len)
>  {
> -	struct buffer_head map_bh;
> +	struct f2fs_map_blocks map;
>  	sector_t start_blk, last_blk;
>  	pgoff_t next_pgofs;
>  	u64 logical = 0, phys = 0, size = 0;
> @@ -1952,19 +1935,21 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	last_blk = bytes_to_blks(inode, start + len - 1);
>  
>  next:
> -	memset(&map_bh, 0, sizeof(struct buffer_head));
> -	map_bh.b_size = len;
> +	memset(&map, 0, sizeof(map));
> +	map.m_lblk = start_blk;
> +	map.m_len = bytes_to_blks(inode, len);
> +	map.m_next_pgofs = &next_pgofs;
> +	map.m_seg_type = NO_CHECK_TYPE;
>  
>  	if (compr_cluster)
> -		map_bh.b_size = blks_to_bytes(inode, cluster_size - 1);
> +		map.m_len = cluster_size - 1;
>  
> -	ret = get_data_block(inode, start_blk, &map_bh, 0,
> -					F2FS_GET_BLOCK_FIEMAP, &next_pgofs);
> +	ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
>  	if (ret)
>  		goto out;
>  
>  	/* HOLE */
> -	if (!buffer_mapped(&map_bh)) {
> +	if (!(map.m_flags & F2FS_MAP_FLAGS)) {
>  		start_blk = next_pgofs;
>  
>  		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
> @@ -1994,7 +1979,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  
>  
>  		logical = blks_to_bytes(inode, start_blk - 1);
> -		phys = blks_to_bytes(inode, map_bh.b_blocknr);
> +		phys = blks_to_bytes(inode, map.m_pblk);
>  		size = blks_to_bytes(inode, cluster_size);
>  
>  		flags |= FIEMAP_EXTENT_ENCODED;
> @@ -2007,17 +1992,17 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		goto prep_next;
>  	}
>  
> -	if (map_bh.b_blocknr == COMPRESS_ADDR) {
> +	if (map.m_pblk == COMPRESS_ADDR) {
>  		compr_cluster = true;
>  		start_blk++;
>  		goto prep_next;
>  	}
>  
>  	logical = blks_to_bytes(inode, start_blk);
> -	phys = blks_to_bytes(inode, map_bh.b_blocknr);
> -	size = map_bh.b_size;
> +	phys = blks_to_bytes(inode, map.m_pblk);
> +	size = blks_to_bytes(inode, map.m_len);
>  	flags = 0;
> -	if (buffer_unwritten(&map_bh))
> +	if (map.m_flags & F2FS_MAP_UNWRITTEN)
>  		flags = FIEMAP_EXTENT_UNWRITTEN;
>  
>  	start_blk += bytes_to_blks(inode, size);
> @@ -3797,9 +3782,6 @@ static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
>  static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
>  {
>  	struct inode *inode = mapping->host;
> -	struct buffer_head tmp = {
> -		.b_size = i_blocksize(inode),
> -	};
>  	sector_t blknr = 0;
>  
>  	if (f2fs_has_inline_data(inode))
> @@ -3816,8 +3798,16 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
>  	if (f2fs_compressed_file(inode)) {
>  		blknr = f2fs_bmap_compress(inode, block);
>  	} else {
> -		if (!get_data_block_bmap(inode, block, &tmp, 0))
> -			blknr = tmp.b_blocknr;
> +		struct f2fs_map_blocks map;
> +
> +		memset(&map, 0, sizeof(map));
> +		map.m_lblk = block;
> +		map.m_len = 1;
> +		map.m_next_pgofs = NULL;
> +		map.m_seg_type = NO_CHECK_TYPE;
> +
> +		if (!f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_BMAP))
> +			blknr = map.m_pblk;
>  	}
>  out:
>  	trace_f2fs_bmap(inode, block, blknr);
> @@ -3905,25 +3895,27 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>  	len = i_size_read(inode);
>  
>  	while (cur_lblock <= last_lblock && cur_lblock < sis->max) {
> -		struct buffer_head map_bh;
> +		struct f2fs_map_blocks map;
>  		pgoff_t next_pgofs;
>  
>  		cond_resched();
>  
> -		memset(&map_bh, 0, sizeof(struct buffer_head));
> -		map_bh.b_size = len - blks_to_bytes(inode, cur_lblock);
> +		memset(&map, 0, sizeof(map));
> +		map.m_lblk = cur_lblock;
> +		map.m_len = bytes_to_blks(inode, len) - cur_lblock;
> +		map.m_next_pgofs = &next_pgofs;
> +		map.m_seg_type = NO_CHECK_TYPE;
>  
> -		ret = get_data_block(inode, cur_lblock, &map_bh, 0,
> -					F2FS_GET_BLOCK_FIEMAP, &next_pgofs);
> +		ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
>  		if (ret)
>  			goto err_out;
>  
>  		/* hole */
> -		if (!buffer_mapped(&map_bh))
> +		if (!(map.m_flags & F2FS_MAP_FLAGS))
>  			goto err_out;
>  
> -		pblock = map_bh.b_blocknr;
> -		nr_pblocks = bytes_to_blks(inode, map_bh.b_size);
> +		pblock = map.m_pblk;
> +		nr_pblocks = map.m_len;
>  
>  		if (cur_lblock + nr_pblocks >= sis->max)
>  			nr_pblocks = sis->max - cur_lblock;
> -- 
> 2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
