Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 121E2860979
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 04:44:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdMTf-0004Pl-Af;
	Fri, 23 Feb 2024 03:44:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rdMTd-0004Pe-UM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 03:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ZKfrxOPlWiP2PoAe6ADrglo6s+SEc50FbdDsm7qZy0=; b=MJSGPoQ2W5C08HjlJ2ofGcO1Ts
 MfpaxRSSJDDbaOs15u8MaESSTJem/R44JGerYeMAvOTEooqOWLehR2F3ap+EbTc8mg6Ud3u3QYTpU
 HV6LkiqXIkr8sLELaO/IQBpt+/UybZwNzPxVmKIobBie/EC+wFmM/RANkI/RgKGidGdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4ZKfrxOPlWiP2PoAe6ADrglo6s+SEc50FbdDsm7qZy0=; b=hKLxW5ujGP5MqkrlTk0EVr4/th
 NnvmYk/xzZOePdLQAUxIV0BRoLALSmlw72PZVAZQs6ZzYeIP8O283xj/XCajAGApWjkMrN9qZAn3E
 sHIp89FNGQdNkaPUtOv48ry7zaBGoJgTjzVYS5Mwe7mJG4B5Pjjn1X2bXRB/+6RiiRzg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdMTb-0005bj-DQ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 03:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E028633AC;
 Fri, 23 Feb 2024 03:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6A7C433F1;
 Fri, 23 Feb 2024 03:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708659825;
 bh=TRd/BANzvLVqQrUFMdKyHxBiSVmEvU8CPsHLgwppJmw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IRkTxVp+XmHAkcwhEve10Jt7hR89sLLmDl6YM/8OqJBWKFnEl43DD8xXfu8vZhGM4
 XvuAUt+uxy84hqG0eDj+LI9guGgPKqyPYc8UTqC9tAAeDS+W9LQPpSekc2rnesRkSZ
 ksSy9StbNxQyT3TsFrihNHyMDeZE1dMxb2Oghxwa6JFz54Kxqaw6oRDI2XQ+SGosEk
 M/yXwdOK/shISDFCO0Ld3hgTkQXGoalhKGyTUuKgankv3p3HgIrn3kjntPMP5PmVVX
 HWRsB5pbkSkzRonQqHM8k2U31G+n0gWIO/pwGFOyjDVyW0B0cKOLxIftTII7BBGVnW
 J4UWh7FVTWCpw==
