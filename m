Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028C62CC1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jul 2019 01:46:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hkdLH-0003eV-Ns; Mon, 08 Jul 2019 23:46:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hkdLG-0003eN-3m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 23:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=49wrEDHZxdEQ2dGlXWBa4Q2QB8kYHcyo9xGcD3kg35s=; b=OcnjAHxFUcKkB2y4DKzxYUBRjL
 z+pHRdSkoz6J/3qecdsquAb5k1vqRN4lv/+N2xLyxQGzsaKTRkQaG8GpOuhVsdDaXHDjxRgeS7E/K
 kKOHMLRdCW7Yhv28/PXZd9WidGDLiSmMOvYpg3wZSv6J3ocPvzkgCEupH/c4IUupvtWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=49wrEDHZxdEQ2dGlXWBa4Q2QB8kYHcyo9xGcD3kg35s=; b=WaSe3Z6R0jn7ePi3zlJaxrHPyP
 CHXrolhk7XYA9/NwpFK8aUYBL/40M66gz3H+amYSsn6xSlhHrbCI4LfiJfl/R4mp73QSbtzfZyLwZ
 xg8R3YrH8rbVF3OCxUuB0+FIgNKtKWE9I31O9NEtRevUAQeI1ycWKytVxKqUkaTQ/ACA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hkdLE-00BzA1-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 23:46:42 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 912D120693;
 Mon,  8 Jul 2019 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562629593;
 bh=4spNAL37b5SpdzFWlG6fdmA984ZUF9bZInFiZ1YetaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjlmKyq5ApTeA8btkdvUqP6aRH+twrtxxAWZ7BLLnMK1XI1J6rOfQTOSFKR310l51
 RbXQY3ikZk49TzRLNWeDrgfC+0cH0LH/QeVXh4PKb8OcDN6vVZjw/Cwpq4zjz9vb+h
 c5KbpdwOdY1wF6F9ehBa7zBd9NEyySpmY5C5tpg8=
Date: Mon, 8 Jul 2019 16:46:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190708234633.GB21769@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190704081730.46414-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704081730.46414-1-yuchao0@huawei.com>
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
X-Headers-End: 1hkdLE-00BzA1-Ro
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate memory in batch in
 build_sit_info()
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

On 07/04, Chao Yu wrote:
> build_sit_info() allocate all bitmaps for each segment one by one,
> it's quite low efficiency, this pach changes to allocate large
> continuous memory at a time, and divide it and assign for each bitmaps

It may give more failure rate?

> of segment. For large size image, it can expect improving its mount
> speed.
> 
> Signed-off-by: Chen Gong <gongchen4@huawei.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/segment.c | 51 +++++++++++++++++++++--------------------------
>  fs/f2fs/segment.h |  1 +
>  2 files changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 402fbbbb2d7c..73c803af1f31 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3929,7 +3929,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
>  	struct sit_info *sit_i;
>  	unsigned int sit_segs, start;
> -	char *src_bitmap;
> +	char *src_bitmap, *bitmap;
>  	unsigned int bitmap_size;
>  
>  	/* allocate memory for SIT information */
> @@ -3950,27 +3950,31 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	if (!sit_i->dirty_sentries_bitmap)
>  		return -ENOMEM;
>  
> +#ifdef CONFIG_F2FS_CHECK_FS
> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 4;
> +#else
> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 3;
> +#endif
> +	sit_i->bitmap = f2fs_kzalloc(sbi, bitmap_size, GFP_KERNEL);
> +	if (!sit_i->bitmap)
> +		return -ENOMEM;
> +
> +	bitmap = sit_i->bitmap;
> +
>  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> -		sit_i->sentries[start].cur_valid_map
> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> -		sit_i->sentries[start].ckpt_valid_map
> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> -		if (!sit_i->sentries[start].cur_valid_map ||
> -				!sit_i->sentries[start].ckpt_valid_map)
> -			return -ENOMEM;
> +		sit_i->sentries[start].cur_valid_map = bitmap;
> +		bitmap += SIT_VBLOCK_MAP_SIZE;
> +
> +		sit_i->sentries[start].ckpt_valid_map = bitmap;
> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>  
>  #ifdef CONFIG_F2FS_CHECK_FS
> -		sit_i->sentries[start].cur_valid_map_mir
> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> -		if (!sit_i->sentries[start].cur_valid_map_mir)
> -			return -ENOMEM;
> +		sit_i->sentries[start].cur_valid_map_mir = bitmap;
> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>  #endif
>  
> -		sit_i->sentries[start].discard_map
> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
> -							GFP_KERNEL);
> -		if (!sit_i->sentries[start].discard_map)
> -			return -ENOMEM;
> +		sit_i->sentries[start].discard_map = bitmap;
> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>  	}
>  
>  	sit_i->tmp_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
> @@ -4440,21 +4444,12 @@ static void destroy_free_segmap(struct f2fs_sb_info *sbi)
>  static void destroy_sit_info(struct f2fs_sb_info *sbi)
>  {
>  	struct sit_info *sit_i = SIT_I(sbi);
> -	unsigned int start;
>  
>  	if (!sit_i)
>  		return;
>  
> -	if (sit_i->sentries) {
> -		for (start = 0; start < MAIN_SEGS(sbi); start++) {
> -			kvfree(sit_i->sentries[start].cur_valid_map);
> -#ifdef CONFIG_F2FS_CHECK_FS
> -			kvfree(sit_i->sentries[start].cur_valid_map_mir);
> -#endif
> -			kvfree(sit_i->sentries[start].ckpt_valid_map);
> -			kvfree(sit_i->sentries[start].discard_map);
> -		}
> -	}
> +	if (sit_i->sentries)
> +		kvfree(sit_i->bitmap);
>  	kvfree(sit_i->tmp_map);
>  
>  	kvfree(sit_i->sentries);
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 2fd53462fa27..4d171b489130 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -226,6 +226,7 @@ struct sit_info {
>  	block_t sit_base_addr;		/* start block address of SIT area */
>  	block_t sit_blocks;		/* # of blocks used by SIT area */
>  	block_t written_valid_blocks;	/* # of valid blocks in main area */
> +	char *bitmap;			/* all bitmaps pointer */
>  	char *sit_bitmap;		/* SIT bitmap pointer */
>  #ifdef CONFIG_F2FS_CHECK_FS
>  	char *sit_bitmap_mir;		/* SIT bitmap mirror */
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
