Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E09543C05D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 04:54:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfZ5D-0003Zj-V6; Wed, 27 Oct 2021 02:54:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mfZ5B-0003ZZ-Qf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 02:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C4WnVQhzkL9VGjyL0vxQm+DR62/B+jY9a+KJd+r1G1E=; b=lqdQNedbGLi1ZSV4+kKYgLW/2K
 Iq8hJozTmttg5hXwJQx1q+cqLmTzO0jVeEITmECXN1oQ9DZuCPd4j52RrtIFe6Kir0HxIG/mxgya+
 UXe+WPCDatrnld+BRz0Fo31uBuLc343O1pa2UV9wmyFvk24H1OmdW14mnVvqh0h/Vfjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C4WnVQhzkL9VGjyL0vxQm+DR62/B+jY9a+KJd+r1G1E=; b=O60YdSBWT5MXMUsggf+Tw/V9Ka
 f9DThEQGclHR9Nd3hoRNjkxWecNLikXlkdRz5KtMKccI+cGuAu/O2GByounuVLyrglRKTVtwm+F6K
 73QRpOgpzHNV4H7spLBoOXxMG/hHuKOqiL+zjb64/r1WY5gT4RADQM9jLWYgRrGCZE/U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfZ2v-0003nv-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 02:54:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C02761002;
 Wed, 27 Oct 2021 02:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635302663;
 bh=ylvVXLO4DhVSvErPlKGlvPEC+l0UK+u6dSdoxkP/acc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t3+ORDD6gWiauAlHa3iPH6Z/ZimyFmJJPwHBihMzDIV8uAmgVzwepnIPv0WSb+qqy
 yXFesya/gHJGDff+mEjUZ72zpCk1rr0DDTxyNXFOPtpsTE1mERpeg27xIfZbhmQFQa
 LxuIKXWuFBolDIf2iTd4BBnLPW3FLX9710LFZTEhzrjxzt/0F5ANUeYfreCzGK9u9j
 /q2NVA/G03lZ3RtwP+XWMH2DwOJA3vkJgkaGByu0G9aFdP6J8d80dkr/FleeK20Znb
 GR5XnGU68p1SVapekvoVmkRsZTbOrFdV3qUZl3IcsW2aDOO09t/yxmtgiERCd18Rqa
 AzGAS+Q5lQFiQ==
Message-ID: <bee5579b-8432-293e-4579-47373c2dbeba@kernel.org>
Date: Wed, 27 Oct 2021 10:44:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211021022141.246051-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211021022141.246051-1-changfengnan@vivo.com>
X-Headers-End: 1mfZ2v-0003nv-Hi
Subject: Re: [f2fs-dev] [PATCH v6 1/2] f2fs: separate buffer and direct io
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/21 10:21, Fengnan Chang wrote:
> separate buffer and direct io in block allocation statistics.
> 
> New output will like this:
>             buffer     direct   segments
> IPU:            0          0        N/A
> SSR:            0          0          0
> LFS:            0          0          0
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c    | 10 ++++++----
>   fs/f2fs/debug.c   | 25 +++++++++++++++----------
>   fs/f2fs/f2fs.h    | 33 ++++++++++++++++++++++-----------
>   fs/f2fs/gc.c      |  2 +-
>   fs/f2fs/segment.c |  8 ++++----
>   5 files changed, 48 insertions(+), 30 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index f4fd6c246c9a..c1490b9a1345 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1342,7 +1342,7 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
>   	return page;
>   }
>   
> -static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
> +static int __allocate_data_block(struct dnode_of_data *dn, int seg_type, bool direct_io)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
>   	struct f2fs_summary sum;
> @@ -1369,7 +1369,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
>   	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
>   	old_blkaddr = dn->data_blkaddr;
>   	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
> -				&sum, seg_type, NULL);
> +				&sum, seg_type, NULL, direct_io);
>   	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
>   		invalidate_mapping_pages(META_MAPPING(sbi),
>   					old_blkaddr, old_blkaddr);
> @@ -1548,7 +1548,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>   		/* use out-place-update for driect IO under LFS mode */
>   		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
>   							map->m_may_create) {
> -			err = __allocate_data_block(&dn, map->m_seg_type);
> +			err = __allocate_data_block(&dn, map->m_seg_type, true);
>   			if (err)
>   				goto sync_out;
>   			blkaddr = dn.data_blkaddr;
> @@ -1569,7 +1569,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,

bool direct_io = flag == (F2FS_GET_BLOCK_PRE_DIO ||
			flag == F2FS_GET_BLOCK_DIO);

WARN_ON(!direct_io);

>   				WARN_ON(flag != F2FS_GET_BLOCK_PRE_DIO &&
>   					flag != F2FS_GET_BLOCK_DIO);
>   				err = __allocate_data_block(&dn,
> -							map->m_seg_type);
> +					map->m_seg_type,
> +					flag == F2FS_GET_BLOCK_PRE_DIO ||
> +					flag == F2FS_GET_BLOCK_DIO);

