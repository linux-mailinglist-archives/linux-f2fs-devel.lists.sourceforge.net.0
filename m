Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F14C06F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2019 20:02:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdeuI-0005Jg-2F; Wed, 19 Jun 2019 18:02:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hdeuH-0005JR-D6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 18:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fOtA/D1qPfZfEtBwdtvsLLWls0ofYKSuZ+6IporRDWw=; b=d0EYz32oDI0mNNEknspP8Ut7Z4
 vrXRmmm0S3EhG64X2DlxFpwjXiXHAKJ8VCLuq0w9voqOaaiwJsHYKRrwib3eps7wQFU8G8LqblVBe
 u9zCsmBgW0Kj/RpEig0+ke2CTMo9C5CRnX+la72rLP+v5mxUAwVkN/03z0JB4NgKyDDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fOtA/D1qPfZfEtBwdtvsLLWls0ofYKSuZ+6IporRDWw=; b=I8uVZDnXGYvHOUp1k9mAtDtGZK
 egvXdo1UdiQd87JRFhS7SUOGc6gleutIpWpOAfrziin4dvSEmxGbw1DQnpqtMC0DXxKDSxYQyCOYv
 5+nD2gAZDunOSj+vhTFLXt8UjybVrFO07SbO/oh3Rd2Gbff5eo6kggNLE4ihDBTQp8w4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdeuD-005SWJ-JA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 18:02:01 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B81BA2166E;
 Wed, 19 Jun 2019 18:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560967312;
 bh=T/b7IDukHQ0hFb1Kz9Rmtuo/Ua4DUc7nk/IE0Oz5MKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uDkISbOf8iJyI2VwWDDqBPdA/dsQitiYgaKhAbHgoyKHPeFB/ONFZCBHNfCnIbDWF
 W+7j2I46c2lwogVsYe9FizxqOmlkG3BA3N7ioGRoEpj1RNywv7EY/RPvejpFJYhksQ
 OGJ9RSdJi7ljcKG9KjUeymcraYwW4u7/t1wKdOa8=
Date: Wed, 19 Jun 2019 11:01:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190619180150.GC57884@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190618094842.19332-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618094842.19332-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdeuD-005SWJ-JA
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce f2fs_<level> macros to wrap
 f2fs_printk()
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
Cc: Joe Perches <joe@perches.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/18, Chao Yu wrote:
> From: Joe Perches <joe@perches.com>
> 
> - Add and use f2fs_<level> macros
> - Convert f2fs_msg to f2fs_printk
> - Remove level from f2fs_printk and embed the level in the format
> - Coalesce formats and align multi-line arguments
> - Remove unnecessary duplicate extern f2fs_msg f2fs.h

Can we just use sbi for f2fs_<level>? And, could you please change missing
f2fs_msg() in the latest dev?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev

Thanks,

