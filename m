Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A48989933F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Oct 2024 18:52:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sxqy7-0003m2-N4;
	Mon, 07 Oct 2024 16:52:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sxqy6-0003lw-Q2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Oct 2024 16:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ba9TtUh+hbc8rOp9Hu3Ik1SrpOW0WSByxsjClrLmbN4=; b=ONNsY7fOJn2xp9rgmgcodOwQEP
 HeFg5b6rGGKLEgScolq5d0KoPVbuz1m6XmDce4Dm390ergPgfdT6UaLxP+V2TXeTp8SgM7F7WNqa/
 g0LNlheEUMVhQZf2synen2mOebWaTeU/lSZp6NC2qclx5/wpWD2pcT5OdB0eSnTjoZPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ba9TtUh+hbc8rOp9Hu3Ik1SrpOW0WSByxsjClrLmbN4=; b=ixsF5mijETkczPLiOD5KRZRxwM
 slrB42r4KaCtlp1Y+e/M2eOjj7x2byrNUIrgMwNJ0OpdCJ61ogkFYlqcNqxSjSQUmS2Hb5O+vm4nG
 ssRB+8Uobir5twDZ0B+QRa1rX2HeWXig8zHltTdDr8k50aNMMU+2PEU5uTUJfb0cjIdQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sxqy5-0000bV-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Oct 2024 16:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D48325C5559
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Oct 2024 16:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96671C4CEC6;
 Mon,  7 Oct 2024 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728319935;
 bh=McFR8CfgpnxksNQs6KtKlTa460EvJpbtOvh/Sm4lYCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NifajxMl/qi1VfPGNZIfvKjpMmnl/IP6NF0mW1lU1NZ6arMQBQa0/v5j8DrHXzqlN
 1Sj1SQT5wxP1GchJLtpPjHJSjA0Ku4s5UQYfS+ATfbYSxXNKUB81ug2/VG1fo0b4ji
 eS/Ltc2/h42GFAInxqkLWG0Rjcuy6hdHE6Z0LjuiI7YoXZzLYFWIWEsvJcXVuXCFun
 ZN4TcZESCB4LV5HTfHKWFnoQaZZnpycy9bkn5WugOlN0FU0kcyu+OHmkvLJgwQH9yr
 Lkz/fOcK6NxmZ2e5bi0lcOZj8BdLSn9SzDOyocEdD+SoIAqOvorErYzdVcISuhhqNK
 Dyow4yn2yFu9A==
Date: Mon, 7 Oct 2024 16:52:14 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ZwQRvmVoDr_O6vLH@google.com>
References: <20240411082354.1691820-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411082354.1691820-1-chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, This introduces another bitmap increasing memory
 footprint. Do we know how much performance benefit with this? On 04/11, Chao
 Yu wrote: > After commit 899fee36fac0 ("f2fs: fix to avoid data corruption
 by > forbidding SSR overwrite"), valid block bitmap of current openned >
 segment is fixed, let's introduce a p [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sxqy5-0000bV-Eu
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use per-log target_bitmap to
 improve lookup performace of ssr allocation
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

This introduces another bitmap increasing memory footprint. Do we know how
much performance benefit with this?

On 04/11, Chao Yu wrote:
> After commit 899fee36fac0 ("f2fs: fix to avoid data corruption by
> forbidding SSR overwrite"), valid block bitmap of current openned
> segment is fixed, let's introduce a per-log bitmap instead of temp
> bitmap to avoid unnecessary calculation overhead whenever allocating
> free slot w/ SSR allocator.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - rebase to last dev-test branch.
>  fs/f2fs/segment.c | 30 ++++++++++++++++++++++--------
>  fs/f2fs/segment.h |  1 +
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6474b7338e81..af716925db19 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2840,31 +2840,39 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
>  	return 0;
>  }
>  
> -static int __next_free_blkoff(struct f2fs_sb_info *sbi,
> -					int segno, block_t start)
> +static void __get_segment_bitmap(struct f2fs_sb_info *sbi,
> +					unsigned long *target_map,
> +					int segno)
>  {
>  	struct seg_entry *se = get_seg_entry(sbi, segno);
>  	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
> -	unsigned long *target_map = SIT_I(sbi)->tmp_map;
>  	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
>  	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
>  	int i;
>  
>  	for (i = 0; i < entries; i++)
>  		target_map[i] = ckpt_map[i] | cur_map[i];
> +}
> +
> +static int __next_free_blkoff(struct f2fs_sb_info *sbi, unsigned long *bitmap,
> +					int segno, block_t start)
> +{
> +	__get_segment_bitmap(sbi, bitmap, segno);
>  
> -	return __find_rev_next_zero_bit(target_map, BLKS_PER_SEG(sbi), start);
> +	return __find_rev_next_zero_bit(bitmap, BLKS_PER_SEG(sbi), start);
>  }
>  
>  static int f2fs_find_next_ssr_block(struct f2fs_sb_info *sbi,
> -		struct curseg_info *seg)
> +					struct curseg_info *seg)
>  {
> -	return __next_free_blkoff(sbi, seg->segno, seg->next_blkoff + 1);
> +	return __find_rev_next_zero_bit(seg->target_map,
> +				BLKS_PER_SEG(sbi), seg->next_blkoff + 1);
>  }
>  
>  bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
>  {
> -	return __next_free_blkoff(sbi, segno, 0) < BLKS_PER_SEG(sbi);
> +	return __next_free_blkoff(sbi, SIT_I(sbi)->tmp_map, segno, 0) <
> +							BLKS_PER_SEG(sbi);
>  }
>  
>  /*
> @@ -2890,7 +2898,8 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
>  
>  	reset_curseg(sbi, type, 1);
>  	curseg->alloc_type = SSR;
> -	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->segno, 0);
> +	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->target_map,
> +							curseg->segno, 0);
>  
>  	sum_page = f2fs_get_sum_page(sbi, new_segno);
>  	if (IS_ERR(sum_page)) {
> @@ -4635,6 +4644,10 @@ static int build_curseg(struct f2fs_sb_info *sbi)
>  				sizeof(struct f2fs_journal), GFP_KERNEL);
>  		if (!array[i].journal)
>  			return -ENOMEM;
> +		array[i].target_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
> +								GFP_KERNEL);
> +		if (!array[i].target_map)
> +			return -ENOMEM;
>  		if (i < NR_PERSISTENT_LOG)
>  			array[i].seg_type = CURSEG_HOT_DATA + i;
>  		else if (i == CURSEG_COLD_DATA_PINNED)
> @@ -5453,6 +5466,7 @@ static void destroy_curseg(struct f2fs_sb_info *sbi)
>  	for (i = 0; i < NR_CURSEG_TYPE; i++) {
>  		kfree(array[i].sum_blk);
>  		kfree(array[i].journal);
> +		kfree(array[i].target_map);
>  	}
>  	kfree(array);
>  }
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index e1c0f418aa11..10f3e44f036f 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -292,6 +292,7 @@ struct curseg_info {
>  	struct f2fs_summary_block *sum_blk;	/* cached summary block */
>  	struct rw_semaphore journal_rwsem;	/* protect journal area */
>  	struct f2fs_journal *journal;		/* cached journal info */
> +	unsigned long *target_map;		/* bitmap for SSR allocator */
>  	unsigned char alloc_type;		/* current allocation type */
>  	unsigned short seg_type;		/* segment type like CURSEG_XXX_TYPE */
>  	unsigned int segno;			/* current segment number */
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
