Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A25673E0AF2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Aug 2021 01:45:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBQZf-0008Vr-De; Wed, 04 Aug 2021 23:45:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mBQZd-0008Vk-OW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 23:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cYEhl5qgbxa4Ug7LJUMiSFssddr3N7T9SbML5zesNG4=; b=a+NjdVbIQlcqE9+mWT0hw19Oe5
 ASyfBQpwhDxlsOOTF7dn2oBD+iVlXdHlBuC0KbiwN33aZE5JCJBYYhc4NDxPuFXG+wWdg9Ngh0GjL
 xHzFQ7Do7pGN9XVNEZMDurpab7AKzdCajYKdzoPNKoVlMvRzxN5k1tlBKru7nars+Pvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cYEhl5qgbxa4Ug7LJUMiSFssddr3N7T9SbML5zesNG4=; b=g1XM5QyjOJ8yY877DFQP3/Yuv1
 Izh6OeKKHUFysECSW9YeTreIOsHDxYJ351lxEz/NQF/m+xuBOeomlkI+ekWs7b/5OWWRgdlvUgiXY
 KgdsG2KSnVQPvtmkYd9xR768YaH5yov0+P7QxQQblqEWbSKDnq1ypPFz+mMOYhI/DvPw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBQZR-00CcRH-TM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 23:45:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F6F960EE9;
 Wed,  4 Aug 2021 23:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628120704;
 bh=D9CL3kNBNxCBUvm3EdiBQx+kby/IM7nwzOqlCtK4QJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DokLvNcUmRzIKHmCagrXB61ebzqNfgGoMb9t0mI5DTbWWimKsv/Wu5sXeo2uRlXqF
 G9wJdKayPVQpapFKQWzopBoSW6af2l8bTEsz0sEA8l9kmW1fMqBv6vIMvxffbzjg1G
 7/gIXLykFMitCpBLpZFlEsLaG2Vt+fBdQ/ldOQjCMxbqvqcf1il6G1hdmDzShXkK5l
 FbfdB2/5tvaMrub5VdtUzrO7MoW9RUfP3DfnSDPgxTB9OuVfFaosdAA29dOk+HeM4s
 F2blph4TUn0f9JcCv9b+mYzNIYiiS0tENRIAO9EB1OKWN4cgOY6X++l49QA+C2vXEJ
 KPBZU172ARRUw==
Date: Wed, 4 Aug 2021 16:45:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQsmfm3ibU6bhvZr@google.com>
References: <20210804022348.1414543-1-chao@kernel.org>
 <YQsIj0wKk6YbN/FJ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQsIj0wKk6YbN/FJ@google.com>
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
X-Headers-End: 1mBQZR-00CcRH-TM
Subject: Re: [f2fs-dev] [RFC v3] f2fs: extent cache: support unaligned extent
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Chao Yu <chao.yu@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Chao,

How about this?
https://github.com/jaegeuk/f2fs/commit/d6bbe121bc24dfabfedc07ba7cb6e921fb70ece0

I'm digging one bug in __insert_extent_tree w/ the patch tho.

