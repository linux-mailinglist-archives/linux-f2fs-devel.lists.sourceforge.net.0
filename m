Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 266068ADBCB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Apr 2024 04:08:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rz5Zi-0006DW-Lm;
	Tue, 23 Apr 2024 02:08:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rz5Zh-0006DI-Cm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 02:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ghb80wWJlPf/bytOJ/Dr9X6UfDjWNlVT/clI9Z4FHUI=; b=fiyggbytSxLSJ5qRonRsBDahJP
 RNT/M/Tk32v4RHZDrerY8ySaKxX5UHKvz/cTyHI3LhHw8+3oykZuPqOODBtDP3KwoZCayJw6es3Mw
 WGWCRYltyxMxpEg+uwL3pK9W+UlJC7YoRnHJFvy40DOKx9J0gxqdgjM3evEF8hBelmBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ghb80wWJlPf/bytOJ/Dr9X6UfDjWNlVT/clI9Z4FHUI=; b=Umn2+LEGwRslFOK65us+mpG2RB
 qWU4mCsQcRe1yUFSRVWUX6S9iHi/qW+2/7/VYEfyrw+22qrx34pvrBgsoyglSZ8FD66darggkE7UL
 Zj39bf7pJkfffQ0w++T81kdOWzdkG1nj2+j/w9af1wWMXB+Ci9rrF+G6Q/0zvJk9O9wk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rz5Zg-0003pF-Lq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 02:08:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8ECE61208
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Apr 2024 02:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC5AC113CC;
 Tue, 23 Apr 2024 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713838075;
 bh=9ZrYYhHo31/mbMcmlkNl/YC9fkL7yN42Gjse/Jn35WQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pE+Vik3oiiMeIHNlxxtcPyG7/G8T38eNZtpg+A8LXg82eDw+dFbD/dpr8n+D4TLOC
 o8xu+x5SwYAtmI0pfmyExpeYiEJzNaBQdYqcQlzA3nn/I66KYY6MvW1XyV3Vg1iEYH
 wNil0i75gyyxednIclBFmYQceQOab3kkXfx4Q67/l/Mv9oCYZ8cFHaixxqxiBkbaNY
 mMfGyA9Ru1Mco5q5HWluEyrXJU2gicB7UoCC0N7Tcl1uNl/v98Yc/PUgaVnugPEOuH
 Sk3tQs0+S4gDHSy+TtSwSNMJpANDBDGZ68JzeJO6/mkEBnY3tHDps5H/ROMVOFSDh9
 70xl98xdJoGEg==
Message-ID: <11d5d736-bae5-4a71-b400-087b8722893c@kernel.org>
Date: Tue, 23 Apr 2024 10:07:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org
References: <20240411082354.1691820-1-chao@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240411082354.1691820-1-chao@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk, any comments for this serials? On 2024/4/11 16:23, 
 Chao Yu wrote: > After commit 899fee36fac0 ("f2fs: fix to avoid data
 corruption
 by > forbidding SSR overwrite"), valid block bitmap of current openned >
 segment is fixed, let's int [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rz5Zg-0003pF-Lq
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, any comments for this serials?

On 2024/4/11 16:23, Chao Yu wrote:
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
>   fs/f2fs/segment.c | 30 ++++++++++++++++++++++--------
>   fs/f2fs/segment.h |  1 +
>   2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6474b7338e81..af716925db19 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2840,31 +2840,39 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
>   	return 0;
>   }
>   
> -static int __next_free_blkoff(struct f2fs_sb_info *sbi,
> -					int segno, block_t start)
> +static void __get_segment_bitmap(struct f2fs_sb_info *sbi,
> +					unsigned long *target_map,
> +					int segno)
>   {
>   	struct seg_entry *se = get_seg_entry(sbi, segno);
>   	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
> -	unsigned long *target_map = SIT_I(sbi)->tmp_map;
>   	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
>   	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
>   	int i;
>   
>   	for (i = 0; i < entries; i++)
>   		target_map[i] = ckpt_map[i] | cur_map[i];
> +}
> +
> +static int __next_free_blkoff(struct f2fs_sb_info *sbi, unsigned long *bitmap,
> +					int segno, block_t start)
> +{
> +	__get_segment_bitmap(sbi, bitmap, segno);
>   
> -	return __find_rev_next_zero_bit(target_map, BLKS_PER_SEG(sbi), start);
> +	return __find_rev_next_zero_bit(bitmap, BLKS_PER_SEG(sbi), start);
>   }
>   
>   static int f2fs_find_next_ssr_block(struct f2fs_sb_info *sbi,
> -		struct curseg_info *seg)
> +					struct curseg_info *seg)
>   {
> -	return __next_free_blkoff(sbi, seg->segno, seg->next_blkoff + 1);
> +	return __find_rev_next_zero_bit(seg->target_map,
> +				BLKS_PER_SEG(sbi), seg->next_blkoff + 1);
>   }
>   
>   bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
>   {
> -	return __next_free_blkoff(sbi, segno, 0) < BLKS_PER_SEG(sbi);
> +	return __next_free_blkoff(sbi, SIT_I(sbi)->tmp_map, segno, 0) <
> +							BLKS_PER_SEG(sbi);
>   }
>   
>   /*
> @@ -2890,7 +2898,8 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
>   
>   	reset_curseg(sbi, type, 1);
>   	curseg->alloc_type = SSR;
> -	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->segno, 0);
> +	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->target_map,
> +							curseg->segno, 0);
>   
>   	sum_page = f2fs_get_sum_page(sbi, new_segno);
>   	if (IS_ERR(sum_page)) {
> @@ -4635,6 +4644,10 @@ static int build_curseg(struct f2fs_sb_info *sbi)
>   				sizeof(struct f2fs_journal), GFP_KERNEL);
>   		if (!array[i].journal)
>   			return -ENOMEM;
> +		array[i].target_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
> +								GFP_KERNEL);
> +		if (!array[i].target_map)
> +			return -ENOMEM;
>   		if (i < NR_PERSISTENT_LOG)
>   			array[i].seg_type = CURSEG_HOT_DATA + i;
>   		else if (i == CURSEG_COLD_DATA_PINNED)
> @@ -5453,6 +5466,7 @@ static void destroy_curseg(struct f2fs_sb_info *sbi)
>   	for (i = 0; i < NR_CURSEG_TYPE; i++) {
>   		kfree(array[i].sum_blk);
>   		kfree(array[i].journal);
> +		kfree(array[i].target_map);
>   	}
>   	kfree(array);
>   }
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index e1c0f418aa11..10f3e44f036f 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -292,6 +292,7 @@ struct curseg_info {
>   	struct f2fs_summary_block *sum_blk;	/* cached summary block */
>   	struct rw_semaphore journal_rwsem;	/* protect journal area */
>   	struct f2fs_journal *journal;		/* cached journal info */
> +	unsigned long *target_map;		/* bitmap for SSR allocator */
>   	unsigned char alloc_type;		/* current allocation type */
>   	unsigned short seg_type;		/* segment type like CURSEG_XXX_TYPE */
>   	unsigned int segno;			/* current segment number */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