Message-ID: <baccf741-eeaa-476d-8478-098dc5d6e9d3@kernel.org>
Date: Fri, 23 Feb 2024 11:43:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240213173812.1432663-1-daeho43@gmail.com>
 <20240213173812.1432663-2-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240213173812.1432663-2-daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/14 1:38, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Support file pinning with conventional storage
 area for zoned devices > > Signed-off-by: Daeho Jeong <daehojeong@g [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdMTb-0005bj-DQ
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: support file pinning for zoned
 devices
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/14 1:38, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Support file pinning with conventional storage area for zoned devices
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v3: check the hole when migrating blocks for swap.
>      do not use the remainder of cold pin section.
> v2: flush previous dirty pages before swapon.
>      do not re-check for the last extent of swap area.
>      merge this patch with swap file pinning support patch.
> ---
>   fs/f2fs/data.c    | 58 ++++++++++++++++++++++++++-------------
>   fs/f2fs/f2fs.h    | 17 +++++++++++-
>   fs/f2fs/file.c    | 24 ++++++++++++-----
>   fs/f2fs/gc.c      | 14 +++++++---
>   fs/f2fs/segment.c | 69 +++++++++++++++++++++++++++++++++++++++++------
>   fs/f2fs/segment.h | 10 +++++++
>   6 files changed, 154 insertions(+), 38 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 828c797cd47c..0c9aa3082fcf 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3839,25 +3839,34 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>   	unsigned int blkofs;
>   	unsigned int blk_per_sec = BLKS_PER_SEC(sbi);
>   	unsigned int secidx = start_blk / blk_per_sec;
> -	unsigned int end_sec = secidx + blkcnt / blk_per_sec;
> +	unsigned int end_sec;
>   	int ret = 0;
>   
> +	if (!blkcnt)
> +		return 0;
> +	end_sec = secidx + (blkcnt - 1) / blk_per_sec;
> +
>   	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   	filemap_invalidate_lock(inode->i_mapping);
>   
>   	set_inode_flag(inode, FI_ALIGNED_WRITE);
>   	set_inode_flag(inode, FI_OPU_WRITE);
>   
> -	for (; secidx < end_sec; secidx++) {
> +	for (; secidx <= end_sec; secidx++) {
> +		unsigned int blkofs_end = secidx == end_sec ?
> +			(blkcnt - 1) % blk_per_sec : blk_per_sec - 1;
> +
>   		f2fs_down_write(&sbi->pin_sem);
>   
> -		f2fs_lock_op(sbi);
> -		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
> -		f2fs_unlock_op(sbi);
> +		ret = f2fs_allocate_pinning_section(sbi);
> +		if (ret) {
> +			f2fs_up_write(&sbi->pin_sem);
> +			break;
> +		}
>   
>   		set_inode_flag(inode, FI_SKIP_WRITES);
>   
> -		for (blkofs = 0; blkofs < blk_per_sec; blkofs++) {
> +		for (blkofs = 0; blkofs <= blkofs_end; blkofs++) {
>   			struct page *page;
>   			unsigned int blkidx = secidx * blk_per_sec + blkofs;
>   
> @@ -3946,27 +3955,34 @@ static int check_swap_activate(struct swap_info_struct *sis,
>   		nr_pblocks = map.m_len;
>   
>   		if ((pblock - SM_I(sbi)->main_blkaddr) & sec_blks_mask ||
> -				nr_pblocks & sec_blks_mask) {
> +				nr_pblocks & sec_blks_mask ||
> +				!f2fs_valid_pinned_area(sbi, pblock)) {
> +			bool last_extent = false;
> +
>   			not_aligned++;
>   
>   			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
>   			if (cur_lblock + nr_pblocks > sis->max)
>   				nr_pblocks -= blks_per_sec;
>   
> +			/* this extent is last one */
>   			if (!nr_pblocks) {
> -				/* this extent is last one */
> -				nr_pblocks = map.m_len;
> -				f2fs_warn(sbi, "Swapfile: last extent is not aligned to section");
> -				goto next;
> +				nr_pblocks = last_lblock - cur_lblock;
> +				last_extent = true;
>   			}
>   
>   			ret = f2fs_migrate_blocks(inode, cur_lblock,
>   							nr_pblocks);
> -			if (ret)
> +			if (ret) {
> +				if (ret == -ENOENT)
> +					ret = -EINVAL;
>   				goto out;
> -			goto retry;
> +			}
> +
> +			if (!last_extent)
> +				goto retry;
>   		}
> -next:
> +
>   		if (cur_lblock + nr_pblocks >= sis->max)
>   			nr_pblocks = sis->max - cur_lblock;
>   
> @@ -4004,17 +4020,17 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>   				sector_t *span)
>   {
>   	struct inode *inode = file_inode(file);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	int ret;
>   
>   	if (!S_ISREG(inode->i_mode))
>   		return -EINVAL;
>   
> -	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
> +	if (f2fs_readonly(sbi->sb))
>   		return -EROFS;
>   
> -	if (f2fs_lfs_mode(F2FS_I_SB(inode))) {
> -		f2fs_err(F2FS_I_SB(inode),
> -			"Swapfile not supported in LFS mode");
> +	if (f2fs_lfs_mode(sbi) && !f2fs_sb_has_blkzoned(sbi)) {
> +		f2fs_err(sbi, "Swapfile not supported in LFS mode");
>   		return -EINVAL;
>   	}
>   
> @@ -4027,13 +4043,17 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
>   
>   	f2fs_precache_extents(inode);
>   
> +	ret = filemap_fdatawrite(inode->i_mapping);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret = check_swap_activate(sis, file, span);
>   	if (ret < 0)
>   		return ret;
>   
>   	stat_inc_swapfile_inode(inode);
>   	set_inode_flag(inode, FI_PIN_FILE);
> -	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> +	f2fs_update_time(sbi, REQ_TIME);
>   	return ret;
>   }
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 40eb590ed646..351133a11518 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3696,7 +3696,8 @@ void f2fs_get_new_segment(struct f2fs_sb_info *sbi,
>   			unsigned int *newseg, bool new_sec, int dir);
>   void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   					unsigned int start, unsigned int end);
> -void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
> +int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
> +int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi);
>   void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
>   int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
>   bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
> @@ -3870,6 +3871,9 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
>   block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
>   int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control);
>   void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
> +int f2fs_gc_range(struct f2fs_sb_info *sbi,
> +		unsigned int start_seg, unsigned int end_seg,
> +		bool dry_run, unsigned int dry_run_sections);
>   int f2fs_resize_fs(struct file *filp, __u64 block_count);
>   int __init f2fs_create_garbage_collection_cache(void);
>   void f2fs_destroy_garbage_collection_cache(void);
> @@ -4524,6 +4528,17 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
>   	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
>   }
>   
> +static inline bool f2fs_valid_pinned_area(struct f2fs_sb_info *sbi,
> +					  block_t blkaddr)
> +{
> +	if (f2fs_sb_has_blkzoned(sbi)) {
> +		int devi = f2fs_target_device_index(sbi, blkaddr);
> +
> +		return !bdev_is_zoned(FDEV(devi).bdev);
> +	}
> +	return true;
> +}
> +
>   static inline bool f2fs_low_mem_mode(struct f2fs_sb_info *sbi)
>   {
>   	return F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 2c13b340c8a0..21c3aa93a8db 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1733,9 +1733,11 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>   
>   		f2fs_down_write(&sbi->pin_sem);
>   
> -		f2fs_lock_op(sbi);
> -		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
> -		f2fs_unlock_op(sbi);
> +		err = f2fs_allocate_pinning_section(sbi);
> +		if (err) {
> +			f2fs_up_write(&sbi->pin_sem);
> +			goto out_err;
> +		}
>   
>   		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
>   		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_DIO);
> @@ -3185,6 +3187,7 @@ int f2fs_pin_file_control(struct inode *inode, bool inc)
>   static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   {
>   	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	__u32 pin;
>   	int ret = 0;
>   
> @@ -3194,7 +3197,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   	if (!S_ISREG(inode->i_mode))
>   		return -EINVAL;
>   
> -	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
> +	if (f2fs_readonly(sbi->sb))
>   		return -EROFS;
>   
>   	ret = mnt_want_write_file(filp);
> @@ -3207,9 +3210,18 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   		clear_inode_flag(inode, FI_PIN_FILE);
>   		f2fs_i_gc_failures_write(inode, 0);
>   		goto done;
> +	} else if (f2fs_is_pinned_file(inode)) {
> +		goto done;
>   	}
>   
> -	if (f2fs_should_update_outplace(inode, NULL)) {
> +	if (f2fs_sb_has_blkzoned(sbi) && F2FS_HAS_BLOCKS(inode)) {
> +		ret = -EFBIG;
> +		goto out;
> +	}
> +
> +	/* Let's allow file pinning on zoned device. */
> +	if (!f2fs_sb_has_blkzoned(sbi) &&
> +	    f2fs_should_update_outplace(inode, NULL)) {
>   		ret = -EINVAL;
>   		goto out;
>   	}
> @@ -3231,7 +3243,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>   	set_inode_flag(inode, FI_PIN_FILE);
>   	ret = F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN];
>   done:
> -	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
> +	f2fs_update_time(sbi, REQ_TIME);
>   out:
>   	inode_unlock(inode);
>   	mnt_drop_write_file(filp);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index a089a938355b..3ff126316d42 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1961,10 +1961,12 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
>   	init_atgc_management(sbi);
>   }
>   
> -static int f2fs_gc_range(struct f2fs_sb_info *sbi,
> -		unsigned int start_seg, unsigned int end_seg, bool dry_run)
> +int f2fs_gc_range(struct f2fs_sb_info *sbi,
> +		unsigned int start_seg, unsigned int end_seg,
> +		bool dry_run, unsigned int dry_run_sections)
>   {
>   	unsigned int segno;
> +	unsigned int gc_secs = dry_run_sections;
>   
>   	for (segno = start_seg; segno <= end_seg; segno += SEGS_PER_SEC(sbi)) {
>   		struct gc_inode_list gc_list = {
> @@ -1972,11 +1974,15 @@ static int f2fs_gc_range(struct f2fs_sb_info *sbi,
>   			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>   		};
>   
> -		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true);
> +		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
> +						dry_run_sections == 0);
>   		put_gc_inode(&gc_list);
>   
>   		if (!dry_run && get_valid_blocks(sbi, segno, true))
>   			return -EAGAIN;
> +		if (dry_run && dry_run_sections &&
> +		    !get_valid_blocks(sbi, segno, true) && --gc_secs == 0)
> +			break;
>   
>   		if (fatal_signal_pending(current))
>   			return -ERESTARTSYS;
> @@ -2014,7 +2020,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
>   		f2fs_allocate_segment_for_resize(sbi, type, start, end);
>   
>   	/* do GC to move out valid blocks in the range */
> -	err = f2fs_gc_range(sbi, start, end, dry_run);
> +	err = f2fs_gc_range(sbi, start, end, dry_run, 0);
>   	if (err || dry_run)
>   		goto out;
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 4e985750c938..0b72c8536ccf 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2632,7 +2632,7 @@ static int is_next_segment_free(struct f2fs_sb_info *sbi,
>    * This function should be returned with success, otherwise BUG
>    */
>   static void get_new_segment(struct f2fs_sb_info *sbi,
> -			unsigned int *newseg, bool new_sec)
> +			unsigned int *newseg, bool new_sec, bool pinning)
>   {
>   	struct free_segmap_info *free_i = FREE_I(sbi);
>   	unsigned int segno, secno, zoneno;
> @@ -2650,6 +2650,16 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>   		if (segno < GET_SEG_FROM_SEC(sbi, hint + 1))
>   			goto got_it;
>   	}
> +
> +	/*
> +	 * If we format f2fs on zoned storage, let's try to get pinned sections
> +	 * from beginning of the storage, which should be a conventional one.
> +	 */
> +	if (f2fs_sb_has_blkzoned(sbi)) {
> +		segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
> +		hint = GET_SEC_FROM_SEG(sbi, segno);
> +	}
> +
>   find_other_zone:
>   	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>   	if (secno >= MAIN_SECS(sbi)) {
> @@ -2749,21 +2759,30 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>    * Allocate a current working segment.
>    * This function always allocates a free segment in LFS manner.
>    */
> -static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
> +static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
>   {
>   	struct curseg_info *curseg = CURSEG_I(sbi, type);
>   	unsigned int segno = curseg->segno;
> +	bool pinning = type == CURSEG_COLD_DATA_PINNED;
>   
>   	if (curseg->inited)
>   		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, segno));
> +
>   	segno = __get_next_segno(sbi, type);

If type is CURSEG_COLD_DATA_PINNED, can we let __get_next_segno() return 0?
then we can allocate free segment from conventional zone in priority.

Thanks,

> -	get_new_segment(sbi, &segno, new_sec);
> +	get_new_segment(sbi, &segno, new_sec, pinning);
> +	if (new_sec && pinning &&
> +	    !f2fs_valid_pinned_area(sbi, START_BLOCK(sbi, segno))) {
> +		__set_free(sbi, segno);
> +		return -EAGAIN;
> +	}
> +
>   	curseg->next_segno = segno;
>   	reset_curseg(sbi, type, 1);
>   	curseg->alloc_type = LFS;
>   	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
>   		curseg->fragment_remained_chunk =
>   				get_random_u32_inclusive(1, sbi->max_fragment_chunk);
> +	return 0;
>   }
>   
>   static int __next_free_blkoff(struct f2fs_sb_info *sbi,
> @@ -3036,7 +3055,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   	f2fs_up_read(&SM_I(sbi)->curseg_lock);
>   }
>   
> -static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
> +static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
>   						bool new_sec, bool force)
>   {
>   	struct curseg_info *curseg = CURSEG_I(sbi, type);
> @@ -3046,21 +3065,49 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
>   	    !curseg->next_blkoff &&
>   	    !get_valid_blocks(sbi, curseg->segno, new_sec) &&
>   	    !get_ckpt_valid_blocks(sbi, curseg->segno, new_sec))
> -		return;
> +		return 0;
>   
>   	old_segno = curseg->segno;
> -	new_curseg(sbi, type, true);
> +	if (new_curseg(sbi, type, true))
> +		return -EAGAIN;
>   	stat_inc_seg_type(sbi, curseg);
>   	locate_dirty_segment(sbi, old_segno);
> +	return 0;
>   }
>   
> -void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
> +int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
>   {
> +	int ret;
> +
>   	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>   	down_write(&SIT_I(sbi)->sentry_lock);
> -	__allocate_new_segment(sbi, type, true, force);
> +	ret = __allocate_new_segment(sbi, type, true, force);
>   	up_write(&SIT_I(sbi)->sentry_lock);
>   	f2fs_up_read(&SM_I(sbi)->curseg_lock);
> +
> +	return ret;
> +}
> +
> +int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
> +{
> +	int err;
> +	bool gc_required = true;
> +
> +retry:
> +	f2fs_lock_op(sbi);
> +	err = f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
> +	f2fs_unlock_op(sbi);
> +
> +	if (f2fs_sb_has_blkzoned(sbi) && err && gc_required) {
> +		f2fs_down_write(&sbi->gc_lock);
> +		f2fs_gc_range(sbi, 0, GET_SEGNO(sbi, FDEV(0).end_blk), true, 1);
> +		f2fs_up_write(&sbi->gc_lock);
> +
> +		gc_required = false;
> +		goto retry;
> +	}
> +
> +	return err;
>   }
>   
>   void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
> @@ -3426,6 +3473,10 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   	 * new segment.
>   	 */
>   	if (segment_full) {
> +		if (type == CURSEG_COLD_DATA_PINNED &&
> +		    !((curseg->segno + 1) % sbi->segs_per_sec))
> +			goto skip_new_segment;
> +
>   		if (from_gc) {
>   			get_atssr_segment(sbi, type, se->type,
>   						AT_SSR, se->mtime);
> @@ -3437,6 +3488,8 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   			stat_inc_seg_type(sbi, curseg);
>   		}
>   	}
> +
> +skip_new_segment:
>   	/*
>   	 * segment dirty status should be updated after segment allocation,
>   	 * so we just need to update status only one time after previous
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 60d93a16f2ac..953af072915f 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -942,3 +942,13 @@ static inline void wake_up_discard_thread(struct f2fs_sb_info *sbi, bool force)
>   	dcc->discard_wake = true;
>   	wake_up_interruptible_all(&dcc->discard_wait_queue);
>   }
> +
> +static inline unsigned int first_zoned_segno(struct f2fs_sb_info *sbi)
> +{
> +	int devi;
> +
> +	for (devi = 0; devi < sbi->s_ndevs; devi++)
> +		if (bdev_is_zoned(FDEV(devi).bdev))
> +			return GET_SEGNO(sbi, FDEV(devi).start_blk);
> +	return 0;
> +}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