On 08/04, Jaegeuk Kim wrote:
> On 08/04, Chao Yu wrote:
> > Compressed inode may suffer read performance issue due to it can not
> > use extent cache, so I propose to add this unaligned extent support
> > to improve it.
> > 
> > Currently, it only works in readonly format f2fs image.
> > 
> > Unaligned extent: in one compressed cluster, physical block number
> > will be less than logical block number, so we add an extra physical
> > block length in extent info in order to indicate such extent status.
> > 
> > The idea is if one whole cluster blocks are contiguous physically,
> > once its mapping info was readed at first time, we will cache an
> > unaligned (or aligned) extent info entry in extent cache, it expects
> > that the mapping info will be hitted when rereading cluster.
> > 
> > Merge policy:
> > - Aligned extents can be merged.
> > - Aligned extent and unaligned extent can not be merged.
> > 
> > Signed-off-by: Chao Yu <chao@kernel.org>
> > ---
> > v3:
> > - avoid CONFIG_F2FS_FS_COMPRESSION as much as possible
> > - clean up codes
> >  fs/f2fs/compress.c     | 24 ++++++++++++
> >  fs/f2fs/data.c         | 28 +++++++++++---
> >  fs/f2fs/extent_cache.c | 88 +++++++++++++++++++++++++++++++++++++-----
> >  fs/f2fs/f2fs.h         | 42 +++++++++++++++++---
> >  fs/f2fs/node.c         | 18 +++++++++
> >  5 files changed, 179 insertions(+), 21 deletions(-)
> > 
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 4aa166d3d9bf..296ff37d4b08 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -1719,6 +1719,30 @@ void f2fs_put_page_dic(struct page *page)
> >  	f2fs_put_dic(dic);
> >  }
> >  
> > +/*
> > + * check whether cluster blocks are contiguous, and add extent cache entry
> > + * only if cluster blocks are logically and physically contiguous.
> > + */
> > +int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
> > +{
> > +	bool compressed = f2fs_data_blkaddr(dn) == COMPRESS_ADDR;
> > +	int i = compressed ? 1 : 0;
> > +	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
> > +						dn->ofs_in_node + i);
> > +
> > +	for (i += 1; i < F2FS_I(dn->inode)->i_cluster_size; i++) {
> > +		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
> > +						dn->ofs_in_node + i);
> > +
> > +		if (!__is_valid_data_blkaddr(blkaddr))
> > +			break;
> > +		if (first_blkaddr + i - 1 != blkaddr)
> > +			return 0;
> > +	}
> > +
> > +	return compressed ? i - 1 : i;
> > +}
> > +
> >  const struct address_space_operations f2fs_compress_aops = {
> >  	.releasepage = f2fs_release_page,
> >  	.invalidatepage = f2fs_invalidate_page,
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index f7b96625e616..8cc964c54d51 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -2186,6 +2186,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  	sector_t last_block_in_file;
> >  	const unsigned blocksize = blks_to_bytes(inode, 1);
> >  	struct decompress_io_ctx *dic = NULL;
> > +	struct extent_info_unaligned eiu;
> > +	bool from_dnode = true;
> >  	int i;
> >  	int ret = 0;
> >  
> > @@ -2216,6 +2218,12 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  	if (f2fs_cluster_is_empty(cc))
> >  		goto out;
> >  
> > +	if (f2fs_lookup_extent_cache_unaligned(inode, start_idx, &eiu))
> > +		from_dnode = false;
> > +
> > +	if (from_dnode)
> > +		goto skip_reading_dnode;
> > +
> >  	set_new_dnode(&dn, inode, NULL, NULL, 0);
> >  	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
> >  	if (ret)
> > @@ -2223,11 +2231,13 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  
> >  	f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
> >  
> > +skip_reading_dnode:
> >  	for (i = 1; i < cc->cluster_size; i++) {
> >  		block_t blkaddr;
> >  
> > -		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> > -						dn.ofs_in_node + i);
> > +		blkaddr = from_dnode ? data_blkaddr(dn.inode, dn.node_page,
> > +					dn.ofs_in_node + i) :
> > +					eiu.ei.blk + i;
> >  
> >  		if (!__is_valid_data_blkaddr(blkaddr))
> >  			break;
> > @@ -2237,6 +2247,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  			goto out_put_dnode;
> >  		}
> >  		cc->nr_cpages++;
> > +
> > +		if (!from_dnode && i >= eiu.plen)
> > +			break;
> >  	}
> >  
> >  	/* nothing to decompress */
> > @@ -2256,8 +2269,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  		block_t blkaddr;
> >  		struct bio_post_read_ctx *ctx;
> >  
> > -		blkaddr = data_blkaddr(dn.inode, dn.node_page,
> > -						dn.ofs_in_node + i + 1);
> > +		blkaddr = from_dnode ? data_blkaddr(dn.inode, dn.node_page,
> > +					dn.ofs_in_node + i + 1) :
> > +					eiu.ei.blk + i + 1;
> >  
> >  		f2fs_wait_on_block_writeback(inode, blkaddr);
> >  
> > @@ -2302,13 +2316,15 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  		*last_block_in_bio = blkaddr;
> >  	}
> >  
> > -	f2fs_put_dnode(&dn);
> > +	if (from_dnode)
> > +		f2fs_put_dnode(&dn);
> >  
> >  	*bio_ret = bio;
> >  	return 0;
> >  
> >  out_put_dnode:
> > -	f2fs_put_dnode(&dn);
> > +	if (from_dnode)
> > +		f2fs_put_dnode(&dn);
> >  out:
> >  	for (i = 0; i < cc->cluster_size; i++) {
> >  		if (cc->rpages[i]) {
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> > index 3ebf976a682d..0ea37e64031f 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -235,7 +235,7 @@ static struct kmem_cache *extent_node_slab;
> >  static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
> >  				struct extent_tree *et, struct extent_info *ei,
> >  				struct rb_node *parent, struct rb_node **p,
> > -				bool leftmost)
> > +				bool leftmost, bool unaligned)
> >  {
> >  	struct extent_node *en;
> >  
> > @@ -247,6 +247,9 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
> >  	INIT_LIST_HEAD(&en->list);
> >  	en->et = et;
> >  
> > +	if (unaligned)
> > +		en->plen = ((struct extent_info_unaligned *)ei)->plen;
> > +
> >  	rb_link_node(&en->rb_node, parent, p);
> >  	rb_insert_color_cached(&en->rb_node, &et->root, leftmost);
> >  	atomic_inc(&et->node_cnt);
> > @@ -320,7 +323,7 @@ static struct extent_node *__init_extent_tree(struct f2fs_sb_info *sbi,
> >  	struct rb_node **p = &et->root.rb_root.rb_node;
> >  	struct extent_node *en;
> >  
> > -	en = __attach_extent_node(sbi, et, ei, NULL, p, true);
> > +	en = __attach_extent_node(sbi, et, ei, NULL, p, true, false);
> >  	if (!en)
> >  		return NULL;
> >  
> > @@ -439,6 +442,17 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
> >  		stat_inc_rbtree_node_hit(sbi);
> >  
> >  	*ei = en->ei;
> > +
> > +#ifdef CONFIG_F2FS_FS_COMPRESSION
> > +	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
> > +				f2fs_sb_has_readonly(sbi)) {
> > +		struct extent_info_unaligned *eiu =
> > +				(struct extent_info_unaligned *)ei;
> > +
> > +		eiu->plen = en->plen;
> > +	}
> > +#endif
> > +
> >  	spin_lock(&sbi->extent_lock);
> >  	if (!list_empty(&en->list)) {
> >  		list_move_tail(&en->list, &sbi->extent_list);
> > @@ -457,17 +471,18 @@ static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
> >  static struct extent_node *__try_merge_extent_node(struct f2fs_sb_info *sbi,
> >  				struct extent_tree *et, struct extent_info *ei,
> >  				struct extent_node *prev_ex,
> > -				struct extent_node *next_ex)
> > +				struct extent_node *next_ex,
> > +				bool unaligned)
> >  {
> >  	struct extent_node *en = NULL;
> >  
> > -	if (prev_ex && __is_back_mergeable(ei, &prev_ex->ei)) {
> > +	if (prev_ex && __is_back_mergeable(ei, &prev_ex->ei, unaligned)) {
> >  		prev_ex->ei.len += ei->len;
> >  		ei = &prev_ex->ei;
> >  		en = prev_ex;
> >  	}
> >  
> > -	if (next_ex && __is_front_mergeable(ei, &next_ex->ei)) {
> > +	if (next_ex && __is_front_mergeable(ei, &next_ex->ei, unaligned)) {
> >  		next_ex->ei.fofs = ei->fofs;
> >  		next_ex->ei.blk = ei->blk;
> >  		next_ex->ei.len += ei->len;
> > @@ -495,7 +510,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
> >  				struct extent_tree *et, struct extent_info *ei,
> >  				struct rb_node **insert_p,
> >  				struct rb_node *insert_parent,
> > -				bool leftmost)
> > +				bool leftmost, bool unaligned)
> >  {
> >  	struct rb_node **p;
> >  	struct rb_node *parent = NULL;
> > @@ -512,7 +527,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
> >  	p = f2fs_lookup_rb_tree_for_insert(sbi, &et->root, &parent,
> >  						ei->fofs, &leftmost);
> >  do_insert:
> > -	en = __attach_extent_node(sbi, et, ei, parent, p, leftmost);
> > +	en = __attach_extent_node(sbi, et, ei, parent, p, leftmost, unaligned);
> >  	if (!en)
> >  		return NULL;
> >  
> > @@ -594,7 +609,7 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
> >  						end - dei.fofs + dei.blk,
> >  						org_end - end);
> >  				en1 = __insert_extent_tree(sbi, et, &ei,
> > -							NULL, NULL, true);
> > +						NULL, NULL, true, false);
> >  				next_en = en1;
> >  			} else {
> >  				en->ei.fofs = end;
> > @@ -633,9 +648,10 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
> >  	if (blkaddr) {
> >  
> >  		set_extent_info(&ei, fofs, blkaddr, len);
> > -		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
> > +		if (!__try_merge_extent_node(sbi, et, &ei,
> > +					prev_en, next_en, false))
> >  			__insert_extent_tree(sbi, et, &ei,
> > -					insert_p, insert_parent, leftmost);
> > +				insert_p, insert_parent, leftmost, false);
> >  
> >  		/* give up extent_cache, if split and small updates happen */
> >  		if (dei.len >= 1 &&
> > @@ -661,6 +677,47 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
> >  		f2fs_mark_inode_dirty_sync(inode, true);
> >  }
> >  
> > +#ifdef CONFIG_F2FS_FS_COMPRESSION
> > +void f2fs_update_extent_tree_range_unaligned(struct inode *inode,
> > +				pgoff_t fofs, block_t blkaddr, unsigned int llen,
> > +				unsigned int plen)
> > +{
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > +	struct extent_tree *et = F2FS_I(inode)->extent_tree;
> > +	struct extent_node *en = NULL;
> > +	struct extent_node *prev_en = NULL, *next_en = NULL;
> > +	struct extent_info_unaligned eiu;
> > +	struct rb_node **insert_p = NULL, *insert_parent = NULL;
> > +	bool leftmost = false;
> > +
> > +	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen);
> > +
> > +	/* it is safe here to check FI_NO_EXTENT w/o et->lock in ro image */
> > +	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> > +		return;
> > +
> > +	write_lock(&et->lock);
> > +
> > +	en = (struct extent_node *)f2fs_lookup_rb_tree_ret(&et->root,
> > +				(struct rb_entry *)et->cached_en, fofs,
> > +				(struct rb_entry **)&prev_en,
> > +				(struct rb_entry **)&next_en,
> > +				&insert_p, &insert_parent, false,
> > +				&leftmost);
> > +	f2fs_bug_on(sbi, en);
> > +
> > +	set_extent_info(&eiu.ei, fofs, blkaddr, llen);
> > +	eiu.plen = plen;
> > +
> > +	if (!__try_merge_extent_node(sbi, et, (struct extent_info *)&eiu,
> > +				prev_en, next_en, true))
> > +		__insert_extent_tree(sbi, et, (struct extent_info *)&eiu,
> > +				insert_p, insert_parent, leftmost, true);
> > +
> > +	write_unlock(&et->lock);
> > +}
> > +#endif
> > +
> >  unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink)
> >  {
> >  	struct extent_tree *et, *next;
> > @@ -818,6 +875,17 @@ bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
> >  	return f2fs_lookup_extent_tree(inode, pgofs, ei);
> >  }
> >  
> > +#ifdef CONFIG_F2FS_FS_COMPRESSION
> > +bool f2fs_lookup_extent_cache_unaligned(struct inode *inode, pgoff_t pgofs,
> > +					struct extent_info_unaligned *eiu)
> > +{
> > +	if (!f2fs_may_extent_tree(inode))
> > +		return false;
> > +
> > +	return f2fs_lookup_extent_tree(inode, pgofs, (struct extent_info *)eiu);
> > +}
> > +#endif
> > +
> >  void f2fs_update_extent_cache(struct dnode_of_data *dn)
> >  {
> >  	pgoff_t fofs;
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 75f97c50302d..618397e6e6c2 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -582,11 +582,21 @@ struct extent_info {
> >  	u32 blk;			/* start block address of the extent */
> >  };
> >  
> > +#ifdef CONFIG_F2FS_FS_COMPRESSION
> > +struct extent_info_unaligned {
> > +	struct extent_info ei;		/* extent info */
> > +	unsigned int plen;		/* physical extent length of compressed blocks */
> > +};
> > +#endif
> > +
> >  struct extent_node {
> >  	struct rb_node rb_node;		/* rb node located in rb-tree */
> >  	struct extent_info ei;		/* extent info */
> >  	struct list_head list;		/* node in global extent list of sbi */
> >  	struct extent_tree *et;		/* extent tree pointer */
> > +#ifdef CONFIG_F2FS_FS_COMPRESSION
> > +	unsigned int plen;		/* physical extent length of compressed blocks */
> > +#endif
> >  };
> >  
> >  struct extent_tree {
> > @@ -822,22 +832,32 @@ static inline bool __is_discard_front_mergeable(struct discard_info *cur,
> >  }
> >  
> >  static inline bool __is_extent_mergeable(struct extent_info *back,
> > -						struct extent_info *front)
> > +				struct extent_info *front, bool unaligned)
> >  {
> > +	if (unaligned) {
> > +		struct extent_info_unaligned *be =
> > +				(struct extent_info_unaligned *)back;
> 
> back is from extent_node->ei, so is it okay to case like this?
> I feel that we may need to replace this casting approach with parameters.
> 
> > +		struct extent_info_unaligned *fe =
> > +				(struct extent_info_unaligned *)front;
> > +
> > +		if (be->ei.len != be->plen || fe->ei.len != fe->plen)
> > +			return false;
> > +	}
> > +
> >  	return (back->fofs + back->len == front->fofs &&
> >  			back->blk + back->len == front->blk);
> >  }
> >  
> >  static inline bool __is_back_mergeable(struct extent_info *cur,
> > -						struct extent_info *back)
> > +				struct extent_info *back, bool unaligned)
> >  {
> > -	return __is_extent_mergeable(back, cur);
> > +	return __is_extent_mergeable(back, cur, unaligned);
> >  }
> >  
> >  static inline bool __is_front_mergeable(struct extent_info *cur,
> > -						struct extent_info *front)
> > +				struct extent_info *front, bool unaligned)
> >  {
> > -	return __is_extent_mergeable(cur, front);
> > +	return __is_extent_mergeable(cur, front, unaligned);
> >  }
> >  
> >  extern void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync);
> > @@ -4001,6 +4021,10 @@ unsigned int f2fs_destroy_extent_node(struct inode *inode);
> >  void f2fs_destroy_extent_tree(struct inode *inode);
> >  bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
> >  			struct extent_info *ei);
> > +#ifdef CONFIG_F2FS_FS_COMPRESSION
> > +bool f2fs_lookup_extent_cache_unaligned(struct inode *inode, pgoff_t pgofs,
> > +					struct extent_info_unaligned *eiu);
> > +#endif
> >  void f2fs_update_extent_cache(struct dnode_of_data *dn);
> >  void f2fs_update_extent_cache_range(struct dnode_of_data *dn,
> >  			pgoff_t fofs, block_t blkaddr, unsigned int len);
> > @@ -4078,6 +4102,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
> >  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
> >  void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed);
> >  void f2fs_put_page_dic(struct page *page);
> > +int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn);
> >  int f2fs_init_compress_ctx(struct compress_ctx *cc);
> >  void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
> >  void f2fs_init_compress_info(struct f2fs_sb_info *sbi);
> > @@ -4106,6 +4131,9 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
> >  		sbi->compr_written_block += blocks;			\
> >  		sbi->compr_saved_block += diff;				\
> >  	} while (0)
> > +void f2fs_update_extent_tree_range_unaligned(struct inode *inode,
> > +				pgoff_t fofs, block_t blkaddr, unsigned int llen,
> > +				unsigned int plen);
> >  #else
> >  static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
> >  static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
> > @@ -4132,6 +4160,7 @@ static inline void f2fs_put_page_dic(struct page *page)
> >  {
> >  	WARN_ON_ONCE(1);
> >  }
> > +static inline int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn) { return 0; }
> >  static inline int f2fs_init_compress_inode(struct f2fs_sb_info *sbi) { return 0; }
> >  static inline void f2fs_destroy_compress_inode(struct f2fs_sb_info *sbi) { }
> >  static inline int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi) { return 0; }
> > @@ -4147,6 +4176,9 @@ static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
> >  static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
> >  							nid_t ino) { }
> >  #define inc_compr_inode_stat(inode)		do { } while (0)
> > +static inline void f2fs_update_extent_tree_range_unaligned(struct inode *inode,
> > +				pgoff_t fofs, block_t blkaddr, unsigned int llen,
> > +				unsigned int plen) { }
> >  #endif
> >  
> >  static inline void set_compress_context(struct inode *inode)
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 5840b82ce311..baf09a2e6e1f 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -841,6 +841,24 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
> >  	dn->ofs_in_node = offset[level];
> >  	dn->node_page = npage[level];
> >  	dn->data_blkaddr = f2fs_data_blkaddr(dn);
> > +
> > +	if (is_inode_flag_set(dn->inode, FI_COMPRESSED_FILE) &&
> > +					f2fs_sb_has_readonly(sbi)) {
> > +		int blknum = f2fs_cluster_blocks_are_contiguous(dn);
> > +
> > +		if (blknum) {
> > +			block_t blkaddr = f2fs_data_blkaddr(dn);
> > +
> > +			if (blkaddr == COMPRESS_ADDR)
> > +				blkaddr = data_blkaddr(dn->inode, dn->node_page,
> > +							dn->ofs_in_node + 1);
> > +
> > +			f2fs_update_extent_tree_range_unaligned(dn->inode,
> > +					index, blkaddr,
> > +					F2FS_I(dn->inode)->i_cluster_size,
> > +					blknum);
> > +		}
> > +	}
> >  	return 0;
> >  
> >  release_pages:
> > -- 
> > 2.22.1
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
