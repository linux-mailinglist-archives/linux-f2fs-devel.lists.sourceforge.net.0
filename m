Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4865CBDE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 03:26:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCtU5-0008Fw-Qq;
	Wed, 04 Jan 2023 02:26:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pCtU4-0008Fp-SG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 02:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HrhXerPcHb6dxn4YoXXUhkkZM/mXRUJvbtLQgrkjSCg=; b=AWE5chBTXCJEI7qyq+2fxgrH57
 +Dg8gQ9AhKUuZ9vd04I3HaD0nwfnBCQqd3jVYDJ8eUGbrUMkzQLATitaUpQzYMlhHQTK8hZFbFE+F
 dodq3cIILfC0o8ejYAFBY43I+dNi7dZuLClTr6u/tQFsnuVKmPr24HWnob8RMCOEzWVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HrhXerPcHb6dxn4YoXXUhkkZM/mXRUJvbtLQgrkjSCg=; b=meS7jpfKidf10GpBHXCcflQplh
 tSR2mGEVhpd4XyMqHExfcmcRN5/uQPRNUDh9+47IyQ9tPi6BdkdzrDrFe72OKqEd5AiqEc1U1jxIE
 Y3Uu1BNseEVhKNBX9NMA9SnIMxO1mgnh6aKb1i4ATbu4MvhXTn3PGZUECPuMas4lVcPE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCtU0-0002p2-JB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 02:26:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ACF961585;
 Wed,  4 Jan 2023 02:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3C0C433D2;
 Wed,  4 Jan 2023 02:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672799177;
 bh=79n4ndnfnk5/RQ25lWXCoeb1TFRaJO9PaOZqKBDpbww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C+X+haZROcCTpxY/ZVIZBVlTjB2YWHG8y+hAHaRYROBAZ1CUjfu7a45QBSykGOpJ2
 RQPtSdmvrrFGCv5CEURVc2gKm6Z1JG3yfGn5FIFSBSD1OtEeOQlz3i2PYWqsCBkpYU
 +CrUeS5d/LfnjDnYcjxuXt9JXye5cibW3Wu3yYlGpZLmFi123Jw6nSZnMl3sPEbqmI
 9rnuuxM8tWv53SevOgHNtyfHm+72Bn9YHnMPh8o7PUwUGQvQ0V3/nSnom5zCydvaWo
 tl7h4bNSSFCqlZPRtVZBZPHqEbDn6QQEqlsYUADMDTwq/O22XZs32XCqg9SNzmW6RV
 s9NBVIPEvsviA==
