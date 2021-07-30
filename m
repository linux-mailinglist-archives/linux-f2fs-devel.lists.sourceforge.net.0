Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0BB3DBEEF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jul 2021 21:20:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9Y3R-0008W2-F2; Fri, 30 Jul 2021 19:20:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m9Y3Q-0008Vv-3N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 19:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MaumBEObCIhmYf3MteHPcB+TcZ1xeAJv2577w3OsMzk=; b=Pd3OW4t8DpfGZUGFWJFEdeST2w
 LvOhsZ2AmL/30ABO7DBsIM9yaBxjBWV0cb5Hv/B/nBYVK1FSxPER+iaWRH86JnZKmwYnMja6ENWTZ
 NG4NbbZduzMPofj3n45YPg4CraTQn/S3h6PjHl/vzJww7K5lONk4Bk4WnKHs7jBz3Dj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MaumBEObCIhmYf3MteHPcB+TcZ1xeAJv2577w3OsMzk=; b=kUMZ9u04VEa3/Voh7V/NhVkmpF
 SXlPVn3lA1Bz2vnU7q32pHV0Wkq53Cbftw26O/YCfkbpSgv9q3wgzXDMqQ6LwejqLjMuXo18C9ZEl
 bPxiL+zzAylXXEZZD1P05xqF7SETYJAXwoD9s5ICMLV+kkskP06oe6i0emUcqrLkSKZ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9Y3I-0005X7-OV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 19:20:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F49B60F5C;
 Fri, 30 Jul 2021 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627672804;
 bh=1p/h3NwoKprkqzAsrD3kTjaDOQeqtfu/9eeKVxT/q90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T8zx94jXppdwT+wNlTdn3Vz0wMsYuWdJubmLP29SsGT4PhVG9LZhkkihbB72qYsqx
 JGVO+qaoVqIJZxhWS2w2Cma/nalJQfHdYw2Td/xa8aHB949Drcknyemf2Qi7jAORCm
 is7asl5qKBeFJjqD2zeuoVNRmr+mq3HfJzLkohI2p/JjMTW9dRGTddbw2Cl1HQi5PT
 WFQPJ1tOwnOeOvNTPPzAoD/F87ltJ84C6DzweYE/bayOBW2+e+kTtL27dKusFtt+eq
 PGKORKAK7d1NKjUipmGPAReDka1Z8VS+A1Cqpd2f40pt7eMmRCE8+U3jCXiTd381Xk
 T8zrtD8oVxtgw==
