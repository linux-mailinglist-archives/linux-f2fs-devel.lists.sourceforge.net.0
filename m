Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 741225896BE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 05:53:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJRuv-0001kK-PA; Thu, 04 Aug 2022 03:53:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oJRuu-0001k9-2r
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 03:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5A6lTYgdL33l49PkCqax+BeoDrc660tVp/FpXPidbnk=; b=ZIupE4sgcUva3s+ylkbqOQztHC
 AGARZbOmP+LY9rtCJ9MBqexF6j5E70IXRx6oZg2DzmgS6a1Z4MdOe1J541r3+K9CiSqILCu8EN4gj
 qIXGL9zswL4dCtYEz060PRVB4WvlBi6vZOIXWNMBJbf6MSo8B1NccB1vw+9NnUJ5hvAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5A6lTYgdL33l49PkCqax+BeoDrc660tVp/FpXPidbnk=; b=gpvgaSzz49r0WsYUlfDpE1jPox
 bXq4Q2cevxtO0hdgHCYNu+qKCAJryNou3pxGRqvUJQhWhhFCwjIMIkmfxOuob1fiRbh+jgMvrIMWJ
 /Ct6KhjdNB5bDK5bVGl+Gl5nY3WZUgDw1u60oFsRGGMLyRYskRw7BY/RhcnkeEJ23294=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJRui-002kdQ-4w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 03:52:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD952B82488;
 Thu,  4 Aug 2022 03:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64908C433C1;
 Thu,  4 Aug 2022 03:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659585160;
 bh=EoHdgp894l1CzJUArtS1NrgT7pc86BjHHXFaAR8T/bY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G5B951jbrxJN0AsEYenHYlwWbJtvQgSuuilN8U5FhOKl+962oGOTSsoGLKUmh7Kge
 Wb9Ql2Jeiubec6xRXa0FTStc9LAkUkTqxRth6UG9djGKYVsE7v+lunLOd2QK1XgDoe
 kw55aLXnRbsDXCIayy3QkcIQJVNOUrSPBEkDQkIJYdoFpB72bIIyoWlIVsjxi3iwep
 2SliWIGSehxIC29NNkhIolVbJZGPBy0hDgwFnVk6LYER6JjEP0cEEavk5Wx10mztZQ
 +XIVsC8SxCw2KHl/r0XyTLwW75hTQ4wvHtlCe9SfXu3BPW+d+vbJyTzyv8BxGCRBeS
 MGBppZWnfQkbw==
Date: Wed, 3 Aug 2022 20:52:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <fengnanchang@gmail.com>
Message-ID: <YutChr9IZJBr/szK@google.com>
References: <20220731033347.455209-1-fengnanchang@gmail.com>
 <20220731033347.455209-4-fengnanchang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220731033347.455209-4-fengnanchang@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I feel that this adds lots of codes only for accounting
 purpose.
 Can we discuss why we need to know WA? If it's for debugging purpose, can
 we debug by tracepoints? On 07/31, Fengnan Chang wrote: > Try to support
 compressed file write and amplifiction accounting. > > Signed-off-by: Fengnan
 Chang <fengnanchang@gmail.com> > --- > fs/f2fs/compress.c | 7 +++++-- > fs
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJRui-002kdQ-4w
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: support compressed file
 write/read amplifiction
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I feel that this adds lots of codes only for accounting purpose. Can we
discuss why we need to know WA? If it's for debugging purpose, can we
debug by tracepoints?

