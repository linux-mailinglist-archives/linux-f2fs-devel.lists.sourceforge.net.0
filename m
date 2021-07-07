Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACFD3BE2A1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jul 2021 07:33:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m10Bp-0007mM-R5; Wed, 07 Jul 2021 05:33:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m10Bp-0007mC-E4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 05:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=42GHIlhI2+kOM9/rOuPewsjDoZw0u7ySAH1pOdikXfs=; b=S1Jk4KeEbnhI2+ZmkdDjpGeOKO
 uyJ/OV7lHPHPRQ46HL4jBPShKLytZZRHUPsjo91GeO2KjxHCs1mB/q9tk8YlKEM/w3De1YIlG52oq
 zu7FkUMg9MLDFW0CuJUxcwsEJZkuPIdQYqDCTv5hzvEAUjYpU0ulS/tcF+evVbBuFn1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=42GHIlhI2+kOM9/rOuPewsjDoZw0u7ySAH1pOdikXfs=; b=ZcwPIBIPYMEid/87JC68DXSC6c
 GgibYAlHPnf4RR26c7lIpMJHRKqB5QwXcFp5yZv2vcikAWFC7L0M3fHpAU9H5uvMRTq98a+3TN2O1
 q3gNKzKdtlHolmLC9LV2p4VbbbGxR1HW89jskpDSqOjzHvUqMfzoKSYXnWszdfEpFO8o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m10Bh-0003Z6-QU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 05:33:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 993AA61CB2;
 Wed,  7 Jul 2021 05:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625636002;
 bh=KFF9XhfYMcQdezNbI8jrfO+gkJEQeYaMCo1RJKgwsnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTNJH2+/iXm43q2Fi3l8eOsrnqV/F2/4QMKZ5AlDP41fK1Rub9G7wASZ5wRtTHH1x
 lehtHJs31E3tkeJV7vXiOlwI2peIt93vzLXHODf4n2STR2B87w43Pdswhc2kBFjr1M
 rqcJgXw9Uwv5O2XgJy/vRiII3+nFUSel7Kc1WPe4lI/1Ejh0W5L0kXywXtsYHJR92L
 A2KVjHC+7UWxPiwneMNIQas6fJzuGs3vjZwBls2IroY7GRE9bD+ARtY9FaqVx1lt8Q
 o32WaFZgGcYwCv/7W1fJl+Mp1NkXBPPS76ZzJKFqGrjZHaKVcKv5qqi40l4QvfAAD0
 qvRfquUuYRk9Q==
Date: Tue, 6 Jul 2021 22:33:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YOU8ofmEpCcQcmmY@google.com>
References: <20210702214458.3876398-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702214458.3876398-1-daeho43@gmail.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m10Bh-0003Z6-QU
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sysfs nodes to get GC info for
 each GC urgent mode
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/02, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added gc_urgent_dirty_segs and gc_urgent_dirty_segs_mode sysfs nodes.
> 1) "gc_urgent_dirty_segs" shows how many dirty segments have been
> reclaimed by GC during a specific GC urgent mode.
> 2) "gc_urgent_dirty_segs_mode" is used to control for which gc urgent
> mode the "gc_urgent_dirty_segs" node shows.
> (1: GC urgent high, 2: GC urgent low)
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++
>  fs/f2fs/f2fs.h                          |  5 +++
>  fs/f2fs/gc.c                            |  4 +++
>  fs/f2fs/sysfs.c                         | 46 +++++++++++++++++++++++++
>  4 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 95155e4ec7fe..9851c3f2efad 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -493,3 +493,17 @@ Contact:	"Chao Yu" <yuchao0@huawei.com>
>  Description:	When ATGC is on, it controls age threshold to bypass GCing young
>  		candidates whose age is not beyond the threshold, by default it was
>  		initialized as 604800 seconds (equals to 7 days).
> +
> +What:		/sys/fs/f2fs/<disk>/gc_urgent_dirty_segs
> +Date:		July 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show how many dirty segments have been reclaimed by GC during
> +		a specific GC urgent mode (1: GC urgent high, 2: GC urgent low)
> +		You can re-initialize this value to "0".
> +
> +What:		/sys/fs/f2fs/<disk>/gc_urgent_dirty_segs_mode
> +Date:		July 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	You can control for which gc urgent mode the "gc_urgent_dirty_segs"
> +		node shows (1: GC urgent high, 2: GC urgent low). You can set the
> +		value to "0" when you want not to select one of them.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 16ce1ade9fa6..d838c373f188 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1728,6 +1728,11 @@ struct f2fs_sb_info {
>  	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
>  	unsigned int inline_xattr_slab_size;	/* default inline xattr slab size */
>  
> +	/* For reclaimed dirty segs statistics per each GC urgent mode */
> +	unsigned int gc_dirty_segs_mode;	/* GC state for reclaimed dirty segments */
> +	u64 gc_urgent_high_dirty_segs;		/* Reclaimed dirty segs in GC_URGENT_HIGH */
> +	u64 gc_urgent_low_dirty_segs;		/* Reclaimed dirty segs in GC_URGENT_LOW */

How about modifying like this? And, can we add this in debug/f2fs/status?

enum {
	GC_NORMAL,
	GC_URGENT_HIGH,
	GC_URGENT_LOW,
	GC_IDLE_CB,
	GC_IDLE_GREEDY,
	GC_IDLE_AT,
};

#define GC_URGENT_MAX	(GC_URGENT_LOW + 1)
unsigned int reclaimed_segs[GC_URGENT_MAX];

> +
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	struct kmem_cache *page_array_slab;	/* page array entry */
>  	unsigned int page_array_slab_size;	/* default page array slab size */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index da5947b30142..233e2a500379 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1648,6 +1648,10 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>  							force_migrate);
>  
>  		stat_inc_seg_count(sbi, type, gc_type);
> +		if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)

		if (sbi->gc_mode < GC_URGENT_MAX)
			sbi->gc_reclaimed_segs[sbi->gc_mode]++;