Date: Tue, 3 Jan 2023 18:26:16 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y7TjyH+Rpa8oZUHs@google.com>
References: <20221206063616.68522-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221206063616.68522-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/06, Yangtao Li wrote: > This patch supports parsing
 these two parameters from mount opt, > so that we don't have to dynamically
 modify the parameters through > the sysfs node after the system st [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCtU0-0002p2-JB
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce hot_data_age_threshold and
 warm_data_age_threshold mount opt
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/06, Yangtao Li wrote:
> This patch supports parsing these two parameters from mount opt,
> so that we don't have to dynamically modify the parameters through
> the sysfs node after the system starts.

It seems sysfs would be enough?

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  Documentation/filesystems/f2fs.rst |  6 +++++
>  fs/f2fs/debug.c                    |  3 ++-
>  fs/f2fs/extent_cache.c             | 14 +++++++----
>  fs/f2fs/f2fs.h                     | 14 +++++++----
>  fs/f2fs/segment.c                  |  8 ++++---
>  fs/f2fs/super.c                    | 38 +++++++++++++++++++++++++++++-
>  fs/f2fs/sysfs.c                    | 16 +++++++++----
>  7 files changed, 81 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 220f3e0d3f55..12a04d7cd634 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -351,6 +351,12 @@ age_extent_cache	 Enable an age extent cache based on rb-tree. It records
>  			 data block update frequency of the extent per inode, in
>  			 order to provide better temperature hints for data block
>  			 allocation.
> +hot_data_age_threshold=%u	 When age_extent_cache is on, it controls the age
> +			 threshold to indicate the data blocks as hot. By default it was
> +			 initialized as 262144 blocks(equals to 1GB).
> +warm_data_age_threshold=%u	 When age_extent_cache is on, it controls the age
> +			 threshold to indicate the data blocks as warm. By default it was
> +			 initialized as 2621440 blocks(equals to 10GB).
>  ======================== ============================================================
>  
>  Debugfs Entries
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 8f1ef742551f..5bf9c1ed7a2f 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -62,6 +62,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi)
>  #ifdef CONFIG_DEBUG_FS
>  static void update_general_status(struct f2fs_sb_info *sbi)
>  {
> +	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
>  	struct f2fs_stat_info *si = F2FS_STAT(sbi);
>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
>  	int i;
> @@ -89,7 +90,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  	si->hit_total[EX_READ] += si->hit_largest;
>  
>  	/* block age extent_cache only */
> -	si->allocated_data_blocks = atomic64_read(&sbi->allocated_data_blocks);
> +	si->allocated_data_blocks = atomic64_read(&fai->allocated_data_blocks);
>  
>  	/* validation check of the segment numbers */
>  	si->ndirty_node = get_pages(sbi, F2FS_DIRTY_NODES);
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 2fc675c45606..601659714aa9 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -883,9 +883,10 @@ static unsigned long long __calculate_block_age(unsigned long long new,
>  static int __get_new_block_age(struct inode *inode, struct extent_info *ei)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
>  	loff_t f_size = i_size_read(inode);
>  	unsigned long long cur_blocks =
> -				atomic64_read(&sbi->allocated_data_blocks);
> +				atomic64_read(&fai->allocated_data_blocks);
>  
>  	/*
>  	 * When I/O is not aligned to a PAGE_SIZE, update will happen to the last
> @@ -1216,13 +1217,18 @@ static void __init_extent_tree_info(struct extent_tree_info *eti)
>  
>  void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
>  {
> +	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
> +
>  	__init_extent_tree_info(&sbi->extent_tree[EX_READ]);
>  	__init_extent_tree_info(&sbi->extent_tree[EX_BLOCK_AGE]);
>  
>  	/* initialize for block age extents */
> -	atomic64_set(&sbi->allocated_data_blocks, 0);
> -	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
> -	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
> +	atomic64_set(&fai->allocated_data_blocks, 0);
> +
> +	if (!fai->hot_data_age_threshold)
> +		fai->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
> +	if (!fai->warm_data_age_threshold)
> +		fai->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
>  }
>  
>  int __init f2fs_create_extent_cache(void)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index eb71edcf70de..32a0bf2977bc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -64,6 +64,12 @@ enum {
>  	FAULT_MAX,
>  };
>  
> +struct f2fs_age_extent_info {
> +	atomic64_t allocated_data_blocks;		/* for block age extent_cache */
> +	unsigned int hot_data_age_threshold;	/* The threshold used for hot data seperation*/
> +	unsigned int warm_data_age_threshold;	/* The threshold used for warm data seperation*/
> +};
> +
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
>  #define F2FS_ALL_FAULT_TYPE		((1 << FAULT_MAX) - 1)
>  
> @@ -148,6 +154,7 @@ struct f2fs_mount_info {
>  	kgid_t s_resgid;		/* reserved blocks for gid */
>  	int active_logs;		/* # of active logs */
>  	int inline_xattr_size;		/* inline xattr size */
> +	struct f2fs_age_extent_info age_info;	/* For block age extent */
>  #ifdef CONFIG_F2FS_FAULT_INJECTION
>  	struct f2fs_fault_info fault_info;	/* For fault injection */
>  #endif
> @@ -173,6 +180,8 @@ struct f2fs_mount_info {
>  					 * unusable when disabling checkpoint
>  					 */
>  
> +	/* For block age extent_cache */
> +
>  	/* For compression */
>  	unsigned char compress_algorithm;	/* algorithm type */
>  	unsigned char compress_log_size;	/* cluster log size */
> @@ -1674,11 +1683,6 @@ struct f2fs_sb_info {
>  
>  	/* for extent tree cache */
>  	struct extent_tree_info extent_tree[NR_EXTENT_CACHES];
> -	atomic64_t allocated_data_blocks;	/* for block age extent_cache */
> -
> -	/* The threshold used for hot and warm data seperation*/
> -	unsigned int hot_data_age_threshold;
> -	unsigned int warm_data_age_threshold;
>  
>  	/* basic filesystem units */
>  	unsigned int log_sectors_per_block;	/* log2 sectors per block */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index dee712f7225f..c9b779fd7041 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3159,14 +3159,15 @@ static int __get_segment_type_4(struct f2fs_io_info *fio)
>  static int __get_age_segment_type(struct inode *inode, pgoff_t pgofs)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
>  	struct extent_info ei;
>  
>  	if (f2fs_lookup_age_extent_cache(inode, pgofs, &ei)) {
>  		if (!ei.age)
>  			return NO_CHECK_TYPE;
> -		if (ei.age <= sbi->hot_data_age_threshold)
> +		if (ei.age <= fai->hot_data_age_threshold)
>  			return CURSEG_HOT_DATA;
> -		if (ei.age <= sbi->warm_data_age_threshold)
> +		if (ei.age <= fai->warm_data_age_threshold)
>  			return CURSEG_WARM_DATA;
>  		return CURSEG_COLD_DATA;
>  	}
> @@ -3242,6 +3243,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  		struct f2fs_summary *sum, int type,
>  		struct f2fs_io_info *fio)
>  {
> +	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
>  	struct sit_info *sit_i = SIT_I(sbi);
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
>  	unsigned long long old_mtime;
> @@ -3316,7 +3318,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
>  
>  	if (IS_DATASEG(type))
> -		atomic64_inc(&sbi->allocated_data_blocks);
> +		atomic64_inc(&fai->allocated_data_blocks);
>  
>  	up_write(&sit_i->sentry_lock);
>  
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5bdab376b852..feea2006b070 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -164,6 +164,8 @@ enum {
>  	Opt_discard_unit,
>  	Opt_memory_mode,
>  	Opt_age_extent_cache,
> +	Opt_hot_data_age_threshold,
> +	Opt_warm_data_age_threshold,
>  	Opt_err,
>  };
>  
> @@ -243,6 +245,8 @@ static match_table_t f2fs_tokens = {
>  	{Opt_discard_unit, "discard_unit=%s"},
>  	{Opt_memory_mode, "memory=%s"},
>  	{Opt_age_extent_cache, "age_extent_cache"},
> +	{Opt_hot_data_age_threshold, "hot_data_age_threshold=%u"},
> +	{Opt_warm_data_age_threshold, "warm_data_age_threshold=%u"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -658,6 +662,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
>  static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
>  	substring_t args[MAX_OPT_ARGS];
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	unsigned char (*ext)[F2FS_EXTENSION_LEN];
> @@ -1262,6 +1267,32 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		case Opt_age_extent_cache:
>  			set_opt(sbi, AGE_EXTENT_CACHE);
>  			break;
> +		case Opt_hot_data_age_threshold:
> +			if (!test_opt(sbi, AGE_EXTENT_CACHE)) {
> +				f2fs_info(sbi, "age extent options not enabled");
> +				break;
> +			}
> +			if (args->from && match_int(args, &arg))
> +				return -EINVAL;
> +			if (arg == 0 || arg > DEF_HOT_DATA_AGE_THRESHOLD) {
> +				f2fs_err(sbi, "hot data age threshold is out of range");
> +				return -EINVAL;
> +			}
> +			fai->hot_data_age_threshold = arg;
> +			break;
> +		case Opt_warm_data_age_threshold:
> +			if (!test_opt(sbi, AGE_EXTENT_CACHE)) {
> +				f2fs_info(sbi, "age extent options not enabled");
> +				break;
> +			}
> +			if (args->from && match_int(args, &arg))
> +				return -EINVAL;
> +			if (arg == 0 || arg > DEF_WARM_DATA_AGE_THRESHOLD) {
> +				f2fs_err(sbi, "warm data age threshold is out of range");
> +				return -EINVAL;
> +			}
> +			fai->warm_data_age_threshold = arg;
> +			break;
>  		default:
>  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>  				 p);
> @@ -1963,8 +1994,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  		seq_puts(seq, ",read_extent_cache");
>  	else
>  		seq_puts(seq, ",no_read_extent_cache");
> -	if (test_opt(sbi, AGE_EXTENT_CACHE))
> +	if (test_opt(sbi, AGE_EXTENT_CACHE)) {
> +		struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
> +
>  		seq_puts(seq, ",age_extent_cache");
> +		seq_printf(seq, ",hot_data_age_threshold=%u", fai->hot_data_age_threshold);
> +		seq_printf(seq, ",warm_data_age_threshold=%u", fai->warm_data_age_threshold);
> +	}
>  	if (test_opt(sbi, DATA_FLUSH))
>  		seq_puts(seq, ",data_flush");
>  
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 2ab215110596..5b8e08aff0a6 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -36,6 +36,7 @@ enum {
>  	FAULT_INFO_RATE,	/* struct f2fs_fault_info */
>  	FAULT_INFO_TYPE,	/* struct f2fs_fault_info */
>  #endif
> +	AGE_EXTENT_INFO,	/* struct f2fs_age_extent_info */
>  	RESERVED_BLOCKS,	/* struct f2fs_sb_info */
>  	CPRC_INFO,	/* struct ckpt_req_control */
>  	ATGC_INFO,	/* struct atgc_management */
> @@ -81,6 +82,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
>  					struct_type == FAULT_INFO_TYPE)
>  		return (unsigned char *)&F2FS_OPTION(sbi).fault_info;
>  #endif
> +	else if (struct_type == AGE_EXTENT_INFO)
> +		return (unsigned char *)&F2FS_OPTION(sbi).age_info;
>  #ifdef CONFIG_F2FS_STAT_FS
>  	else if (struct_type == STAT_INFO)
>  		return (unsigned char *)F2FS_STAT(sbi);
> @@ -669,7 +672,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  	}
>  
>  	if (!strcmp(a->attr.name, "hot_data_age_threshold")) {
> -		if (t == 0 || t >= sbi->warm_data_age_threshold)
> +		struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
> +
> +		if (t == 0 || t >= fai->warm_data_age_threshold)
>  			return -EINVAL;
>  		if (t == *ui)
>  			return count;
> @@ -678,7 +683,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  	}
>  
>  	if (!strcmp(a->attr.name, "warm_data_age_threshold")) {
> -		if (t == 0 || t <= sbi->hot_data_age_threshold)
> +		struct f2fs_age_extent_info *fai = &F2FS_OPTION(sbi).age_info;
> +
> +		if (t == 0 || t <= fai->hot_data_age_threshold)
>  			return -EINVAL;
>  		if (t == *ui)
>  			return count;
> @@ -942,8 +949,9 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_bl
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
>  
>  /* For block age extent cache */
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
> +F2FS_RW_ATTR(AGE_EXTENT_INFO, f2fs_age_extent_info, hot_data_age_threshold, hot_data_age_threshold);
> +F2FS_RW_ATTR(AGE_EXTENT_INFO, f2fs_age_extent_info, warm_data_age_threshold,
> +							warm_data_age_threshold);
>  
>  #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>  static struct attribute *f2fs_attrs[] = {
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
