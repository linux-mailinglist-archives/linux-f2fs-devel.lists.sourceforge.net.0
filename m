Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 903DD25200C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Aug 2020 21:34:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAeiA-0008Vq-DG; Tue, 25 Aug 2020 19:34:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kAei9-0008Vc-54
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Aug 2020 19:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cA7ED8sfhl9j6lN949U4XcK/rvj9gHDnvAcFYBj+c+k=; b=lu04P6TD14nofuSCMavRyvrZ3G
 9Co1Yz5ihDSeXrGfmK44jq5tcHOxzU0oOLA4SzKyQbzSYbzWoDTRUeNkkHr4j1xbXoTbcnn67Vk3T
 5gfjJ3aIiokP7KF3dpYJyI40DdU4OmfZGitfcOFUKa2cM1oSj3DoJtVXIcoynpdrCzC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cA7ED8sfhl9j6lN949U4XcK/rvj9gHDnvAcFYBj+c+k=; b=RXsDP4iFDh4gHFsSQ+lLzR4yc0
 OmtazYxF/JsUF1qzUsbSplG045ZH1R0ZazBhgCFP/BoaIm3Y4DoKXzHG0E8B4bUE1AVufkan29aoh
 V7mSsk864Sj0nIalwlwC/P5UB6THZ5KON3YTXBw5/ktKEOfUOii3YcSozW3AGWES8UAg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAei6-006IHF-HS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Aug 2020 19:34:25 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA6C02075E;
 Tue, 25 Aug 2020 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598384045;
 bh=J1rnYe8st4KDK8U7l2rAfFxpUs7kW7Fc/45qX6HRFzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fL3PFnxWUQu+m3VZ6G0GN3Gh2HAOOCXls+A9r9hj83ME3KgkCKL2oFUxETu5YMnhn
 Trh7bVGnqJHvBqAV59AFBWhJCIAyFbdi/NNwdcpJ/kmr0ZwdRnzO/nlK4b8ovBU/XO
 EsKnAp7ivMF1TvhBAz0ypRNa318CJVeyS2Q1Wb1I=
Date: Tue, 25 Aug 2020 12:34:04 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200825193404.GA2614120@google.com>
References: <20200804131449.50517-1-yuchao0@huawei.com>
 <20200804131449.50517-6-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804131449.50517-6-yuchao0@huawei.com>
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kAei6-006IHF-HS
Subject: Re: [f2fs-dev] [PATCH v2 5/5] f2fs: support age threshold based
 garbage collection
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

