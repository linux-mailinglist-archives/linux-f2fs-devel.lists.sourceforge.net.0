Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3A861B64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 19:17:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rda7G-0000Vy-RR;
	Fri, 23 Feb 2024 18:17:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rda7F-0000Vh-DN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 18:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etfNkYG6t3J8Xpx8GC9HT/9tDsrGClmbFdOCDBKIH70=; b=YI3+xysX1I30Z3ah3GlkD5Wf2R
 0inTnePQP7/xp4OPmuDKx/UpcqGroeh3kD4Q0EKtGHe+4LYC8Vn+qV+pumEF+N6WeVDMXI8WB32qs
 BDZXzF0DZ/wFo/w9r7wOxab6jFsMh6yndu7ZFXlgHvWlZk/fhjWPqTFDqPeArNpST6dI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=etfNkYG6t3J8Xpx8GC9HT/9tDsrGClmbFdOCDBKIH70=; b=WXXjisaOjpG5yFiE6FW/ObCBJt
 aexiu+2/bMEVGUAbc0uTkVg7eBNZ29WchybGqB8cIL5K9Bix+G5B7NCfTkvwQTnwwu7hXq7tMeKqj
 yJNWypJKfrPAwlASswLneit5kfUzPq4hYJANm+qd3Iu4ZtG8VMnw4YtKt549UpTWLJyg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rda7D-0001EE-7T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 18:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7A775CE2E0C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Feb 2024 18:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC4CC43390;
 Fri, 23 Feb 2024 18:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708712256;
 bh=iJquEFt23xizdXUmEmBXyMOOMrAnorwKkj0LdrjyfE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AQmP9dRdN8jCwuLwRsWiRmEPfqY9Hq5SANvHeknqL6XVj2uh0Ib8jVM5I1emK/hQd
 DCKrUAXOsG0k20R8jYQZVEgPH4v9HurUCGZ0BWOyBQ2WJa5rfGVilJEu/m92A0K/qA
 +Ub3zVNz0KrL3GNUwMxBNZ7GQn7nivyUrHdUoJ1OqufkguBTpYXEaWSwV4EhJORGfJ
 hefWD1EBPjuMPmhOuzYZEXd2LMo0Xh3Cbu1TtzYdE+qrtedbv6xL4mTLeN0HH8pW5x
 BSvfDaHW9sizYO3CBe9TQazZYle+oe7Pm/2fTqg6eFWPn3ZiLKWyN6r4jA/5ZL5Hsy
 M4FoOiXAw7uvw==
