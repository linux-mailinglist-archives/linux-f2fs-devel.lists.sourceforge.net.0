Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A61348586
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 00:50:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPDGR-0004d7-Go; Wed, 24 Mar 2021 23:50:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lPDGK-0004cn-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 23:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9qxTE8dMbHOZ+a4VPhistQpF4i8Xh+fqFIhrjdHJaHo=; b=gz7+7wPwfK2Xw9jttGBP5Rn6kK
 kePuEdNJ5vuLM0LzI1KzmwcGac3/SeFinzbpAHjcAJrDOhoXxtp9SPCssR9w72XCOesSkADdBR0xR
 z9CTsUvv3jjpcEI+SfzxojX3jOaXoQZsnORVbAhCy7aRMJTXVH7UCK4adlsLCLpgsq7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9qxTE8dMbHOZ+a4VPhistQpF4i8Xh+fqFIhrjdHJaHo=; b=XKlDVtGCBOqV2hUM9Rvxp6F7V2
 4AdL5hyolhHbxX2Ll9AexrLvqSw9H8YkfIbbW6H29JauTZPb05P2D/W0ULRbyT9m7uI+KEU74pfJA
 BI/Q+9T8mW17s6xrs5IzmU4A45PCgITmiAZUA+dp9kk8dxO0Yrkb35ueeNdv+/3RBqq4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPDG7-0006Rg-MO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 23:50:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41324619FE;
 Wed, 24 Mar 2021 23:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629789;
 bh=HAs0X9fe2pmLkFwHBxgmGC/MbFM09Ch0s0nXEufxLXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RYGKbltSBxpDhcQZRcIn8VHUszSBc/YMTEOSMJEdQKLee4Ts4rATyTPBDy7csaSqY
 R4/ck/Ep1I1Hp6uaaDFfdXLQJGtIuIDWk6BDVnh8bff6U6comuTpE2rpUfIdPQl5Xc
 Gykr4U2EuY1G/pKWpgxAXpGEVzTWXZbdxdoN27/Af8NydYngSaFs7ALrQGtTT15472
 q6AHzoOWEoTgVH+y7r0lK8vOC7cBwSarUsa6mDDnsw86rn6NIcYcOQHVEt1lG7RZ6q
 sTSZQ2qLt49O+KN0lA9/yVoga+ywnCVOZ6pRltU7mAllpEseKc1cxQUOitYMSGPM6D
 O2yHoTA6fzrvw==
Date: Wed, 24 Mar 2021 16:49:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YFvQGxLbpmDjxEzR@google.com>
References: <20210324031828.67133-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324031828.67133-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lPDG7-0006Rg-MO
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid touching checkpointed
 data in get_victim()
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

