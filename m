Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CE82C9649
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 05:10:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjwzM-0003lA-FF; Tue, 01 Dec 2020 04:10:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kjwzK-0003ku-TE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ucnd2QHGe6a82lKNJ42bzAN/ufOa7Sx/v9GvzYNnBqs=; b=hxNJMBPCRe+xVt9DdK3wUT9vaS
 TsQ9jPeNobdpgb+0qyKqqPbQx3F+CrCIw0Q1iCZ1OdPAgsuzuKv32TEmIL7LzUD+XTVe0kCYud7Eb
 mtZ1ydhAlwVnwBoCVv1kojov9ME1DTpH7rKkncCWIUT5hwU7IzUuXzDGFlDeajxUNB6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ucnd2QHGe6a82lKNJ42bzAN/ufOa7Sx/v9GvzYNnBqs=; b=bv4SDhFYeKKOoFGv4mxLcHEzml
 ek99cvlLVUfj+Bab82U0YoB0ViNt42SgV8Cq9p8V8hV4CEkkHuPoL+xTuq3QHZcjFhW4Kh1Tef1MY
 mSDA50EdGfVhtjS4KBTuI8ZNbSZz16QoVKI0ExpQDEQ0w2MQt829WBQsh/veFudlwfc8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjwzG-00DK1J-E2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 04:10:02 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85CB8207FF;
 Tue,  1 Dec 2020 04:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606795785;
 bh=alV+iNbD6jv9Jf4on2H+QdoZhJwJ7hF8xZXgwLkI8m8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wLR20K2t81nEaaAf7p5Bc4BU8mTBWjknGAvTGoRBA/YOURmhOX96mnZUGco5o+5rj
 9xBlB6JkM5t40ajj7uX84kUlmLCubL7Qf9+1b1LdiMukdNOBmRxNFpI5j7c1LDOOKa
 zDEK1mfeDMj+pCwIyDh09d6BktVndeWbxMOIs8GY=
Date: Mon, 30 Nov 2020 20:09:44 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, kernel-team@android.com
Message-ID: <20201201040944.GD3858797@google.com>
References: <20201126022416.3068426-1-jaegeuk@kernel.org>
 <20201126022416.3068426-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126022416.3068426-2-jaegeuk@kernel.org>
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
X-Headers-End: 1kjwzG-00DK1J-E2
Subject: Re: [f2fs-dev] [PATCH 2/4] f2fs: use new conversion functions
 between blks and bytes
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

