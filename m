Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77B85B818
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 10:49:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcMkP-000651-Oc;
	Tue, 20 Feb 2024 09:49:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcMkO-00064n-9i
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 09:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xbsxlPq8f9QXBYJFwaiTvzszkC71E95GuViA8p87dtg=; b=Er6MWCTLihtX33XAljAhe0W9hO
 9obpoZFPjXo5erAee/yypeA/qHMjCgnjEge1TW1If0dQLylIjRwE9r/lxbwtK4wI+M+2bcwP8VJd1
 mP0dSG49MXcjiwdxNHEPZ41GSE9XJZUZss54hubjJHyYwOuQwMfzDRzuiWLx4pOQn6cc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xbsxlPq8f9QXBYJFwaiTvzszkC71E95GuViA8p87dtg=; b=aI9RjT/RV6OC8CkXLoNlYwVGY6
 1cP/gx4KF5mhRgl8OrPHhy94glQ7Ak5xkpDaNgYIIWo9he2/7J21KA575cAT4LZImfavAuNsKnVoY
 i85q0plWXJL4Ogm/r2s/sefmxcKindm5Pn8leqVVdgMmmXft7f8J0p5BHyKsuvynEu30=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcMkL-0007gY-Qs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 09:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AAF1B61032;
 Tue, 20 Feb 2024 09:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E73C433C7;
 Tue, 20 Feb 2024 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708422536;
 bh=jMHxApPYZirTVUCpGTYrD72PQ7F2NhB+PTIrpWnG4oY=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=DPB7GOybij/eNh4ZP7d1iOAKZBvPFXw96EubzUZ7zMemzRIymMSS2IQgFF2doOwS0
 ml+fwGgYpUWvOvneNvGAPVcwoU0wjqLhQ99mOr0v9fE1SHBs8m/G+mdhH1ALfUL4aJ
 dUxc9NY6zOuCN8SoX2jpn+rhVvMkwaaMh3edocguiovArk3MzlytX85VpxAcdnetWg
 nuBy43YPqRyC1WLKgHmG9Y7ddDKKpNkO79D9pKI+vCzDjgUmdDkpIckc1rzKpHpd+J
 +CamOujMtiAuZYzyOI6nivNW5L1bR9NFOiHb1TCbPuBn88mwNUX+mx0rDH9zRiASmw
 2GLX7OciEnJTQ==
Message-ID: <f174092a-192a-47f9-a1d4-14d86bba266c@kernel.org>
Date: Tue, 20 Feb 2024 17:48:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, daehojeong@google.com
References: <20240207005105.3744811-1-jaegeuk@kernel.org>
 <20240207005105.3744811-3-jaegeuk@kernel.org> <ZcQSV0HyTwoiW8os@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZcQSV0HyTwoiW8os@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, Daeho, Do we need Cc WD guys? Not sure whether they
 need this feature... For ZUFS: 1) will it only exports 2MB-aligned zone size, 
 and 2) its zone capacity equals zone size? 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcMkL-0007gY-Qs
Subject: Re: [f2fs-dev] [PATCH 3/3 v2] f2fs: kill zone-capacity support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, Daeho,

Do we need Cc WD guys? Not sure whether they need this feature...

For ZUFS: 1) will it only exports 2MB-aligned zone size, and 2) its zone
capacity equals zone size?

Thanks,