err = __allocate_data_block(&dn,
	map->m_seg_type, direct_io);

>   				if (!err)
>   					set_inode_flag(inode, FI_APPEND_WRITE);
>   			}
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 8c50518475a9..9f6880094fd1 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -64,7 +64,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>   {
>   	struct f2fs_stat_info *si = F2FS_STAT(sbi);
>   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> -	int i;
> +	int i, j;
>   
>   	/* these will be changed if online resize is done */
>   	si->main_area_segs = le32_to_cpu(raw_super->segment_count_main);
> @@ -208,12 +208,14 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>   		si->valid_blks[type] += blks;
>   	}
>   
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < IO_TYPE_NUM; i++) {
>   		si->segment_count[i] = sbi->segment_count[i];
> -		si->block_count[i] = sbi->block_count[i];
> +		for (j = 0; j < 2; j++)
> +			si->block_count[i][j] = sbi->block_count[i][j];
>   	}
>   
> -	si->inplace_count = atomic_read(&sbi->inplace_count);
> +	for (i = 0; i < IO_TYPE_NUM; i++)
> +		si->inplace_count[i] = atomic_read(&sbi->inplace_count[i]);
>   }
>   
>   /*
> @@ -551,11 +553,13 @@ static int stat_show(struct seq_file *s, void *v)
>   		for (j = 0; j < si->util_free; j++)
>   			seq_putc(s, '-');
>   		seq_puts(s, "]\n\n");
> -		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
> -		seq_printf(s, "SSR: %u blocks in %u segments\n",
> -			   si->block_count[SSR], si->segment_count[SSR]);
> -		seq_printf(s, "LFS: %u blocks in %u segments\n",
> -			   si->block_count[LFS], si->segment_count[LFS]);
> +		seq_printf(s, "       %10s %10s %10s\n", "buffer", "direct", "segments");
> +		seq_printf(s,   "IPU:   %10d %10d        N/A\n", si->inplace_count[1],
> +				si->inplace_count[0]);
> +		seq_printf(s,   "SSR:   %10d %10d %10d\n", si->block_count[1][SSR],
> +				si->block_count[0][SSR], si->segment_count[SSR]);
> +		seq_printf(s,   "LFS:   %10d %10d %10d\n", si->block_count[1][LFS],
> +				si->block_count[0][LFS], si->segment_count[LFS]);
>   
>   		/* segment usage info */
>   		f2fs_update_sit_info(si->sbi);
> @@ -611,7 +615,8 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
>   	atomic_set(&sbi->inline_dir, 0);
>   	atomic_set(&sbi->compr_inode, 0);
>   	atomic64_set(&sbi->compr_blocks, 0);
> -	atomic_set(&sbi->inplace_count, 0);
> +	for (i = 0; i < 2; i++)

i < IO_TYPE_NUM