On 03/24, Chao Yu wrote:
> In CP disabling mode, there are two issues when using LFS or SSR | AT_SSR
> mode to select victim:
> 
> 1. LFS is set to find source section during GC, the victim should have
> no checkpointed data, since after GC, section could not be set free for
> reuse.
> 
> Previously, we only check valid chpt blocks in current segment rather
> than section, fix it.
> 
> 2. SSR | AT_SSR are set to find target segment for writes which can be
> fully filled by checkpointed and newly written blocks, we should never
> select such segment, otherwise it can cause panic or data corruption
> during allocation, potential case is described as below:
> 
>  a) target segment has 128 ckpt valid blocks
>  b) GC migrates 'n' (n < 512) valid blocks to other segment (segment is
>     still in dirty list)
>  c) GC migrates '512 - n' blocks to target segment (segment has 'n'
>     cp_vblocks and '512 - n' vblocks)
>  d) If GC selects target segment via {AT,}SSR allocator, however there
>     is no free space in targe segment.
> 
> Fixes: 4354994f097d ("f2fs: checkpoint disabling")
> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - fix to check checkpointed data in section rather than segment for
> LFS mode.
> - update commit title and message.
>  fs/f2fs/f2fs.h    |  1 +
>  fs/f2fs/gc.c      | 28 ++++++++++++++++++++--------
>  fs/f2fs/segment.c | 39 ++++++++++++++++++++++++---------------
>  fs/f2fs/segment.h | 14 +++++++++++++-
>  4 files changed, 58 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index eb154d9cb063..29e634d08a27 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3387,6 +3387,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
>  int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
>  void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
>  int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
>  void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
>  void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
>  void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index d96acc6531f2..4d9616373a4a 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -392,10 +392,6 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>  		if (p->gc_mode == GC_AT &&
>  			get_valid_blocks(sbi, segno, true) == 0)
>  			return;
> -
> -		if (p->alloc_mode == AT_SSR &&
> -			get_seg_entry(sbi, segno)->ckpt_valid_blocks == 0)
> -			return;
>  	}
>  
>  	for (i = 0; i < sbi->segs_per_sec; i++)
> @@ -728,11 +724,27 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  
>  		if (sec_usage_check(sbi, secno))
>  			goto next;
> +
>  		/* Don't touch checkpointed data */
> -		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
> -					get_ckpt_valid_blocks(sbi, segno) &&
> -					p.alloc_mode == LFS))
> -			goto next;
> +		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +			if (p.alloc_mode == LFS) {
> +				/*
> +				 * LFS is set to find source section during GC.
> +				 * The victim should have no checkpointed data.
> +				 */
> +				if (get_ckpt_valid_blocks(sbi, segno, true))
> +					goto next;
> +			} else {
> +				/*
> +				 * SSR | AT_SSR are set to find target segment
> +				 * for writes which can be full by checkpointed
> +				 * and newly written blocks.
> +				 */
> +				if (!segment_has_free_slot(sbi, segno))
> +					goto next;
> +			}
> +		}
> +
>  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>  			goto next;
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6e1a5f5657bf..f6a30856ceda 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -865,7 +865,7 @@ static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno)
>  	mutex_lock(&dirty_i->seglist_lock);
>  
>  	valid_blocks = get_valid_blocks(sbi, segno, false);
> -	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno);
> +	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno, false);
>  
>  	if (valid_blocks == 0 && (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) ||
>  		ckpt_valid_blocks == usable_blocks)) {
> @@ -950,7 +950,7 @@ static unsigned int get_free_segment(struct f2fs_sb_info *sbi)
>  	for_each_set_bit(segno, dirty_i->dirty_segmap[DIRTY], MAIN_SEGS(sbi)) {
>  		if (get_valid_blocks(sbi, segno, false))
>  			continue;
> -		if (get_ckpt_valid_blocks(sbi, segno))
> +		if (get_ckpt_valid_blocks(sbi, segno, false))
>  			continue;
>  		mutex_unlock(&dirty_i->seglist_lock);
>  		return segno;
> @@ -2643,6 +2643,26 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
>  		seg->next_blkoff++;
>  }
>  
> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
> +{
> +	struct sit_info *sit = SIT_I(sbi);
> +	struct seg_entry *se = get_seg_entry(sbi, segno);
> +	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
> +	unsigned long *target_map = SIT_I(sbi)->tmp_map;
> +	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
> +	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
> +	int i, pos;
> +
> +	down_write(&sit->sentry_lock);

Should remove this lock.
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev

> +	for (i = 0; i < entries; i++)
> +		target_map[i] = ckpt_map[i] | cur_map[i];
> +
> +	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, 0);
> +	up_write(&sit->sentry_lock);
> +
> +	return pos < sbi->blocks_per_seg;
> +}
> +
>  /*
>   * This function always allocates a used segment(from dirty seglist) by SSR
>   * manner, so it should recover the existing segment information of valid blocks
> @@ -2913,19 +2933,8 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
>  		get_valid_blocks(sbi, curseg->segno, new_sec))
>  		goto alloc;
>  
> -	if (new_sec) {
> -		unsigned int segno = START_SEGNO(curseg->segno);
> -		int i;
> -
> -		for (i = 0; i < sbi->segs_per_sec; i++, segno++) {
> -			if (get_ckpt_valid_blocks(sbi, segno))
> -				goto alloc;
> -		}
> -	} else {
> -		if (!get_ckpt_valid_blocks(sbi, curseg->segno))
> -			return;
> -	}
> -
> +	if (!get_ckpt_valid_blocks(sbi, curseg->segno, new_sec))
> +		return;
>  alloc:
>  	old_segno = curseg->segno;
>  	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 144980b62f9e..dab87ecba2b5 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -359,8 +359,20 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
>  }
>  
>  static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
> -				unsigned int segno)
> +				unsigned int segno, bool use_section)
>  {
> +	if (use_section && __is_large_section(sbi)) {
> +		unsigned int start_segno = START_SEGNO(segno);
> +		unsigned int blocks = 0;
> +		int i;
> +
> +		for (i = 0; i < sbi->segs_per_sec; i++, start_segno++) {
> +			struct seg_entry *se = get_seg_entry(sbi, start_segno);
> +
> +			blocks += se->ckpt_valid_blocks;
> +		}
> +		return blocks;
> +	}
>  	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>  }
>  
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
