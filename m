Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE728434278
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Oct 2021 02:09:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mczAw-0004pv-68; Wed, 20 Oct 2021 00:09:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mczAv-0004po-0W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Oct 2021 00:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uszvhwnUAPjWd9CXeiwNm1N/amuhwZZ1xXamKCBbJSM=; b=CM1B39/cMwoPCUMJa8v8t1ahD4
 YNkCEyd1L+CjZUDiq6ZzhyUsUgSRioYBBw0q0rLEU7IVJlHewYLIq2lQg0FuwLQTleA15TGJOK+V2
 mDC6ZJITILlPfyYsP/9kOuda4tV+0CWCpAU4gwPdWuHFyFaZ5vmRKyu4OcSpD8WKcz/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uszvhwnUAPjWd9CXeiwNm1N/amuhwZZ1xXamKCBbJSM=; b=Ujc0bWIyHa0SDx+PkLxY7xq5Ft
 Ac+PiDuMDX/8An+0DNOHC96JIf2+mjqj/Bie83Tt6hPACIeTqgtCMeuLAeJ0aPl9hEZ+/4NbbpspF
 qNT0+q9ynJAiae5U5/l3teBatiKrIlc2joCVTtzF7FumZVwBRlEFbMudU+jqKctOo7YI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mczAr-0006fq-Ll
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Oct 2021 00:09:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E23E61052;
 Wed, 20 Oct 2021 00:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634688576;
 bh=h+GzDmyTR0Qf2h191aWyf2bRBaBQGnIXUJxkOGeLo2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dW0VSB5skcrthYtZ3IQ4WPHYpPIGb9hmLQ7W5j5G4//aqz9lzSgwM9w1vuji/2oaH
 wuuKt2iOSXdG70SCWfNa4vWUYZNBjRT745SlOktXUKUPj5JHAZagVUD1jAWtEXCIKi
 tON5niHcQ84DX7i7FzHA+0RH1G+XdZbOqSyk+Z2AjxPivfcEH+xxDTIt3SW0kDpdoY
 E5TwAeXDT2bArv35jacKjkprYzCEaMOjKJiVAmOI5FsbWFxsWQWcljM9i2GIeZrhhI
 KSpxSglWysAYHLmZF5qJzxR1f0RLSa3/7+c21WYYBCkhj6ooHKVNyp63rogVL9vRGd
 +kGoh3+KnxN3Q==