I modified directly like below which makes fsck complain wrong free segment
number.

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 60d6b0795231a..a0d7a7e04bc70 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2728,9 +2728,6 @@ static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
 {
        struct curseg_info *curseg = CURSEG_I(sbi, type);

-       if (!sbi->am.atgc_enabled)
-               return;
-
        mutex_lock(&curseg->curseg_mutex);
        if (!curseg->inited)
                goto out;
@@ -2759,9 +2756,6 @@ static void __f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
 {
        struct curseg_info *curseg = CURSEG_I(sbi, type);

-       if (!sbi->am.atgc_enabled)
-               return;
-
        mutex_lock(&curseg->curseg_mutex);
        if (!curseg->inited)
                goto out;

On 08/04, Chao Yu wrote:
> There are several issues in current background GC algorithm:
> - valid blocks is one of key factors during cost overhead calculation,
> so if segment has less valid block, however even its age is young or
> it locates hot segment, CB algorithm will still choose the segment as
> victim, it's not appropriate.
> - GCed data/node will go to existing logs, no matter in-there datas'
> update frequency is the same or not, it may mix hot and cold data
> again.
> - GC alloctor mainly use LFS type segment, it will cost free segment
> more quickly.
> 
> This patch introduces a new algorithm named age threshold based
> garbage collection to solve above issues, there are three steps
> mainly:
> 
> 1. select a source victim:
> - set an age threshold, and select candidates beased threshold:
> e.g.
>  0 means youngest, 100 means oldest, if we set age threshold to 80
>  then select dirty segments which has age in range of [80, 100] as
>  candiddates;
> - set candidate_ratio threshold, and select candidates based the
> ratio, so that we can shrink candidates to those oldest segments;
> - select target segment with fewest valid blocks in order to
> migrate blocks with minimum cost;
> 
> 2. select a target victim:
> - select candidates beased age threshold;
> - set candidate_radius threshold, search candidates whose age is
> around source victims, searching radius should less than the
> radius threshold.
> - select target segment with most valid blocks in order to avoid
> migrating current target segment.
> 
> 3. merge valid blocks from source victim into target victim with
> SSR alloctor.
> 
> Test steps:
> - create 160 dirty segments:
>  * half of them have 128 valid blocks per segment
>  * left of them have 384 valid blocks per segment
> - run background GC
> 
> Benefit: GC count and block movement count both decrease obviously:
> 
> - Before:
>   - Valid: 86
>   - Dirty: 1
>   - Prefree: 11
>   - Free: 6001 (6001)
> 
> GC calls: 162 (BG: 220)
>   - data segments : 160 (160)
>   - node segments : 2 (2)
> Try to move 41454 blocks (BG: 41454)
>   - data blocks : 40960 (40960)
>   - node blocks : 494 (494)
> 
> IPU: 0 blocks
> SSR: 0 blocks in 0 segments
> LFS: 41364 blocks in 81 segments
> 
> - After:
> 
>   - Valid: 87
>   - Dirty: 0
>   - Prefree: 4
>   - Free: 6008 (6008)
> 
> GC calls: 75 (BG: 76)
>   - data segments : 74 (74)
>   - node segments : 1 (1)
> Try to move 12813 blocks (BG: 12813)
>   - data blocks : 12544 (12544)
>   - node blocks : 269 (269)
> 
> IPU: 0 blocks
> SSR: 12032 blocks in 77 segments
> LFS: 855 blocks in 2 segments
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  Documentation/filesystems/f2fs.rst |   2 +
>  fs/f2fs/checkpoint.c               |   4 +-
>  fs/f2fs/data.c                     |   2 +-
>  fs/f2fs/debug.c                    |   4 +
>  fs/f2fs/f2fs.h                     |  29 ++-
>  fs/f2fs/gc.c                       | 368 ++++++++++++++++++++++++++++-
>  fs/f2fs/gc.h                       |  25 ++
>  fs/f2fs/segment.c                  | 182 +++++++++++---
>  fs/f2fs/segment.h                  |  25 +-
>  fs/f2fs/super.c                    |  26 +-
>  include/trace/events/f2fs.h        |   8 +-
>  11 files changed, 617 insertions(+), 58 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index de43239a3c31..58c2549ee602 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -260,6 +260,8 @@ compress_extension=%s  Support adding specified extension, so that f2fs can enab
>                         For other files, we can still enable compression via ioctl.
>                         Note that, there is one reserved special extension '*', it
>                         can be set to enable compression for all files.
> +atgc                   Enable age-threshold garbage collection, it provides high
> +                       effectiveness and efficiency on background GC.
>  ====================== ============================================================
>  
>  Debugfs Entries
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 9e30ff6414b8..6059ce3758d8 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1620,7 +1620,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	f2fs_flush_sit_entries(sbi, cpc);
>  
>  	/* save inmem log status */
> -	f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> +	f2fs_save_inmem_curseg(sbi);
>  
>  	err = do_checkpoint(sbi, cpc);
>  	if (err)
> @@ -1628,7 +1628,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	else
>  		f2fs_clear_prefree_segments(sbi, cpc);
>  
> -	f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> +	f2fs_restore_inmem_curseg(sbi);
>  stop:
>  	unblock_operations(sbi);
>  	stat_inc_cp_count(sbi->stat_info);
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2b2bfda756a8..1c3154914522 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1368,7 +1368,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
>  	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
>  	old_blkaddr = dn->data_blkaddr;
>  	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
> -				&sum, seg_type, NULL, false);
> +				&sum, seg_type, NULL);
>  	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
>  		invalidate_mapping_pages(META_MAPPING(sbi),
>  					old_blkaddr, old_blkaddr);
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 41a91aa8c262..cb679561f44d 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -397,6 +397,10 @@ static int stat_show(struct seq_file *s, void *v)
>  			   si->curseg[CURSEG_COLD_DATA_PINNED],
>  			   si->cursec[CURSEG_COLD_DATA_PINNED],
>  			   si->curzone[CURSEG_COLD_DATA_PINNED]);
> +		seq_printf(s, "  - ATGC   data: %8d %8d %8d\n",
> +			   si->curseg[CURSEG_ALL_DATA_ATGC],
> +			   si->cursec[CURSEG_ALL_DATA_ATGC],
> +			   si->curzone[CURSEG_ALL_DATA_ATGC]);
>  		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
>  			   si->main_area_segs - si->dirty_count -
>  			   si->prefree_count - si->free_segs,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 44445b9ccc1b..3b9c38d5bf58 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -98,6 +98,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  #define F2FS_MOUNT_RESERVE_ROOT		0x01000000
>  #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
>  #define F2FS_MOUNT_NORECOVERY		0x04000000
> +#define F2FS_MOUNT_ATGC			0x08000000
>  
>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -978,7 +979,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
>   */
>  #define	NR_CURSEG_DATA_TYPE	(3)
>  #define NR_CURSEG_NODE_TYPE	(3)
> -#define NR_CURSEG_INMEM_TYPE	(1)
> +#define NR_CURSEG_INMEM_TYPE	(2)
>  #define NR_CURSEG_PERSIST_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
>  #define NR_CURSEG_TYPE		(NR_CURSEG_INMEM_TYPE + NR_CURSEG_PERSIST_TYPE)
>  
> @@ -992,6 +993,7 @@ enum {
>  	NR_PERSISTENT_LOG,	/* number of persistent log */
>  	CURSEG_COLD_DATA_PINNED = NR_PERSISTENT_LOG,
>  				/* pinned file that needs consecutive block address */
> +	CURSEG_ALL_DATA_ATGC,	/* SSR alloctor in hot/warm/cold data area */
>  	NO_CHECK_TYPE,		/* number of persistent & inmem log */
>  };
>  
> @@ -1237,6 +1239,18 @@ struct inode_management {
>  	unsigned long ino_num;			/* number of entries */
>  };
>  
> +/* for GC_AT */
> +struct atgc_management {
> +	bool atgc_enabled;			/* ATGC is enabled or not */
> +	struct rb_root_cached root;		/* root of victim rb-tree */
> +	struct list_head victim_list;		/* linked with all victim entries */
> +	unsigned int victim_count;		/* victim count in rb-tree */
> +	unsigned int candidate_ratio;		/* candidate ratio */
> +	unsigned int max_candidate_count;	/* max candidate count */
> +	unsigned int age_weight;		/* age weight, vblock_weight = 100 - age_weight */
> +	unsigned long long age_threshold;	/* age threshold */
> +};
> +
>  /* For s_flag in struct f2fs_sb_info */
>  enum {
>  	SBI_IS_DIRTY,				/* dirty flag for checkpoint */
> @@ -1269,6 +1283,7 @@ enum {
>  	GC_NORMAL,
>  	GC_IDLE_CB,
>  	GC_IDLE_GREEDY,
> +	GC_IDLE_AT,
>  	GC_URGENT_HIGH,
>  	GC_URGENT_LOW,
>  };
> @@ -1524,6 +1539,7 @@ struct f2fs_sb_info {
>  						 * race between GC and GC or CP
>  						 */
>  	struct f2fs_gc_kthread	*gc_thread;	/* GC thread */
> +	struct atgc_management am;		/* atgc management */
>  	unsigned int cur_victim_sec;		/* current victim section num */
>  	unsigned int gc_mode;			/* current GC state */
>  	unsigned int next_victim_seg[2];	/* next segment in victim section */
> @@ -3341,8 +3357,11 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
>  int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
>  void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
>  int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
> -void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type);
> -void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type);
> +void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
> +void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
> +void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
> +void f2fs_get_new_segment(struct f2fs_sb_info *sbi,
> +			unsigned int *newseg, bool new_sec, int dir);
>  void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>  					unsigned int start, unsigned int end);
>  void f2fs_allocate_new_segment(struct f2fs_sb_info *sbi, int type);
> @@ -3370,7 +3389,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>  void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  			block_t old_blkaddr, block_t *new_blkaddr,
>  			struct f2fs_summary *sum, int type,
> -			struct f2fs_io_info *fio, bool from_gc);
> +			struct f2fs_io_info *fio);
>  void f2fs_wait_on_page_writeback(struct page *page,
>  			enum page_type type, bool ordered, bool locked);
>  void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
> @@ -3505,6 +3524,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background,
>  			unsigned int segno);
>  void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
>  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
> +int __init f2fs_create_garbage_collection_cache(void);
> +void f2fs_destroy_garbage_collection_cache(void);
>  
>  /*
>   * recovery.c
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index da187aec988f..a38d41b21019 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -21,6 +21,8 @@
>  #include "gc.h"
>  #include <trace/events/f2fs.h>
>  
> +static struct kmem_cache *victim_entry_slab;
> +
>  static unsigned int count_bits(const unsigned long *addr,
>  				unsigned int offset, unsigned int len);
>  
> @@ -169,7 +171,16 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
>  
>  static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
>  {
> -	int gc_mode = (gc_type == BG_GC) ? GC_CB : GC_GREEDY;
> +	int gc_mode;
> +
> +	if (gc_type == BG_GC) {
> +		if (sbi->am.atgc_enabled)
> +			gc_mode = GC_AT;
> +		else
> +			gc_mode = GC_CB;
> +	} else {
> +		gc_mode = GC_GREEDY;
> +	}
>  
>  	switch (sbi->gc_mode) {
>  	case GC_IDLE_CB:
> @@ -179,7 +190,11 @@ static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
>  	case GC_URGENT_HIGH:
>  		gc_mode = GC_GREEDY;
>  		break;
> +	case GC_IDLE_AT:
> +		gc_mode = GC_AT;
> +		break;
>  	}
> +
>  	return gc_mode;
>  }
>  
> @@ -193,6 +208,11 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
>  		p->dirty_bitmap = dirty_i->dirty_segmap[type];
>  		p->max_search = dirty_i->nr_dirty[type];
>  		p->ofs_unit = 1;
> +	} else if (p->alloc_mode == AT_SSR) {
> +		p->gc_mode = GC_GREEDY;
> +		p->dirty_bitmap = dirty_i->dirty_segmap[type];
> +		p->max_search = dirty_i->nr_dirty[type];
> +		p->ofs_unit = 1;
>  	} else {
>  		p->gc_mode = select_gc_type(sbi, gc_type);
>  		p->ofs_unit = sbi->segs_per_sec;
> @@ -212,6 +232,7 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
>  	 */
>  	if (gc_type != FG_GC &&
>  			(sbi->gc_mode != GC_URGENT_HIGH) &&
> +			(p->gc_mode != GC_AT && p->alloc_mode != AT_SSR) &&
>  			p->max_search > sbi->max_victim_search)
>  		p->max_search = sbi->max_victim_search;
>  
> @@ -229,10 +250,16 @@ static unsigned int get_max_cost(struct f2fs_sb_info *sbi,
>  	/* SSR allocates in a segment unit */
>  	if (p->alloc_mode == SSR)
>  		return sbi->blocks_per_seg;
> +	else if (p->alloc_mode == AT_SSR)
> +		return UINT_MAX;
> +
> +	/* LFS */
>  	if (p->gc_mode == GC_GREEDY)
>  		return 2 * sbi->blocks_per_seg * p->ofs_unit;
>  	else if (p->gc_mode == GC_CB)
>  		return UINT_MAX;
> +	else if (p->gc_mode == GC_AT)
> +		return UINT_MAX;
>  	else /* No other gc_mode */
>  		return 0;
>  }
> @@ -297,8 +324,11 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
>  	/* alloc_mode == LFS */
>  	if (p->gc_mode == GC_GREEDY)
>  		return get_valid_blocks(sbi, segno, true);
> -	else
> +	else if (p->gc_mode == GC_CB)
>  		return get_cb_cost(sbi, segno);
> +
> +	f2fs_bug_on(sbi, 1);
> +	return 0;
>  }
>  
>  static unsigned int count_bits(const unsigned long *addr,
> @@ -313,6 +343,263 @@ static unsigned int count_bits(const unsigned long *addr,
>  	return sum;
>  }
>  
> +static struct victim_entry *attach_victim_entry(struct f2fs_sb_info *sbi,
> +				unsigned long long mtime, unsigned int segno,
> +				struct rb_node *parent, struct rb_node **p,
> +				bool left_most)
> +{
> +	struct atgc_management *am = &sbi->am;
> +	struct victim_entry *ve;
> +
> +	ve =  f2fs_kmem_cache_alloc(victim_entry_slab, GFP_NOFS);
> +
> +	ve->mtime = mtime;
> +	ve->segno = segno;
> +
> +	rb_link_node(&ve->rb_node, parent, p);
> +	rb_insert_color_cached(&ve->rb_node, &am->root, left_most);
> +
> +	list_add_tail(&ve->list, &am->victim_list);
> +
> +	am->victim_count++;
> +
> +	return ve;
> +}
> +
> +static void insert_victim_entry(struct f2fs_sb_info *sbi,
> +				unsigned long long mtime, unsigned int segno)
> +{
> +	struct atgc_management *am = &sbi->am;
> +	struct rb_node **p;
> +	struct rb_node *parent = NULL;
> +	bool left_most = true;
> +
> +	p = f2fs_lookup_rb_tree_ext(sbi, &am->root, &parent, mtime, &left_most);
> +	attach_victim_entry(sbi, mtime, segno, parent, p, left_most);
> +}
> +
> +static void add_victim_entry(struct f2fs_sb_info *sbi,
> +				struct victim_sel_policy *p, unsigned int segno)
> +{
> +	struct sit_info *sit_i = SIT_I(sbi);
> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> +	unsigned int start = GET_SEG_FROM_SEC(sbi, secno);
> +	unsigned long long mtime = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < sbi->segs_per_sec; i++)
> +		mtime += get_seg_entry(sbi, start + i)->mtime;
> +	mtime = div_u64(mtime, sbi->segs_per_sec);
> +
> +	/* Handle if the system time has changed by the user */
> +	if (mtime < sit_i->min_mtime)
> +		sit_i->min_mtime = mtime;
> +	if (mtime > sit_i->max_mtime)
> +		sit_i->max_mtime = mtime;
> +	if (mtime < sit_i->dirty_min_mtime)
> +		sit_i->dirty_min_mtime = mtime;
> +	if (mtime > sit_i->dirty_max_mtime)
> +		sit_i->dirty_max_mtime = mtime;
> +
> +	/* don't choose young section as candidate */
> +	if (sit_i->dirty_max_mtime - mtime < p->age_threshold)
> +		return;
> +
> +	insert_victim_entry(sbi, mtime, segno);
> +}
> +
> +static struct rb_node *lookup_central_victim(struct f2fs_sb_info *sbi,
> +						struct victim_sel_policy *p)
> +{
> +	struct atgc_management *am = &sbi->am;
> +	struct rb_node *parent = NULL;
> +	bool left_most;
> +
> +	f2fs_lookup_rb_tree_ext(sbi, &am->root, &parent, p->age, &left_most);
> +
> +	return parent;
> +}
> +
> +static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
> +						struct victim_sel_policy *p)
> +{
> +	struct sit_info *sit_i = SIT_I(sbi);
> +	struct atgc_management *am = &sbi->am;
> +	struct rb_root_cached *root = &am->root;
> +	struct rb_node *node;
> +	struct rb_entry *re;
> +	struct victim_entry *ve;
> +	unsigned long long total_time;
> +	unsigned long long age, u, accu;
> +	unsigned long long max_mtime = sit_i->dirty_max_mtime;
> +	unsigned long long min_mtime = sit_i->dirty_min_mtime;
> +	unsigned int sec_blocks = BLKS_PER_SEC(sbi);
> +	unsigned int vblocks;
> +	unsigned int dirty_threshold = max(am->max_candidate_count,
> +					am->candidate_ratio *
> +					am->victim_count / 100);
> +	unsigned int age_weight = am->age_weight;
> +	unsigned int cost;
> +	unsigned int iter = 0;
> +
> +	if (max_mtime < min_mtime)
> +		return;
> +
> +	max_mtime += 1;
> +	total_time = max_mtime - min_mtime;
> +
> +	accu = div64_u64(ULLONG_MAX, total_time);
> +	accu = min_t(unsigned long long, div_u64(accu, 100),
> +					DEFAULT_ACCURACY_CLASS);
> +
> +	node = rb_first_cached(root);
> +next:
> +	re = rb_entry_safe(node, struct rb_entry, rb_node);
> +	if (!re)
> +		return;
> +
> +	ve = (struct victim_entry *)re;
> +
> +	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
> +		goto skip;
> +
> +	/* age = 10000 * x% * 60 */
> +	age = div64_u64(accu * (max_mtime - ve->mtime), total_time) *
> +								age_weight;
> +
> +	vblocks = get_valid_blocks(sbi, ve->segno, true);
> +	f2fs_bug_on(sbi, !vblocks || vblocks == sec_blocks);
> +
> +	/* u = 10000 * x% * 40 */
> +	u = div64_u64(accu * (sec_blocks - vblocks), sec_blocks) *
> +							(100 - age_weight);
> +
> +	f2fs_bug_on(sbi, age + u >= UINT_MAX);
> +
> +	cost = UINT_MAX - (age + u);
> +	iter++;
> +
> +	if (cost < p->min_cost ||
> +			(cost == p->min_cost && age > p->oldest_age)) {
> +		p->min_cost = cost;
> +		p->oldest_age = age;
> +		p->min_segno = ve->segno;
> +	}
> +skip:
> +	if (iter < dirty_threshold) {
> +		node = rb_next(node);
> +		goto next;
> +	}
> +}
> +
> +/*
> + * select candidates around source section in range of
> + * [target - dirty_threshold, target + dirty_threshold]
> + */
> +static void atssr_lookup_victim(struct f2fs_sb_info *sbi,
> +						struct victim_sel_policy *p)
> +{
> +	struct sit_info *sit_i = SIT_I(sbi);
> +	struct atgc_management *am = &sbi->am;
> +	struct rb_node *node;
> +	struct rb_entry *re;
> +	struct victim_entry *ve;
> +	unsigned long long age;
> +	unsigned long long max_mtime = sit_i->dirty_max_mtime;
> +	unsigned long long min_mtime = sit_i->dirty_min_mtime;
> +	unsigned int seg_blocks = sbi->blocks_per_seg;
> +	unsigned int vblocks;
> +	unsigned int dirty_threshold = max(am->max_candidate_count,
> +					am->candidate_ratio *
> +					am->victim_count / 100);
> +	unsigned int cost;
> +	unsigned int iter = 0;
> +	int stage = 0;
> +
> +	if (max_mtime < min_mtime)
> +		return;
> +	max_mtime += 1;
> +next_stage:
> +	node = lookup_central_victim(sbi, p);
> +next_node:
> +	re = rb_entry_safe(node, struct rb_entry, rb_node);
> +	if (!re) {
> +		if (stage == 0)
> +			goto skip_stage;
> +		return;
> +	}
> +
> +	ve = (struct victim_entry *)re;
> +
> +	if (ve->mtime >= max_mtime || ve->mtime < min_mtime)
> +		goto skip_node;
> +
> +	age = max_mtime - ve->mtime;
> +
> +	vblocks = get_seg_entry(sbi, ve->segno)->ckpt_valid_blocks;
> +	f2fs_bug_on(sbi, !vblocks);
> +
> +	/* rare case */
> +	if (vblocks == seg_blocks)
> +		goto skip_node;
> +
> +	iter++;
> +
> +	age = max_mtime - abs(p->age - age);
> +	cost = UINT_MAX - vblocks;
> +
> +	if (cost < p->min_cost ||
> +			(cost == p->min_cost && age > p->oldest_age)) {
> +		p->min_cost = cost;
> +		p->oldest_age = age;
> +		p->min_segno = ve->segno;
> +	}
> +skip_node:
> +	if (iter < dirty_threshold) {
> +		if (stage == 0)
> +			node = rb_prev(node);
> +		else if (stage == 1)
> +			node = rb_next(node);
> +		goto next_node;
> +	}
> +skip_stage:
> +	if (stage < 1) {
> +		stage++;
> +		iter = 0;
> +		goto next_stage;
> +	}
> +}
> +static void lookup_victim_by_age(struct f2fs_sb_info *sbi,
> +						struct victim_sel_policy *p)
> +{
> +	f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
> +						&sbi->am.root, true));
> +
> +	if (p->gc_mode == GC_AT)
> +		atgc_lookup_victim(sbi, p);
> +	else if (p->alloc_mode == AT_SSR)
> +		atssr_lookup_victim(sbi, p);
> +	else
> +		f2fs_bug_on(sbi, 1);
> +}
> +
> +static void release_victim_entry(struct f2fs_sb_info *sbi)
> +{
> +	struct atgc_management *am = &sbi->am;
> +	struct victim_entry *ve, *tmp;
> +
> +	list_for_each_entry_safe(ve, tmp, &am->victim_list, list) {
> +		list_del(&ve->list);
> +		kmem_cache_free(victim_entry_slab, ve);
> +		am->victim_count--;
> +	}
> +
> +	am->root = RB_ROOT_CACHED;
> +
> +	f2fs_bug_on(sbi, am->victim_count);
> +	f2fs_bug_on(sbi, !list_empty(&am->victim_list));
> +}
> +
>  /*
>   * This function is called from two paths.
>   * One is garbage collection and the other is SSR segment selection.
> @@ -322,25 +609,37 @@ static unsigned int count_bits(const unsigned long *addr,
>   * which has minimum valid blocks and removes it from dirty seglist.
>   */
>  static int get_victim_by_default(struct f2fs_sb_info *sbi,
> -		unsigned int *result, int gc_type, int type, char alloc_mode)
> +			unsigned int *result, int gc_type, int type,
> +			char alloc_mode, unsigned long long age)
>  {
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>  	struct sit_info *sm = SIT_I(sbi);
>  	struct victim_sel_policy p;
>  	unsigned int secno, last_victim;
>  	unsigned int last_segment;
> -	unsigned int nsearched = 0;
> +	unsigned int nsearched;
> +	bool is_atgc;
>  	int ret = 0;
>  
>  	mutex_lock(&dirty_i->seglist_lock);
>  	last_segment = MAIN_SECS(sbi) * sbi->segs_per_sec;
>  
>  	p.alloc_mode = alloc_mode;
> -	select_policy(sbi, gc_type, type, &p);
> +	p.age = age;
> +	p.age_threshold = sbi->am.age_threshold;
>  
> +retry:
> +	select_policy(sbi, gc_type, type, &p);
>  	p.min_segno = NULL_SEGNO;
> +	p.oldest_age = 0;
>  	p.min_cost = get_max_cost(sbi, &p);
>  
> +	is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
> +	nsearched = 0;
> +
> +	if (is_atgc)
> +		SIT_I(sbi)->dirty_min_mtime = ULLONG_MAX;
> +
>  	if (*result != NULL_SEGNO) {
>  		if (!get_valid_blocks(sbi, *result, false)) {
>  			ret = -ENODATA;
> @@ -426,6 +725,11 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>  			goto next;
>  
> +		if (is_atgc) {
> +			add_victim_entry(sbi, &p, segno);
> +			goto next;
> +		}
> +
>  		cost = get_gc_cost(sbi, segno, &p);
>  
>  		if (p.min_cost > cost) {
> @@ -444,6 +748,19 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  			break;
>  		}
>  	}
> +
> +	/* get victim for GC_AT/AT_SSR */
> +	if (is_atgc) {
> +		lookup_victim_by_age(sbi, &p);
> +		release_victim_entry(sbi);
> +	}
> +
> +	if (is_atgc && p.min_segno == NULL_SEGNO &&
> +			sm->elapsed_time < p.age_threshold) {
> +		p.age_threshold = 0;
> +		goto retry;
> +	}
> +
>  	if (p.min_segno != NULL_SEGNO) {
>  got_it:
>  		*result = (p.min_segno / p.ofs_unit) * p.ofs_unit;
> @@ -791,6 +1108,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	block_t newaddr;
>  	int err = 0;
>  	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
> +	int type = fio.sbi->am.atgc_enabled ?
> +				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
>  
>  	/* do not read out */
>  	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
> @@ -877,7 +1196,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	}
>  
>  	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
> -				&sum, CURSEG_COLD_DATA, NULL, true);
> +				&sum, type, NULL);
>  
>  	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
>  				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
> @@ -1182,7 +1501,7 @@ static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
>  
>  	down_write(&sit_i->sentry_lock);
>  	ret = DIRTY_I(sbi)->v_ops->get_victim(sbi, victim, gc_type,
> -					      NO_CHECK_TYPE, LFS);
> +					      NO_CHECK_TYPE, LFS, 0);
>  	up_write(&sit_i->sentry_lock);
>  	return ret;
>  }
> @@ -1204,6 +1523,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>  	if (__is_large_section(sbi))
>  		end_segno = rounddown(end_segno, sbi->segs_per_sec);
>  
> +	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
> +
>  	/* readahead multi ssa blocks those have contiguous address */
>  	if (__is_large_section(sbi))
>  		f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
> @@ -1413,6 +1734,37 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>  	return ret;
>  }
>  
> +int __init f2fs_create_garbage_collection_cache(void)
> +{
> +	victim_entry_slab = f2fs_kmem_cache_create("f2fs_victim_entry",
> +					sizeof(struct victim_entry));
> +	if (!victim_entry_slab)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +void f2fs_destroy_garbage_collection_cache(void)
> +{
> +	kmem_cache_destroy(victim_entry_slab);
> +}
> +
> +static void init_atgc_management(struct f2fs_sb_info *sbi)
> +{
> +	struct atgc_management *am = &sbi->am;
> +
> +	if (test_opt(sbi, ATGC) &&
> +		SIT_I(sbi)->elapsed_time >= DEF_GC_THREAD_AGE_THRESHOLD)
> +		am->atgc_enabled = true;
> +
> +	am->root = RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&am->victim_list);
> +	am->victim_count = 0;
> +
> +	am->candidate_ratio = DEF_GC_THREAD_CANDIDATE_RATIO;
> +	am->max_candidate_count = DEF_GC_THREAD_MAX_CANDIDATE_COUNT;
> +	am->age_weight = DEF_GC_THREAD_AGE_WEIGHT;
> +}
> +
>  void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
>  {
>  	DIRTY_I(sbi)->v_ops = &default_v_ops;
> @@ -1423,6 +1775,8 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
>  	if (f2fs_is_multi_device(sbi) && !__is_large_section(sbi))
>  		SIT_I(sbi)->last_victim[ALLOC_NEXT] =
>  				GET_SEGNO(sbi, FDEV(0).end_blk) + 1;
> +
> +	init_atgc_management(sbi);
>  }
>  
>  static int free_segment_range(struct f2fs_sb_info *sbi,
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index db3c61046aa4..853287b2b45c 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -14,6 +14,14 @@
>  #define DEF_GC_THREAD_MIN_SLEEP_TIME	30000	/* milliseconds */
>  #define DEF_GC_THREAD_MAX_SLEEP_TIME	60000
>  #define DEF_GC_THREAD_NOGC_SLEEP_TIME	300000	/* wait 5 min */
> +
> +/* choose candidates from sections which has age of more than 7 days */
> +#define DEF_GC_THREAD_AGE_THRESHOLD		(60 * 60 * 24 * 7)
> +#define DEF_GC_THREAD_CANDIDATE_RATIO		20	/* select 20% oldest sections as candidates */
> +#define DEF_GC_THREAD_MAX_CANDIDATE_COUNT	10	/* select at most 10 sections as candidates */
> +#define DEF_GC_THREAD_AGE_WEIGHT		60	/* age weight */
> +#define DEFAULT_ACCURACY_CLASS			10000	/* accuracy class */
> +
>  #define LIMIT_INVALID_BLOCK	40 /* percentage over total user space */
>  #define LIMIT_FREE_BLOCK	40 /* percentage over invalid + free space */
>  
> @@ -41,6 +49,23 @@ struct gc_inode_list {
>  	struct radix_tree_root iroot;
>  };
>  
> +struct victim_info {
> +	unsigned long long mtime;	/* mtime of section */
> +	unsigned int segno;		/* section No. */
> +};
> +
> +struct victim_entry {
> +	struct rb_node rb_node;		/* rb node located in rb-tree */
> +	union {
> +		struct {
> +			unsigned long long mtime;	/* mtime of section */
> +			unsigned int segno;		/* segment No. */
> +		};
> +		struct victim_info vi;	/* victim info */
> +	};
> +	struct list_head list;
> +};
> +
>  /*
>   * inline functions
>   */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index f89219db72a2..5a5f5ad2e865 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2420,9 +2420,9 @@ static void write_current_sum_page(struct f2fs_sb_info *sbi,
>  	f2fs_put_page(page, 1);
>  }
>  
> -static int is_next_segment_free(struct f2fs_sb_info *sbi, int type)
> +static int is_next_segment_free(struct f2fs_sb_info *sbi,
> +				struct curseg_info *curseg, int type)
>  {
> -	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	unsigned int segno = curseg->segno + 1;
>  	struct free_segmap_info *free_i = FREE_I(sbi);
>  
> @@ -2526,6 +2526,7 @@ static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	struct summary_footer *sum_footer;
> +	unsigned short seg_type = curseg->seg_type;
>  
>  	curseg->inited = true;
>  	curseg->segno = curseg->next_segno;
> @@ -2535,16 +2536,22 @@ static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
>  
>  	sum_footer = &(curseg->sum_blk->footer);
>  	memset(sum_footer, 0, sizeof(struct summary_footer));
> -	if (IS_DATASEG(curseg->seg_type))
> +
> +	sanity_check_seg_type(sbi, seg_type);
> +
> +	if (IS_DATASEG(seg_type))
>  		SET_SUM_TYPE(sum_footer, SUM_TYPE_DATA);
> -	if (IS_NODESEG(curseg->seg_type))
> +	if (IS_NODESEG(seg_type))
>  		SET_SUM_TYPE(sum_footer, SUM_TYPE_NODE);
> -	__set_sit_entry_type(sbi, curseg->seg_type, curseg->segno, modified);
> +	__set_sit_entry_type(sbi, seg_type, curseg->segno, modified);
>  }
>  
>  static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> +	unsigned short seg_type = curseg->seg_type;
> +
> +	sanity_check_seg_type(sbi, seg_type);
>  
>  	/* if segs_per_sec is large than 1, we need to keep original policy. */
>  	if (__is_large_section(sbi))
> @@ -2558,8 +2565,7 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>  		return 0;
>  
>  	if (test_opt(sbi, NOHEAP) &&
> -		(curseg->seg_type == CURSEG_HOT_DATA ||
> -		IS_NODESEG(curseg->seg_type)))
> +		(seg_type == CURSEG_HOT_DATA || IS_NODESEG(seg_type)))
>  		return 0;
>  
>  	if (SIT_I(sbi)->last_victim[ALLOC_NEXT])
> @@ -2635,7 +2641,7 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
>   * This function always allocates a used segment(from dirty seglist) by SSR
>   * manner, so it should recover the existing segment information of valid blocks
>   */
> -static void change_curseg(struct f2fs_sb_info *sbi, int type)
> +static void change_curseg(struct f2fs_sb_info *sbi, int type, bool flush)
>  {
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> @@ -2643,8 +2649,10 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type)
>  	struct f2fs_summary_block *sum_node;
>  	struct page *sum_page;
>  
> -	write_sum_page(sbi, curseg->sum_blk,
> -				GET_SUM_BLOCK(sbi, curseg->segno));
> +	if (flush)
> +		write_sum_page(sbi, curseg->sum_blk,
> +					GET_SUM_BLOCK(sbi, curseg->segno));
> +
>  	__set_test_and_inuse(sbi, new_segno);
>  
>  	mutex_lock(&dirty_i->seglist_lock);
> @@ -2663,10 +2671,62 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type)
>  	f2fs_put_page(sum_page, 1);
>  }
>  
> -void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> +static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
> +				int alloc_mode, unsigned long long age);
> +
> +static void get_atssr_segment(struct f2fs_sb_info *sbi, int type,
> +					int target_type, int alloc_mode,
> +					unsigned long long age)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  
> +	curseg->seg_type = target_type;
> +
> +	if (get_ssr_segment(sbi, type, alloc_mode, age)) {
> +		struct seg_entry *se = get_seg_entry(sbi, curseg->next_segno);
> +
> +		curseg->seg_type = se->type;
> +		change_curseg(sbi, type, true);
> +	} else {
> +		/* allocate cold segment by default */
> +		curseg->seg_type = CURSEG_COLD_DATA;
> +		new_curseg(sbi, type, true);
> +	}
> +	stat_inc_seg_type(sbi, curseg);
> +}
> +
> +static void __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
> +{
> +	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC);
> +
> +	if (!sbi->am.atgc_enabled)
> +		return;
> +
> +	down_read(&SM_I(sbi)->curseg_lock);
> +
> +	mutex_lock(&curseg->curseg_mutex);
> +	down_write(&SIT_I(sbi)->sentry_lock);
> +
> +	get_atssr_segment(sbi, CURSEG_ALL_DATA_ATGC, CURSEG_COLD_DATA, SSR, 0);
> +
> +	up_write(&SIT_I(sbi)->sentry_lock);
> +	mutex_unlock(&curseg->curseg_mutex);
> +
> +	up_read(&SM_I(sbi)->curseg_lock);
> +
> +}
> +void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi)
> +{
> +	__f2fs_init_atgc_curseg(sbi);
> +}
> +
> +static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> +{
> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> +
> +	if (!sbi->am.atgc_enabled)
> +		return;
> +
>  	mutex_lock(&curseg->curseg_mutex);
>  	if (!curseg->inited)
>  		goto out;
> @@ -2683,10 +2743,21 @@ void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
>  	mutex_unlock(&curseg->curseg_mutex);
>  }
>  
> -void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
> +void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi)
> +{
> +	__f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> +
> +	if (sbi->am.atgc_enabled)
> +		__f2fs_save_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
> +}
> +
> +static void __f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  
> +	if (!sbi->am.atgc_enabled)
> +		return;
> +
>  	mutex_lock(&curseg->curseg_mutex);
>  	if (!curseg->inited)
>  		goto out;
> @@ -2700,23 +2771,35 @@ void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
>  	mutex_unlock(&curseg->curseg_mutex);
>  }
>  
> -static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
> +void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi)
> +{
> +	__f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> +
> +	if (sbi->am.atgc_enabled)
> +		__f2fs_restore_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
> +}
> +
> +static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
> +				int alloc_mode, unsigned long long age)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	const struct victim_selection *v_ops = DIRTY_I(sbi)->v_ops;
>  	unsigned segno = NULL_SEGNO;
> +	unsigned short seg_type = curseg->seg_type;
>  	int i, cnt;
>  	bool reversed = false;
>  
> +	sanity_check_seg_type(sbi, seg_type);
> +
>  	/* f2fs_need_SSR() already forces to do this */
> -	if (!v_ops->get_victim(sbi, &segno, BG_GC, type, SSR)) {
> +	if (!v_ops->get_victim(sbi, &segno, BG_GC, seg_type, alloc_mode, age)) {
>  		curseg->next_segno = segno;
>  		return 1;
>  	}
>  
>  	/* For node segments, let's do SSR more intensively */
> -	if (IS_NODESEG(type)) {
> -		if (type >= CURSEG_WARM_NODE) {
> +	if (IS_NODESEG(seg_type)) {
> +		if (seg_type >= CURSEG_WARM_NODE) {
>  			reversed = true;
>  			i = CURSEG_COLD_NODE;
>  		} else {
> @@ -2724,7 +2807,7 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
>  		}
>  		cnt = NR_CURSEG_NODE_TYPE;
>  	} else {
> -		if (type >= CURSEG_WARM_DATA) {
> +		if (seg_type >= CURSEG_WARM_DATA) {
>  			reversed = true;
>  			i = CURSEG_COLD_DATA;
>  		} else {
> @@ -2734,9 +2817,9 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
>  	}
>  
>  	for (; cnt-- > 0; reversed ? i-- : i++) {
> -		if (i == type)
> +		if (i == seg_type)
>  			continue;
> -		if (!v_ops->get_victim(sbi, &segno, BG_GC, i, SSR)) {
> +		if (!v_ops->get_victim(sbi, &segno, BG_GC, i, alloc_mode, age)) {
>  			curseg->next_segno = segno;
>  			return 1;
>  		}
> @@ -2765,13 +2848,15 @@ static void allocate_segment_by_default(struct f2fs_sb_info *sbi,
>  	if (force)
>  		new_curseg(sbi, type, true);
>  	else if (!is_set_ckpt_flags(sbi, CP_CRC_RECOVERY_FLAG) &&
> -					type == CURSEG_WARM_NODE)
> +					curseg->seg_type == CURSEG_WARM_NODE)
>  		new_curseg(sbi, type, false);
> -	else if (curseg->alloc_type == LFS && is_next_segment_free(sbi, type) &&
> +	else if (curseg->alloc_type == LFS &&
> +			is_next_segment_free(sbi, curseg, type) &&
>  			likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>  		new_curseg(sbi, type, false);
> -	else if (f2fs_need_SSR(sbi) && get_ssr_segment(sbi, type))
> -		change_curseg(sbi, type);
> +	else if (f2fs_need_SSR(sbi) &&
> +			get_ssr_segment(sbi, type, SSR, 0))
> +		change_curseg(sbi, type, true);
>  	else
>  		new_curseg(sbi, type, false);
>  
> @@ -2792,8 +2877,8 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>  	if (segno < start || segno > end)
>  		goto unlock;
>  
> -	if (f2fs_need_SSR(sbi) && get_ssr_segment(sbi, type))
> -		change_curseg(sbi, type);
> +	if (f2fs_need_SSR(sbi) && get_ssr_segment(sbi, type, SSR, 0))
> +		change_curseg(sbi, type, true);
>  	else
>  		new_curseg(sbi, type, true);
>  
> @@ -3012,9 +3097,9 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>  	return err;
>  }
>  
> -static bool __has_curseg_space(struct f2fs_sb_info *sbi, int type)
> +static bool __has_curseg_space(struct f2fs_sb_info *sbi,
> +					struct curseg_info *curseg)
>  {
> -	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	if (curseg->next_blkoff < sbi->blocks_per_seg)
>  		return true;
>  	return false;
> @@ -3157,8 +3242,13 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  	if (fio->type == DATA) {
>  		struct inode *inode = fio->page->mapping->host;
>  
> -		if (is_cold_data(fio->page) || file_is_cold(inode) ||
> -				f2fs_compressed_file(inode))
> +		if (is_cold_data(fio->page)) {
> +			if (fio->sbi->am.atgc_enabled)
> +				return CURSEG_ALL_DATA_ATGC;
> +			else
> +				return CURSEG_COLD_DATA;
> +		}
> +		if (file_is_cold(inode) || f2fs_compressed_file(inode))
>  			return CURSEG_COLD_DATA;
>  		if (file_is_hot(inode) ||
>  				is_inode_flag_set(inode, FI_HOT_DATA) ||
> @@ -3204,19 +3294,29 @@ static int __get_segment_type(struct f2fs_io_info *fio)
>  void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  		block_t old_blkaddr, block_t *new_blkaddr,
>  		struct f2fs_summary *sum, int type,
> -		struct f2fs_io_info *fio, bool from_gc)
> +		struct f2fs_io_info *fio)
>  {
>  	struct sit_info *sit_i = SIT_I(sbi);
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	unsigned long long old_mtime;
> +	bool from_gc = (type == CURSEG_ALL_DATA_ATGC);
> +	struct seg_entry *se;
>  
>  	down_read(&SM_I(sbi)->curseg_lock);
>  
>  	mutex_lock(&curseg->curseg_mutex);
>  	down_write(&sit_i->sentry_lock);
>  
> +	if (from_gc) {
> +		f2fs_bug_on(sbi, GET_SEGNO(sbi, old_blkaddr) == NULL_SEGNO);
> +		se = get_seg_entry(sbi, GET_SEGNO(sbi, old_blkaddr));
> +		sanity_check_seg_type(sbi, se->type);
> +		f2fs_bug_on(sbi, IS_NODESEG(se->type));
> +	}
>  	*new_blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
>  
> +	f2fs_bug_on(sbi, curseg->next_blkoff >= sbi->blocks_per_seg);
> +
>  	f2fs_wait_discard_bio(sbi, *new_blkaddr);
>  
>  	/*
> @@ -3246,9 +3346,13 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
>  		update_sit_entry(sbi, old_blkaddr, -1);
>  
> -	if (!__has_curseg_space(sbi, type))
> -		sit_i->s_ops->allocate_segment(sbi, type, false);
> -
> +	if (!__has_curseg_space(sbi, curseg)) {
> +		if (from_gc)
> +			get_atssr_segment(sbi, type, se->type,
> +						AT_SSR, se->mtime);
> +		else
> +			sit_i->s_ops->allocate_segment(sbi, type, false);
> +	}
>  	/*
>  	 * segment dirty status should be updated after segment allocation,
>  	 * so we just need to update status only one time after previous
> @@ -3314,8 +3418,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>  		down_read(&fio->sbi->io_order_lock);
>  reallocate:
>  	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
> -			&fio->new_blkaddr, sum, type, fio,
> -			is_cold_data(fio->page));
> +			&fio->new_blkaddr, sum, type, fio);
>  	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
>  		invalidate_mapping_pages(META_MAPPING(fio->sbi),
>  					fio->old_blkaddr, fio->old_blkaddr);
> @@ -3477,7 +3580,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  	/* change the current segment */
>  	if (segno != curseg->segno) {
>  		curseg->next_segno = segno;
> -		change_curseg(sbi, type);
> +		change_curseg(sbi, type, true);
>  	}
>  
>  	curseg->next_blkoff = GET_BLKOFF_FROM_SEG0(sbi, new_blkaddr);
> @@ -3504,7 +3607,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  	if (recover_curseg) {
>  		if (old_cursegno != curseg->segno) {
>  			curseg->next_segno = old_cursegno;
> -			change_curseg(sbi, type);
> +			change_curseg(sbi, type, true);
>  		}
>  		curseg->next_blkoff = old_blkoff;
>  	}
> @@ -4259,6 +4362,8 @@ static int build_curseg(struct f2fs_sb_info *sbi)
>  			array[i].seg_type = CURSEG_HOT_DATA + i;
>  		else if (i == CURSEG_COLD_DATA_PINNED)
>  			array[i].seg_type = CURSEG_COLD_DATA;
> +		else if (i == CURSEG_ALL_DATA_ATGC)
> +			array[i].seg_type = CURSEG_COLD_DATA;
>  		array[i].segno = NULL_SEGNO;
>  		array[i].next_blkoff = 0;
>  		array[i].inited = false;
> @@ -4501,6 +4606,8 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  		struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
>  		unsigned int blkofs = curseg->next_blkoff;
>  
> +		sanity_check_seg_type(sbi, curseg->seg_type);
> +
>  		if (f2fs_test_bit(blkofs, se->cur_valid_map))
>  			goto out;
>  
> @@ -4803,6 +4910,7 @@ static void init_min_max_mtime(struct f2fs_sb_info *sbi)
>  			sit_i->min_mtime = mtime;
>  	}
>  	sit_i->max_mtime = get_mtime(sbi, false);
> +	sit_i->dirty_max_mtime = 0;
>  	up_write(&sit_i->sentry_lock);
>  }
>  
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 515d9ed2cd95..47a5c464603f 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -24,6 +24,12 @@
>  #define IS_DATASEG(t)	((t) <= CURSEG_COLD_DATA)
>  #define IS_NODESEG(t)	((t) >= CURSEG_HOT_NODE && (t) <= CURSEG_COLD_NODE)
>  
> +static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
> +						unsigned short seg_type)
> +{
> +	f2fs_bug_on(sbi, seg_type >= NR_PERSISTENT_LOG);
> +}
> +
>  #define IS_HOT(t)	((t) == CURSEG_HOT_NODE || (t) == CURSEG_HOT_DATA)
>  #define IS_WARM(t)	((t) == CURSEG_WARM_NODE || (t) == CURSEG_WARM_DATA)
>  #define IS_COLD(t)	((t) == CURSEG_COLD_NODE || (t) == CURSEG_COLD_DATA)
> @@ -35,7 +41,8 @@
>  	 ((seg) == CURSEG_I(sbi, CURSEG_HOT_NODE)->segno) ||	\
>  	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno) ||	\
>  	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno) ||	\
> -	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno))
> +	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno) ||	\
> +	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno))
>  
>  #define IS_CURSEC(sbi, secno)						\
>  	(((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /		\
> @@ -51,6 +58,8 @@
>  	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno /		\
>  	  (sbi)->segs_per_sec) ||	\
>  	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /	\
> +	  (sbi)->segs_per_sec) ||	\
> +	 ((secno) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno /	\
>  	  (sbi)->segs_per_sec))
>  
>  #define MAIN_BLKADDR(sbi)						\
> @@ -135,20 +144,25 @@ enum {
>   * In the victim_sel_policy->alloc_mode, there are two block allocation modes.
>   * LFS writes data sequentially with cleaning operations.
>   * SSR (Slack Space Recycle) reuses obsolete space without cleaning operations.
> + * AT_SSR (Age Threshold based Slack Space Recycle) merges fragments into
> + * fragmented segment which has similar aging degree.
>   */
>  enum {
>  	LFS = 0,
> -	SSR
> +	SSR,
> +	AT_SSR,
>  };
>  
>  /*
>   * In the victim_sel_policy->gc_mode, there are two gc, aka cleaning, modes.
>   * GC_CB is based on cost-benefit algorithm.
>   * GC_GREEDY is based on greedy algorithm.
> + * GC_AT is based on age-threshold algorithm.
>   */
>  enum {
>  	GC_CB = 0,
>  	GC_GREEDY,
> +	GC_AT,
>  	ALLOC_NEXT,
>  	FLUSH_DEVICE,
>  	MAX_GC_POLICY,
> @@ -177,7 +191,10 @@ struct victim_sel_policy {
>  	unsigned int offset;		/* last scanned bitmap offset */
>  	unsigned int ofs_unit;		/* bitmap search unit */
>  	unsigned int min_cost;		/* minimum cost */
> +	unsigned long long oldest_age;	/* oldest age of segments having the same min cost */
>  	unsigned int min_segno;		/* segment # having min. cost */
> +	unsigned long long age;		/* mtime of GCed section*/
> +	unsigned long long age_threshold;/* age threshold */
>  };
>  
>  struct seg_entry {
> @@ -243,6 +260,8 @@ struct sit_info {
>  	unsigned long long mounted_time;	/* mount time */
>  	unsigned long long min_mtime;		/* min. modification time */
>  	unsigned long long max_mtime;		/* max. modification time */
> +	unsigned long long dirty_min_mtime;	/* rerange candidates in GC_AT */
> +	unsigned long long dirty_max_mtime;	/* rerange candidates in GC_AT */
>  
>  	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
>  };
> @@ -281,7 +300,7 @@ struct dirty_seglist_info {
>  /* victim selection function for cleaning and SSR */
>  struct victim_selection {
>  	int (*get_victim)(struct f2fs_sb_info *, unsigned int *,
> -							int, int, char);
> +					int, int, char, unsigned long long);
>  };
>  
>  /* for active log information */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index bf90c8caeb1e..e391079587ac 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -145,6 +145,7 @@ enum {
>  	Opt_compress_algorithm,
>  	Opt_compress_log_size,
>  	Opt_compress_extension,
> +	Opt_atgc,
>  	Opt_err,
>  };
>  
> @@ -211,6 +212,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_compress_algorithm, "compress_algorithm=%s"},
>  	{Opt_compress_log_size, "compress_log_size=%u"},
>  	{Opt_compress_extension, "compress_extension=%s"},
> +	{Opt_atgc, "atgc"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -930,6 +932,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			f2fs_info(sbi, "compression options not supported");
>  			break;
>  #endif
> +		case Opt_atgc:
> +			set_opt(sbi, ATGC);
> +			break;
>  		default:
>  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>  				 p);
> @@ -1623,6 +1628,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	f2fs_show_compress_options(seq, sbi->sb);
>  #endif
> +
> +	if (test_opt(sbi, ATGC))
> +		seq_puts(seq, ",atgc");
>  	return 0;
>  }
>  
> @@ -1750,6 +1758,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
>  	bool disable_checkpoint = test_opt(sbi, DISABLE_CHECKPOINT);
>  	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
> +	bool no_atgc = !test_opt(sbi, ATGC);
>  	bool checkpoint_changed;
>  #ifdef CONFIG_QUOTA
>  	int i, j;
> @@ -1822,6 +1831,13 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  		}
>  	}
>  #endif
> +	/* disallow enable atgc dynamically */
> +	if (no_atgc == !!test_opt(sbi, ATGC)) {
> +		err = -EINVAL;
> +		f2fs_warn(sbi, "switch atgc option is not allowed");
> +		goto restore_opts;
> +	}
> +
>  	/* disallow enable/disable extent_cache dynamically */
>  	if (no_extent_cache == !!test_opt(sbi, EXTENT_CACHE)) {
>  		err = -EINVAL;
> @@ -3728,6 +3744,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	}
>  
>  reset_checkpoint:
> +	f2fs_init_inmem_curseg(sbi);
> +
>  	/* f2fs_recover_fsync_data() cleared this already */
>  	clear_sbi_flag(sbi, SBI_POR_DOING);
>  
> @@ -3933,9 +3951,12 @@ static int __init init_f2fs_fs(void)
>  	err = f2fs_create_extent_cache();
>  	if (err)
>  		goto free_checkpoint_caches;
> -	err = f2fs_init_sysfs();
> +	err = f2fs_create_garbage_collection_cache();
>  	if (err)
>  		goto free_extent_cache;
> +	err = f2fs_init_sysfs();
> +	if (err)
> +		goto free_garbage_collection_cache;
>  	err = register_shrinker(&f2fs_shrinker_info);
>  	if (err)
>  		goto free_sysfs;
> @@ -3969,6 +3990,8 @@ static int __init init_f2fs_fs(void)
>  	unregister_shrinker(&f2fs_shrinker_info);
>  free_sysfs:
>  	f2fs_exit_sysfs();
> +free_garbage_collection_cache:
> +	f2fs_destroy_garbage_collection_cache();
>  free_extent_cache:
>  	f2fs_destroy_extent_cache();
>  free_checkpoint_caches:
> @@ -3993,6 +4016,7 @@ static void __exit exit_f2fs_fs(void)
>  	unregister_filesystem(&f2fs_fs_type);
>  	unregister_shrinker(&f2fs_shrinker_info);
>  	f2fs_exit_sysfs();
> +	f2fs_destroy_garbage_collection_cache();
>  	f2fs_destroy_extent_cache();
>  	f2fs_destroy_checkpoint_caches();
>  	f2fs_destroy_segment_manager_caches();
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 8a1c1311acac..06c73f3f6dd2 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -111,13 +111,15 @@ TRACE_DEFINE_ENUM(CP_RESIZE);
>  
>  #define show_alloc_mode(type)						\
>  	__print_symbolic(type,						\
> -		{ LFS,	"LFS-mode" },					\
> -		{ SSR,	"SSR-mode" })
> +		{ LFS,		"LFS-mode" },				\
> +		{ SSR,		"SSR-mode" },				\
> +		{ AT_SSR,	"AT_SSR-mode" })
>  
>  #define show_victim_policy(type)					\
>  	__print_symbolic(type,						\
>  		{ GC_GREEDY,	"Greedy" },				\
> -		{ GC_CB,	"Cost-Benefit" })
> +		{ GC_CB,	"Cost-Benefit" },			\
> +		{ GC_AT,	"Age-threshold" })
>  
>  #define show_cpreason(type)						\
>  	__print_flags(type, "|",					\
> -- 
> 2.26.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