Date: Fri, 30 Jul 2021 12:20:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQRQ4kHvdRTBnb10@google.com>
References: <20210707015815.1978-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707015815.1978-1-chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9Y3I-0005X7-OV
Subject: Re: [f2fs-dev] [RFC NO MERGE] f2fs: extent cache: support unaligned
 extent
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/07, Chao Yu wrote:
> Compressed inode may suffer read performance issue due to it can not
> use extent cache, so I propose to add this unaligned extent support
> to improve it.
> 
> Currently, it only works in readonly format f2fs image.
> 
> Unaligned extent: in one compressed cluster, physical block number
> will be less than logical block number, so we add an extra physical
> block length in extent info in order to indicate such extent status.
> 
> The idea is if one whole cluster blocks are contiguous physically,
> once its mapping info was readed at first time, we will cache an
> unaligned (or aligned) extent info entry in extent cache, it expects
> that the mapping info will be hitted when rereading cluster.
> 
> Merge policy:
> - Aligned extents can be merged.
> - Aligned extent and unaligned extent can not be merged.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> 
> I just post this for comments, it passes compiling, w/o any test.
> 
>  fs/f2fs/compress.c     | 25 ++++++++++++
>  fs/f2fs/data.c         | 38 +++++++++++++-----
>  fs/f2fs/extent_cache.c | 90 +++++++++++++++++++++++++++++++++++++-----
>  fs/f2fs/f2fs.h         | 33 +++++++++++++---
>  fs/f2fs/node.c         | 20 ++++++++++
>  5 files changed, 181 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 455561826c7d..f072ac33eba5 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1666,6 +1666,31 @@ void f2fs_put_page_dic(struct page *page)
>  	f2fs_put_dic(dic);
>  }
>  
> +/*
> + * check whether cluster blocks are contiguous, and add extent cache entry
> + * only if cluster blocks are logically and physically contiguous.
> + */
> +int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
> +{
> +	bool compressed = f2fs_data_blkaddr(dn) == COMPRESS_ADDR;
> +	int i = compressed ? 1 : 0;
> +	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
> +						dn->ofs_in_node + i);
> +
> +	for (i += 1; i < F2FS_I(dn->inode)->i_cluster_size; i++) {
> +		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
> +						dn->ofs_in_node + i);
> +
> +		if (!__is_valid_data_blkaddr(blkaddr))
> +			break;
> +		if (first_blkaddr + i - 1 != blkaddr)
> +			return 0;
> +	}
> +
> +	return compressed ? i - 1 : i;
> +}
> +
> +
>  const struct address_space_operations f2fs_compress_aops = {
>  	.releasepage = f2fs_release_page,
>  	.invalidatepage = f2fs_invalidate_page,
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d2cf48c5a2e4..9572d78da4d7 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2115,6 +2115,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  	sector_t last_block_in_file;
>  	const unsigned blocksize = blks_to_bytes(inode, 1);
>  	struct decompress_io_ctx *dic = NULL;
> +	struct extent_info_unaligned eiu;
> +	bool extent_cache = false;
>  	int i;
>  	int ret = 0;
>  
> @@ -2145,18 +2147,26 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  	if (f2fs_cluster_is_empty(cc))
>  		goto out;
>  
> -	set_new_dnode(&dn, inode, NULL, NULL, 0);
> -	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> -	if (ret)
> -		goto out;
> +	if (f2fs_lookup_extent_cache_unaligned(inode, start_idx, &eiu))
> +		extent_cache = true;

Is there any race condition between the address in extent_cache and the one in
dnode? I feel that we could synchronize it by locking its dnode block.

>  
> -	f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
> +	if (!extent_cache) {
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> +		if (ret)
> +			goto out;
> +
> +		f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
> +	}
>  
>  	for (i = 1; i < cc->cluster_size; i++) {
>  		block_t blkaddr;
>  
> -		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> -						dn.ofs_in_node + i);
> +		if (extent_cache)
> +			blkaddr = eiu.ei.blk + i;
> +		else
> +			blkaddr = data_blkaddr(dn.inode, dn.node_page,
> +							dn.ofs_in_node + i);
>  
>  		if (!__is_valid_data_blkaddr(blkaddr))
>  			break;
> @@ -2166,6 +2176,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  			goto out_put_dnode;
>  		}
>  		cc->nr_cpages++;
> +
> +		if (extent_cache && i >= eiu.plen)
> +			break;
>  	}
>  
>  	/* nothing to decompress */
> @@ -2185,7 +2198,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		block_t blkaddr;
>  		struct bio_post_read_ctx *ctx;
>  
> -		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> +		if (extent_cache)
> +			blkaddr = eiu.plen + i + 1;
> +		else
> +			blkaddr = data_blkaddr(dn.inode, dn.node_page,
>  						dn.ofs_in_node + i + 1);
>  
>  		f2fs_wait_on_block_writeback(inode, blkaddr);
> @@ -2231,13 +2247,15 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		*last_block_in_bio = blkaddr;
>  	}
>  
> -	f2fs_put_dnode(&dn);
> +	if (!extent_cache)
> +		f2fs_put_dnode(&dn);
>  
>  	*bio_ret = bio;
>  	return 0;
>  
>  out_put_dnode:
> -	f2fs_put_dnode(&dn);
> +	if (!extent_cache)
> +		f2fs_put_dnode(&dn);
>  out:
>  	for (i = 0; i < cc->cluster_size; i++) {
>  		if (cc->rpages[i]) {
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 3ebf976a682d..db9de95f90dc 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -235,7 +235,7 @@ static struct kmem_cache *extent_node_slab;
>  static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
>  				struct extent_tree *et, struct extent_info *ei,
>  				struct rb_node *parent, struct rb_node **p,
> -				bool leftmost)
> +				bool leftmost, bool unaligned)
>  {
>  	struct extent_node *en;
>  
> @@ -247,6 +247,11 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
>  	INIT_LIST_HEAD(&en->list);
>  	en->et = et;
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (unaligned)
> +		en->plen = ((struct extent_info_unaligned *)ei)->plen;
> +#endif
> +
>  	rb_link_node(&en->rb_node, parent, p);
>  	rb_insert_color_cached(&en->rb_node, &et->root, leftmost);
>  	atomic_inc(&et->node_cnt);
> @@ -320,7 +325,7 @@ static struct extent_node *__init_extent_tree(struct f2fs_sb_info *sbi,
>  	struct rb_node **p = &et->root.rb_root.rb_node;
>  	struct extent_node *en;
>  
> -	en = __attach_extent_node(sbi, et, ei, NULL, p, true);
> +	en = __attach_extent_node(sbi, et, ei, NULL, p, true, false);
>  	if (!en)
>  		return NULL;
>  
> @@ -439,6 +444,17 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
>  		stat_inc_rbtree_node_hit(sbi);
>  
>  	*ei = en->ei;
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
> +				!f2fs_sb_has_readonly(sbi)) {
> +		struct extent_info_unaligned *eiu =
> +				(struct extent_info_unaligned *)ei;
> +
> +		eiu->plen = en->plen;
> +	}
> +#endif
> +
>  	spin_lock(&sbi->extent_lock);
>  	if (!list_empty(&en->list)) {
>  		list_move_tail(&en->list, &sbi->extent_list);
> @@ -457,17 +473,18 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
>  static struct extent_node *__try_merge_extent_node(struct f2fs_sb_info *sbi,
>  				struct extent_tree *et, struct extent_info *ei,
>  				struct extent_node *prev_ex,
> -				struct extent_node *next_ex)
> +				struct extent_node *next_ex,
> +				bool unaligned)
>  {
>  	struct extent_node *en = NULL;
>  
> -	if (prev_ex && __is_back_mergeable(ei, &prev_ex->ei)) {
> +	if (prev_ex && __is_back_mergeable(ei, &prev_ex->ei, unaligned)) {
>  		prev_ex->ei.len += ei->len;
>  		ei = &prev_ex->ei;
>  		en = prev_ex;
>  	}
>  
> -	if (next_ex && __is_front_mergeable(ei, &next_ex->ei)) {
> +	if (next_ex && __is_front_mergeable(ei, &next_ex->ei, unaligned)) {
>  		next_ex->ei.fofs = ei->fofs;
>  		next_ex->ei.blk = ei->blk;
>  		next_ex->ei.len += ei->len;
> @@ -495,7 +512,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>  				struct extent_tree *et, struct extent_info *ei,
>  				struct rb_node **insert_p,
>  				struct rb_node *insert_parent,
> -				bool leftmost)
> +				bool leftmost, bool unaligned)
>  {
>  	struct rb_node **p;
>  	struct rb_node *parent = NULL;
> @@ -512,7 +529,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>  	p = f2fs_lookup_rb_tree_for_insert(sbi, &et->root, &parent,
>  						ei->fofs, &leftmost);
>  do_insert:
> -	en = __attach_extent_node(sbi, et, ei, parent, p, leftmost);
> +	en = __attach_extent_node(sbi, et, ei, parent, p, leftmost, unaligned);
>  	if (!en)
>  		return NULL;
>  
> @@ -594,7 +611,7 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
>  						end - dei.fofs + dei.blk,
>  						org_end - end);
>  				en1 = __insert_extent_tree(sbi, et, &ei,
> -							NULL, NULL, true);
> +						NULL, NULL, true, false);
>  				next_en = en1;
>  			} else {
>  				en->ei.fofs = end;
> @@ -633,9 +650,10 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
>  	if (blkaddr) {
>  
>  		set_extent_info(&ei, fofs, blkaddr, len);
> -		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
> +		if (!__try_merge_extent_node(sbi, et, &ei,
> +					prev_en, next_en, false))
>  			__insert_extent_tree(sbi, et, &ei,
> -					insert_p, insert_parent, leftmost);
> +				insert_p, insert_parent, leftmost, false);
>  
>  		/* give up extent_cache, if split and small updates happen */
>  		if (dei.len >= 1 &&
> @@ -661,6 +679,47 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
>  		f2fs_mark_inode_dirty_sync(inode, true);
>  }
>  
> +void f2fs_update_extent_tree_range_unaligned(struct inode *inode,
> +				pgoff_t fofs, block_t blkaddr, unsigned int llen,
> +				unsigned int plen)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct extent_tree *et = F2FS_I(inode)->extent_tree;
> +	struct extent_node *en = NULL;
> +	struct extent_node *prev_en = NULL, *next_en = NULL;
> +	struct extent_info_unaligned eiu;
> +	struct rb_node **insert_p = NULL, *insert_parent = NULL;
> +	bool leftmost = false;
> +
> +	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen);
> +
> +	write_lock(&et->lock);
> +
> +	if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
> +		write_unlock(&et->lock);
> +		return;
> +	}
> +
> +	en = (struct extent_node *)f2fs_lookup_rb_tree_ret(&et->root,
> +				(struct rb_entry *)et->cached_en, fofs,
> +				(struct rb_entry **)&prev_en,
> +				(struct rb_entry **)&next_en,
> +				&insert_p, &insert_parent, false,
> +				&leftmost);
> +	f2fs_bug_on(sbi, en);
> +
> +	set_extent_info(&eiu.ei, fofs, blkaddr, llen);
> +	eiu.plen = plen;
> +
> +	if (!__try_merge_extent_node(sbi, et, (struct extent_info *)&eiu,
> +				prev_en, next_en, true))
> +		__insert_extent_tree(sbi, et, (struct extent_info *)&eiu,
> +				insert_p, insert_parent, leftmost, true);
> +
> +	write_unlock(&et->lock);
> +}
> +
> +
>  unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
>  {
>  	struct extent_tree *et, *next;
> @@ -818,6 +877,17 @@ bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
>  	return f2fs_lookup_extent_tree(inode, pgofs, ei);
>  }
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +bool f2fs_lookup_extent_cache_unaligned(struct inode *inode, pgoff_t pgofs,
> +					struct extent_info_unaligned *eiu)
> +{
> +	if (!f2fs_may_extent_tree(inode))
> +		return false;
> +
> +	return f2fs_lookup_extent_tree(inode, pgofs, (struct extent_info *)eiu);
> +}
> +#endif
> +
>  void f2fs_update_extent_cache(struct dnode_of_data *dn)
>  {
>  	pgoff_t fofs;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0fe239dd50f4..3a02642a26d4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -578,11 +578,21 @@ struct extent_info {
>  	u32 blk;			/* start block address of the extent */
>  };
>  
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +struct extent_info_unaligned {
> +	struct extent_info ei;		/* extent info */
> +	unsigned int plen;		/* physical extent length of compressed blocks */
> +};
> +#endif
> +
>  struct extent_node {
>  	struct rb_node rb_node;		/* rb node located in rb-tree */
>  	struct extent_info ei;		/* extent info */
>  	struct list_head list;		/* node in global extent list of sbi */
>  	struct extent_tree *et;		/* extent tree pointer */
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	unsigned int plen;		/* physical extent length of compressed blocks */
> +#endif
>  };
>  
>  struct extent_tree {
> @@ -817,22 +827,29 @@ static inline bool __is_discard_front_mergeable(struct discard_info *cur,
>  }
>  
>  static inline bool __is_extent_mergeable(struct extent_info *back,
> -						struct extent_info *front)
> +				struct extent_info *front, bool unaligned)
>  {
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	struct extent_info_unaligned *be = (struct extent_info_unaligned *)back;
> +	struct extent_info_unaligned *fe = (struct extent_info_unaligned *)front;
> +
> +	if (!unaligned || be->ei.len != be->plen || fe->ei.len != fe->plen)
> +		return false;
> +#endif
>  	return (back->fofs + back->len == front->fofs &&
>  			back->blk + back->len == front->blk);
>  }
>  
>  static inline bool __is_back_mergeable(struct extent_info *cur,
> -						struct extent_info *back)
> +				struct extent_info *back, bool unaligned)
>  {
> -	return __is_extent_mergeable(back, cur);
> +	return __is_extent_mergeable(back, cur, unaligned);
>  }
>  
>  static inline bool __is_front_mergeable(struct extent_info *cur,
> -						struct extent_info *front)
> +				struct extent_info *front, bool unaligned)
>  {
> -	return __is_extent_mergeable(cur, front);
> +	return __is_extent_mergeable(cur, front, unaligned);
>  }
>  
>  extern void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync);
> @@ -3972,6 +3989,9 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
>  		bool force, bool *leftmost);
>  bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
>  				struct rb_root_cached *root, bool check_key);
> +void f2fs_update_extent_tree_range_unaligned(struct inode *inode,
> +				pgoff_t fofs, block_t blkaddr, unsigned int llen,
> +				unsigned int plen);
>  unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
>  void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
>  void f2fs_drop_extent_tree(struct inode *inode);
> @@ -3979,6 +3999,8 @@ unsigned int f2fs_destroy_extent_node(struct inode *inode);
>  void f2fs_destroy_extent_tree(struct inode *inode);
>  bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
>  			struct extent_info *ei);
> +bool f2fs_lookup_extent_cache_unaligned(struct inode *inode, pgoff_t pgofs,
> +					struct extent_info_unaligned *eiu);
>  void f2fs_update_extent_cache(struct dnode_of_data *dn);
>  void f2fs_update_extent_cache_range(struct dnode_of_data *dn,
>  			pgoff_t fofs, block_t blkaddr, unsigned int len);
> @@ -4055,6 +4077,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
>  void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed);
>  void f2fs_put_page_dic(struct page *page);
> +int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn);
>  int f2fs_init_compress_ctx(struct compress_ctx *cc);
>  void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
>  void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index dd611efa8aa4..7be2b01caa2a 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -832,6 +832,26 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
>  	dn->ofs_in_node = offset[level];
>  	dn->node_page = npage[level];
>  	dn->data_blkaddr = f2fs_data_blkaddr(dn);
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
> +			!f2fs_sb_has_readonly(sbi)) {
> +		int blknum = f2fs_cluster_blocks_are_contiguous(dn);
> +
> +		if (blknum) {
> +			block_t blkaddr = f2fs_data_blkaddr(dn);
> +
> +			if (blkaddr == COMPRESS_ADDR)
> +				blkaddr = data_blkaddr(dn->inode, dn->node_page,
> +							dn->ofs_in_node + 1);
> +
> +			f2fs_update_extent_tree_range_unaligned(dn->inode,
> +					index, blkaddr,
> +					F2FS_I(dn->inode)->i_cluster_size,
> +					blknum);
> +		}
> +	}
> +#endif
>  	return 0;
>  
>  release_pages:
> -- 
> 2.22.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