> +			sbi->gc_urgent_high_dirty_segs++;
> +		else if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
> +			sbi->gc_urgent_low_dirty_segs++;
>  		migrated++;
>  
>  freed:
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 6642246206bd..9ede97fe12cf 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -307,6 +307,25 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>  		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
>  #endif
>  
> +	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs_mode")) {
> +		if (sbi->gc_dirty_segs_mode == GC_NORMAL)
> +			return sysfs_emit(buf, "0\n");

						"0:gc_normal"?

> +		else if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)
> +			return sysfs_emit(buf, "1\n");

						"1:gc_urgent_high"?

> +		else if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
> +			return sysfs_emit(buf, "2\n");

						"2:gc_urgent_low"?

> +	}
> +
> +	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs")) {
> +		if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)
> +			return sysfs_emit(buf, "%llu\n",
> +					sbi->gc_urgent_high_dirty_segs);
> +		if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
> +			return sysfs_emit(buf, "%llu\n",
> +					sbi->gc_urgent_low_dirty_segs);
> +		return sysfs_emit(buf, "0\n");
> +	}
> +
>  	ui = (unsigned int *)(ptr + a->offset);
>  
>  	return sprintf(buf, "%u\n", *ui);
> @@ -515,6 +534,28 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs_mode")) {
> +		if (t == 0)
> +			sbi->gc_dirty_segs_mode = GC_NORMAL;
> +		else if (t == 1)
> +			sbi->gc_dirty_segs_mode = GC_URGENT_HIGH;
> +		else if (t == 2)
> +			sbi->gc_dirty_segs_mode = GC_URGENT_LOW;
> +		else
> +			return -EINVAL;
> +		return count;
> +	}
> +
> +	if (!strcmp(a->attr.name, "gc_urgent_dirty_segs")) {
> +		if (t != 0 || sbi->gc_dirty_segs_mode == GC_NORMAL)
> +			return -EINVAL;
> +		if (sbi->gc_dirty_segs_mode == GC_URGENT_HIGH)
> +			sbi->gc_urgent_high_dirty_segs = 0;
> +		else if (sbi->gc_dirty_segs_mode == GC_URGENT_LOW)
> +			sbi->gc_urgent_low_dirty_segs = 0;
> +		return count;
> +	}
> +
>  	*ui = (unsigned int)t;
>  
>  	return count;
> @@ -740,6 +781,9 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
>  F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
>  F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
>  
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_dirty_segs_mode, gc_dirty_segs_mode);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_dirty_segs, gc_urgent_high_dirty_segs);
> +
>  #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>  static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(gc_urgent_sleep_time),
> @@ -812,6 +856,8 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(atgc_candidate_count),
>  	ATTR_LIST(atgc_age_weight),
>  	ATTR_LIST(atgc_age_threshold),
> +	ATTR_LIST(gc_urgent_dirty_segs_mode),
> +	ATTR_LIST(gc_urgent_dirty_segs),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs);
> -- 
> 2.32.0.93.g670b81a890-goog
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