Date: Tue, 19 Oct 2021 17:09:34 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <YW9ePgJkxSr+oB7k@google.com>
References: <20211009112744.33698-1-changfengnan@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211009112744.33698-1-changfengnan@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/09, Fengnan Chang wrote: > separate buffer and direct
 io in block allocation statistics. > > New output will like this: > buffer
 direct segments > IPU: 0 0 N/A > SSR: 0 0 0 > LFS: 0 0 0 > > Sign [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mczAr-0006fq-Ll
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: separate buffer and direct io
 in block allocation statistics
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

On 10/09, Fengnan Chang wrote:
> separate buffer and direct io in block allocation statistics.
> 
> New output will like this:
>            buffer     direct   segments
> IPU:            0          0        N/A
> SSR:            0          0          0
> LFS:            0          0          0
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>  fs/f2fs/data.c    | 10 ++++++----
>  fs/f2fs/debug.c   | 24 +++++++++++++++---------
>  fs/f2fs/f2fs.h    | 32 +++++++++++++++++++++-----------
>  fs/f2fs/gc.c      |  2 +-
>  fs/f2fs/segment.c |  8 ++++----
>  5 files changed, 47 insertions(+), 29 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f4fd6c246c9a..c1490b9a1345 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1342,7 +1342,7 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
>  	return page;
>  }
>  
> -static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
> +static int __allocate_data_block(struct dnode_of_data *dn, int seg_type, bool direct_io)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
>  	struct f2fs_summary sum;
> @@ -1369,7 +1369,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
>  	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
>  	old_blkaddr = dn->data_blkaddr;
>  	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
> -				&sum, seg_type, NULL);
> +				&sum, seg_type, NULL, direct_io);
>  	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
>  		invalidate_mapping_pages(META_MAPPING(sbi),
>  					old_blkaddr, old_blkaddr);
> @@ -1548,7 +1548,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  		/* use out-place-update for driect IO under LFS mode */
>  		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
>  							map->m_may_create) {
> -			err = __allocate_data_block(&dn, map->m_seg_type);
> +			err = __allocate_data_block(&dn, map->m_seg_type, true);
>  			if (err)
>  				goto sync_out;
>  			blkaddr = dn.data_blkaddr;
> @@ -1569,7 +1569,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  				WARN_ON(flag != F2FS_GET_BLOCK_PRE_DIO &&
>  					flag != F2FS_GET_BLOCK_DIO);
>  				err = __allocate_data_block(&dn,
> -							map->m_seg_type);
> +					map->m_seg_type,
> +					flag == F2FS_GET_BLOCK_PRE_DIO ||
> +					flag == F2FS_GET_BLOCK_DIO);
>  				if (!err)
>  					set_inode_flag(inode, FI_APPEND_WRITE);
>  			}
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 8c50518475a9..e1aa843b067c 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -64,7 +64,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_stat_info *si = F2FS_STAT(sbi);
>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> -	int i;
> +	int i, j;
>  
>  	/* these will be changed if online resize is done */
>  	si->main_area_segs = le32_to_cpu(raw_super->segment_count_main);
> @@ -210,10 +210,12 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  
>  	for (i = 0; i < 2; i++) {
>  		si->segment_count[i] = sbi->segment_count[i];
> -		si->block_count[i] = sbi->block_count[i];
> +		for (j = 0; j < 2; j++)
> +			si->block_count[i][j] = sbi->block_count[i][j];
>  	}
>  
> -	si->inplace_count = atomic_read(&sbi->inplace_count);
> +	for (i = 0; i < 2; i++)
> +		si->inplace_count[i] = atomic_read(&sbi->inplace_count[i]);
>  }
>  
>  /*
> @@ -551,11 +553,14 @@ static int stat_show(struct seq_file *s, void *v)
>  		for (j = 0; j < si->util_free; j++)
>  			seq_putc(s, '-');
>  		seq_puts(s, "]\n\n");
> -		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
> -		seq_printf(s, "SSR: %u blocks in %u segments\n",
> -			   si->block_count[SSR], si->segment_count[SSR]);
> -		seq_printf(s, "LFS: %u blocks in %u segments\n",
> -			   si->block_count[LFS], si->segment_count[LFS]);
> +
> +		seq_printf(s, "       %10s %10s %10s\n", "buffer", "direct", "segments");
> +		seq_printf(s,   "IPU:   %10d %10d        N/A\n", si->inplace_count[1],
> +				si->inplace_count[0]);
> +		seq_printf(s,   "SSR:   %10d %10d %10d\n", si->block_count[1][SSR],
> +				si->block_count[0][SSR], si->segment_count[SSR]);
> +		seq_printf(s,   "LFS:   %10d %10d %10d\n", si->block_count[1][LFS],
> +				si->block_count[0][LFS], si->segment_count[LFS]);

Please clean up unnecessary spaces.

>  
>  		/* segment usage info */
>  		f2fs_update_sit_info(si->sbi);
> @@ -611,7 +616,8 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
>  	atomic_set(&sbi->inline_dir, 0);
>  	atomic_set(&sbi->compr_inode, 0);
>  	atomic64_set(&sbi->compr_blocks, 0);
> -	atomic_set(&sbi->inplace_count, 0);
> +	for (i = 0; i < 2; i++)
> +		atomic_set(&sbi->inplace_count[i], 0);
>  	for (i = META_CP; i < META_MAX; i++)
>  		atomic_set(&sbi->meta_count[i], 0);
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b339ae89c1ad..bf2e73e46304 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1692,8 +1692,8 @@ struct f2fs_sb_info {
>  	struct f2fs_stat_info *stat_info;	/* FS status information */
>  	atomic_t meta_count[META_MAX];		/* # of meta blocks */
>  	unsigned int segment_count[2];		/* # of allocated segments */
> -	unsigned int block_count[2];		/* # of allocated blocks */
> -	atomic_t inplace_count;		/* # of inplace update */
> +	unsigned int block_count[2][2];		/* # of allocated blocks */
> +	atomic_t inplace_count[2];		/* # of inplace update */

Can we clean up w/ macros instead of 2?

>  	atomic64_t total_hit_ext;		/* # of lookup extent cache */
>  	atomic64_t read_hit_rbtree;		/* # of hit rbtree extent node */
>  	atomic64_t read_hit_largest;		/* # of hit largest extent node */
> @@ -3491,7 +3491,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>  void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  			block_t old_blkaddr, block_t *new_blkaddr,
>  			struct f2fs_summary *sum, int type,
> -			struct f2fs_io_info *fio);
> +			struct f2fs_io_info *fio, bool direct_io);
>  void f2fs_wait_on_page_writeback(struct page *page,
>  			enum page_type type, bool ordered, bool locked);
>  void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
> @@ -3699,8 +3699,8 @@ struct f2fs_stat_info {
>  
>  	unsigned int meta_count[META_MAX];
>  	unsigned int segment_count[2];
> -	unsigned int block_count[2];
> -	unsigned int inplace_count;
> +	unsigned int block_count[2][2];
> +	unsigned int inplace_count[2];
>  	unsigned long long base_mem, cache_mem, page_mem;
>  };
>  
> @@ -3778,10 +3778,20 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>  	} while (0)
>  #define stat_inc_seg_type(sbi, curseg)					\
>  		((sbi)->segment_count[(curseg)->alloc_type]++)
> -#define stat_inc_block_count(sbi, curseg)				\
> -		((sbi)->block_count[(curseg)->alloc_type]++)
> -#define stat_inc_inplace_blocks(sbi)					\
> -		(atomic_inc(&(sbi)->inplace_count))
> +#define stat_inc_block_count(sbi, curseg, direct_io)			\
> +	do {								\
> +		if (direct_io)						\
> +			((sbi)->block_count[0][(curseg)->alloc_type]++);	\
> +		else								\
> +			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
> +	} while (0)
> +#define stat_inc_inplace_blocks(sbi, direct_io)					\
> +	do {								\
> +		if (direct_io)						\
> +			(atomic_inc(&(sbi)->inplace_count[0]));		\
> +		else								\
> +			(atomic_inc(&(sbi)->inplace_count[1]));		\
> +	} while (0)
>  #define stat_update_max_atomic_write(inode)				\
>  	do {								\
>  		int cur = F2FS_I_SB(inode)->atomic_files;	\
> @@ -3866,8 +3876,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>  #define stat_update_max_volatile_write(inode)		do { } while (0)
>  #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
>  #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
> -#define stat_inc_block_count(sbi, curseg)		do { } while (0)
> -#define stat_inc_inplace_blocks(sbi)			do { } while (0)
> +#define stat_inc_block_count(sbi, curseg, direct_io)	do { } while (0)
> +#define stat_inc_inplace_blocks(sbi, direct_io)		do { } while (0)
>  #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
>  #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
>  #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 77391e3b7d68..7c47082f73cc 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1247,7 +1247,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  
>  	/* allocate block address */
>  	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
> -				&sum, type, NULL);
> +				&sum, type, NULL, false);
>  
>  	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
>  				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a135d2247415..ded744e880d0 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3391,7 +3391,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
>  void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  		block_t old_blkaddr, block_t *new_blkaddr,
>  		struct f2fs_summary *sum, int type,
> -		struct f2fs_io_info *fio)
> +		struct f2fs_io_info *fio, bool direct_io)
>  {
>  	struct sit_info *sit_i = SIT_I(sbi);
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> @@ -3425,7 +3425,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  
>  	__refresh_next_blkoff(sbi, curseg);
>  
> -	stat_inc_block_count(sbi, curseg);
> +	stat_inc_block_count(sbi, curseg, direct_io);
>  
>  	if (from_gc) {
>  		old_mtime = get_segment_mtime(sbi, old_blkaddr);
> @@ -3515,7 +3515,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>  		down_read(&fio->sbi->io_order_lock);
>  reallocate:
>  	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
> -			&fio->new_blkaddr, sum, type, fio);
> +			&fio->new_blkaddr, sum, type, fio, false);
>  	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
>  		invalidate_mapping_pages(META_MAPPING(fio->sbi),
>  					fio->old_blkaddr, fio->old_blkaddr);
> @@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>  		goto drop_bio;
>  	}
>  
> -	stat_inc_inplace_blocks(fio->sbi);
> +	stat_inc_inplace_blocks(fio->sbi, false);
>  
>  	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
>  		err = f2fs_merge_page_bio(fio);
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