On 2024/2/8 7:29, Jaegeuk Kim wrote:
> Since we don't see any user, let's kill.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   from v1:
>    - keep setting the seq bit
> 
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 --
>   fs/f2fs/debug.c                         |  7 +-
>   fs/f2fs/f2fs.h                          |  5 --
>   fs/f2fs/file.c                          |  6 +-
>   fs/f2fs/gc.c                            | 33 +++------
>   fs/f2fs/gc.h                            | 26 -------
>   fs/f2fs/segment.c                       | 93 +++----------------------
>   fs/f2fs/segment.h                       | 41 ++++-------
>   fs/f2fs/super.c                         | 16 ++---
>   fs/f2fs/sysfs.c                         |  6 --
>   10 files changed, 44 insertions(+), 195 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 48c135e24eb5..dff8c87d87dd 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -628,12 +628,6 @@ Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
>   Description:	Controls max # of node block writes to be used for roll forward
>   		recovery. This can limit the roll forward recovery time.
>   
> -What:		/sys/fs/f2fs/<disk>/unusable_blocks_per_sec
> -Date:		June 2022
> -Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> -Description:	Shows the number of unusable blocks in a section which was defined by
> -		the zone capacity reported by underlying zoned device.
> -
>   What:		/sys/fs/f2fs/<disk>/current_atomic_write
>   Date:		July 2022
>   Contact:	"Daeho Jeong" <daehojeong@google.com>
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 0d02224b99b7..6617195bd27e 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -32,21 +32,20 @@ static struct dentry *f2fs_debugfs_root;
>   void f2fs_update_sit_info(struct f2fs_sb_info *sbi)
>   {
>   	struct f2fs_stat_info *si = F2FS_STAT(sbi);
> -	unsigned long long blks_per_sec, hblks_per_sec, total_vblocks;
> +	unsigned long long hblks_per_sec, total_vblocks;
>   	unsigned long long bimodal, dist;
>   	unsigned int segno, vblocks;
>   	int ndirty = 0;
>   
>   	bimodal = 0;
>   	total_vblocks = 0;
> -	blks_per_sec = CAP_BLKS_PER_SEC(sbi);
> -	hblks_per_sec = blks_per_sec / 2;
> +	hblks_per_sec = BLKS_PER_SEC(sbi) / 2;
>   	for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
>   		vblocks = get_valid_blocks(sbi, segno, true);
>   		dist = abs(vblocks - hblks_per_sec);
>   		bimodal += dist * dist;
>   
> -		if (vblocks > 0 && vblocks < blks_per_sec) {
> +		if (vblocks > 0 && vblocks < BLKS_PER_SEC(sbi)) {
>   			total_vblocks += vblocks;
>   			ndirty++;
>   		}
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9a9e858083af..34d718301392 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1618,7 +1618,6 @@ struct f2fs_sb_info {
>   	unsigned int meta_ino_num;		/* meta inode number*/
>   	unsigned int log_blocks_per_seg;	/* log2 blocks per segment */
>   	unsigned int blocks_per_seg;		/* blocks per segment */
> -	unsigned int unusable_blocks_per_sec;	/* unusable blocks per section */
>   	unsigned int segs_per_sec;		/* segments per section */
>   	unsigned int secs_per_zone;		/* sections per zone */
>   	unsigned int total_sections;		/* total section count */
> @@ -3743,10 +3742,6 @@ void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
>   int __init f2fs_create_segment_manager_caches(void);
>   void f2fs_destroy_segment_manager_caches(void);
>   int f2fs_rw_hint_to_seg_type(enum rw_hint hint);
> -unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> -			unsigned int segno);
> -unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> -			unsigned int segno);
>   
>   #define DEF_FRAGMENT_SIZE	4
>   #define MIN_FRAGMENT_SIZE	1
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index b0be576b2090..2c13b340c8a0 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1717,7 +1717,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   		return 0;
>   
>   	if (f2fs_is_pinned_file(inode)) {
> -		block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
> +		block_t sec_blks = BLKS_PER_SEC(sbi);
>   		block_t sec_len = roundup(map.m_len, sec_blks);
>   
>   		map.m_len = sec_blks;
> @@ -2525,7 +2525,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>   			ret = -EAGAIN;
>   		goto out;
>   	}
> -	range->start += CAP_BLKS_PER_SEC(sbi);
> +	range->start += BLKS_PER_SEC(sbi);
>   	if (range->start <= end)
>   		goto do_more;
>   out:
> @@ -2654,7 +2654,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>   		goto out;
>   	}
>   
> -	sec_num = DIV_ROUND_UP(total, CAP_BLKS_PER_SEC(sbi));
> +	sec_num = DIV_ROUND_UP(total, BLKS_PER_SEC(sbi));
>   
>   	/*
>   	 * make sure there are enough free section for LFS allocation, this can
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index d61a60c1c844..0a1a50b68df8 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -340,14 +340,13 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
>   	unsigned char age = 0;
>   	unsigned char u;
>   	unsigned int i;
> -	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi, segno);
>   
> -	for (i = 0; i < usable_segs_per_sec; i++)
> +	for (i = 0; i < SEGS_PER_SEC(sbi); i++)
>   		mtime += get_seg_entry(sbi, start + i)->mtime;
>   	vblocks = get_valid_blocks(sbi, segno, true);
>   
> -	mtime = div_u64(mtime, usable_segs_per_sec);
> -	vblocks = div_u64(vblocks, usable_segs_per_sec);
> +	mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
> +	vblocks = div_u64(vblocks, SEGS_PER_SEC(sbi));
>   
>   	u = (vblocks * 100) >> sbi->log_blocks_per_seg;
>   
> @@ -530,7 +529,6 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
>   	unsigned long long age, u, accu;
>   	unsigned long long max_mtime = sit_i->dirty_max_mtime;
>   	unsigned long long min_mtime = sit_i->dirty_min_mtime;
> -	unsigned int sec_blocks = CAP_BLKS_PER_SEC(sbi);
>   	unsigned int vblocks;
>   	unsigned int dirty_threshold = max(am->max_candidate_count,
>   					am->candidate_ratio *
> @@ -560,13 +558,13 @@ static void atgc_lookup_victim(struct f2fs_sb_info *sbi,
>   
>   	/* age = 10000 * x% * 60 */
>   	age = div64_u64(accu * (max_mtime - ve->mtime), total_time) *
> -								age_weight;
> +							age_weight;
>   
>   	vblocks = get_valid_blocks(sbi, ve->segno, true);
> -	f2fs_bug_on(sbi, !vblocks || vblocks == sec_blocks);
> +	f2fs_bug_on(sbi, !vblocks || vblocks == BLKS_PER_SEC(sbi));
>   
>   	/* u = 10000 * x% * 40 */
> -	u = div64_u64(accu * (sec_blocks - vblocks), sec_blocks) *
> +	u = div64_u64(accu * (BLKS_PER_SEC(sbi) - vblocks), BLKS_PER_SEC(sbi)) *
>   							(100 - age_weight);
>   
>   	f2fs_bug_on(sbi, age + u >= UINT_MAX);
> @@ -1003,7 +1001,6 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
>   	int phase = 0;
>   	bool fggc = (gc_type == FG_GC);
>   	int submitted = 0;
> -	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
>   
>   	start_addr = START_BLOCK(sbi, segno);
>   
> @@ -1013,7 +1010,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
>   	if (fggc && phase == 2)
>   		atomic_inc(&sbi->wb_sync_req[NODE]);
>   
> -	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
> +	for (off = 0; off < BLKS_PER_SEG(sbi); off++, entry++) {
>   		nid_t nid = le32_to_cpu(entry->nid);
>   		struct page *node_page;
>   		struct node_info ni;
> @@ -1498,14 +1495,13 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   	int off;
>   	int phase = 0;
>   	int submitted = 0;
> -	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
>   
>   	start_addr = START_BLOCK(sbi, segno);
>   
>   next_step:
>   	entry = sum;
>   
> -	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
> +	for (off = 0; off < BLKS_PER_SEG(sbi); off++, entry++) {
>   		struct page *data_page;
>   		struct inode *inode;
>   		struct node_info dni; /* dnode info for the data */
> @@ -1520,7 +1516,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   		 */
>   		if ((gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) ||
>   			(!force_migrate && get_valid_blocks(sbi, segno, true) ==
> -							CAP_BLKS_PER_SEC(sbi)))
> +							BLKS_PER_SEC(sbi)))
>   			return submitted;
>   
>   		if (check_valid_map(sbi, segno, off) == 0)
> @@ -1680,15 +1676,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   	if (__is_large_section(sbi))
>   		end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
>   
> -	/*
> -	 * zone-capacity can be less than zone-size in zoned devices,
> -	 * resulting in less than expected usable segments in the zone,
> -	 * calculate the end segno in the zone which can be garbage collected
> -	 */
> -	if (f2fs_sb_has_blkzoned(sbi))
> -		end_segno -= SEGS_PER_SEC(sbi) -
> -					f2fs_usable_segs_in_sec(sbi, segno);
> -
>   	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
>   
>   	/* readahead multi ssa blocks those have contiguous address */
> @@ -1862,7 +1849,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   
>   	total_freed += seg_freed;
>   
> -	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno)) {
> +	if (seg_freed == SEGS_PER_SEC(sbi)) {
>   		sec_freed++;
>   		total_sec_freed++;
>   	}
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 28a00942802c..e4a75aa4160f 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -68,34 +68,8 @@ struct victim_entry {
>    * inline functions
>    */
>   
> -/*
> - * On a Zoned device zone-capacity can be less than zone-size and if
> - * zone-capacity is not aligned to f2fs segment size(2MB), then the segment
> - * starting just before zone-capacity has some blocks spanning across the
> - * zone-capacity, these blocks are not usable.
> - * Such spanning segments can be in free list so calculate the sum of usable
> - * blocks in currently free segments including normal and spanning segments.
> - */
> -static inline block_t free_segs_blk_count_zoned(struct f2fs_sb_info *sbi)
> -{
> -	block_t free_seg_blks = 0;
> -	struct free_segmap_info *free_i = FREE_I(sbi);
> -	int j;
> -
> -	spin_lock(&free_i->segmap_lock);
> -	for (j = 0; j < MAIN_SEGS(sbi); j++)
> -		if (!test_bit(j, free_i->free_segmap))
> -			free_seg_blks += f2fs_usable_blks_in_seg(sbi, j);
> -	spin_unlock(&free_i->segmap_lock);
> -
> -	return free_seg_blks;
> -}
> -
>   static inline block_t free_segs_blk_count(struct f2fs_sb_info *sbi)
>   {
> -	if (f2fs_sb_has_blkzoned(sbi))
> -		return free_segs_blk_count_zoned(sbi);
> -
>   	return free_segments(sbi) << sbi->log_blocks_per_seg;
>   }
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8d330664b925..1013276ad12a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -769,7 +769,7 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>   				get_valid_blocks(sbi, segno, true);
>   
>   			f2fs_bug_on(sbi, unlikely(!valid_blocks ||
> -					valid_blocks == CAP_BLKS_PER_SEC(sbi)));
> +					valid_blocks == BLKS_PER_SEC(sbi)));
>   
>   			if (!IS_CURSEC(sbi, secno))
>   				set_bit(secno, dirty_i->dirty_secmap);
> @@ -805,7 +805,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>   			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>   
>   			if (!valid_blocks ||
> -					valid_blocks == CAP_BLKS_PER_SEC(sbi)) {
> +					valid_blocks == BLKS_PER_SEC(sbi)) {
>   				clear_bit(secno, dirty_i->dirty_secmap);
>   				return;
>   			}
> @@ -825,22 +825,20 @@ static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno)
>   {
>   	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>   	unsigned short valid_blocks, ckpt_valid_blocks;
> -	unsigned int usable_blocks;
>   
>   	if (segno == NULL_SEGNO || IS_CURSEG(sbi, segno))
>   		return;
>   
> -	usable_blocks = f2fs_usable_blks_in_seg(sbi, segno);
>   	mutex_lock(&dirty_i->seglist_lock);
>   
>   	valid_blocks = get_valid_blocks(sbi, segno, false);
>   	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno, false);
>   
>   	if (valid_blocks == 0 && (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) ||
> -		ckpt_valid_blocks == usable_blocks)) {
> +		ckpt_valid_blocks == BLKS_PER_SEG(sbi))) {
>   		__locate_dirty_segment(sbi, segno, PRE);
>   		__remove_dirty_segment(sbi, segno, DIRTY);
> -	} else if (valid_blocks < usable_blocks) {
> +	} else if (valid_blocks < BLKS_PER_SEG(sbi)) {
>   		__locate_dirty_segment(sbi, segno, DIRTY);
>   	} else {
>   		/* Recovery routine with SSR needs this */
> @@ -882,12 +880,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi)
>   	mutex_lock(&dirty_i->seglist_lock);
>   	for_each_set_bit(segno, dirty_i->dirty_segmap[DIRTY], MAIN_SEGS(sbi)) {
>   		se = get_seg_entry(sbi, segno);
> -		if (IS_NODESEG(se->type))
> -			holes[NODE] += f2fs_usable_blks_in_seg(sbi, segno) -
> -							se->valid_blocks;
> -		else
> -			holes[DATA] += f2fs_usable_blks_in_seg(sbi, segno) -
> -							se->valid_blocks;
> +		holes[SE_PAGETYPE(se)] += BLKS_PER_SEG(sbi) - se->valid_blocks;
>   	}
>   	mutex_unlock(&dirty_i->seglist_lock);
>   
> @@ -2406,8 +2399,7 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>   	new_vblocks = se->valid_blocks + del;
>   	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
>   
> -	f2fs_bug_on(sbi, (new_vblocks < 0 ||
> -			(new_vblocks > f2fs_usable_blks_in_seg(sbi, segno))));
> +	f2fs_bug_on(sbi, new_vblocks < 0 || new_vblocks > BLKS_PER_SEG(sbi));
>   
>   	se->valid_blocks = new_vblocks;
>   
> @@ -3449,7 +3441,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
>   			f2fs_randomize_chunk(sbi, curseg);
>   	}
> -	if (curseg->next_blkoff >= f2fs_usable_blks_in_seg(sbi, curseg->segno))
> +	if (curseg->next_blkoff >= BLKS_PER_SEG(sbi))
>   		segment_full = true;
>   	stat_inc_block_count(sbi, curseg);
>   
> @@ -4687,8 +4679,6 @@ static void init_free_segmap(struct f2fs_sb_info *sbi)
>   	struct seg_entry *sentry;
>   
>   	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> -		if (f2fs_usable_blks_in_seg(sbi, start) == 0)
> -			continue;
>   		sentry = get_seg_entry(sbi, start);
>   		if (!sentry->valid_blocks)
>   			__set_free(sbi, start);
> @@ -4710,7 +4700,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
>   	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>   	struct free_segmap_info *free_i = FREE_I(sbi);
>   	unsigned int segno = 0, offset = 0, secno;
> -	block_t valid_blocks, usable_blks_in_seg;
> +	block_t valid_blocks;
>   
>   	while (1) {
>   		/* find dirty segment based on free segmap */
> @@ -4719,10 +4709,9 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
>   			break;
>   		offset = segno + 1;
>   		valid_blocks = get_valid_blocks(sbi, segno, false);
> -		usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
> -		if (valid_blocks == usable_blks_in_seg || !valid_blocks)
> +		if (valid_blocks == BLKS_PER_SEG(sbi) || !valid_blocks)
>   			continue;
> -		if (valid_blocks > usable_blks_in_seg) {
> +		if (valid_blocks > BLKS_PER_SEG(sbi)) {
>   			f2fs_bug_on(sbi, 1);
>   			continue;
>   		}
> @@ -4739,7 +4728,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
>   		valid_blocks = get_valid_blocks(sbi, segno, true);
>   		secno = GET_SEC_FROM_SEG(sbi, segno);
>   
> -		if (!valid_blocks || valid_blocks == CAP_BLKS_PER_SEC(sbi))
> +		if (!valid_blocks || valid_blocks == BLKS_PER_SEC(sbi))
>   			continue;
>   		if (IS_CURSEC(sbi, secno))
>   			continue;
> @@ -5097,42 +5086,6 @@ int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
>   
>   	return 0;
>   }
> -
> -/*
> - * Return the number of usable blocks in a segment. The number of blocks
> - * returned is always equal to the number of blocks in a segment for
> - * segments fully contained within a sequential zone capacity or a
> - * conventional zone. For segments partially contained in a sequential
> - * zone capacity, the number of usable blocks up to the zone capacity
> - * is returned. 0 is returned in all other cases.
> - */
> -static inline unsigned int f2fs_usable_zone_blks_in_seg(
> -			struct f2fs_sb_info *sbi, unsigned int segno)
> -{
> -	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
> -	unsigned int secno;
> -
> -	if (!sbi->unusable_blocks_per_sec)
> -		return BLKS_PER_SEG(sbi);
> -
> -	secno = GET_SEC_FROM_SEG(sbi, segno);
> -	seg_start = START_BLOCK(sbi, segno);
> -	sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
> -	sec_cap_blkaddr = sec_start_blkaddr + CAP_BLKS_PER_SEC(sbi);
> -
> -	/*
> -	 * If segment starts before zone capacity and spans beyond
> -	 * zone capacity, then usable blocks are from seg start to
> -	 * zone capacity. If the segment starts after the zone capacity,
> -	 * then there are no usable blocks.
> -	 */
> -	if (seg_start >= sec_cap_blkaddr)
> -		return 0;
> -	if (seg_start + BLKS_PER_SEG(sbi) > sec_cap_blkaddr)
> -		return sec_cap_blkaddr - seg_start;
> -
> -	return BLKS_PER_SEG(sbi);
> -}
>   #else
>   int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
>   {
> @@ -5143,31 +5096,7 @@ int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
>   {
>   	return 0;
>   }
> -
> -static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi,
> -							unsigned int segno)
> -{
> -	return 0;
> -}
> -
>   #endif
> -unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> -					unsigned int segno)
> -{
> -	if (f2fs_sb_has_blkzoned(sbi))
> -		return f2fs_usable_zone_blks_in_seg(sbi, segno);
> -
> -	return BLKS_PER_SEG(sbi);
> -}
> -
> -unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> -					unsigned int segno)
> -{
> -	if (f2fs_sb_has_blkzoned(sbi))
> -		return CAP_SEGS_PER_SEC(sbi);
> -
> -	return SEGS_PER_SEC(sbi);
> -}
>   
>   /*
>    * Update min, max modified time for cost-benefit GC algorithm
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 96cec83012f1..b725ae1a7043 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -99,12 +99,6 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>   	((!__is_valid_data_blkaddr(blk_addr)) ?			\
>   	NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),			\
>   		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
> -#define CAP_BLKS_PER_SEC(sbi)					\
> -	((sbi)->segs_per_sec * (sbi)->blocks_per_seg -		\
> -	 (sbi)->unusable_blocks_per_sec)
> -#define CAP_SEGS_PER_SEC(sbi)					\
> -	((sbi)->segs_per_sec - ((sbi)->unusable_blocks_per_sec >>\
> -	(sbi)->log_blocks_per_seg))
>   #define GET_SEC_FROM_SEG(sbi, segno)				\
>   	(((segno) == -1) ? -1 : (segno) / (sbi)->segs_per_sec)
>   #define GET_SEG_FROM_SEC(sbi, secno)				\
> @@ -440,7 +434,6 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
>   	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>   	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>   	unsigned int next;
> -	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
>   
>   	spin_lock(&free_i->segmap_lock);
>   	clear_bit(segno, free_i->free_segmap);
> @@ -448,7 +441,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
>   
>   	next = find_next_bit(free_i->free_segmap,
>   			start_segno + SEGS_PER_SEC(sbi), start_segno);
> -	if (next >= start_segno + usable_segs) {
> +	if (next >= start_segno + SEGS_PER_SEC(sbi)) {
>   		clear_bit(secno, free_i->free_secmap);
>   		free_i->free_sections++;
>   	}
> @@ -474,7 +467,6 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>   	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>   	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>   	unsigned int next;
> -	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
>   
>   	spin_lock(&free_i->segmap_lock);
>   	if (test_and_clear_bit(segno, free_i->free_segmap)) {
> @@ -484,7 +476,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>   			goto skip_free;
>   		next = find_next_bit(free_i->free_segmap,
>   				start_segno + SEGS_PER_SEC(sbi), start_segno);
> -		if (next >= start_segno + usable_segs) {
> +		if (next >= start_segno + SEGS_PER_SEC(sbi)) {
>   			if (test_and_clear_bit(secno, free_i->free_secmap))
>   				free_i->free_sections++;
>   		}
> @@ -577,16 +569,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>   	/* check current node segment */
>   	for (i = CURSEG_HOT_NODE; i <= CURSEG_COLD_NODE; i++) {
>   		segno = CURSEG_I(sbi, i)->segno;
> -		left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> +		left_blocks = BLKS_PER_SEG(sbi) -
>   				get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> -
>   		if (node_blocks > left_blocks)
>   			return false;
>   	}
>   
>   	/* check current data segment */
>   	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> -	left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> +	left_blocks = BLKS_PER_SEG(sbi) -
>   			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>   	if (dent_blocks > left_blocks)
>   		return false;
> @@ -604,10 +595,10 @@ static inline void __get_secs_required(struct f2fs_sb_info *sbi,
>   					get_pages(sbi, F2FS_DIRTY_DENTS) +
>   					get_pages(sbi, F2FS_DIRTY_IMETA);
>   	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
> -	unsigned int node_secs = total_node_blocks / CAP_BLKS_PER_SEC(sbi);
> -	unsigned int dent_secs = total_dent_blocks / CAP_BLKS_PER_SEC(sbi);
> -	unsigned int node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
> -	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
> +	unsigned int node_secs = total_node_blocks / BLKS_PER_SEC(sbi);
> +	unsigned int dent_secs = total_dent_blocks / BLKS_PER_SEC(sbi);
> +	unsigned int node_blocks = total_node_blocks % BLKS_PER_SEC(sbi);
> +	unsigned int dent_blocks = total_dent_blocks % BLKS_PER_SEC(sbi);
>   
>   	if (lower_p)
>   		*lower_p = node_secs + dent_secs;
> @@ -766,22 +757,21 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
>   	bool is_valid  = test_bit_le(0, raw_sit->valid_map) ? true : false;
>   	int valid_blocks = 0;
>   	int cur_pos = 0, next_pos;
> -	unsigned int usable_blks_per_seg = f2fs_usable_blks_in_seg(sbi, segno);
>   
>   	/* check bitmap with valid block count */
>   	do {
>   		if (is_valid) {
>   			next_pos = find_next_zero_bit_le(&raw_sit->valid_map,
> -					usable_blks_per_seg,
> +					BLKS_PER_SEG(sbi),
>   					cur_pos);
>   			valid_blocks += next_pos - cur_pos;
>   		} else
>   			next_pos = find_next_bit_le(&raw_sit->valid_map,
> -					usable_blks_per_seg,
> +					BLKS_PER_SEG(sbi),
>   					cur_pos);
>   		cur_pos = next_pos;
>   		is_valid = !is_valid;
> -	} while (cur_pos < usable_blks_per_seg);
> +	} while (cur_pos < BLKS_PER_SEG(sbi));
>   
>   	if (unlikely(GET_SIT_VBLOCKS(raw_sit) != valid_blocks)) {
>   		f2fs_err(sbi, "Mismatch valid blocks %d vs. %d",
> @@ -791,14 +781,9 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
>   		return -EFSCORRUPTED;
>   	}
>   
> -	if (usable_blks_per_seg < BLKS_PER_SEG(sbi))
> -		f2fs_bug_on(sbi, find_next_bit_le(&raw_sit->valid_map,
> -				BLKS_PER_SEG(sbi),
> -				usable_blks_per_seg) != BLKS_PER_SEG(sbi));
> -
>   	/* check segment usage, and check boundary of a given segment number */
> -	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
> -					|| !valid_main_segno(sbi, segno))) {
> +	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > BLKS_PER_SEG(sbi) ||
> +				!valid_main_segno(sbi, segno))) {
>   		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
>   			 GET_SIT_VBLOCKS(raw_sit), segno);
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c0688c124aa7..cd6a56020a5d 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3837,21 +3837,13 @@ static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
>   			      void *data)
>   {
>   	struct f2fs_report_zones_args *rz_args = data;
> -	block_t unusable_blocks = (zone->len - zone->capacity) >>
> -					F2FS_LOG_SECTORS_PER_BLOCK;
>   
> -	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
> -		return 0;
> -
> -	set_bit(idx, rz_args->dev->blkz_seq);
> -	if (!rz_args->sbi->unusable_blocks_per_sec) {
> -		rz_args->sbi->unusable_blocks_per_sec = unusable_blocks;
> -		return 0;
> -	}
> -	if (rz_args->sbi->unusable_blocks_per_sec != unusable_blocks) {
> -		f2fs_err(rz_args->sbi, "F2FS supports single zone capacity\n");
> +	if (zone->len != zone->capacity) {
> +		f2fs_err(rz_args->sbi, "F2FS does not support zone capacity.\n");
>   		return -EINVAL;
>   	}
> +	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL)
> +		set_bit(idx, rz_args->dev->blkz_seq);
>   	return 0;
>   }
>   
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 906d2af2d849..2689cc9c3bf8 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1018,9 +1018,6 @@ F2FS_SBI_GENERAL_RW_ATTR(revoked_atomic_block);
>   F2FS_SBI_GENERAL_RW_ATTR(hot_data_age_threshold);
>   F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
>   F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
> -#ifdef CONFIG_BLK_DEV_ZONED
> -F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
> -#endif
>   
>   /* STAT_INFO ATTR */
>   #ifdef CONFIG_F2FS_STAT_FS
> @@ -1172,9 +1169,6 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(moved_blocks_background),
>   	ATTR_LIST(avg_vblocks),
>   #endif
> -#ifdef CONFIG_BLK_DEV_ZONED
> -	ATTR_LIST(unusable_blocks_per_sec),
> -#endif
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	ATTR_LIST(compr_written_block),
>   	ATTR_LIST(compr_saved_block),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