On 11/25, Jaegeuk Kim wrote:
> This patch cleans up blks and bytes conversions.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c | 46 +++++++++++++++++++++-------------------------
>  1 file changed, 21 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a8612c6f40ab..a84e5bc09337 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1750,6 +1750,16 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
>  	return true;
>  }
>  
> +static inline u64 bytes_to_blks(struct inode *inode, u64 bytes)
> +{
> +	return (bytes >> inode->i_blkbits);
> +}
> +
> +static inline u64 blks_to_bytes(struct inode *inode, u64 blks)
> +{
> +	return (blks << inode->i_blkbits);
> +}
> +
>  static int __get_data_block(struct inode *inode, sector_t iblock,
>  			struct buffer_head *bh, int create, int flag,
>  			pgoff_t *next_pgofs, int seg_type, bool may_write)
> @@ -1758,7 +1768,7 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
>  	int err;
>  
>  	map.m_lblk = iblock;
> -	map.m_len = bh->b_size >> inode->i_blkbits;
> +	map.m_len = bytes_to_blks(inode, bh->b_size);
>  	map.m_next_pgofs = next_pgofs;
>  	map.m_next_extent = NULL;
>  	map.m_seg_type = seg_type;
> @@ -1768,7 +1778,7 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
>  	if (!err) {
>  		map_bh(bh, inode->i_sb, map.m_pblk);
>  		bh->b_state = (bh->b_state & ~F2FS_MAP_FLAGS) | map.m_flags;
> -		bh->b_size = (u64)map.m_len << inode->i_blkbits;
> +		bh->b_size = blks_to_bytes(inode, map.m_len);
>  	}
>  	return err;
>  }
> @@ -1808,16 +1818,6 @@ static int get_data_block_bmap(struct inode *inode, sector_t iblock,
>  						NO_CHECK_TYPE, create);
>  }
>  
> -static inline u64 bytes_to_blks(struct inode *inode, u64 bytes)
> -{
> -	return (bytes >> inode->i_blkbits);
> -}
> -
> -static inline u64 blks_to_bytes(struct inode *inode, u64 blks)
> -{
> -	return (blks << inode->i_blkbits);
> -}
> -
>  static int f2fs_xattr_fiemap(struct inode *inode,
>  				struct fiemap_extent_info *fieinfo)
>  {
> @@ -2053,8 +2053,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  					bool is_readahead)
>  {
>  	struct bio *bio = *bio_ret;
> -	const unsigned blkbits = inode->i_blkbits;
> -	const unsigned blocksize = 1 << blkbits;
> +	const unsigned blocksize = blks_to_bytes(inode, 1);
>  	sector_t block_in_file;
>  	sector_t last_block;
>  	sector_t last_block_in_file;
> @@ -2063,8 +2062,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  
>  	block_in_file = (sector_t)page_index(page);
>  	last_block = block_in_file + nr_pages;
> -	last_block_in_file = (f2fs_readpage_limit(inode) + blocksize - 1) >>
> -							blkbits;
> +	last_block_in_file = bytes_to_blks(inode,
> +			f2fs_readpage_limit(inode) + blocksize - 1);
>  	if (last_block > last_block_in_file)
>  		last_block = last_block_in_file;
>  
> @@ -2177,16 +2176,15 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  	struct bio *bio = *bio_ret;
>  	unsigned int start_idx = cc->cluster_idx << cc->log_cluster_size;
>  	sector_t last_block_in_file;
> -	const unsigned blkbits = inode->i_blkbits;
> -	const unsigned blocksize = 1 << blkbits;
> +	const unsigned blocksize = blks_to_bytes(inode, 1);
>  	struct decompress_io_ctx *dic = NULL;
>  	int i;
>  	int ret = 0;
>  
>  	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
>  
> -	last_block_in_file = (f2fs_readpage_limit(inode) +
> -					blocksize - 1) >> blkbits;
> +	last_block_in_file = bytes_to_blks(inode,
> +			f2fs_readpage_limit(inode) + blocksize - 1);
>  
>  	/* get rid of pages beyond EOF */
>  	for (i = 0; i < cc->cluster_size; i++) {
> @@ -3968,7 +3966,6 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  	struct inode *inode = mapping->host;
>  	unsigned blocks_per_page;
>  	unsigned long page_no;
> -	unsigned blkbits;
>  	sector_t probe_block;
>  	sector_t last_block;
>  	sector_t lowest_block = -1;
> @@ -3979,8 +3976,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  	if (PAGE_SIZE == F2FS_BLKSIZE)
>  		return check_swap_activate_fast(sis, swap_file, span);
>  
> -	blkbits = inode->i_blkbits;
> -	blocks_per_page = PAGE_SIZE >> blkbits;
> +	blocks_per_page = bytes_to_blks(inode, PAGE_SIZE);
>  
>  	/*
>  	 * Map all the blocks into the extent list.  This code doesn't try
> @@ -3988,7 +3984,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  	 */
>  	probe_block = 0;
>  	page_no = 0;
> -	last_block = i_size_read(inode) >> blkbits;
> +	last_block = bytes_to_blks(inode, i_size_read(inode));
>  	while ((probe_block + blocks_per_page) <= last_block &&
>  			page_no < sis->max) {
>  		unsigned block_in_page;
> @@ -4028,7 +4024,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  			}
>  		}
>  
> -		first_block >>= (PAGE_SHIFT - blkbits);
> +		first_block >>= (PAGE_SHIFT - inode->i_blkbits);
>  		if (page_no) {	/* exclude the header page */
>  			if (first_block < lowest_block)
>  				lowest_block = first_block;
> -- 
> 2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
