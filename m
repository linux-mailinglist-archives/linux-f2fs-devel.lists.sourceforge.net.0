Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C53391985
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 16:06:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lluB4-0003Qz-Id; Wed, 26 May 2021 14:06:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lluB3-0003Qs-JS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 14:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LeF1XDYbMY4Q/WrDYjQWJNee/wCG8+HKS0MHyFRVuSA=; b=YPom1FMuyNxliXhp8FcGC3G1N3
 yTnOksRpHtU2+OkMlu6gcYkJ1iRq+UxOB1mOosCj7C6pXKwt/DGbqYzYM8RkNMM9aIyV6eB/s2TZv
 kNONept6qxLQItHRftU3evsGSx6/HVW5rg1SN5reuM7O9cKyo5bp+JqLSkab9nn3h6rY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LeF1XDYbMY4Q/WrDYjQWJNee/wCG8+HKS0MHyFRVuSA=; b=HgqT/dA4Spma2/kO/DbcHWWezN
 LihNrR5M09Ld+/SfPunDjBstyOQ6lGcTjvl2WbGhXUfo2ZhVxQlEnX5uKV9Tm5AmLJfAIld1ON3wp
 a4FVUO4F9Wzh/itsfI6WYhpIN1LgFrQA5Eh9E3KcIcFTJVbPO6P08TJCD+HXRNvJLejg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lluAz-0002SS-HP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 14:06:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3007A61260;
 Wed, 26 May 2021 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622037981;
 bh=e4Arr+6mU3sLUs6KQlLZe/rjB/6CCdPrwstpi4MOkAg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=pdVIjsRPNWjG1r8lqfpY3rctoWJ89GwlkhnDuifEyEXcEX9vQllDmaMAMFO//OJ1c
 KNJr379veMEvITN17eYdOIKfrvfR5+GCU87NWWEz0oXiNP9yQBao5HXpBwM0PLdMpb
 SPMMFUrZ3GdjryIc1sTdo3jCkPxasN1DF2nC0Vo2lu0f3KQYsrjzgRYXghIWgheDsy
 X01B3B4A+SLMJqX3zTobLZYixhrCdjUeMJZcWSMB5pFKbsvJIpZCdPCWkY79FFEU/n
 +bstF9yXRpw1cM+jnozvNAyqBsc5kLqUoQZ++WyV0Vlb9NjGN/g2V2+oUSW50RdwV0
 Gm6SwHq+rNO0A==
Date: Wed, 26 May 2021 07:06:19 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YK5V23HDYvrrXM00@google.com>
References: <20210521190217.2484099-1-jaegeuk@kernel.org>
 <20210521190217.2484099-2-jaegeuk@kernel.org>
 <YK5UOfzwdZni7c5W@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YK5UOfzwdZni7c5W@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lluAz-0002SS-HP
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: support RO feature
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/26, Jaegeuk Kim wrote:
> Given RO feature in superblock, we don't need to check provisioning/reserve
> spaces and SSA area.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/f2fs.h    |  2 ++
>  fs/f2fs/segment.c |  4 ++++
>  fs/f2fs/super.c   | 35 ++++++++++++++++++++++++++++++-----
>  3 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index eaf57b5f3c4b..9ad502f92529 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -168,6 +168,7 @@ struct f2fs_mount_info {
>  #define F2FS_FEATURE_SB_CHKSUM		0x0800
>  #define F2FS_FEATURE_CASEFOLD		0x1000
>  #define F2FS_FEATURE_COMPRESSION	0x2000
> +#define F2FS_FEATURE_RO			0x4000
>  
>  #define __F2FS_HAS_FEATURE(raw_super, mask)				\
>  	((raw_super->feature & cpu_to_le32(mask)) != 0)
> @@ -940,6 +941,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
>  #define	NR_CURSEG_DATA_TYPE	(3)
>  #define NR_CURSEG_NODE_TYPE	(3)
>  #define NR_CURSEG_INMEM_TYPE	(2)
> +#define NR_CURSEG_RO_TYPE	(2)
>  #define NR_CURSEG_PERSIST_TYPE	(NR_CURSEG_DATA_TYPE + NR_CURSEG_NODE_TYPE)
>  #define NR_CURSEG_TYPE		(NR_CURSEG_INMEM_TYPE + NR_CURSEG_PERSIST_TYPE)
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8668df7870d0..02e0c38be7eb 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4683,6 +4683,10 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  		struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
>  		unsigned int blkofs = curseg->next_blkoff;
>  
> +		if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) &&
> +			i != CURSEG_HOT_DATA && i != CURSEG_HOT_NODE)
> +			continue;
> +
>  		sanity_check_seg_type(sbi, curseg->seg_type);
>  
>  		if (f2fs_test_bit(blkofs, se->cur_valid_map))
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e70aca8f97bd..7769ed789b38 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1162,6 +1162,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  	 */
>  	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_TYPE)
>  		F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
> +
> +	if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) && !f2fs_readonly(sbi->sb)) {
> +		f2fs_info(sbi, "Allow to mount readonly mode only");
> +		err = -EINVAL;
> +		goto free_options;

Fixed:
       if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) && !f2fs_readonly(sbi->sb)) {
               f2fs_err(sbi, "Allow to mount readonly mode only");
               return EINVAL;
       }