On 07/31, Fengnan Chang wrote:
> Try to support compressed file write and amplifiction accounting.
> 
> Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
> ---
>  fs/f2fs/compress.c |  7 +++++--
>  fs/f2fs/data.c     | 44 ++++++++++++++++++++++++++++++++++++--------
>  fs/f2fs/debug.c    |  7 +++++--
>  fs/f2fs/f2fs.h     | 36 +++++++++++++++++++++++++++++++++++-
>  4 files changed, 81 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 0eca4e060deb..374d4a73ab2c 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1125,7 +1125,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  	sector_t last_block_in_bio;
>  	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
>  	pgoff_t start_idx = start_idx_of_cluster(cc);
> -	int i, ret;
> +	int i, ret, once_read = 0;
>  
>  retry:
>  	ret = f2fs_is_compressed_cluster(cc->inode, start_idx);
> @@ -1155,13 +1155,16 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  		struct bio *bio = NULL;
>  
>  		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
> -					&last_block_in_bio, false, true);
> +					&last_block_in_bio, false, true, &once_read);
>  		f2fs_put_rpages(cc);
>  		f2fs_destroy_compress_ctx(cc, true);
>  		if (ret)
>  			goto out;
>  		if (bio)
>  			f2fs_submit_bio(sbi, bio, DATA);
> +		/* All need read page in here is read amplification */
> +		if (once_read)
> +			f2fs_i_compr_ra_blocks_update(cc->inode, once_read, true);
>  
>  		ret = f2fs_init_compress_ctx(cc);
>  		if (ret)
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0b159c555069..9bedcea189eb 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2133,7 +2133,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  				unsigned nr_pages, sector_t *last_block_in_bio,
> -				bool is_readahead, bool for_write)
> +				bool is_readahead, bool for_write, int *nr_need_read)
>  {
>  	struct dnode_of_data dn;
>  	struct inode *inode = cc->inode;
> @@ -2146,7 +2146,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  	struct extent_info ei = {0, };
>  	bool from_dnode = true;
>  	int i;
> -	int ret = 0;
> +	int ret = 0, nr_cache_hit = 0;
> +
> +	if (nr_need_read)
> +		*nr_need_read = 0;
>  
>  	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
>  
> @@ -2237,6 +2240,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
>  			if (atomic_dec_and_test(&dic->remaining_pages))
>  				f2fs_decompress_cluster(dic, true);
> +			nr_cache_hit++;
>  			continue;
>  		}
>  
> @@ -2275,6 +2279,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		*last_block_in_bio = blkaddr;
>  	}
>  
> +	/* we need read whole cluster when nr_cache_hit less than nr_cpages */
> +	if (nr_need_read && nr_cache_hit < cc->nr_cpages)
> +		*nr_need_read = cc->nr_cpages;
> +
>  	if (from_dnode)
>  		f2fs_put_dnode(&dn);
>  
> @@ -2322,7 +2330,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  #endif
>  	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>  	unsigned max_nr_pages = nr_pages;
> -	int ret = 0;
> +	int ret = 0, once_read = 0, total_read = 0, single_read = 0;
>  
>  	map.m_pblk = 0;
>  	map.m_lblk = 0;
> @@ -2346,10 +2354,11 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  				ret = f2fs_read_multi_pages(&cc, &bio,
>  							max_nr_pages,
>  							&last_block_in_bio,
> -							rac != NULL, false);
> +							rac != NULL, false, &once_read);
>  				f2fs_destroy_compress_ctx(&cc, false);
>  				if (ret)
>  					goto set_error_page;
> +				total_read += once_read;
>  			}
>  			if (cc.cluster_idx == NULL_CLUSTER) {
>  				if (nc_cluster_idx ==
> @@ -2389,6 +2398,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  			zero_user_segment(page, 0, PAGE_SIZE);
>  			unlock_page(page);
>  		}
> +		single_read++;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  next_page:
>  #endif
> @@ -2402,12 +2412,23 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  				ret = f2fs_read_multi_pages(&cc, &bio,
>  							max_nr_pages,
>  							&last_block_in_bio,
> -							rac != NULL, false);
> +							rac != NULL, false, &once_read);
>  				f2fs_destroy_compress_ctx(&cc, false);
> +				if (!ret)
> +					total_read += once_read;
>  			}
>  		}
>  #endif
>  	}
> +	max_nr_pages -= single_read;
> +	if (total_read > max_nr_pages)
> +		f2fs_i_compr_ra_blocks_update(inode,
> +						total_read - max_nr_pages,
> +						true);
> +	else
> +		f2fs_i_compr_ra_blocks_update(inode,
> +						max_nr_pages - total_read,
> +						false);
>  	if (bio)
>  		__submit_bio(F2FS_I_SB(inode), bio, DATA);
>  	return ret;
> @@ -2944,11 +2965,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	int range_whole = 0;
>  	xa_mark_t tag;
>  	int nwritten = 0;
> -	int submitted = 0;
> +	int submitted = 0, raw_dirty_pages = 0;
>  	int i;
>  
> -	if (get_dirty_pages(mapping->host) <=
> -				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
> +	raw_dirty_pages = get_dirty_pages(mapping->host);
> +	if (raw_dirty_pages <= SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
>  		set_inode_flag(mapping->host, FI_HOT_DATA);
>  	else
>  		clear_inode_flag(mapping->host, FI_HOT_DATA);
> @@ -3148,6 +3169,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	if (bio)
>  		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
>  
> +	if (f2fs_compressed_file(inode)) {
> +		if (nwritten > raw_dirty_pages)
> +			f2fs_i_compr_wa_blocks_update(inode, nwritten - raw_dirty_pages, true);
> +		else
> +			f2fs_i_compr_wa_blocks_update(inode, raw_dirty_pages - nwritten, false);
> +	}
>  	return ret;
>  }
>  
> @@ -3498,6 +3525,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  			err = ret;
>  			goto fail;
>  		} else if (ret) {
> +			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
>  			return 0;
>  		}
>  	}
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index c01471573977..e6b943edba91 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -136,6 +136,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  	si->inline_dir = atomic_read(&sbi->inline_dir);
>  	si->compr_inode = atomic_read(&sbi->compr_inode);
>  	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
> +	si->compr_wa_blocks = atomic64_read(&sbi->compr_wa_blocks);
> +	si->compr_ra_blocks = atomic64_read(&sbi->compr_ra_blocks);
>  	si->append = sbi->im[APPEND_INO].ino_num;
>  	si->update = sbi->im[UPDATE_INO].ino_num;
>  	si->orphans = sbi->im[ORPHAN_INO].ino_num;
> @@ -383,8 +385,9 @@ static int stat_show(struct seq_file *s, void *v)
>  			   si->inline_inode);
>  		seq_printf(s, "  - Inline_dentry Inode: %u\n",
>  			   si->inline_dir);
> -		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
> -			   si->compr_inode, si->compr_blocks);
> +		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu, WA Blocks: %lld, RA Blocks %lld\n",
> +			   si->compr_inode, si->compr_blocks,
> +			   si->compr_wa_blocks, si->compr_ra_blocks);
>  		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
>  			   si->orphans, si->append, si->update);
>  		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 955dbf4f83ad..c549be2e75af 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1761,6 +1761,8 @@ struct f2fs_sb_info {
>  	atomic_t inline_dir;			/* # of inline_dentry inodes */
>  	atomic_t compr_inode;			/* # of compressed inodes */
>  	atomic64_t compr_blocks;		/* # of compressed blocks */
> +	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
> +	atomic64_t compr_ra_blocks;		/* # of compressed RA blocks */
>  	atomic_t max_aw_cnt;			/* max # of atomic writes */
>  	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
>  	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
> @@ -3859,6 +3861,8 @@ struct f2fs_stat_info {
>  	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
>  	int compr_inode;
>  	unsigned long long compr_blocks;
> +	long long compr_wa_blocks;
> +	long long compr_ra_blocks;
>  	int aw_cnt, max_aw_cnt;
>  	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
>  	unsigned int bimodal, avg_vblocks;
> @@ -3946,6 +3950,14 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>  		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
>  #define stat_sub_compr_blocks(inode, blocks)				\
>  		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
> +#define stat_add_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
> +#define stat_sub_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
> +#define stat_add_compr_ra_blocks(inode, blocks)				\
> +	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
> +#define stat_sub_compr_ra_blocks(inode, blocks)				\
> +	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
>  #define stat_inc_meta_count(sbi, blkaddr)				\
>  	do {								\
>  		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
> @@ -4030,6 +4042,10 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>  #define stat_dec_compr_inode(inode)			do { } while (0)
>  #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
>  #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
> +#define stat_add_compr_wa_blocks(inode, blocks)		do { } while (0)
> +#define stat_sub_compr_wa_blocks(inode, blocks)		do { } while (0)
> +#define stat_add_compr_ra_blocks(inode, blocks)		do { } while (0)
> +#define stat_sub_compr_ra_blocks(inode, blocks)		do { } while (0)
>  #define stat_update_max_atomic_write(inode)		do { } while (0)
>  #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
>  #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
> @@ -4209,7 +4225,7 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
>  				unsigned int c_len);
>  int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  				unsigned nr_pages, sector_t *last_block_in_bio,
> -				bool is_readahead, bool for_write);
> +				bool is_readahead, bool for_write, int *nr_need_read);
>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
>  void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
>  				bool in_task);
> @@ -4465,6 +4481,24 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  }
>  
> +static inline void f2fs_i_compr_wa_blocks_update(struct inode *inode,
> +						u64 blocks, bool add)
> +{
> +	if (add)
> +		stat_add_compr_wa_blocks(inode, blocks);
> +	else
> +		stat_sub_compr_wa_blocks(inode, blocks);
> +}
> +
> +static inline void f2fs_i_compr_ra_blocks_update(struct inode *inode,
> +						u64 blocks, bool add)
> +{
> +	if (add)
> +		stat_add_compr_ra_blocks(inode, blocks);
> +	else
> +		stat_sub_compr_ra_blocks(inode, blocks);
> +}
> +
>  static inline int block_unaligned_IO(struct inode *inode,
>  				struct kiocb *iocb, struct iov_iter *iter)
>  {
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
