Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B366815F5DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 19:42:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2fuh-0000NH-K8; Fri, 14 Feb 2020 18:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j2fug-0000N8-E8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNubY6BSNm4rDlbdeuQuW0bv3PWZwa2DoCwrL7QRb44=; b=f1tVbmLvn5o4DwB/hQ5+Q77xR0
 2I/RktKKHyi7Q3mhLj23bdGftaxd8WJC8lWcM79EH6ooTb/kgtgUBL1cY3lwuBnDEAM8tTiFLtoLG
 XrutdR3dchIABLxRhmTieKfrEfIohktBNShSy5xWD81QhDOsWhz0BbypxFSuVOP23YIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wNubY6BSNm4rDlbdeuQuW0bv3PWZwa2DoCwrL7QRb44=; b=Vk9PVg26QVGpAlcBZeOO9aOwFf
 lUXSh4X0iPLDYQCzWXusFkl/pzqzXem6QOUXNHk8rO3PfM1RPvvkMiGZJiUrH028GhGMJBosB5Vtg
 5c5l56OW61nFZlD2AOLZlHfBCvhjxtOoPaoCxlmHPtcpXK60sP0KAykw2+kJ2frVcGY4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2fuX-0042Fs-15
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:42:06 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EE0A20848;
 Fri, 14 Feb 2020 18:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581705711;
 bh=Vmr7dtwO8orqihgXko6Xr4/uDKtNzlidNtsbZUcAv7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xl0Jo5HdSpIcwWHNL77+oXE3Th2FQk4KX5LnN5V4PR780fvjHJCou8UkGHM6pxu2K
 qHO8sc2mENydR3sHzXUMBTa/JonS2lXUkh5EZ1xDmCJTQZEIwNrFloM8m0Sug5XQBm
 sIvSbHM1ObBhvASjN2aggS+GlItB0VIvq/HFLuKs=
Date: Fri, 14 Feb 2020 10:41:50 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200214184150.GB60913@google.com>
References: <20200214094413.12784-1-yuchao0@huawei.com>
 <20200214094413.12784-3-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214094413.12784-3-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j2fuX-0042Fs-15
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: clean up lfs/adaptive mount option
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