> +		atomic_set(&sbi->inplace_count[i], 0);
>   	for (i = META_CP; i < META_MAX; i++)
>   		atomic_set(&sbi->meta_count[i], 0);
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 039a229e11c9..09d871c00dd2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1551,6 +1551,7 @@ struct decompress_io_ctx {
>   #define MIN_COMPRESS_LOG_SIZE		2
>   #define MAX_COMPRESS_LOG_SIZE		8
>   #define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
> +#define IO_TYPE_NUM			2	/* buffer io or direct io*/

How about:

enum io_type {
	BUFFERED_IO,
	DIRECT_IO,
	MAX_IO_TYPE,
};

And we can use BUFFERED_IO/DIRECT_IO to instead 0/1 used in stat_show().

>   
>   struct f2fs_sb_info {
>   	struct super_block *sb;			/* pointer to VFS super block */
> @@ -1695,8 +1696,8 @@ struct f2fs_sb_info {
>   	struct f2fs_stat_info *stat_info;	/* FS status information */
>   	atomic_t meta_count[META_MAX];		/* # of meta blocks */
>   	unsigned int segment_count[2];		/* # of allocated segments */
> -	unsigned int block_count[2];		/* # of allocated blocks */
> -	atomic_t inplace_count;		/* # of inplace update */
> +	unsigned int block_count[IO_TYPE_NUM][2];	/* # of allocated blocks */
> +	atomic_t inplace_count[IO_TYPE_NUM];	/* # of inplace update */
>   	atomic64_t total_hit_ext;		/* # of lookup extent cache */
>   	atomic64_t read_hit_rbtree;		/* # of hit rbtree extent node */
>   	atomic64_t read_hit_largest;		/* # of hit largest extent node */
> @@ -3494,7 +3495,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>   void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   			block_t old_blkaddr, block_t *new_blkaddr,
>   			struct f2fs_summary *sum, int type,
> -			struct f2fs_io_info *fio);
> +			struct f2fs_io_info *fio, bool direct_io);
>   void f2fs_wait_on_page_writeback(struct page *page,
>   			enum page_type type, bool ordered, bool locked);
>   void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
> @@ -3702,8 +3703,8 @@ struct f2fs_stat_info {
>   
>   	unsigned int meta_count[META_MAX];
>   	unsigned int segment_count[2];
> -	unsigned int block_count[2];
> -	unsigned int inplace_count;
> +	unsigned int block_count[2][2];

Ditto,

> +	unsigned int inplace_count[2];

Ditto,

Thanks,

>   	unsigned long long base_mem, cache_mem, page_mem;
>   };
>   
> @@ -3781,10 +3782,20 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>   	} while (0)
>   #define stat_inc_seg_type(sbi, curseg)					\
>   		((sbi)->segment_count[(curseg)->alloc_type]++)
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
>   #define stat_update_max_atomic_write(inode)				\
>   	do {								\
>   		int cur = F2FS_I_SB(inode)->atomic_files;	\
> @@ -3869,8 +3880,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>   #define stat_update_max_volatile_write(inode)		do { } while (0)
>   #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
>   #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
> -#define stat_inc_block_count(sbi, curseg)		do { } while (0)
> -#define stat_inc_inplace_blocks(sbi)			do { } while (0)
> +#define stat_inc_block_count(sbi, curseg, direct_io)	do { } while (0)
> +#define stat_inc_inplace_blocks(sbi, direct_io)		do { } while (0)
>   #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
>   #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
>   #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 77391e3b7d68..7c47082f73cc 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1247,7 +1247,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>   
>   	/* allocate block address */
>   	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
> -				&sum, type, NULL);
> +				&sum, type, NULL, false);
>   
>   	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
>   				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 3189537a19dc..139db3c709e3 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3410,7 +3410,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
>   void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   		block_t old_blkaddr, block_t *new_blkaddr,
>   		struct f2fs_summary *sum, int type,
> -		struct f2fs_io_info *fio)
> +		struct f2fs_io_info *fio, bool direct_io)
>   {
>   	struct sit_info *sit_i = SIT_I(sbi);
>   	struct curseg_info *curseg = CURSEG_I(sbi, type);
> @@ -3444,7 +3444,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   
>   	__refresh_next_blkoff(sbi, curseg);
>   
> -	stat_inc_block_count(sbi, curseg);
> +	stat_inc_block_count(sbi, curseg, direct_io);
>   
>   	if (from_gc) {
>   		old_mtime = get_segment_mtime(sbi, old_blkaddr);
> @@ -3534,7 +3534,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>   		down_read(&fio->sbi->io_order_lock);
>   reallocate:
>   	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
> -			&fio->new_blkaddr, sum, type, fio);
> +			&fio->new_blkaddr, sum, type, fio, false);
>   	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
>   		invalidate_mapping_pages(META_MAPPING(fio->sbi),
>   					fio->old_blkaddr, fio->old_blkaddr);
> @@ -3630,7 +3630,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>   		goto drop_bio;
>   	}
>   
> -	stat_inc_inplace_blocks(fio->sbi);
> +	stat_inc_inplace_blocks(fio->sbi, false);
>   
>   	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
>   		err = f2fs_merge_page_bio(fio);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