> 
> Signed-off-by: Joe Perches <joe@perches.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/checkpoint.c   |  34 ++-
>  fs/f2fs/dir.c          |  10 +-
>  fs/f2fs/extent_cache.c |   7 +-
>  fs/f2fs/f2fs.h         |  38 ++--
>  fs/f2fs/file.c         |  21 +-
>  fs/f2fs/gc.c           |  10 +-
>  fs/f2fs/inline.c       |  12 +-
>  fs/f2fs/inode.c        |  72 +++---
>  fs/f2fs/namei.c        |  10 +-
>  fs/f2fs/node.c         |  30 +--
>  fs/f2fs/recovery.c     |  37 ++--
>  fs/f2fs/segment.c      |  56 ++---
>  fs/f2fs/segment.h      |  10 +-
>  fs/f2fs/super.c        | 485 +++++++++++++++++------------------------
>  14 files changed, 340 insertions(+), 492 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 43f65f0962e5..6cebf17cde13 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -146,8 +146,8 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
>  
>  	exist = f2fs_test_bit(offset, se->cur_valid_map);
>  	if (!exist && type == DATA_GENERIC_ENHANCE) {
> -		f2fs_msg(sbi->sb, KERN_ERR, "Inconsistent error "
> -			"blkaddr:%u, sit bitmap:%d", blkaddr, exist);
> +		f2fs_err(sbi->sb, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> +			 blkaddr, exist);
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		WARN_ON(1);
>  	}
> @@ -184,8 +184,8 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  	case DATA_GENERIC_ENHANCE_READ:
>  		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>  				blkaddr < MAIN_BLKADDR(sbi))) {
> -			f2fs_msg(sbi->sb, KERN_WARNING,
> -				"access invalid blkaddr:%u", blkaddr);
> +			f2fs_warn(sbi->sb, "access invalid blkaddr:%u",
> +				  blkaddr);
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
>  			WARN_ON(1);
>  			return false;
> @@ -657,9 +657,8 @@ static int recover_orphan_inode(struct f2fs_sb_info *sbi, nid_t ino)
>  
>  err_out:
>  	set_sbi_flag(sbi, SBI_NEED_FSCK);
> -	f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: orphan failed (ino=%x), run fsck to fix.",
> -			__func__, ino);
> +	f2fs_warn(sbi->sb, "%s: orphan failed (ino=%x), run fsck to fix.",
> +		  __func__, ino);
>  	return err;
>  }
>  
> @@ -676,13 +675,12 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  		return 0;
>  
>  	if (bdev_read_only(sbi->sb->s_bdev)) {
> -		f2fs_msg(sbi->sb, KERN_INFO, "write access "
> -			"unavailable, skipping orphan cleanup");
> +		f2fs_info(sbi->sb, "write access unavailable, skipping orphan cleanup");
>  		return 0;
>  	}
>  
>  	if (s_flags & SB_RDONLY) {
> -		f2fs_msg(sbi->sb, KERN_INFO, "orphan cleanup on readonly fs");
> +		f2fs_info(sbi->sb, "orphan cleanup on readonly fs");
>  		sbi->sb->s_flags &= ~SB_RDONLY;
>  	}
>  
> @@ -827,15 +825,14 @@ static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
>  	if (crc_offset < CP_MIN_CHKSUM_OFFSET ||
>  			crc_offset > CP_CHKSUM_OFFSET) {
>  		f2fs_put_page(*cp_page, 1);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"invalid crc_offset: %zu", crc_offset);
> +		f2fs_warn(sbi->sb, "invalid crc_offset: %zu", crc_offset);
>  		return -EINVAL;
>  	}
>  
>  	crc = f2fs_checkpoint_chksum(sbi, *cp_block);
>  	if (crc != cur_cp_crc(*cp_block)) {
>  		f2fs_put_page(*cp_page, 1);
> -		f2fs_msg(sbi->sb, KERN_WARNING, "invalid crc value");
> +		f2fs_warn(sbi->sb, "invalid crc value");
>  		return -EINVAL;
>  	}
>  
> @@ -858,9 +855,8 @@ static struct page *validate_checkpoint(struct f2fs_sb_info *sbi,
>  
>  	if (le32_to_cpu(cp_block->cp_pack_total_block_count) >
>  					sbi->blocks_per_seg) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"invalid cp_pack_total_block_count:%u",
> -			le32_to_cpu(cp_block->cp_pack_total_block_count));
> +		f2fs_warn(sbi->sb, "invalid cp_pack_total_block_count:%u",
> +			  le32_to_cpu(cp_block->cp_pack_total_block_count));
>  		goto invalid_cp;
>  	}
>  	pre_version = *version;
> @@ -1555,8 +1551,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>  		if (cpc->reason != CP_PAUSE)
>  			return 0;
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -				"Start checkpoint disabled!");
> +		f2fs_warn(sbi->sb, "Start checkpoint disabled!");
>  	}
>  	mutex_lock(&sbi->cp_mutex);
>  
> @@ -1622,8 +1617,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  	stat_inc_cp_count(sbi->stat_info);
>  
>  	if (cpc->reason & CP_RECOVERY)
> -		f2fs_msg(sbi->sb, KERN_NOTICE,
> -			"checkpoint: version = %llx", ckpt_ver);
> +		f2fs_notice(sbi->sb, "checkpoint: version = %llx", ckpt_ver);
>  
>  	/* do checkpoint periodically */
>  	f2fs_update_time(sbi, CP_TIME);
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 64cb61c42b95..d6897d0dd836 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -218,9 +218,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>  
>  	max_depth = F2FS_I(dir)->i_current_depth;
>  	if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
> -		f2fs_msg(F2FS_I_SB(dir)->sb, KERN_WARNING,
> -				"Corrupted max_depth of %lu: %u",
> -				dir->i_ino, max_depth);
> +		f2fs_warn(F2FS_I_SB(dir)->sb, "Corrupted max_depth of %lu: %u",
> +			  dir->i_ino, max_depth);
>  		max_depth = MAX_DIR_HASH_DEPTH;
>  		f2fs_i_depth_write(dir, max_depth);
>  	}
> @@ -816,9 +815,8 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>  		bit_pos += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
>  		if (unlikely(bit_pos > d->max ||
>  				le16_to_cpu(de->name_len) > F2FS_NAME_LEN)) {
> -			f2fs_msg(sbi->sb, KERN_WARNING,
> -				"%s: corrupted namelen=%d, run fsck to fix.",
> -				__func__, le16_to_cpu(de->name_len));
> +			f2fs_warn(sbi->sb, "%s: corrupted namelen=%d, run fsck to fix.",
> +				  __func__, le16_to_cpu(de->name_len));
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
>  			err = -EINVAL;
>  			goto out;
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index caf77fe8ac07..8f89ebf722bc 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -184,10 +184,9 @@ bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
>  		next_re = rb_entry(next, struct rb_entry, rb_node);
>  
>  		if (cur_re->ofs + cur_re->len > next_re->ofs) {
> -			f2fs_msg(sbi->sb, KERN_INFO, "inconsistent rbtree, "
> -				"cur(%u, %u) next(%u, %u)",
> -				cur_re->ofs, cur_re->len,
> -				next_re->ofs, next_re->len);
> +			f2fs_info(sbi->sb, "inconsistent rbtree, cur(%u, %u) next(%u, %u)",
> +				  cur_re->ofs, cur_re->len,
> +				  next_re->ofs, next_re->len);
>  			return false;
>  		}
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9bd2bf0f559b..91f37fe0bca2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1806,7 +1806,20 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>  	return -ENOSPC;
>  }
>  
> -void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...);
> +__printf(2, 3)
> +void f2fs_printk(struct super_block *sb, const char *fmt, ...);
> +
> +#define f2fs_err(sb, fmt, ...)						\
> +	f2fs_printk(sb, KERN_ERR fmt, ##__VA_ARGS__)
> +#define f2fs_warn(sb, fmt, ...)						\
> +	f2fs_printk(sb, KERN_WARNING fmt, ##__VA_ARGS__)
> +#define f2fs_notice(sb, fmt, ...)					\
> +	f2fs_printk(sb, KERN_NOTICE fmt, ##__VA_ARGS__)
> +#define f2fs_info(sb, fmt, ...)						\
> +	f2fs_printk(sb, KERN_INFO fmt, ##__VA_ARGS__)
> +#define f2fs_debug(sb, fmt, ...)					\
> +	f2fs_printk(sb, KERN_DEBUG fmt, ##__VA_ARGS__)
> +
>  static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
>  						struct inode *inode,
>  						block_t count)
> @@ -1822,11 +1835,10 @@ static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
>  					sbi->current_reserved_blocks + count);
>  	spin_unlock(&sbi->stat_lock);
>  	if (unlikely(inode->i_blocks < sectors)) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"Inconsistent i_blocks, ino:%lu, iblocks:%llu, sectors:%llu",
> -			inode->i_ino,
> -			(unsigned long long)inode->i_blocks,
> -			(unsigned long long)sectors);
> +		f2fs_warn(sbi->sb, "Inconsistent i_blocks, ino:%lu, iblocks:%llu, sectors:%llu",
> +			  inode->i_ino,
> +			  (unsigned long long)inode->i_blocks,
> +			  (unsigned long long)sectors);
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		return;
>  	}
> @@ -2064,10 +2076,9 @@ static inline void dec_valid_node_count(struct f2fs_sb_info *sbi,
>  		dquot_free_inode(inode);
>  	} else {
>  		if (unlikely(inode->i_blocks == 0)) {
> -			f2fs_msg(sbi->sb, KERN_WARNING,
> -				"Inconsistent i_blocks, ino:%lu, iblocks:%llu",
> -				inode->i_ino,
> -				(unsigned long long)inode->i_blocks);
> +			f2fs_warn(sbi->sb, "Inconsistent i_blocks, ino:%lu, iblocks:%llu",
> +				  inode->i_ino,
> +				  (unsigned long long)inode->i_blocks);
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
>  			return;
>  		}
> @@ -2871,9 +2882,8 @@ static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
>  					block_t blkaddr, int type)
>  {
>  	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type)) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"invalid blkaddr: %u, type: %d, run fsck to fix.",
> -			blkaddr, type);
> +		f2fs_err(sbi->sb, "invalid blkaddr: %u, type: %d, run fsck to fix.",
> +			 blkaddr, type);
>  		f2fs_bug_on(sbi, 1);
>  	}
>  }
> @@ -3004,8 +3014,6 @@ int f2fs_quota_sync(struct super_block *sb, int type);
>  void f2fs_quota_off_umount(struct super_block *sb);
>  int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
>  int f2fs_sync_fs(struct super_block *sb, int sync);
> -extern __printf(3, 4)
> -void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...);
>  int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
>  
>  /*
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 45b45f37d347..51d9eccadb68 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1764,9 +1764,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>  	 * f2fs_is_atomic_file.
>  	 */
>  	if (get_dirty_pages(inode))
> -		f2fs_msg(F2FS_I_SB(inode)->sb, KERN_WARNING,
> -		"Unexpected flush for atomic writes: ino=%lu, npages=%u",
> -					inode->i_ino, get_dirty_pages(inode));
> +		f2fs_warn(F2FS_I_SB(inode)->sb, "Unexpected flush for atomic writes: ino=%lu, npages=%u",
> +			  inode->i_ino, get_dirty_pages(inode));
>  	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>  	if (ret) {
>  		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> @@ -2201,8 +2200,7 @@ static int f2fs_ioc_write_checkpoint(struct file *filp, unsigned long arg)
>  		return -EROFS;
>  
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -			"Skipping Checkpoint. Checkpoints currently disabled.");
> +		f2fs_info(sbi->sb, "Skipping Checkpoint. Checkpoints currently disabled.");
>  		return -EINVAL;
>  	}
>  
> @@ -2587,10 +2585,8 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
>  
>  	if (!f2fs_is_multi_device(sbi) || sbi->s_ndevs - 1 <= range.dev_num ||
>  			__is_large_section(sbi)) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"Can't flush %u in %d for segs_per_sec %u != 1",
> -				range.dev_num, sbi->s_ndevs,
> -				sbi->segs_per_sec);
> +		f2fs_warn(sbi->sb, "Can't flush %u in %d for segs_per_sec %u != 1",
> +			  range.dev_num, sbi->s_ndevs, sbi->segs_per_sec);
>  		return -EINVAL;
>  	}
>  
> @@ -2869,10 +2865,9 @@ int f2fs_pin_file_control(struct inode *inode, bool inc)
>  				fi->i_gc_failures[GC_FAILURE_PIN] + 1);
>  
>  	if (fi->i_gc_failures[GC_FAILURE_PIN] > sbi->gc_pin_file_threshold) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: Enable GC = ino %lx after %x GC trials",
> -			__func__, inode->i_ino,
> -			fi->i_gc_failures[GC_FAILURE_PIN]);
> +		f2fs_warn(sbi->sb, "%s: Enable GC = ino %lx after %x GC trials",
> +			  __func__, inode->i_ino,
> +			  fi->i_gc_failures[GC_FAILURE_PIN]);
>  		clear_inode_flag(inode, FI_PIN_FILE);
>  		return -EAGAIN;
>  	}
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 1e029da26053..15932ea4a1b6 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -616,9 +616,8 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>  	}
>  
>  	if (sum->version != dni->version) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -				"%s: valid data with mismatched node version.",
> -				__func__);
> +		f2fs_warn(sbi->sb, "%s: valid data with mismatched node version.",
> +			  __func__);
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  	}
>  
> @@ -1181,9 +1180,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>  
>  		sum = page_address(sum_page);
>  		if (type != GET_SUM_TYPE((&sum->footer))) {
> -			f2fs_msg(sbi->sb, KERN_ERR, "Inconsistent segment (%u) "
> -				"type [%d, %d] in SSA and SIT",
> -				segno, type, GET_SUM_TYPE((&sum->footer)));
> +			f2fs_err(sbi->sb, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
> +				 segno, type, GET_SUM_TYPE((&sum->footer)));
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
>  			f2fs_stop_checkpoint(sbi, false);
>  			goto skip;
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 404d2462a0fe..b3bdd8e8f4b8 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -140,10 +140,8 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
>  	if (unlikely(dn->data_blkaddr != NEW_ADDR)) {
>  		f2fs_put_dnode(dn);
>  		set_sbi_flag(fio.sbi, SBI_NEED_FSCK);
> -		f2fs_msg(fio.sbi->sb, KERN_WARNING,
> -			"%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, "
> -			"run fsck to fix.",
> -			__func__, dn->inode->i_ino, dn->data_blkaddr);
> +		f2fs_warn(fio.sbi->sb, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
> +			  __func__, dn->inode->i_ino, dn->data_blkaddr);
>  		return -EINVAL;
>  	}
>  
> @@ -383,10 +381,8 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
>  	if (unlikely(dn.data_blkaddr != NEW_ADDR)) {
>  		f2fs_put_dnode(&dn);
>  		set_sbi_flag(F2FS_P_SB(page), SBI_NEED_FSCK);
> -		f2fs_msg(F2FS_P_SB(page)->sb, KERN_WARNING,
> -			"%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, "
> -			"run fsck to fix.",
> -			__func__, dir->i_ino, dn.data_blkaddr);
> +		f2fs_warn(F2FS_P_SB(page)->sb, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
> +			  __func__, dir->i_ino, dn.data_blkaddr);
>  		err = -EINVAL;
>  		goto out;
>  	}
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index ccb02226dd2c..e5492bc05ddc 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -176,9 +176,8 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
>  	calculated = f2fs_inode_chksum(sbi, page);
>  
>  	if (provided != calculated)
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
> -			page->index, ino_of_node(page), provided, calculated);
> +		f2fs_warn(sbi->sb, "checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
> +			  page->index, ino_of_node(page), provided, calculated);
>  
>  	return provided == calculated;
>  }
> @@ -202,50 +201,41 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  	iblocks = le64_to_cpu(F2FS_INODE(node_page)->i_blocks);
>  	if (!iblocks) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, "
> -			"run fsck to fix.",
> -			__func__, inode->i_ino, iblocks);
> +		f2fs_warn(sbi->sb, "%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, run fsck to fix.",
> +			  __func__, inode->i_ino, iblocks);
>  		return false;
>  	}
>  
>  	if (ino_of_node(node_page) != nid_of_node(node_page)) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: corrupted inode footer i_ino=%lx, ino,nid: "
> -			"[%u, %u] run fsck to fix.",
> -			__func__, inode->i_ino,
> -			ino_of_node(node_page), nid_of_node(node_page));
> +		f2fs_warn(sbi->sb, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
> +			  __func__, inode->i_ino,
> +			  ino_of_node(node_page), nid_of_node(node_page));
>  		return false;
>  	}
>  
>  	if (f2fs_sb_has_flexible_inline_xattr(sbi)
>  			&& !f2fs_has_extra_attr(inode)) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: corrupted inode ino=%lx, run fsck to fix.",
> -			__func__, inode->i_ino);
> +		f2fs_warn(sbi->sb, "%s: corrupted inode ino=%lx, run fsck to fix.",
> +			  __func__, inode->i_ino);
>  		return false;
>  	}
>  
>  	if (f2fs_has_extra_attr(inode) &&
>  			!f2fs_sb_has_extra_attr(sbi)) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: inode (ino=%lx) is with extra_attr, "
> -			"but extra_attr feature is off",
> -			__func__, inode->i_ino);
> +		f2fs_warn(sbi->sb, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> +			  __func__, inode->i_ino);
>  		return false;
>  	}
>  
>  	if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
>  			fi->i_extra_isize % sizeof(__le32)) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: inode (ino=%lx) has corrupted i_extra_isize: %d, "
> -			"max: %zu",
> -			__func__, inode->i_ino, fi->i_extra_isize,
> -			F2FS_TOTAL_EXTRA_ATTR_SIZE);
> +		f2fs_warn(sbi->sb, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
> +			  __func__, inode->i_ino, fi->i_extra_isize,
> +			  F2FS_TOTAL_EXTRA_ATTR_SIZE);
>  		return false;
>  	}
>  
> @@ -255,11 +245,9 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  		(!fi->i_inline_xattr_size ||
>  		fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: inode (ino=%lx) has corrupted "
> -			"i_inline_xattr_size: %d, max: %zu",
> -			__func__, inode->i_ino, fi->i_inline_xattr_size,
> -			MAX_INLINE_XATTR_SIZE);
> +		f2fs_warn(sbi->sb, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, max: %zu",
> +			  __func__, inode->i_ino, fi->i_inline_xattr_size,
> +			  MAX_INLINE_XATTR_SIZE);
>  		return false;
>  	}
>  
> @@ -272,11 +260,9 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  			!f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
>  						DATA_GENERIC_ENHANCE))) {
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
> -			f2fs_msg(sbi->sb, KERN_WARNING,
> -				"%s: inode (ino=%lx) extent info [%u, %u, %u] "
> -				"is incorrect, run fsck to fix",
> -				__func__, inode->i_ino,
> -				ei->blk, ei->fofs, ei->len);
> +			f2fs_warn(sbi->sb, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
> +				  __func__, inode->i_ino,
> +				  ei->blk, ei->fofs, ei->len);
>  			return false;
>  		}
>  	}
> @@ -284,19 +270,15 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  	if (f2fs_has_inline_data(inode) &&
>  			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: inode (ino=%lx, mode=%u) should not have "
> -			"inline_data, run fsck to fix",
> -			__func__, inode->i_ino, inode->i_mode);
> +		f2fs_warn(sbi->sb, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
> +			  __func__, inode->i_ino, inode->i_mode);
>  		return false;
>  	}
>  
>  	if (f2fs_has_inline_dentry(inode) && !S_ISDIR(inode->i_mode)) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"%s: inode (ino=%lx, mode=%u) should not have "
> -			"inline_dentry, run fsck to fix",
> -			__func__, inode->i_ino, inode->i_mode);
> +		f2fs_warn(sbi->sb, "%s: inode (ino=%lx, mode=%u) should not have inline_dentry, run fsck to fix",
> +			  __func__, inode->i_ino, inode->i_mode);
>  		return false;
>  	}
>  
> @@ -783,8 +765,7 @@ void f2fs_handle_failed_inode(struct inode *inode)
>  	err = f2fs_get_node_info(sbi, inode->i_ino, &ni);
>  	if (err) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"May loss orphan inode, run fsck to fix.");
> +		f2fs_warn(sbi->sb, "May loss orphan inode, run fsck to fix.");
>  		goto out;
>  	}
>  
> @@ -792,8 +773,7 @@ void f2fs_handle_failed_inode(struct inode *inode)
>  		err = f2fs_acquire_orphan_inode(sbi);
>  		if (err) {
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
> -			f2fs_msg(sbi->sb, KERN_WARNING,
> -				"Too many orphan inodes, run fsck to fix.");
> +			f2fs_warn(sbi->sb, "Too many orphan inodes, run fsck to fix.");
>  		} else {
>  			f2fs_add_orphan_inode(inode);
>  		}
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 0f77f9242751..426aff52b745 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -385,9 +385,8 @@ static int __recover_dot_dentries(struct inode *dir, nid_t pino)
>  	int err = 0;
>  
>  	if (f2fs_readonly(sbi->sb)) {
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -			"skip recovering inline_dots inode (ino:%lu, pino:%u) "
> -			"in readonly mountpoint", dir->i_ino, pino);
> +		f2fs_info(sbi->sb, "skip recovering inline_dots inode (ino:%lu, pino:%u) in readonly mountpoint",
> +			  dir->i_ino, pino);
>  		return 0;
>  	}
>  
> @@ -484,9 +483,8 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
>  	if (IS_ENCRYPTED(dir) &&
>  	    (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
>  	    !fscrypt_has_permitted_context(dir, inode)) {
> -		f2fs_msg(inode->i_sb, KERN_WARNING,
> -			 "Inconsistent encryption contexts: %lu/%lu",
> -			 dir->i_ino, inode->i_ino);
> +		f2fs_warn(inode->i_sb, "Inconsistent encryption contexts: %lu/%lu",
> +			  dir->i_ino, inode->i_ino);
>  		err = -EPERM;
>  		goto out_iput;
>  	}
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 865f1525df32..eb8cbea35936 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -34,9 +34,8 @@ int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid)
>  {
>  	if (unlikely(nid < F2FS_ROOT_INO(sbi) || nid >= NM_I(sbi)->max_nid)) {
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -				"%s: out-of-range nid=%x, run fsck to fix.",
> -				__func__, nid);
> +		f2fs_warn(sbi->sb, "%s: out-of-range nid=%x, run fsck to fix.",
> +			  __func__, nid);
>  		return -EINVAL;
>  	}
>  	return 0;
> @@ -1189,10 +1188,8 @@ int f2fs_remove_inode_page(struct inode *inode)
>  	}
>  
>  	if (unlikely(inode->i_blocks != 0 && inode->i_blocks != 8)) {
> -		f2fs_msg(F2FS_I_SB(inode)->sb, KERN_WARNING,
> -			"Inconsistent i_blocks, ino:%lu, iblocks:%llu",
> -			inode->i_ino,
> -			(unsigned long long)inode->i_blocks);
> +		f2fs_warn(F2FS_I_SB(inode)->sb, "Inconsistent i_blocks, ino:%lu, iblocks:%llu",
> +			  inode->i_ino, (unsigned long long)inode->i_blocks);
>  		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
>  	}
>  
> @@ -1380,11 +1377,10 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>  	}
>  page_hit:
>  	if(unlikely(nid != nid_of_node(page))) {
> -		f2fs_msg(sbi->sb, KERN_WARNING, "inconsistent node block, "
> -			"nid:%lu, node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
> -			nid, nid_of_node(page), ino_of_node(page),
> -			ofs_of_node(page), cpver_of_node(page),
> -			next_blkaddr_of_node(page));
> +		f2fs_warn(sbi->sb, "inconsistent node block, nid:%lu, node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
> +			  nid, nid_of_node(page), ino_of_node(page),
> +			  ofs_of_node(page), cpver_of_node(page),
> +			  next_blkaddr_of_node(page));
>  		err = -EINVAL;
>  out_err:
>  		ClearPageUptodate(page);
> @@ -1752,9 +1748,8 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  			break;
>  	}
>  	if (!ret && atomic && !marked) {
> -		f2fs_msg(sbi->sb, KERN_DEBUG,
> -			"Retry to write fsync mark: ino=%u, idx=%lx",
> -					ino, last_page->index);
> +		f2fs_debug(sbi->sb, "Retry to write fsync mark: ino=%u, idx=%lx",
> +			   ino, last_page->index);
>  		lock_page(last_page);
>  		f2fs_wait_on_page_writeback(last_page, NODE, true, true);
>  		set_page_dirty(last_page);
> @@ -2304,8 +2299,7 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
>  			if (ret) {
>  				up_read(&nm_i->nat_tree_lock);
>  				f2fs_bug_on(sbi, !mount);
> -				f2fs_msg(sbi->sb, KERN_ERR,
> -					"NAT is corrupt, run fsck to fix it");
> +				f2fs_err(sbi->sb, "NAT is corrupt, run fsck to fix it");
>  				return ret;
>  			}
>  		}
> @@ -2915,7 +2909,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
>  	nm_i->full_nat_bits = nm_i->nat_bits + 8;
>  	nm_i->empty_nat_bits = nm_i->full_nat_bits + nat_bits_bytes;
>  
> -	f2fs_msg(sbi->sb, KERN_NOTICE, "Found nat_bits in checkpoint");
> +	f2fs_notice(sbi->sb, "Found nat_bits in checkpoint");
>  	return 0;
>  }
>  
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index e04f82b3f4fc..431d7d150360 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -188,10 +188,9 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
>  		name = "<encrypted>";
>  	else
>  		name = raw_inode->i_name;
> -	f2fs_msg(inode->i_sb, KERN_NOTICE,
> -			"%s: ino = %x, name = %s, dir = %lx, err = %d",
> -			__func__, ino_of_node(ipage), name,
> -			IS_ERR(dir) ? 0 : dir->i_ino, err);
> +	f2fs_notice(inode->i_sb, "%s: ino = %x, name = %s, dir = %lx, err = %d",
> +		    __func__, ino_of_node(ipage), name,
> +		    IS_ERR(dir) ? 0 : dir->i_ino, err);
>  	return err;
>  }
>  
> @@ -292,9 +291,8 @@ static int recover_inode(struct inode *inode, struct page *page)
>  	else
>  		name = F2FS_INODE(page)->i_name;
>  
> -	f2fs_msg(inode->i_sb, KERN_NOTICE,
> -		"recover_inode: ino = %x, name = %s, inline = %x",
> -			ino_of_node(page), name, raw->i_inline);
> +	f2fs_notice(inode->i_sb, "recover_inode: ino = %x, name = %s, inline = %x",
> +		    ino_of_node(page), name, raw->i_inline);
>  	return 0;
>  }
>  
> @@ -371,10 +369,9 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
>  		/* sanity check in order to detect looped node chain */
>  		if (++loop_cnt >= free_blocks ||
>  			blkaddr == next_blkaddr_of_node(page)) {
> -			f2fs_msg(sbi->sb, KERN_NOTICE,
> -				"%s: detect looped node chain, "
> -				"blkaddr:%u, next:%u",
> -				__func__, blkaddr, next_blkaddr_of_node(page));
> +			f2fs_notice(sbi->sb, "%s: detect looped node chain, blkaddr:%u, next:%u",
> +				    __func__, blkaddr,
> +				    next_blkaddr_of_node(page));
>  			f2fs_put_page(page, 1);
>  			err = -EINVAL;
>  			break;
> @@ -553,10 +550,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>  	f2fs_bug_on(sbi, ni.ino != ino_of_node(page));
>  
>  	if (ofs_of_node(dn.node_page) != ofs_of_node(page)) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
> -			inode->i_ino, ofs_of_node(dn.node_page),
> -			ofs_of_node(page));
> +		f2fs_warn(sbi->sb, "Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
> +			  inode->i_ino, ofs_of_node(dn.node_page),
> +			  ofs_of_node(page));
>  		err = -EFAULT;
>  		goto err;
>  	}
> @@ -642,11 +638,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>  err:
>  	f2fs_put_dnode(&dn);
>  out:
> -	f2fs_msg(sbi->sb, KERN_NOTICE,
> -		"recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
> -		inode->i_ino,
> -		file_keep_isize(inode) ? "keep" : "recover",
> -		recovered, err);
> +	f2fs_notice(sbi->sb, "recover_data: ino = %lx (i_size: %s) recovered = %d, err = %d",
> +		    inode->i_ino, file_keep_isize(inode) ? "keep" : "recover",
> +		    recovered, err);
>  	return err;
>  }
>  
> @@ -734,8 +728,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  #endif
>  
>  	if (s_flags & SB_RDONLY) {
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -				"recover fsync data on readonly fs");
> +		f2fs_info(sbi->sb, "recover fsync data on readonly fs");
>  		sbi->sb->s_flags &= ~SB_RDONLY;
>  	}
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 54a3e398d1ea..403e6ec48060 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1757,8 +1757,7 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
>  		devi = f2fs_target_device_index(sbi, blkstart);
>  		if (blkstart < FDEV(devi).start_blk ||
>  		    blkstart > FDEV(devi).end_blk) {
> -			f2fs_msg(sbi->sb, KERN_ERR, "Invalid block %x",
> -				 blkstart);
> +			f2fs_err(sbi->sb, "Invalid block %x", blkstart);
>  			return -EIO;
>  		}
>  		blkstart -= FDEV(devi).start_blk;
> @@ -1771,10 +1770,9 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
>  
>  		if (sector & (bdev_zone_sectors(bdev) - 1) ||
>  				nr_sects != bdev_zone_sectors(bdev)) {
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -				"(%d) %s: Unaligned zone reset attempted (block %x + %x)",
> -				devi, sbi->s_ndevs ? FDEV(devi).path: "",
> -				blkstart, blklen);
> +			f2fs_err(sbi->sb, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
> +				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
> +				 blkstart, blklen);
>  			return -EIO;
>  		}
>  		trace_f2fs_issue_reset_zone(bdev, blkstart);
> @@ -2138,15 +2136,14 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  		mir_exist = f2fs_test_and_set_bit(offset,
>  						se->cur_valid_map_mir);
>  		if (unlikely(exist != mir_exist)) {
> -			f2fs_msg(sbi->sb, KERN_ERR, "Inconsistent error "
> -				"when setting bitmap, blk:%u, old bit:%d",
> -				blkaddr, exist);
> +			f2fs_err(sbi->sb, "Inconsistent error when setting bitmap, blk:%u, old bit:%d",
> +				 blkaddr, exist);
>  			f2fs_bug_on(sbi, 1);
>  		}
>  #endif
>  		if (unlikely(exist)) {
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -				"Bitmap was wrongly set, blk:%u", blkaddr);
> +			f2fs_err(sbi->sb, "Bitmap was wrongly set, blk:%u",
> +				 blkaddr);
>  			f2fs_bug_on(sbi, 1);
>  			se->valid_blocks--;
>  			del = 0;
> @@ -2167,15 +2164,14 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  		mir_exist = f2fs_test_and_clear_bit(offset,
>  						se->cur_valid_map_mir);
>  		if (unlikely(exist != mir_exist)) {
> -			f2fs_msg(sbi->sb, KERN_ERR, "Inconsistent error "
> -				"when clearing bitmap, blk:%u, old bit:%d",
> -				blkaddr, exist);
> +			f2fs_err(sbi->sb, "Inconsistent error when clearing bitmap, blk:%u, old bit:%d",
> +				 blkaddr, exist);
>  			f2fs_bug_on(sbi, 1);
>  		}
>  #endif
>  		if (unlikely(!exist)) {
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -				"Bitmap was wrongly cleared, blk:%u", blkaddr);
> +			f2fs_err(sbi->sb, "Bitmap was wrongly cleared, blk:%u",
> +				 blkaddr);
>  			f2fs_bug_on(sbi, 1);
>  			se->valid_blocks++;
>  			del = 0;
> @@ -2789,8 +2785,7 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>  		goto out;
>  
>  	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"Found FS corruption, run fsck to fix.");
> +		f2fs_warn(sbi->sb, "Found FS corruption, run fsck to fix.");
>  		return -EIO;
>  	}
>  
> @@ -3551,9 +3546,8 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
>  	/* sanity check for summary blocks */
>  	if (nats_in_cursum(nat_j) > NAT_JOURNAL_ENTRIES ||
>  			sits_in_cursum(sit_j) > SIT_JOURNAL_ENTRIES) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"invalid journal entries nats %u sits %u\n",
> -			nats_in_cursum(nat_j), sits_in_cursum(sit_j));
> +		f2fs_err(sbi->sb, "invalid journal entries nats %u sits %u\n",
> +			 nats_in_cursum(nat_j), sits_in_cursum(sit_j));
>  		return -EINVAL;
>  	}
>  
> @@ -4120,9 +4114,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  
>  		start = le32_to_cpu(segno_in_journal(journal, i));
>  		if (start >= MAIN_SEGS(sbi)) {
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -					"Wrong journal entry on segno %u",
> -					start);
> +			f2fs_err(sbi->sb, "Wrong journal entry on segno %u",
> +				 start);
>  			set_sbi_flag(sbi, SBI_NEED_FSCK);
>  			err = -EINVAL;
>  			break;
> @@ -4161,9 +4154,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	up_read(&curseg->journal_rwsem);
>  
>  	if (!err && total_node_blocks != valid_node_count(sbi)) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"SIT is corrupted node# %u vs %u",
> -			total_node_blocks, valid_node_count(sbi));
> +		f2fs_err(sbi->sb, "SIT is corrupted node# %u vs %u",
> +			 total_node_blocks, valid_node_count(sbi));
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		err = -EINVAL;
>  	}
> @@ -4279,12 +4271,10 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  			if (!f2fs_test_bit(blkofs, se->cur_valid_map))
>  				continue;
>  out:
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -				"Current segment's next free block offset is "
> -				"inconsistent with bitmap, logtype:%u, "
> -				"segno:%u, type:%u, next_blkoff:%u, blkofs:%u",
> -				i, curseg->segno, curseg->alloc_type,
> -				curseg->next_blkoff, blkofs);
> +			f2fs_err(sbi->sb,
> +				 "Current segment's next free block offset is inconsistent with bitmap, logtype:%u, segno:%u, type:%u, next_blkoff:%u, blkofs:%u",
> +				 i, curseg->segno, curseg->alloc_type,
> +				 curseg->next_blkoff, blkofs);
>  			return -EINVAL;
>  		}
>  	}
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 429007b8036e..ae29838939ab 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -693,9 +693,8 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
>  	} while (cur_pos < sbi->blocks_per_seg);
>  
>  	if (unlikely(GET_SIT_VBLOCKS(raw_sit) != valid_blocks)) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -				"Mismatch valid blocks %d vs. %d",
> -					GET_SIT_VBLOCKS(raw_sit), valid_blocks);
> +		f2fs_err(sbi->sb, "Mismatch valid blocks %d vs. %d",
> +			 GET_SIT_VBLOCKS(raw_sit), valid_blocks);
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		return -EINVAL;
>  	}
> @@ -703,9 +702,8 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
>  	/* check segment usage, and check boundary of a given segment number */
>  	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > sbi->blocks_per_seg
>  					|| segno > TOTAL_SEGS(sbi) - 1)) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -				"Wrong valid blocks %d or segno %u",
> -					GET_SIT_VBLOCKS(raw_sit), segno);
> +		f2fs_err(sbi->sb, "Wrong valid blocks %d or segno %u",
> +			 GET_SIT_VBLOCKS(raw_sit), segno);
>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		return -EINVAL;
>  	}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5a318399a2fa..d8abbf43b178 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -205,15 +205,20 @@ static match_table_t f2fs_tokens = {
>  	{Opt_err, NULL},
>  };
>  
> -void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...)
> +void f2fs_printk(struct super_block *sb, const char *fmt, ...)
>  {
>  	struct va_format vaf;
>  	va_list args;
> +	int level;
>  
>  	va_start(args, fmt);
> -	vaf.fmt = fmt;
> +
> +	level = printk_get_level(fmt);
> +	vaf.fmt = printk_skip_level(fmt);
>  	vaf.va = &args;
> -	printk("%sF2FS-fs (%s): %pV\n", level, sb->s_id, &vaf);
> +	printk("%c%cF2FS-fs (%s): %pV\n",
> +	       KERN_SOH_ASCII, level, sb->s_id, &vaf);
> +
>  	va_end(args);
>  }
>  
> @@ -226,21 +231,19 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
>  	if (test_opt(sbi, RESERVE_ROOT) &&
>  			F2FS_OPTION(sbi).root_reserved_blocks > limit) {
>  		F2FS_OPTION(sbi).root_reserved_blocks = limit;
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -			"Reduce reserved blocks for root = %u",
> -			F2FS_OPTION(sbi).root_reserved_blocks);
> +		f2fs_info(sbi->sb, "Reduce reserved blocks for root = %u",
> +			  F2FS_OPTION(sbi).root_reserved_blocks);
>  	}
>  	if (!test_opt(sbi, RESERVE_ROOT) &&
>  		(!uid_eq(F2FS_OPTION(sbi).s_resuid,
>  				make_kuid(&init_user_ns, F2FS_DEF_RESUID)) ||
>  		!gid_eq(F2FS_OPTION(sbi).s_resgid,
>  				make_kgid(&init_user_ns, F2FS_DEF_RESGID))))
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -			"Ignore s_resuid=%u, s_resgid=%u w/o reserve_root",
> -				from_kuid_munged(&init_user_ns,
> -					F2FS_OPTION(sbi).s_resuid),
> -				from_kgid_munged(&init_user_ns,
> -					F2FS_OPTION(sbi).s_resgid));
> +		f2fs_info(sbi->sb, "Ignore s_resuid=%u, s_resgid=%u w/o reserve_root",
> +			  from_kuid_munged(&init_user_ns,
> +					   F2FS_OPTION(sbi).s_resuid),
> +			  from_kgid_munged(&init_user_ns,
> +					   F2FS_OPTION(sbi).s_resgid));
>  }
>  
>  static void init_once(void *foo)
> @@ -261,35 +264,29 @@ static int f2fs_set_qf_name(struct super_block *sb, int qtype,
>  	int ret = -EINVAL;
>  
>  	if (sb_any_quota_loaded(sb) && !F2FS_OPTION(sbi).s_qf_names[qtype]) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"Cannot change journaled "
> -			"quota options when quota turned on");
> +		f2fs_err(sb, "Cannot change journaled quota options when quota turned on");
>  		return -EINVAL;
>  	}
>  	if (f2fs_sb_has_quota_ino(sbi)) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"QUOTA feature is enabled, so ignore qf_name");
> +		f2fs_info(sb, "QUOTA feature is enabled, so ignore qf_name");
>  		return 0;
>  	}
>  
>  	qname = match_strdup(args);
>  	if (!qname) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"Not enough memory for storing quotafile name");
> +		f2fs_err(sb, "Not enough memory for storing quotafile name");
>  		return -ENOMEM;
>  	}
>  	if (F2FS_OPTION(sbi).s_qf_names[qtype]) {
>  		if (strcmp(F2FS_OPTION(sbi).s_qf_names[qtype], qname) == 0)
>  			ret = 0;
>  		else
> -			f2fs_msg(sb, KERN_ERR,
> -				 "%s quota file already specified",
> +			f2fs_err(sb, "%s quota file already specified",
>  				 QTYPE2NAME(qtype));
>  		goto errout;
>  	}
>  	if (strchr(qname, '/')) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"quotafile must be on filesystem root");
> +		f2fs_err(sb, "quotafile must be on filesystem root");
>  		goto errout;
>  	}
>  	F2FS_OPTION(sbi).s_qf_names[qtype] = qname;
> @@ -305,8 +302,7 @@ static int f2fs_clear_qf_name(struct super_block *sb, int qtype)
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  
>  	if (sb_any_quota_loaded(sb) && F2FS_OPTION(sbi).s_qf_names[qtype]) {
> -		f2fs_msg(sb, KERN_ERR, "Cannot change journaled quota options"
> -			" when quota turned on");
> +		f2fs_err(sb, "Cannot change journaled quota options when quota turned on");
>  		return -EINVAL;
>  	}
>  	kvfree(F2FS_OPTION(sbi).s_qf_names[qtype]);
> @@ -322,8 +318,7 @@ static int f2fs_check_quota_options(struct f2fs_sb_info *sbi)
>  	 * to support legacy quotas in quota files.
>  	 */
>  	if (test_opt(sbi, PRJQUOTA) && !f2fs_sb_has_project_quota(sbi)) {
> -		f2fs_msg(sbi->sb, KERN_ERR, "Project quota feature not enabled. "
> -			 "Cannot enable project quota enforcement.");
> +		f2fs_err(sbi->sb, "Project quota feature not enabled. Cannot enable project quota enforcement.");
>  		return -1;
>  	}
>  	if (F2FS_OPTION(sbi).s_qf_names[USRQUOTA] ||
> @@ -343,21 +338,18 @@ static int f2fs_check_quota_options(struct f2fs_sb_info *sbi)
>  
>  		if (test_opt(sbi, GRPQUOTA) || test_opt(sbi, USRQUOTA) ||
>  				test_opt(sbi, PRJQUOTA)) {
> -			f2fs_msg(sbi->sb, KERN_ERR, "old and new quota "
> -					"format mixing");
> +			f2fs_err(sbi->sb, "old and new quota format mixing");
>  			return -1;
>  		}
>  
>  		if (!F2FS_OPTION(sbi).s_jquota_fmt) {
> -			f2fs_msg(sbi->sb, KERN_ERR, "journaled quota format "
> -					"not specified");
> +			f2fs_err(sbi->sb, "journaled quota format not specified");
>  			return -1;
>  		}
>  	}
>  
>  	if (f2fs_sb_has_quota_ino(sbi) && F2FS_OPTION(sbi).s_jquota_fmt) {
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -			"QUOTA feature is enabled, so ignore jquota_fmt");
> +		f2fs_info(sbi->sb, "QUOTA feature is enabled, so ignore jquota_fmt");
>  		F2FS_OPTION(sbi).s_jquota_fmt = 0;
>  	}
>  	return 0;
> @@ -425,8 +417,7 @@ static int parse_options(struct super_block *sb, char *options)
>  			break;
>  		case Opt_nodiscard:
>  			if (f2fs_sb_has_blkzoned(sbi)) {
> -				f2fs_msg(sb, KERN_WARNING,
> -					"discard is required for zoned block devices");
> +				f2fs_warn(sb, "discard is required for zoned block devices");
>  				return -EINVAL;
>  			}
>  			clear_opt(sbi, DISCARD);
> @@ -458,20 +449,16 @@ static int parse_options(struct super_block *sb, char *options)
>  			break;
>  #else
>  		case Opt_user_xattr:
> -			f2fs_msg(sb, KERN_INFO,
> -				"user_xattr options not supported");
> +			f2fs_info(sb, "user_xattr options not supported");
>  			break;
>  		case Opt_nouser_xattr:
> -			f2fs_msg(sb, KERN_INFO,
> -				"nouser_xattr options not supported");
> +			f2fs_info(sb, "nouser_xattr options not supported");
>  			break;
>  		case Opt_inline_xattr:
> -			f2fs_msg(sb, KERN_INFO,
> -				"inline_xattr options not supported");
> +			f2fs_info(sb, "inline_xattr options not supported");
>  			break;
>  		case Opt_noinline_xattr:
> -			f2fs_msg(sb, KERN_INFO,
> -				"noinline_xattr options not supported");
> +			f2fs_info(sb, "noinline_xattr options not supported");
>  			break;
>  #endif
>  #ifdef CONFIG_F2FS_FS_POSIX_ACL
> @@ -483,10 +470,10 @@ static int parse_options(struct super_block *sb, char *options)
>  			break;
>  #else
>  		case Opt_acl:
> -			f2fs_msg(sb, KERN_INFO, "acl options not supported");
> +			f2fs_info(sb, "acl options not supported");
>  			break;
>  		case Opt_noacl:
> -			f2fs_msg(sb, KERN_INFO, "noacl options not supported");
> +			f2fs_info(sb, "noacl options not supported");
>  			break;
>  #endif
>  		case Opt_active_logs:
> @@ -536,9 +523,8 @@ static int parse_options(struct super_block *sb, char *options)
>  			if (args->from && match_int(args, &arg))
>  				return -EINVAL;
>  			if (test_opt(sbi, RESERVE_ROOT)) {
> -				f2fs_msg(sb, KERN_INFO,
> -					"Preserve previous reserve_root=%u",
> -					F2FS_OPTION(sbi).root_reserved_blocks);
> +				f2fs_info(sb, "Preserve previous reserve_root=%u",
> +					  F2FS_OPTION(sbi).root_reserved_blocks);
>  			} else {
>  				F2FS_OPTION(sbi).root_reserved_blocks = arg;
>  				set_opt(sbi, RESERVE_ROOT);
> @@ -549,8 +535,7 @@ static int parse_options(struct super_block *sb, char *options)
>  				return -EINVAL;
>  			uid = make_kuid(current_user_ns(), arg);
>  			if (!uid_valid(uid)) {
> -				f2fs_msg(sb, KERN_ERR,
> -					"Invalid uid value %d", arg);
> +				f2fs_err(sb, "Invalid uid value %d", arg);
>  				return -EINVAL;
>  			}
>  			F2FS_OPTION(sbi).s_resuid = uid;
> @@ -560,8 +545,7 @@ static int parse_options(struct super_block *sb, char *options)
>  				return -EINVAL;
>  			gid = make_kgid(current_user_ns(), arg);
>  			if (!gid_valid(gid)) {
> -				f2fs_msg(sb, KERN_ERR,
> -					"Invalid gid value %d", arg);
> +				f2fs_err(sb, "Invalid gid value %d", arg);
>  				return -EINVAL;
>  			}
>  			F2FS_OPTION(sbi).s_resgid = gid;
> @@ -574,9 +558,7 @@ static int parse_options(struct super_block *sb, char *options)
>  			if (strlen(name) == 8 &&
>  					!strncmp(name, "adaptive", 8)) {
>  				if (f2fs_sb_has_blkzoned(sbi)) {
> -					f2fs_msg(sb, KERN_WARNING,
> -						 "adaptive mode is not allowed with "
> -						 "zoned block device feature");
> +					f2fs_warn(sb, "adaptive mode is not allowed with zoned block device feature");
>  					kvfree(name);
>  					return -EINVAL;
>  				}
> @@ -594,9 +576,8 @@ static int parse_options(struct super_block *sb, char *options)
>  			if (args->from && match_int(args, &arg))
>  				return -EINVAL;
>  			if (arg <= 0 || arg > __ilog2_u32(BIO_MAX_PAGES)) {
> -				f2fs_msg(sb, KERN_WARNING,
> -					"Not support %d, larger than %d",
> -					1 << arg, BIO_MAX_PAGES);
> +				f2fs_warn(sb, "Not support %d, larger than %d",
> +					  1 << arg, BIO_MAX_PAGES);
>  				return -EINVAL;
>  			}
>  			F2FS_OPTION(sbi).write_io_size_bits = arg;
> @@ -617,13 +598,11 @@ static int parse_options(struct super_block *sb, char *options)
>  			break;
>  #else
>  		case Opt_fault_injection:
> -			f2fs_msg(sb, KERN_INFO,
> -				"fault_injection options not supported");
> +			f2fs_info(sb, "fault_injection options not supported");
>  			break;
>  
>  		case Opt_fault_type:
> -			f2fs_msg(sb, KERN_INFO,
> -				"fault_type options not supported");
> +			f2fs_info(sb, "fault_type options not supported");
>  			break;
>  #endif
>  		case Opt_lazytime:
> @@ -703,8 +682,7 @@ static int parse_options(struct super_block *sb, char *options)
>  		case Opt_jqfmt_vfsv0:
>  		case Opt_jqfmt_vfsv1:
>  		case Opt_noquota:
> -			f2fs_msg(sb, KERN_INFO,
> -					"quota operations not supported");
> +			f2fs_info(sb, "quota operations not supported");
>  			break;
>  #endif
>  		case Opt_whint:
> @@ -766,16 +744,14 @@ static int parse_options(struct super_block *sb, char *options)
>  		case Opt_test_dummy_encryption:
>  #ifdef CONFIG_FS_ENCRYPTION
>  			if (!f2fs_sb_has_encrypt(sbi)) {
> -				f2fs_msg(sb, KERN_ERR, "Encrypt feature is off");
> +				f2fs_err(sb, "Encrypt feature is off");
>  				return -EINVAL;
>  			}
>  
>  			F2FS_OPTION(sbi).test_dummy_encryption = true;
> -			f2fs_msg(sb, KERN_INFO,
> -					"Test dummy encryption mode enabled");
> +			f2fs_info(sb, "Test dummy encryption mode enabled");
>  #else
> -			f2fs_msg(sb, KERN_INFO,
> -					"Test dummy encryption mount option ignored");
> +			f2fs_info(sb, "Test dummy encryption mount option ignored");
>  #endif
>  			break;
>  		case Opt_checkpoint_disable_cap_perc:
> @@ -804,9 +780,8 @@ static int parse_options(struct super_block *sb, char *options)
>  			clear_opt(sbi, DISABLE_CHECKPOINT);
>  			break;
>  		default:
> -			f2fs_msg(sb, KERN_ERR,
> -				"Unrecognized mount option \"%s\" or missing value",
> -				p);
> +			f2fs_err(sb, "Unrecognized mount option \"%s\" or missing value",
> +				 p);
>  			return -EINVAL;
>  		}
>  	}
> @@ -815,23 +790,18 @@ static int parse_options(struct super_block *sb, char *options)
>  		return -EINVAL;
>  #else
>  	if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sbi->sb)) {
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -			 "Filesystem with quota feature cannot be mounted RDWR "
> -			 "without CONFIG_QUOTA");
> +		f2fs_info(sbi->sb, "Filesystem with quota feature cannot be mounted RDWR without CONFIG_QUOTA");
>  		return -EINVAL;
>  	}
>  	if (f2fs_sb_has_project_quota(sbi) && !f2fs_readonly(sbi->sb)) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"Filesystem with project quota feature cannot be "
> -			"mounted RDWR without CONFIG_QUOTA");
> +		f2fs_err(sb, "Filesystem with project quota feature cannot be mounted RDWR without CONFIG_QUOTA");
>  		return -EINVAL;
>  	}
>  #endif
>  
>  	if (F2FS_IO_SIZE_BITS(sbi) && !test_opt(sbi, LFS)) {
> -		f2fs_msg(sb, KERN_ERR,
> -				"Should set mode=lfs with %uKB-sized IO",
> -				F2FS_IO_SIZE_KB(sbi));
> +		f2fs_err(sb, "Should set mode=lfs with %uKB-sized IO",
> +			 F2FS_IO_SIZE_KB(sbi));
>  		return -EINVAL;
>  	}
>  
> @@ -840,15 +810,11 @@ static int parse_options(struct super_block *sb, char *options)
>  
>  		if (!f2fs_sb_has_extra_attr(sbi) ||
>  			!f2fs_sb_has_flexible_inline_xattr(sbi)) {
> -			f2fs_msg(sb, KERN_ERR,
> -					"extra_attr or flexible_inline_xattr "
> -					"feature is off");
> +			f2fs_err(sb, "extra_attr or flexible_inline_xattr feature is off");
>  			return -EINVAL;
>  		}
>  		if (!test_opt(sbi, INLINE_XATTR)) {
> -			f2fs_msg(sb, KERN_ERR,
> -					"inline_xattr_size option should be "
> -					"set with inline_xattr option");
> +			f2fs_err(sb, "inline_xattr_size option should be set with inline_xattr option");
>  			return -EINVAL;
>  		}
>  
> @@ -857,16 +823,14 @@ static int parse_options(struct super_block *sb, char *options)
>  
>  		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
>  				F2FS_OPTION(sbi).inline_xattr_size > max_size) {
> -			f2fs_msg(sb, KERN_ERR,
> -				"inline xattr size is out of range: %d ~ %d",
> -				min_size, max_size);
> +			f2fs_err(sb, "inline xattr size is out of range: %d ~ %d",
> +				 min_size, max_size);
>  			return -EINVAL;
>  		}
>  	}
>  
>  	if (test_opt(sbi, DISABLE_CHECKPOINT) && test_opt(sbi, LFS)) {
> -		f2fs_msg(sb, KERN_ERR,
> -				"LFS not compatible with checkpoint=disable\n");
> +		f2fs_err(sb, "LFS not compatible with checkpoint=disable\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1488,8 +1452,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  	block_t unusable;
>  
>  	if (s_flags & SB_RDONLY) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -				"checkpoint=disable on readonly fs");
> +		f2fs_err(sbi->sb, "checkpoint=disable on readonly fs");
>  		return -EINVAL;
>  	}
>  	sbi->sb->s_flags |= SB_ACTIVE;
> @@ -1592,8 +1555,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	/* recover superblocks we couldn't write due to previous RO mount */
>  	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
>  		err = f2fs_commit_super(sbi, false);
> -		f2fs_msg(sb, KERN_INFO,
> -			"Try to recover all the superblocks, ret: %d", err);
> +		f2fs_info(sb, "Try to recover all the superblocks, ret: %d",
> +			  err);
>  		if (!err)
>  			clear_sbi_flag(sbi, SBI_NEED_SB_WRITE);
>  	}
> @@ -1634,15 +1597,13 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	/* disallow enable/disable extent_cache dynamically */
>  	if (no_extent_cache == !!test_opt(sbi, EXTENT_CACHE)) {
>  		err = -EINVAL;
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -				"switch extent_cache option is not allowed");
> +		f2fs_warn(sbi->sb, "switch extent_cache option is not allowed");
>  		goto restore_opts;
>  	}
>  
>  	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
>  		err = -EINVAL;
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"disabling checkpoint not compatible with read-only");
> +		f2fs_warn(sbi->sb, "disabling checkpoint not compatible with read-only");
>  		goto restore_opts;
>  	}
>  
> @@ -1712,8 +1673,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  restore_gc:
>  	if (need_restart_gc) {
>  		if (f2fs_start_gc_thread(sbi))
> -			f2fs_msg(sbi->sb, KERN_WARNING,
> -				"background gc thread has stopped");
> +			f2fs_warn(sbi->sb, "background gc thread has stopped");
>  	} else if (need_stop_gc) {
>  		f2fs_stop_gc_thread(sbi);
>  	}
> @@ -1852,8 +1812,7 @@ static qsize_t *f2fs_get_reserved_space(struct inode *inode)
>  static int f2fs_quota_on_mount(struct f2fs_sb_info *sbi, int type)
>  {
>  	if (is_set_ckpt_flags(sbi, CP_QUOTA_NEED_FSCK_FLAG)) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"quota sysfile may be corrupted, skip loading it");
> +		f2fs_err(sbi->sb, "quota sysfile may be corrupted, skip loading it");
>  		return 0;
>  	}
>  
> @@ -1869,8 +1828,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly)
>  	if (f2fs_sb_has_quota_ino(sbi) && rdonly) {
>  		err = f2fs_enable_quotas(sbi->sb);
>  		if (err) {
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -					"Cannot turn on quota_ino: %d", err);
> +			f2fs_err(sbi->sb, "Cannot turn on quota_ino: %d", err);
>  			return 0;
>  		}
>  		return 1;
> @@ -1883,8 +1841,8 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly)
>  				enabled = 1;
>  				continue;
>  			}
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -				"Cannot turn on quotas: %d on %d", err, i);
> +			f2fs_err(sbi->sb, "Cannot turn on quotas: %d on %d",
> +				 err, i);
>  		}
>  	}
>  	return enabled;
> @@ -1905,8 +1863,7 @@ static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
>  
>  	qf_inode = f2fs_iget(sb, qf_inum);
>  	if (IS_ERR(qf_inode)) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"Bad quota inode %u:%lu", type, qf_inum);
> +		f2fs_err(sb, "Bad quota inode %u:%lu", type, qf_inum);
>  		return PTR_ERR(qf_inode);
>  	}
>  
> @@ -1928,8 +1885,7 @@ static int f2fs_enable_quotas(struct super_block *sb)
>  	};
>  
>  	if (is_set_ckpt_flags(F2FS_SB(sb), CP_QUOTA_NEED_FSCK_FLAG)) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"quota file may be corrupted, skip loading it");
> +		f2fs_err(sb, "quota file may be corrupted, skip loading it");
>  		return 0;
>  	}
>  
> @@ -1942,10 +1898,8 @@ static int f2fs_enable_quotas(struct super_block *sb)
>  				DQUOT_USAGE_ENABLED |
>  				(quota_mopt[type] ? DQUOT_LIMITS_ENABLED : 0));
>  			if (err) {
> -				f2fs_msg(sb, KERN_ERR,
> -					"Failed to enable quota tracking "
> -					"(type=%d, err=%d). Please run "
> -					"fsck to fix.", type, err);
> +				f2fs_err(sb, "Failed to enable quota tracking (type=%d, err=%d). Please run fsck to fix.",
> +					 type, err);
>  				for (type--; type >= 0; type--)
>  					dquot_quota_off(sb, type);
>  				set_sbi_flag(F2FS_SB(sb),
> @@ -2067,10 +2021,8 @@ void f2fs_quota_off_umount(struct super_block *sb)
>  		if (err) {
>  			int ret = dquot_quota_off(sb, type);
>  
> -			f2fs_msg(sb, KERN_ERR,
> -				"Fail to turn off disk quota "
> -				"(type: %d, err: %d, ret:%d), Please "
> -				"run fsck to fix it.", type, err, ret);
> +			f2fs_err(sb, "Fail to turn off disk quota (type: %d, err: %d, ret:%d), Please run fsck to fix it.",
> +				 type, err, ret);
>  			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
>  		}
>  	}
> @@ -2376,55 +2328,49 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
>  				(segment_count << log_blocks_per_seg);
>  
>  	if (segment0_blkaddr != cp_blkaddr) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Mismatch start address, segment0(%u) cp_blkaddr(%u)",
> -			segment0_blkaddr, cp_blkaddr);
> +		f2fs_info(sb, "Mismatch start address, segment0(%u) cp_blkaddr(%u)",
> +			  segment0_blkaddr, cp_blkaddr);
>  		return true;
>  	}
>  
>  	if (cp_blkaddr + (segment_count_ckpt << log_blocks_per_seg) !=
>  							sit_blkaddr) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Wrong CP boundary, start(%u) end(%u) blocks(%u)",
> -			cp_blkaddr, sit_blkaddr,
> -			segment_count_ckpt << log_blocks_per_seg);
> +		f2fs_info(sb, "Wrong CP boundary, start(%u) end(%u) blocks(%u)",
> +			  cp_blkaddr, sit_blkaddr,
> +			  segment_count_ckpt << log_blocks_per_seg);
>  		return true;
>  	}
>  
>  	if (sit_blkaddr + (segment_count_sit << log_blocks_per_seg) !=
>  							nat_blkaddr) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Wrong SIT boundary, start(%u) end(%u) blocks(%u)",
> -			sit_blkaddr, nat_blkaddr,
> -			segment_count_sit << log_blocks_per_seg);
> +		f2fs_info(sb, "Wrong SIT boundary, start(%u) end(%u) blocks(%u)",
> +			  sit_blkaddr, nat_blkaddr,
> +			  segment_count_sit << log_blocks_per_seg);
>  		return true;
>  	}
>  
>  	if (nat_blkaddr + (segment_count_nat << log_blocks_per_seg) !=
>  							ssa_blkaddr) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Wrong NAT boundary, start(%u) end(%u) blocks(%u)",
> -			nat_blkaddr, ssa_blkaddr,
> -			segment_count_nat << log_blocks_per_seg);
> +		f2fs_info(sb, "Wrong NAT boundary, start(%u) end(%u) blocks(%u)",
> +			  nat_blkaddr, ssa_blkaddr,
> +			  segment_count_nat << log_blocks_per_seg);
>  		return true;
>  	}
>  
>  	if (ssa_blkaddr + (segment_count_ssa << log_blocks_per_seg) !=
>  							main_blkaddr) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Wrong SSA boundary, start(%u) end(%u) blocks(%u)",
> -			ssa_blkaddr, main_blkaddr,
> -			segment_count_ssa << log_blocks_per_seg);
> +		f2fs_info(sb, "Wrong SSA boundary, start(%u) end(%u) blocks(%u)",
> +			  ssa_blkaddr, main_blkaddr,
> +			  segment_count_ssa << log_blocks_per_seg);
>  		return true;
>  	}
>  
>  	if (main_end_blkaddr > seg_end_blkaddr) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Wrong MAIN_AREA boundary, start(%u) end(%u) block(%u)",
> -			main_blkaddr,
> -			segment0_blkaddr +
> -				(segment_count << log_blocks_per_seg),
> -			segment_count_main << log_blocks_per_seg);
> +		f2fs_info(sb, "Wrong MAIN_AREA boundary, start(%u) end(%u) block(%u)",
> +			  main_blkaddr,
> +			  segment0_blkaddr +
> +			  (segment_count << log_blocks_per_seg),
> +			  segment_count_main << log_blocks_per_seg);
>  		return true;
>  	} else if (main_end_blkaddr < seg_end_blkaddr) {
>  		int err = 0;
> @@ -2441,12 +2387,11 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
>  			err = __f2fs_commit_super(bh, NULL);
>  			res = err ? "failed" : "done";
>  		}
> -		f2fs_msg(sb, KERN_INFO,
> -			"Fix alignment : %s, start(%u) end(%u) block(%u)",
> -			res, main_blkaddr,
> -			segment0_blkaddr +
> -				(segment_count << log_blocks_per_seg),
> -			segment_count_main << log_blocks_per_seg);
> +		f2fs_info(sb, "Fix alignment : %s, start(%u) end(%u) block(%u)",
> +			  res, main_blkaddr,
> +			  segment0_blkaddr +
> +			  (segment_count << log_blocks_per_seg),
> +			  segment_count_main << log_blocks_per_seg);
>  		if (err)
>  			return true;
>  	}
> @@ -2470,48 +2415,42 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  		crc_offset = le32_to_cpu(raw_super->checksum_offset);
>  		if (crc_offset !=
>  			offsetof(struct f2fs_super_block, crc)) {
> -			f2fs_msg(sb, KERN_INFO,
> -				"Invalid SB checksum offset: %zu",
> -				crc_offset);
> +			f2fs_info(sb, "Invalid SB checksum offset: %zu",
> +				  crc_offset);
>  			return 1;
>  		}
>  		crc = le32_to_cpu(raw_super->crc);
>  		if (!f2fs_crc_valid(sbi, crc, raw_super, crc_offset)) {
> -			f2fs_msg(sb, KERN_INFO,
> -				"Invalid SB checksum value: %u", crc);
> +			f2fs_info(sb, "Invalid SB checksum value: %u", crc);
>  			return 1;
>  		}
>  	}
>  
>  	if (F2FS_SUPER_MAGIC != le32_to_cpu(raw_super->magic)) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Magic Mismatch, valid(0x%x) - read(0x%x)",
> -			F2FS_SUPER_MAGIC, le32_to_cpu(raw_super->magic));
> +		f2fs_info(sb, "Magic Mismatch, valid(0x%x) - read(0x%x)",
> +			  F2FS_SUPER_MAGIC, le32_to_cpu(raw_super->magic));
>  		return 1;
>  	}
>  
>  	/* Currently, support only 4KB page cache size */
>  	if (F2FS_BLKSIZE != PAGE_SIZE) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Invalid page_cache_size (%lu), supports only 4KB",
> -			PAGE_SIZE);
> +		f2fs_info(sb, "Invalid page_cache_size (%lu), supports only 4KB",
> +			  PAGE_SIZE);
>  		return 1;
>  	}
>  
>  	/* Currently, support only 4KB block size */
>  	blocksize = 1 << le32_to_cpu(raw_super->log_blocksize);
>  	if (blocksize != F2FS_BLKSIZE) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Invalid blocksize (%u), supports only 4KB",
> -			blocksize);
> +		f2fs_info(sb, "Invalid blocksize (%u), supports only 4KB",
> +			  blocksize);
>  		return 1;
>  	}
>  
>  	/* check log blocks per segment */
>  	if (le32_to_cpu(raw_super->log_blocks_per_seg) != 9) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Invalid log blocks per segment (%u)",
> -			le32_to_cpu(raw_super->log_blocks_per_seg));
> +		f2fs_info(sb, "Invalid log blocks per segment (%u)",
> +			  le32_to_cpu(raw_super->log_blocks_per_seg));
>  		return 1;
>  	}
>  
> @@ -2520,17 +2459,16 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  				F2FS_MAX_LOG_SECTOR_SIZE ||
>  		le32_to_cpu(raw_super->log_sectorsize) <
>  				F2FS_MIN_LOG_SECTOR_SIZE) {
> -		f2fs_msg(sb, KERN_INFO, "Invalid log sectorsize (%u)",
> -			le32_to_cpu(raw_super->log_sectorsize));
> +		f2fs_info(sb, "Invalid log sectorsize (%u)",
> +			  le32_to_cpu(raw_super->log_sectorsize));
>  		return 1;
>  	}
>  	if (le32_to_cpu(raw_super->log_sectors_per_block) +
>  		le32_to_cpu(raw_super->log_sectorsize) !=
>  			F2FS_MAX_LOG_SECTOR_SIZE) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Invalid log sectors per block(%u) log sectorsize(%u)",
> -			le32_to_cpu(raw_super->log_sectors_per_block),
> -			le32_to_cpu(raw_super->log_sectorsize));
> +		f2fs_info(sb, "Invalid log sectors per block(%u) log sectorsize(%u)",
> +			  le32_to_cpu(raw_super->log_sectors_per_block),
> +			  le32_to_cpu(raw_super->log_sectorsize));
>  		return 1;
>  	}
>  
> @@ -2544,59 +2482,51 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  
>  	if (segment_count > F2FS_MAX_SEGMENT ||
>  				segment_count < F2FS_MIN_SEGMENTS) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Invalid segment count (%u)",
> -			segment_count);
> +		f2fs_info(sb, "Invalid segment count (%u)", segment_count);
>  		return 1;
>  	}
>  
>  	if (total_sections > segment_count ||
>  			total_sections < F2FS_MIN_SEGMENTS ||
>  			segs_per_sec > segment_count || !segs_per_sec) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Invalid segment/section count (%u, %u x %u)",
> -			segment_count, total_sections, segs_per_sec);
> +		f2fs_info(sb, "Invalid segment/section count (%u, %u x %u)",
> +			  segment_count, total_sections, segs_per_sec);
>  		return 1;
>  	}
>  
>  	if ((segment_count / segs_per_sec) < total_sections) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Small segment_count (%u < %u * %u)",
> -			segment_count, segs_per_sec, total_sections);
> +		f2fs_info(sb, "Small segment_count (%u < %u * %u)",
> +			  segment_count, segs_per_sec, total_sections);
>  		return 1;
>  	}
>  
>  	if (segment_count > (le64_to_cpu(raw_super->block_count) >> 9)) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Wrong segment_count / block_count (%u > %llu)",
> -			segment_count, le64_to_cpu(raw_super->block_count));
> +		f2fs_info(sb, "Wrong segment_count / block_count (%u > %llu)",
> +			  segment_count, le64_to_cpu(raw_super->block_count));
>  		return 1;
>  	}
>  
>  	if (secs_per_zone > total_sections || !secs_per_zone) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Wrong secs_per_zone / total_sections (%u, %u)",
> -			secs_per_zone, total_sections);
> +		f2fs_info(sb, "Wrong secs_per_zone / total_sections (%u, %u)",
> +			  secs_per_zone, total_sections);
>  		return 1;
>  	}
>  	if (le32_to_cpu(raw_super->extension_count) > F2FS_MAX_EXTENSION ||
>  			raw_super->hot_ext_count > F2FS_MAX_EXTENSION ||
>  			(le32_to_cpu(raw_super->extension_count) +
>  			raw_super->hot_ext_count) > F2FS_MAX_EXTENSION) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Corrupted extension count (%u + %u > %u)",
> -			le32_to_cpu(raw_super->extension_count),
> -			raw_super->hot_ext_count,
> -			F2FS_MAX_EXTENSION);
> +		f2fs_info(sb, "Corrupted extension count (%u + %u > %u)",
> +			  le32_to_cpu(raw_super->extension_count),
> +			  raw_super->hot_ext_count,
> +			  F2FS_MAX_EXTENSION);
>  		return 1;
>  	}
>  
>  	if (le32_to_cpu(raw_super->cp_payload) >
>  				(blocks_per_seg - F2FS_CP_PACKS)) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Insane cp_payload (%u > %u)",
> -			le32_to_cpu(raw_super->cp_payload),
> -			blocks_per_seg - F2FS_CP_PACKS);
> +		f2fs_info(sb, "Insane cp_payload (%u > %u)",
> +			  le32_to_cpu(raw_super->cp_payload),
> +			  blocks_per_seg - F2FS_CP_PACKS);
>  		return 1;
>  	}
>  
> @@ -2604,11 +2534,10 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  	if (le32_to_cpu(raw_super->node_ino) != 1 ||
>  		le32_to_cpu(raw_super->meta_ino) != 2 ||
>  		le32_to_cpu(raw_super->root_ino) != 3) {
> -		f2fs_msg(sb, KERN_INFO,
> -			"Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
> -			le32_to_cpu(raw_super->node_ino),
> -			le32_to_cpu(raw_super->meta_ino),
> -			le32_to_cpu(raw_super->root_ino));
> +		f2fs_info(sb, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
> +			  le32_to_cpu(raw_super->node_ino),
> +			  le32_to_cpu(raw_super->meta_ino),
> +			  le32_to_cpu(raw_super->root_ino));
>  		return 1;
>  	}
>  
> @@ -2652,8 +2581,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  
>  	if (unlikely(fsmeta < F2FS_MIN_SEGMENTS ||
>  			ovp_segments == 0 || reserved_segments == 0)) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"Wrong layout: check mkfs.f2fs version");
> +		f2fs_err(sbi->sb, "Wrong layout: check mkfs.f2fs version");
>  		return 1;
>  	}
>  
> @@ -2662,16 +2590,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
>  	if (!user_block_count || user_block_count >=
>  			segment_count_main << log_blocks_per_seg) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"Wrong user_block_count: %u", user_block_count);
> +		f2fs_err(sbi->sb, "Wrong user_block_count: %u",
> +			 user_block_count);
>  		return 1;
>  	}
>  
>  	valid_user_blocks = le64_to_cpu(ckpt->valid_block_count);
>  	if (valid_user_blocks > user_block_count) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"Wrong valid_user_blocks: %u, user_block_count: %u",
> -			valid_user_blocks, user_block_count);
> +		f2fs_err(sbi->sb, "Wrong valid_user_blocks: %u, user_block_count: %u",
> +			 valid_user_blocks, user_block_count);
>  		return 1;
>  	}
>  
> @@ -2679,9 +2606,8 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	avail_node_count = sbi->total_node_count - sbi->nquota_files -
>  						F2FS_RESERVED_NODE_NUM;
>  	if (valid_node_count > avail_node_count) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"Wrong valid_node_count: %u, avail_node_count: %u",
> -			valid_node_count, avail_node_count);
> +		f2fs_err(sbi->sb, "Wrong valid_node_count: %u, avail_node_count: %u",
> +			 valid_node_count, avail_node_count);
>  		return 1;
>  	}
>  
> @@ -2695,10 +2621,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  		for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
>  			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
>  				le32_to_cpu(ckpt->cur_node_segno[j])) {
> -				f2fs_msg(sbi->sb, KERN_ERR,
> -					"Node segment (%u, %u) has the same "
> -					"segno: %u", i, j,
> -					le32_to_cpu(ckpt->cur_node_segno[i]));
> +				f2fs_err(sbi->sb, "Node segment (%u, %u) has the same segno: %u",
> +					 i, j,
> +					 le32_to_cpu(ckpt->cur_node_segno[i]));
>  				return 1;
>  			}
>  		}
> @@ -2710,10 +2635,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  		for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
>  			if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
>  				le32_to_cpu(ckpt->cur_data_segno[j])) {
> -				f2fs_msg(sbi->sb, KERN_ERR,
> -					"Data segment (%u, %u) has the same "
> -					"segno: %u", i, j,
> -					le32_to_cpu(ckpt->cur_data_segno[i]));
> +				f2fs_err(sbi->sb, "Data segment (%u, %u) has the same segno: %u",
> +					 i, j,
> +					 le32_to_cpu(ckpt->cur_data_segno[i]));
>  				return 1;
>  			}
>  		}
> @@ -2722,10 +2646,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  		for (j = i; j < NR_CURSEG_DATA_TYPE; j++) {
>  			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
>  				le32_to_cpu(ckpt->cur_data_segno[j])) {
> -				f2fs_msg(sbi->sb, KERN_ERR,
> -					"Data segment (%u) and Data segment (%u)"
> -					" has the same segno: %u", i, j,
> -					le32_to_cpu(ckpt->cur_node_segno[i]));
> +				f2fs_err(sbi->sb, "Data segment (%u) and Data segment (%u) has the same segno: %u",
> +					 i, j,
> +					 le32_to_cpu(ckpt->cur_node_segno[i]));
>  				return 1;
>  			}
>  		}
> @@ -2736,9 +2659,8 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  
>  	if (sit_bitmap_size != ((sit_segs / 2) << log_blocks_per_seg) / 8 ||
>  		nat_bitmap_size != ((nat_segs / 2) << log_blocks_per_seg) / 8) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"Wrong bitmap size: sit: %u, nat:%u",
> -			sit_bitmap_size, nat_bitmap_size);
> +		f2fs_err(sbi->sb, "Wrong bitmap size: sit: %u, nat:%u",
> +			 sit_bitmap_size, nat_bitmap_size);
>  		return 1;
>  	}
>  
> @@ -2747,23 +2669,20 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	if (cp_pack_start_sum < cp_payload + 1 ||
>  		cp_pack_start_sum > blocks_per_seg - 1 -
>  			NR_CURSEG_TYPE) {
> -		f2fs_msg(sbi->sb, KERN_ERR,
> -			"Wrong cp_pack_start_sum: %u",
> -			cp_pack_start_sum);
> +		f2fs_err(sbi->sb, "Wrong cp_pack_start_sum: %u",
> +			 cp_pack_start_sum);
>  		return 1;
>  	}
>  
>  	if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG) &&
>  		le32_to_cpu(ckpt->checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
> -		f2fs_msg(sbi->sb, KERN_WARNING,
> -			"layout of large_nat_bitmap is deprecated, "
> -			"run fsck to repair, chksum_offset: %u",
> -			le32_to_cpu(ckpt->checksum_offset));
> +		f2fs_warn(sbi->sb, "layout of large_nat_bitmap is deprecated, run fsck to repair, chksum_offset: %u",
> +			  le32_to_cpu(ckpt->checksum_offset));
>  		return 1;
>  	}
>  
>  	if (unlikely(f2fs_cp_error(sbi))) {
> -		f2fs_msg(sbi->sb, KERN_ERR, "A bug case: need to run fsck");
> +		f2fs_err(sbi->sb, "A bug case: need to run fsck");
>  		return 1;
>  	}
>  	return 0;
> @@ -2932,17 +2851,16 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
>  	for (block = 0; block < 2; block++) {
>  		bh = sb_bread(sb, block);
>  		if (!bh) {
> -			f2fs_msg(sb, KERN_ERR, "Unable to read %dth superblock",
> -				block + 1);
> +			f2fs_err(sb, "Unable to read %dth superblock",
> +				 block + 1);
>  			err = -EIO;
>  			continue;
>  		}
>  
>  		/* sanity checking of raw super */
>  		if (sanity_check_raw_super(sbi, bh)) {
> -			f2fs_msg(sb, KERN_ERR,
> -				"Can't find valid F2FS filesystem in %dth superblock",
> -				block + 1);
> +			f2fs_err(sb, "Can't find valid F2FS filesystem in %dth superblock",
> +				 block + 1);
>  			err = -EINVAL;
>  			brelse(bh);
>  			continue;
> @@ -3072,36 +2990,32 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  #ifdef CONFIG_BLK_DEV_ZONED
>  		if (bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HM &&
>  				!f2fs_sb_has_blkzoned(sbi)) {
> -			f2fs_msg(sbi->sb, KERN_ERR,
> -				"Zoned block device feature not enabled\n");
> +			f2fs_err(sbi->sb, "Zoned block device feature not enabled\n");
>  			return -EINVAL;
>  		}
>  		if (bdev_zoned_model(FDEV(i).bdev) != BLK_ZONED_NONE) {
>  			if (init_blkz_info(sbi, i)) {
> -				f2fs_msg(sbi->sb, KERN_ERR,
> -					"Failed to initialize F2FS blkzone information");
> +				f2fs_err(sbi->sb, "Failed to initialize F2FS blkzone information");
>  				return -EINVAL;
>  			}
>  			if (max_devices == 1)
>  				break;
> -			f2fs_msg(sbi->sb, KERN_INFO,
> -				"Mount Device [%2d]: %20s, %8u, %8x - %8x (zone: %s)",
> -				i, FDEV(i).path,
> -				FDEV(i).total_segments,
> -				FDEV(i).start_blk, FDEV(i).end_blk,
> -				bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HA ?
> -				"Host-aware" : "Host-managed");
> +			f2fs_info(sbi->sb, "Mount Device [%2d]: %20s, %8u, %8x - %8x (zone: %s)",
> +				  i, FDEV(i).path,
> +				  FDEV(i).total_segments,
> +				  FDEV(i).start_blk, FDEV(i).end_blk,
> +				  bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HA ?
> +				  "Host-aware" : "Host-managed");
>  			continue;
>  		}
>  #endif
> -		f2fs_msg(sbi->sb, KERN_INFO,
> -			"Mount Device [%2d]: %20s, %8u, %8x - %8x",
> -				i, FDEV(i).path,
> -				FDEV(i).total_segments,
> -				FDEV(i).start_blk, FDEV(i).end_blk);
> -	}
> -	f2fs_msg(sbi->sb, KERN_INFO,
> -			"IO Block Size: %8d KB", F2FS_IO_SIZE_KB(sbi));
> +		f2fs_info(sbi->sb, "Mount Device [%2d]: %20s, %8u, %8x - %8x",
> +			  i, FDEV(i).path,
> +			  FDEV(i).total_segments,
> +			  FDEV(i).start_blk, FDEV(i).end_blk);
> +	}
> +	f2fs_info(sbi->sb,
> +		  "IO Block Size: %8d KB", F2FS_IO_SIZE_KB(sbi));
>  	return 0;
>  }
>  
> @@ -3147,7 +3061,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* Load the checksum driver */
>  	sbi->s_chksum_driver = crypto_alloc_shash("crc32", 0, 0);
>  	if (IS_ERR(sbi->s_chksum_driver)) {
> -		f2fs_msg(sb, KERN_ERR, "Cannot load crc32 driver.");
> +		f2fs_err(sb, "Cannot load crc32 driver.");
>  		err = PTR_ERR(sbi->s_chksum_driver);
>  		sbi->s_chksum_driver = NULL;
>  		goto free_sbi;
> @@ -3155,7 +3069,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  	/* set a block size */
>  	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
> -		f2fs_msg(sb, KERN_ERR, "unable to set blocksize");
> +		f2fs_err(sb, "unable to set blocksize");
>  		goto free_sbi;
>  	}
>  
> @@ -3179,8 +3093,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	 */
>  #ifndef CONFIG_BLK_DEV_ZONED
>  	if (f2fs_sb_has_blkzoned(sbi)) {
> -		f2fs_msg(sb, KERN_ERR,
> -			 "Zoned block device support is not enabled");
> +		f2fs_err(sb, "Zoned block device support is not enabled");
>  		err = -EOPNOTSUPP;
>  		goto free_sb_buf;
>  	}
> @@ -3288,14 +3201,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* get an inode for meta space */
>  	sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
>  	if (IS_ERR(sbi->meta_inode)) {
> -		f2fs_msg(sb, KERN_ERR, "Failed to read F2FS meta data inode");
> +		f2fs_err(sb, "Failed to read F2FS meta data inode");
>  		err = PTR_ERR(sbi->meta_inode);
>  		goto free_io_dummy;
>  	}
>  
>  	err = f2fs_get_valid_checkpoint(sbi);
>  	if (err) {
> -		f2fs_msg(sb, KERN_ERR, "Failed to get valid F2FS checkpoint");
> +		f2fs_err(sb, "Failed to get valid F2FS checkpoint");
>  		goto free_meta_inode;
>  	}
>  
> @@ -3309,7 +3222,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* Initialize device list */
>  	err = f2fs_scan_devices(sbi);
>  	if (err) {
> -		f2fs_msg(sb, KERN_ERR, "Failed to find devices");
> +		f2fs_err(sb, "Failed to find devices");
>  		goto free_devices;
>  	}
>  
> @@ -3340,14 +3253,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* setup f2fs internal modules */
>  	err = f2fs_build_segment_manager(sbi);
>  	if (err) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"Failed to initialize F2FS segment manager (%d)", err);
> +		f2fs_err(sb, "Failed to initialize F2FS segment manager (%d)",
> +			 err);
>  		goto free_sm;
>  	}
>  	err = f2fs_build_node_manager(sbi);
>  	if (err) {
> -		f2fs_msg(sb, KERN_ERR,
> -			"Failed to initialize F2FS node manager (%d)", err);
> +		f2fs_err(sb, "Failed to initialize F2FS node manager (%d)",
> +			 err);
>  		goto free_nm;
>  	}
>  
> @@ -3372,7 +3285,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* get an inode for node space */
>  	sbi->node_inode = f2fs_iget(sb, F2FS_NODE_INO(sbi));
>  	if (IS_ERR(sbi->node_inode)) {
> -		f2fs_msg(sb, KERN_ERR, "Failed to read node inode");
> +		f2fs_err(sb, "Failed to read node inode");
>  		err = PTR_ERR(sbi->node_inode);
>  		goto free_stats;
>  	}
> @@ -3380,7 +3293,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* read root inode and dentry */
>  	root = f2fs_iget(sb, F2FS_ROOT_INO(sbi));
>  	if (IS_ERR(root)) {
> -		f2fs_msg(sb, KERN_ERR, "Failed to read root inode");
> +		f2fs_err(sb, "Failed to read root inode");
>  		err = PTR_ERR(root);
>  		goto free_node_inode;
>  	}
> @@ -3406,8 +3319,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sb)) {
>  		err = f2fs_enable_quotas(sb);
>  		if (err)
> -			f2fs_msg(sb, KERN_ERR,
> -				"Cannot turn on quotas: error %d", err);
> +			f2fs_err(sb, "Cannot turn on quotas: error %d", err);
>  	}
>  #endif
>  	/* if there are nt orphan nodes free them */
> @@ -3427,13 +3339,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		if (f2fs_hw_is_readonly(sbi)) {
>  			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
>  				err = -EROFS;
> -				f2fs_msg(sb, KERN_ERR,
> -					"Need to recover fsync data, but "
> -					"write access unavailable");
> +				f2fs_err(sb, "Need to recover fsync data, but write access unavailable");
>  				goto free_meta;
>  			}
> -			f2fs_msg(sbi->sb, KERN_INFO, "write access "
> -				"unavailable, skipping recovery");
> +			f2fs_info(sbi->sb, "write access unavailable, skipping recovery");
>  			goto reset_checkpoint;
>  		}
>  
> @@ -3448,8 +3357,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  			if (err != -ENOMEM)
>  				skip_recovery = true;
>  			need_fsck = true;
> -			f2fs_msg(sb, KERN_ERR,
> -				"Cannot recover all fsync data errno=%d", err);
> +			f2fs_err(sb, "Cannot recover all fsync data errno=%d",
> +				 err);
>  			goto free_meta;
>  		}
>  	} else {
> @@ -3457,8 +3366,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  		if (!f2fs_readonly(sb) && err > 0) {
>  			err = -EINVAL;
> -			f2fs_msg(sb, KERN_ERR,
> -				"Need to recover fsync data");
> +			f2fs_err(sb, "Need to recover fsync data");
>  			goto free_meta;
>  		}
>  	}
> @@ -3489,17 +3397,16 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	/* recover broken superblock */
>  	if (recovery) {
>  		err = f2fs_commit_super(sbi, true);
> -		f2fs_msg(sb, KERN_INFO,
> -			"Try to recover %dth superblock, ret: %d",
> -			sbi->valid_super_block ? 1 : 2, err);
> +		f2fs_info(sb, "Try to recover %dth superblock, ret: %d",
> +			  sbi->valid_super_block ? 1 : 2, err);
>  	}
>  
>  	f2fs_join_shrinker(sbi);
>  
>  	f2fs_tuning_parameters(sbi);
>  
> -	f2fs_msg(sbi->sb, KERN_NOTICE, "Mounted with checkpoint version = %llx",
> -				cur_cp_version(F2FS_CKPT(sbi)));
> +	f2fs_notice(sbi->sb, "Mounted with checkpoint version = %llx",
> +		    cur_cp_version(F2FS_CKPT(sbi)));
>  	f2fs_update_time(sbi, CP_TIME);
>  	f2fs_update_time(sbi, REQ_TIME);
>  	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