On 02/14, Chao Yu wrote:
> This patch removes F2FS_MOUNT_ADAPTIVE and F2FS_MOUNT_LFS mount options,
> and add F2FS_OPTION.fs_mode with below two status to indicate filesystem
> mode.
> 
> enum {
> 	FS_MODE_ADAPTIVE,	/* use both lfs/ssr allocation */
> 	FS_MODE_LFS,		/* use lfs allocation only */
> };
> 
> It can enhance code readability and fs mode's scalability.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/data.c    |  8 ++++----
>  fs/f2fs/f2fs.h    | 27 ++++++++++-----------------
>  fs/f2fs/file.c    |  2 +-
>  fs/f2fs/gc.c      |  2 +-
>  fs/f2fs/segment.c | 12 ++++++------
>  fs/f2fs/super.c   | 16 ++++++++--------
>  6 files changed, 30 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index ec4b030e2466..019c91f7b301 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -445,7 +445,7 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
>  		if (type != DATA && type != NODE)
>  			goto submit_io;
>  
> -		if (test_opt(sbi, LFS) && current->plug)
> +		if (f2fs_lfs_mode(sbi) && current->plug)
>  			blk_finish_plug(current->plug);
>  
>  		if (F2FS_IO_ALIGNED(sbi))
> @@ -1420,7 +1420,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  	end = pgofs + maxblocks;
>  
>  	if (!create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
> -		if (test_opt(sbi, LFS) && flag == F2FS_GET_BLOCK_DIO &&
> +		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
>  							map->m_may_create)
>  			goto next_dnode;
>  
> @@ -1475,7 +1475,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  
>  	if (__is_valid_data_blkaddr(blkaddr)) {
>  		/* use out-place-update for driect IO under LFS mode */
> -		if (test_opt(sbi, LFS) && flag == F2FS_GET_BLOCK_DIO &&
> +		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
>  							map->m_may_create) {
>  			err = __allocate_data_block(&dn, map->m_seg_type);
>  			if (err)
> @@ -2403,7 +2403,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  
> -	if (test_opt(sbi, LFS))
> +	if (f2fs_lfs_mode(sbi))
>  		return true;
>  	if (S_ISDIR(inode->i_mode))
>  		return true;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5152e9bf432b..d2d50827772c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -91,8 +91,6 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  #define F2FS_MOUNT_FORCE_FG_GC		0x00004000
>  #define F2FS_MOUNT_DATA_FLUSH		0x00008000
>  #define F2FS_MOUNT_FAULT_INJECTION	0x00010000
> -#define F2FS_MOUNT_ADAPTIVE		0x00020000
> -#define F2FS_MOUNT_LFS			0x00040000

I don't think we can remove this simply.

>  #define F2FS_MOUNT_USRQUOTA		0x00080000
>  #define F2FS_MOUNT_GRPQUOTA		0x00100000
>  #define F2FS_MOUNT_PRJQUOTA		0x00200000
> @@ -138,6 +136,7 @@ struct f2fs_mount_info {
>  	int whint_mode;
>  	int alloc_mode;			/* segment allocation policy */
>  	int fsync_mode;			/* fsync policy */
> +	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
>  	bool test_dummy_encryption;	/* test dummy encryption */
>  	block_t unusable_cap;		/* Amount of space allowed to be
>  					 * unusable when disabling checkpoint
> @@ -1171,6 +1170,11 @@ enum {
>  	GC_URGENT,
>  };
>  
> +enum {
> +	FS_MODE_ADAPTIVE,	/* use both lfs/ssr allocation */
> +	FS_MODE_LFS,		/* use lfs allocation only */
> +};
> +
>  enum {
>  	WHINT_MODE_OFF,		/* not pass down write hints */
>  	WHINT_MODE_USER,	/* try to pass down hints given by users */
> @@ -3907,20 +3911,9 @@ static inline bool f2fs_hw_is_readonly(struct f2fs_sb_info *sbi)
>  	return false;
>  }
>  
> -
> -static inline void set_opt_mode(struct f2fs_sb_info *sbi, unsigned int mt)
> +static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
>  {
> -	clear_opt(sbi, ADAPTIVE);
> -	clear_opt(sbi, LFS);
> -
> -	switch (mt) {
> -	case F2FS_MOUNT_ADAPTIVE:
> -		set_opt(sbi, ADAPTIVE);
> -		break;
> -	case F2FS_MOUNT_LFS:
> -		set_opt(sbi, LFS);
> -		break;
> -	}
> +	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
>  }
>  
>  static inline bool f2fs_may_encrypt(struct inode *inode)
> @@ -3975,7 +3968,7 @@ static inline int allow_outplace_dio(struct inode *inode,
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	int rw = iov_iter_rw(iter);
>  
> -	return (test_opt(sbi, LFS) && (rw == WRITE) &&
> +	return (f2fs_lfs_mode(sbi) && (rw == WRITE) &&
>  				!block_unaligned_IO(inode, iocb, iter));
>  }
>  
> @@ -3997,7 +3990,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  	 */
>  	if (f2fs_sb_has_blkzoned(sbi))
>  		return true;
> -	if (test_opt(sbi, LFS) && (rw == WRITE)) {
> +	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
>  		if (block_unaligned_IO(inode, iocb, iter))
>  			return true;
>  		if (F2FS_IO_ALIGNED(sbi))
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5a0f84751091..efca4ed17b7d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1132,7 +1132,7 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
>  
>  		if (!f2fs_is_checkpointed_data(sbi, *blkaddr)) {
>  
> -			if (test_opt(sbi, LFS)) {
> +			if (f2fs_lfs_mode(sbi)) {
>  				f2fs_put_dnode(&dn);
>  				return -EOPNOTSUPP;
>  			}
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 53312d7bc78b..8aebe2b9c655 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -762,7 +762,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  	struct page *page, *mpage;
>  	block_t newaddr;
>  	int err = 0;
> -	bool lfs_mode = test_opt(fio.sbi, LFS);
> +	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
>  
>  	/* do not read out */
>  	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index cf0eb002cfd4..c3252603ff79 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -172,7 +172,7 @@ bool f2fs_need_SSR(struct f2fs_sb_info *sbi)
>  	int dent_secs = get_blocktype_secs(sbi, F2FS_DIRTY_DENTS);
>  	int imeta_secs = get_blocktype_secs(sbi, F2FS_DIRTY_IMETA);
>  
> -	if (test_opt(sbi, LFS))
> +	if (f2fs_lfs_mode(sbi))
>  		return false;
>  	if (sbi->gc_mode == GC_URGENT)
>  		return true;
> @@ -1940,7 +1940,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>  	unsigned int start = 0, end = -1;
>  	unsigned int secno, start_segno;
>  	bool force = (cpc->reason & CP_DISCARD);
> -	bool need_align = test_opt(sbi, LFS) && __is_large_section(sbi);
> +	bool need_align = f2fs_lfs_mode(sbi) && __is_large_section(sbi);
>  
>  	mutex_lock(&dirty_i->seglist_lock);
>  
> @@ -1972,7 +1972,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>  					(end - 1) <= cpc->trim_end)
>  				continue;
>  
> -		if (!test_opt(sbi, LFS) || !__is_large_section(sbi)) {
> +		if (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi)) {
>  			f2fs_issue_discard(sbi, START_BLOCK(sbi, start),
>  				(end - start) << sbi->log_blocks_per_seg);
>  			continue;
> @@ -2830,7 +2830,7 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>  	struct discard_policy dpolicy;
>  	unsigned long long trimmed = 0;
>  	int err = 0;
> -	bool need_align = test_opt(sbi, LFS) && __is_large_section(sbi);
> +	bool need_align = f2fs_lfs_mode(sbi) && __is_large_section(sbi);
>  
>  	if (start >= MAX_BLKADDR(sbi) || range->len < sbi->blocksize)
>  		return -EINVAL;
> @@ -3193,7 +3193,7 @@ static void update_device_state(struct f2fs_io_info *fio)
>  static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>  {
>  	int type = __get_segment_type(fio);
> -	bool keep_order = (test_opt(fio->sbi, LFS) && type == CURSEG_COLD_DATA);
> +	bool keep_order = (f2fs_lfs_mode(fio->sbi) && type == CURSEG_COLD_DATA);
>  
>  	if (keep_order)
>  		down_read(&fio->sbi->io_order_lock);
> @@ -4678,7 +4678,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
>  	if (sm_info->rec_prefree_segments > DEF_MAX_RECLAIM_PREFREE_SEGMENTS)
>  		sm_info->rec_prefree_segments = DEF_MAX_RECLAIM_PREFREE_SEGMENTS;
>  
> -	if (!test_opt(sbi, LFS))
> +	if (!f2fs_lfs_mode(sbi))
>  		sm_info->ipu_policy = 1 << F2FS_IPU_FSYNC;
>  	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
>  	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 65a7a432dfee..427409eff354 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -600,10 +600,10 @@ static int parse_options(struct super_block *sb, char *options)
>  					kvfree(name);
>  					return -EINVAL;
>  				}
> -				set_opt_mode(sbi, F2FS_MOUNT_ADAPTIVE);
> +				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
>  			} else if (strlen(name) == 3 &&
>  					!strncmp(name, "lfs", 3)) {
> -				set_opt_mode(sbi, F2FS_MOUNT_LFS);
> +				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
>  			} else {
>  				kvfree(name);
>  				return -EINVAL;
> @@ -904,7 +904,7 @@ static int parse_options(struct super_block *sb, char *options)
>  	}
>  #endif
>  
> -	if (F2FS_IO_SIZE_BITS(sbi) && !test_opt(sbi, LFS)) {
> +	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
>  		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
>  			 F2FS_IO_SIZE_KB(sbi));
>  		return -EINVAL;
> @@ -934,7 +934,7 @@ static int parse_options(struct super_block *sb, char *options)
>  		}
>  	}
>  
> -	if (test_opt(sbi, DISABLE_CHECKPOINT) && test_opt(sbi, LFS)) {
> +	if (test_opt(sbi, DISABLE_CHECKPOINT) && f2fs_lfs_mode(sbi)) {
>  		f2fs_err(sbi, "LFS not compatible with checkpoint=disable\n");
>  		return -EINVAL;
>  	}
> @@ -1497,9 +1497,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  		seq_puts(seq, ",data_flush");
>  
>  	seq_puts(seq, ",mode=");
> -	if (test_opt(sbi, ADAPTIVE))
> +	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_ADAPTIVE)
>  		seq_puts(seq, "adaptive");
> -	else if (test_opt(sbi, LFS))
> +	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
>  		seq_puts(seq, "lfs");
>  	seq_printf(seq, ",active_logs=%u", F2FS_OPTION(sbi).active_logs);
>  	if (test_opt(sbi, RESERVE_ROOT))
> @@ -1586,9 +1586,9 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	set_opt(sbi, FLUSH_MERGE);
>  	set_opt(sbi, DISCARD);
>  	if (f2fs_sb_has_blkzoned(sbi))
> -		set_opt_mode(sbi, F2FS_MOUNT_LFS);
> +		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
>  	else
> -		set_opt_mode(sbi, F2FS_MOUNT_ADAPTIVE);
> +		F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
>  
>  #ifdef CONFIG_F2FS_FS_XATTR
>  	set_opt(sbi, XATTR_USER);
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