> +	}
>  	return 0;
>  }
>  
> @@ -1819,7 +1825,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  static void default_options(struct f2fs_sb_info *sbi)
>  {
>  	/* init some FS parameters */
> -	F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
> +	if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO))
> +		F2FS_OPTION(sbi).active_logs = NR_CURSEG_RO_TYPE;
> +	else
> +		F2FS_OPTION(sbi).active_logs = NR_CURSEG_PERSIST_TYPE;
> +
>  	F2FS_OPTION(sbi).inline_xattr_size = DEFAULT_INLINE_XATTR_ADDRS;
>  	F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
>  	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
> @@ -2001,6 +2011,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
>  		goto skip;
>  
> +	if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) && !(*flags & SB_RDONLY)) {
> +		err = -EROFS;
> +		goto restore_opts;
> +	}
> +
>  #ifdef CONFIG_QUOTA
>  	if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
>  		err = dquot_suspend(sb, -1);
> @@ -3134,14 +3149,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	ovp_segments = le32_to_cpu(ckpt->overprov_segment_count);
>  	reserved_segments = le32_to_cpu(ckpt->rsvd_segment_count);
>  
> -	if (unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
> +	if (!F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) &&
> +			unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
>  			ovp_segments == 0 || reserved_segments == 0)) {
>  		f2fs_err(sbi, "Wrong layout: check mkfs.f2fs version");
>  		return 1;
>  	}
> -
>  	user_block_count = le64_to_cpu(ckpt->user_block_count);
> -	segment_count_main = le32_to_cpu(raw_super->segment_count_main);
> +	segment_count_main = le32_to_cpu(raw_super->segment_count_main) +
> +			F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO) ? 1 : 0;
>  	log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
>  	if (!user_block_count || user_block_count >=
>  			segment_count_main << log_blocks_per_seg) {
> @@ -3172,6 +3188,10 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  		if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
>  			le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
>  			return 1;
> +
> +		if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO))
> +			goto check_data;
> +
>  		for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
>  			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
>  				le32_to_cpu(ckpt->cur_node_segno[j])) {
> @@ -3182,10 +3202,15 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  			}
>  		}
>  	}
> +check_data:
>  	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
>  		if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
>  			le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
>  			return 1;
> +
> +		if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_RO))
> +			goto skip_cross;
> +
>  		for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
>  			if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
>  				le32_to_cpu(ckpt->cur_data_segno[j])) {
> @@ -3207,7 +3232,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  			}
>  		}
>  	}
> -
> +skip_cross:
>  	sit_bitmap_size = le32_to_cpu(ckpt->sit_ver_bitmap_bytesize);
>  	nat_bitmap_size = le32_to_cpu(ckpt->nat_ver_bitmap_bytesize);
>  
> -- 
> 2.32.0.rc0.204.g9fa02ecfa5-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