Date: Fri, 23 Feb 2024 10:17:35 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZdjhP5d92C9DoLSj@google.com>
References: <20240221092040.403629-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221092040.403629-1-chao@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chao,
 I applied the below as well in order to keep zone capacity
 back. --- a/fs/f2fs/segment.h +++ b/fs/f2fs/segment.h @@ -101,11 +101,10
 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 NULL_SEGNO
 : GET_L2R_SEGNO(FREE_I(sbi), \ GET_SEGNO_FROM_SEG0(s [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rda7D-0001EE-7T
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS
 for cleanup
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

Chao,

I applied the below as well in order to keep zone capacity back.

--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -101,11 +101,10 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
        NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),                 \
                GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
 #define CAP_BLKS_PER_SEC(sbi)                                  \
-       (SEGS_PER_SEC(sbi) * BLKS_PER_SEG(sbi) -                \
-        (sbi)->unusable_blocks_per_sec)
+       (BLKS_PER_SEC(sbi) - (sbi)->unusable_blocks_per_sec)
 #define CAP_SEGS_PER_SEC(sbi)                                  \
-       (SEGS_PER_SEC(sbi) - ((sbi)->unusable_blocks_per_sec >> \
-       (sbi)->log_blocks_per_seg))
+       (SEGS_PER_SEC(sbi) -                                    \
+       BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec)
 #define GET_SEC_FROM_SEG(sbi, segno)                           \
        (((segno) == -1) ? -1 : (segno) / SEGS_PER_SEC(sbi))
 #define GET_SEG_FROM_SEC(sbi, secno)                           \


On 02/21, Chao Yu wrote:
> Just cleanup, no functional change.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/debug.c   |  7 +++----
>  fs/f2fs/f2fs.h    | 14 ++++++++------
>  fs/f2fs/gc.c      | 10 +++++-----
>  fs/f2fs/gc.h      |  4 ++--
>  fs/f2fs/segment.c | 12 ++++++------
>  fs/f2fs/segment.h |  8 ++++----
>  fs/f2fs/super.c   | 16 ++++++++--------
>  fs/f2fs/sysfs.c   |  4 ++--
>  8 files changed, 38 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 6617195bd27e..12893477f2e4 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -134,7 +134,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  	si->cur_ckpt_time = sbi->cprc_info.cur_time;
>  	si->peak_ckpt_time = sbi->cprc_info.peak_time;
>  	spin_unlock(&sbi->cprc_info.stat_lock);
> -	si->total_count = (int)sbi->user_block_count / BLKS_PER_SEG(sbi);
> +	si->total_count = BLKS_TO_SEGS(sbi, (int)sbi->user_block_count);
>  	si->rsvd_segs = reserved_segments(sbi);
>  	si->overp_segs = overprovision_segments(sbi);
>  	si->valid_count = valid_user_blocks(sbi);
> @@ -175,11 +175,10 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  	si->alloc_nids = NM_I(sbi)->nid_cnt[PREALLOC_NID];
>  	si->io_skip_bggc = sbi->io_skip_bggc;
>  	si->other_skip_bggc = sbi->other_skip_bggc;
> -	si->util_free = (int)(free_user_blocks(sbi) >> sbi->log_blocks_per_seg)
> +	si->util_free = (int)(BLKS_TO_SEGS(sbi, free_user_blocks(sbi)))
>  		* 100 / (int)(sbi->user_block_count >> sbi->log_blocks_per_seg)
>  		/ 2;
> -	si->util_valid = (int)(written_block_count(sbi) >>
> -						sbi->log_blocks_per_seg)
> +	si->util_valid = (int)(BLKS_TO_SEGS(sbi, written_block_count(sbi)))
>  		* 100 / (int)(sbi->user_block_count >> sbi->log_blocks_per_seg)
>  		/ 2;
>  	si->util_invalid = 50 - si->util_free - si->util_valid;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index dad2774ca72f..8a6fd4352a0e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1813,12 +1813,14 @@ struct f2fs_sb_info {
>  };
>  
>  /* Definitions to access f2fs_sb_info */
> -#define BLKS_PER_SEG(sbi)					\
> -	((sbi)->blocks_per_seg)
> -#define BLKS_PER_SEC(sbi)					\
> -	((sbi)->segs_per_sec << (sbi)->log_blocks_per_seg)
> -#define SEGS_PER_SEC(sbi)					\
> -	((sbi)->segs_per_sec)
> +#define SEGS_TO_BLKS(sbi, segs)					\
> +		((segs) << (sbi)->log_blocks_per_seg)
> +#define BLKS_TO_SEGS(sbi, blks)					\
> +		((blks) >> (sbi)->log_blocks_per_seg)
> +
> +#define BLKS_PER_SEG(sbi)	((sbi)->blocks_per_seg)
> +#define BLKS_PER_SEC(sbi)	(SEGS_TO_BLKS(sbi, (sbi)->segs_per_sec))
> +#define SEGS_PER_SEC(sbi)	((sbi)->segs_per_sec)
>  
>  __printf(3, 4)
>  void f2fs_printk(struct f2fs_sb_info *sbi, bool limit_rate, const char *fmt, ...);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 3ff126316d42..6d160d50e14e 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -301,7 +301,7 @@ static unsigned int get_max_cost(struct f2fs_sb_info *sbi,
>  
>  	/* LFS */
>  	if (p->gc_mode == GC_GREEDY)
> -		return 2 * BLKS_PER_SEG(sbi) * p->ofs_unit;
> +		return SEGS_TO_BLKS(sbi, 2 * p->ofs_unit);
>  	else if (p->gc_mode == GC_CB)
>  		return UINT_MAX;
>  	else if (p->gc_mode == GC_AT)
> @@ -347,7 +347,7 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
>  	mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
>  	vblocks = div_u64(vblocks, SEGS_PER_SEC(sbi));
>  
> -	u = (vblocks * 100) >> sbi->log_blocks_per_seg;
> +	u = BLKS_TO_SEGS(sbi, vblocks * 100);
>  
>  	/* Handle if the system time has changed by the user */
>  	if (mtime < sit_i->min_mtime)
> @@ -2060,7 +2060,7 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
>  	raw_sb->segment_count = cpu_to_le32(segment_count + segs);
>  	raw_sb->segment_count_main = cpu_to_le32(segment_count_main + segs);
>  	raw_sb->block_count = cpu_to_le64(block_count +
> -			(long long)(segs << sbi->log_blocks_per_seg));
> +			(long long)SEGS_TO_BLKS(sbi, segs));
>  	if (f2fs_is_multi_device(sbi)) {
>  		int last_dev = sbi->s_ndevs - 1;
>  		int dev_segs =
> @@ -2076,7 +2076,7 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
>  static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  {
>  	int segs = secs * SEGS_PER_SEC(sbi);
> -	long long blks = (long long)(segs << sbi->log_blocks_per_seg);
> +	long long blks = (long long)SEGS_TO_BLKS(sbi, segs);
>  	long long user_block_count =
>  				le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);
>  
> @@ -2118,7 +2118,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>  		int last_dev = sbi->s_ndevs - 1;
>  		__u64 last_segs = FDEV(last_dev).total_segments;
>  
> -		if (block_count + (last_segs << sbi->log_blocks_per_seg) <=
> +		if (block_count + SEGS_TO_BLKS(sbi, last_segs) <=
>  								old_block_count)
>  			return -EINVAL;
>  	}
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index e4a75aa4160f..6a2419ddc7c6 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -70,7 +70,7 @@ struct victim_entry {
>  
>  static inline block_t free_segs_blk_count(struct f2fs_sb_info *sbi)
>  {
> -	return free_segments(sbi) << sbi->log_blocks_per_seg;
> +	return SEGS_TO_BLKS(sbi, free_segments(sbi));
>  }
>  
>  static inline block_t free_user_blocks(struct f2fs_sb_info *sbi)
> @@ -78,7 +78,7 @@ static inline block_t free_user_blocks(struct f2fs_sb_info *sbi)
>  	block_t free_blks, ovp_blks;
>  
>  	free_blks = free_segs_blk_count(sbi);
> -	ovp_blks = overprovision_segments(sbi) << sbi->log_blocks_per_seg;
> +	ovp_blks = SEGS_TO_BLKS(sbi, overprovision_segments(sbi));
>  
>  	if (free_blks < ovp_blks)
>  		return 0;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 56927b097e30..d0209ea77dd2 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -448,8 +448,8 @@ static inline bool excess_dirty_threshold(struct f2fs_sb_info *sbi)
>  	unsigned int nodes = get_pages(sbi, F2FS_DIRTY_NODES);
>  	unsigned int meta = get_pages(sbi, F2FS_DIRTY_META);
>  	unsigned int imeta = get_pages(sbi, F2FS_DIRTY_IMETA);
> -	unsigned int threshold = (factor * DEFAULT_DIRTY_THRESHOLD) <<
> -				sbi->log_blocks_per_seg;
> +	unsigned int threshold =
> +		SEGS_TO_BLKS(sbi, (factor * DEFAULT_DIRTY_THRESHOLD));
>  	unsigned int global_threshold = threshold * 3 / 2;
>  
>  	if (dents >= threshold || qdata >= threshold ||
> @@ -870,7 +870,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi)
>  {
>  	int ovp_hole_segs =
>  		(overprovision_segments(sbi) - reserved_segments(sbi));
> -	block_t ovp_holes = ovp_hole_segs << sbi->log_blocks_per_seg;
> +	block_t ovp_holes = SEGS_TO_BLKS(sbi, ovp_hole_segs);
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>  	block_t holes[2] = {0, 0};	/* DATA and NODE */
>  	block_t unusable;
> @@ -2178,7 +2178,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>  		if (!f2fs_sb_has_blkzoned(sbi) &&
>  		    (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi))) {
>  			f2fs_issue_discard(sbi, START_BLOCK(sbi, start),
> -				(end - start) << sbi->log_blocks_per_seg);
> +				SEGS_TO_BLKS(sbi, end - start));
>  			continue;
>  		}
>  next:
> @@ -2289,7 +2289,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>  	atomic_set(&dcc->queued_discard, 0);
>  	atomic_set(&dcc->discard_cmd_cnt, 0);
>  	dcc->nr_discards = 0;
> -	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
> +	dcc->max_discards = SEGS_TO_BLKS(sbi, MAIN_SEGS(sbi));
>  	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
>  	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
>  	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
> @@ -4469,7 +4469,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  #endif
>  
>  	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
> -	sit_i->sit_blocks = sit_segs << sbi->log_blocks_per_seg;
> +	sit_i->sit_blocks = SEGS_TO_BLKS(sbi, sit_segs);
>  	sit_i->written_valid_blocks = 0;
>  	sit_i->bitmap_size = sit_bitmap_size;
>  	sit_i->dirty_sentries = 0;
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 9fe5ec619456..e72b02b67087 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -77,21 +77,21 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>  #define TOTAL_SEGS(sbi)							\
>  	(SM_I(sbi) ? SM_I(sbi)->segment_count : 				\
>  		le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment_count))
> -#define TOTAL_BLKS(sbi)	(TOTAL_SEGS(sbi) << (sbi)->log_blocks_per_seg)
> +#define TOTAL_BLKS(sbi)	(SEGS_TO_BLKS(sbi, TOTAL_SEGS(sbi)))
>  
>  #define MAX_BLKADDR(sbi)	(SEG0_BLKADDR(sbi) + TOTAL_BLKS(sbi))
>  #define SEGMENT_SIZE(sbi)	(1ULL << ((sbi)->log_blocksize +	\
>  					(sbi)->log_blocks_per_seg))
>  
>  #define START_BLOCK(sbi, segno)	(SEG0_BLKADDR(sbi) +			\
> -	 (GET_R2L_SEGNO(FREE_I(sbi), segno) << (sbi)->log_blocks_per_seg))
> +	 (SEGS_TO_BLKS(sbi, GET_R2L_SEGNO(FREE_I(sbi), segno))))
>  
>  #define NEXT_FREE_BLKADDR(sbi, curseg)					\
>  	(START_BLOCK(sbi, (curseg)->segno) + (curseg)->next_blkoff)
>  
>  #define GET_SEGOFF_FROM_SEG0(sbi, blk_addr)	((blk_addr) - SEG0_BLKADDR(sbi))
>  #define GET_SEGNO_FROM_SEG0(sbi, blk_addr)				\
> -	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) >> (sbi)->log_blocks_per_seg)
> +	(BLKS_TO_SEGS(sbi, GET_SEGOFF_FROM_SEG0(sbi, blk_addr)))
>  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
>  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (BLKS_PER_SEG(sbi) - 1))
>  
> @@ -891,7 +891,7 @@ static inline int nr_pages_to_skip(struct f2fs_sb_info *sbi, int type)
>  	if (type == DATA)
>  		return BLKS_PER_SEG(sbi);
>  	else if (type == NODE)
> -		return 8 * BLKS_PER_SEG(sbi);
> +		return SEGS_TO_BLKS(sbi, 8);
>  	else if (type == META)
>  		return 8 * BIO_MAX_VECS;
>  	else
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9976f2b0393c..bb056700b459 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3763,9 +3763,9 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>  	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
>  	sbi->secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
>  	sbi->total_sections = le32_to_cpu(raw_super->section_count);
> -	sbi->total_node_count =
> -		((le32_to_cpu(raw_super->segment_count_nat) / 2) *
> -		NAT_ENTRY_PER_BLOCK) << sbi->log_blocks_per_seg;
> +	sbi->total_node_count = SEGS_TO_BLKS(sbi,
> +			((le32_to_cpu(raw_super->segment_count_nat) / 2) *
> +			NAT_ENTRY_PER_BLOCK));
>  	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
>  	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
>  	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
> @@ -4199,14 +4199,14 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  			if (i == 0) {
>  				FDEV(i).start_blk = 0;
>  				FDEV(i).end_blk = FDEV(i).start_blk +
> -				    (FDEV(i).total_segments <<
> -				    sbi->log_blocks_per_seg) - 1 +
> -				    le32_to_cpu(raw_super->segment0_blkaddr);
> +					SEGS_TO_BLKS(sbi,
> +					FDEV(i).total_segments) - 1 +
> +					le32_to_cpu(raw_super->segment0_blkaddr);
>  			} else {
>  				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
>  				FDEV(i).end_blk = FDEV(i).start_blk +
> -					(FDEV(i).total_segments <<
> -					sbi->log_blocks_per_seg) - 1;
> +						SEGS_TO_BLKS(sbi,
> +						FDEV(i).total_segments) - 1;
>  				FDEV(i).bdev_handle = bdev_open_by_path(
>  					FDEV(i).path, mode, sbi->sb, NULL);
>  			}
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 2689cc9c3bf8..ceac3bfc5e2c 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -493,8 +493,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		spin_lock(&sbi->stat_lock);
>  		if (t > (unsigned long)(sbi->user_block_count -
>  				F2FS_OPTION(sbi).root_reserved_blocks -
> -				(SM_I(sbi)->additional_reserved_segments <<
> -					sbi->log_blocks_per_seg))) {
> +				SEGS_TO_BLKS(sbi,
> +				SM_I(sbi)->additional_reserved_segments))) {
>  			spin_unlock(&sbi->stat_lock);
>  			return -EINVAL;
>  		}
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
