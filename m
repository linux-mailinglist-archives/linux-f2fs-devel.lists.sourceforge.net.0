Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3EB1E4C9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 10:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAzbNvqexkqwc0hbO+DsZmu6KeGCohWjXgcn8VbfnP0=; b=YKoBkX3pkl8W38GC12TMTHUe6D
	uQUE0aNr6rEvoD3ZFFpvPwhQ6y2MAbshdbsWAcOjCJSv9ge8zwy4XR6bTQqQSN/jazEQJvhO4bxJF
	vqlILBaaXzq1FXQ6muYf/Xoj2uY5aAhNpRMzcnLGpXhA5M+tT+KQ/So9usVSuz8vxTHU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukIp3-0000VM-VD;
	Fri, 08 Aug 2025 08:51:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ukIp2-0000V9-PE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OiHTxk14DZiLL0tIunh/LaJpwnk4mvlYHwiYX3jOICQ=; b=lkIpuaOl6VshwwMb40YmHtjS6a
 vhFj3avQuDKnhyq1iriS3T37qIIg4fWP0iJAoNTOS3geA0G4xnD5yzKBOtxx62mdIsfQJYq6/UxII
 xjvPNDz5qNUlPyyeKlx5drBOtjhYT+gK04z5o5TBrYwzUdIqmpsiopRMLtwKNxZ4/SuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OiHTxk14DZiLL0tIunh/LaJpwnk4mvlYHwiYX3jOICQ=; b=jiY3gZxLfK15el3WaTQQ3cqgA9
 5Jc8k6Z9Cb0WQ2Y2RH9s3dhn6Fr5aXGZjBzuQJgcZjGBOOLzN9BYKgm3SSIGfvvXywZcPfYCpZ+wc
 yltVDzXgjQGS7ute6sBCAeduikdV0KspB4ceNVzKK6mEVn5KHMpzZTRx20B/DEoGPwiY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukIp2-0000Ee-RU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 08:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 360126112C;
 Fri,  8 Aug 2025 08:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7334C4CEF0;
 Fri,  8 Aug 2025 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754643086;
 bh=IWdk99tmWxi7aajaTzmcpHaOK5XzjNsTEpbOhip9jIU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=l6aZEtRR49R+PLKwbzr3hjlIwS9hePRbkslFmO0ZBTfoJwVa6cjKxliuuFPVjEb9w
 e8VW0XneI8BSl9A4Vej3oBPhrG/LFt3tDQnGg9gvdWgKQMGKrXo+rVf2RIqyEENW7B
 3zP7V3kehDxr9fvgDH/hAmbu57xZbic31R45u5aUOJWAW1p8RWDfM+1Ks3uVLBUkiK
 84JgVtiyXQH9MvEGkj0b4SXRfstG5rPUpirlH4rEzBruGqlT5ESo2B4CAP4WtBYfWH
 zEWdCYvBa7vCMvVXLqix2GCOBK8kMoNAgFtohdX/0aPUV2eNySjNsBJdz7ld4jzVP6
 NgsliN8tLJqzA==
Message-ID: <459de7d9-970a-4921-b16d-d8ee658f86a8@kernel.org>
Date: Fri, 8 Aug 2025 16:51:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, jaegeuk@kernel.org
References: <20250808072939.202357-1-liaoyuanhong@vivo.com>
Content-Language: en-US
In-Reply-To: <20250808072939.202357-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/8/2025 3:29 PM, Liao Yuanhong wrote: > Currently, we
 have encountered some issues while testing ZUFS. In > situations near the
 storage limit (e.g., 50GB remaining), and after > simulating fragmen [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ukIp2-0000Ee-RU
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: Add bggc_block_io to adjust the
 priority of BG_GC when issuing IO
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/8/2025 3:29 PM, Liao Yuanhong wrote:
> Currently, we have encountered some issues while testing ZUFS. In
> situations near the storage limit (e.g., 50GB remaining), and after
> simulating fragmentation by repeatedly writing and deleting data, we found
> that application installation and startup tests conducted after idling for
> a few minutes take significantly longer several times that of traditional
> UFS. Tracing the operations revealed that the majority of I/Os were issued
> by background GC, which blocks normal I/O operations.
> 
> Under normal circumstances, ZUFS indeed requires more background GC and
> employs a more aggressive GC strategy. However, I aim to find a way to
> minimize the impact on regular I/O operations under these near-limit
> conditions. To address this, I have introduced a bggc_block_io feature,
> which controls the prioritization of background GC in the presence of I/Os.
> This switch can be adjusted at the framework level to implement different
> strategies. If set to ALL_IO_PRIOR, all background GC operations will be
> skipped during active I/O issuance. The default option remains consistent
> with the current strategy, ensuring no change in behavior.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
> Changes in v4:
> 	Adjust the default policy ALL_IO_PRIOR to 0 and modify the description to
> 	match this change
> 
> Changes in v3:
> 	Modified the issue where it does not work after closing
> 	CONFIG_BLK_DEV_ZONED.
> 
> Changes in v2:
> 	Non ZUFS can also be adjusted through this option.
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
>   fs/f2fs/f2fs.h                          | 18 +++++++++++-------
>   fs/f2fs/super.c                         |  2 ++
>   fs/f2fs/sysfs.c                         |  9 +++++++++
>   4 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bc0e7fefc39d..21e6951919de 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -883,3 +883,16 @@ Date:		June 2025
>   Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
>   		Default: 1
> +
> +What:		/sys/fs/f2fs/<disk>/bggc_block_io
> +Date:		August 2025
> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
> +Description:	Used to adjust the BG_GC priority when issuing IO, with a default value
> +		of 0. Specifically, for ZUFS, the default value is 1.
> +
> +		==================  =============================================
> +		value				description
> +		bggc_block_io = 0   Stop background GC when issuing I/O
> +		bggc_block_io = 1   Stop background GC only when issuing read I/O
> +		bggc_block_io = 2   Prioritize background GC
> +		==================  =============================================
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 46be7560548c..440542ea0646 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
>   	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
>   };
>   
> +enum bggc_block_io_policy {
> +	ALL_IO_PRIOR,
> +	READ_IO_PRIOR,
> +	BGGC_PRIOR,

Hi Yuanhong,

Just nitpick, :)

A little bit confuse for BGGC_PRIOR naming, since it won't submit
bggc IO in prior to other IO, just not be aware other IOs.

So, what do you think of renaming as below? Keeping align w/ naming
of discard_policy.io_aware.

/sys/fs/f2fs/<dev>/bggc_io_aware

enum bggc_io_aware_policy {
	AWARE_ALL_IO,		/* skip background GC if there is any kind of pending IO */
	AWARE_READ_IO,		/* skip background GC if there is pending read IO */
	AWARE_NONE,		/* don't aware IO for background GC */
};

Thanks,

> +};
> +
>   /*
>    * An implementation of an rwsem that is explicitly unfair to readers. This
>    * prevents priority inversion when a low-priority reader acquires the read lock
> @@ -1804,6 +1810,7 @@ struct f2fs_sb_info {
>   	spinlock_t dev_lock;			/* protect dirty_device */
>   	bool aligned_blksize;			/* all devices has the same logical blksize */
>   	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
> +	unsigned int bggc_block_io;		/* For adjust the BG_GC priority when issuing IO */
>   
>   	/* For write statistics */
>   	u64 sectors_written_start;
> @@ -2998,13 +3005,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
>   	if (sbi->gc_mode == GC_URGENT_HIGH)
>   		return true;
>   
> -	if (zoned_gc) {
> -		if (is_inflight_read_io(sbi))
> -			return false;
> -	} else {
> -		if (is_inflight_io(sbi, type))
> -			return false;
> -	}
> +	if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
> +		return false;
> +	if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
> +		return false;
>   
>   	if (sbi->gc_mode == GC_URGENT_MID)
>   		return true;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e16c4e2830c2..a21cecc5424e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4629,9 +4629,11 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>   
>   	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
>   	sbi->aligned_blksize = true;
> +	sbi->bggc_block_io = ALL_IO_PRIOR;
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	sbi->max_open_zones = UINT_MAX;
>   	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
> +	sbi->bggc_block_io = READ_IO_PRIOR;
>   #endif
>   
>   	for (i = 0; i < max_devices; i++) {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index f736052dea50..1b587908f049 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -866,6 +866,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "bggc_block_io")) {
> +		if (t < ALL_IO_PRIOR || t > BGGC_PRIOR)
> +			return -EINVAL;
> +		sbi->bggc_block_io = t;
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -1175,6 +1182,7 @@ F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>   #endif
>   F2FS_SBI_GENERAL_RW_ATTR(carve_out);
>   F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
> +F2FS_SBI_GENERAL_RW_ATTR(bggc_block_io);
>   
>   /* STAT_INFO ATTR */
>   #ifdef CONFIG_F2FS_STAT_FS
> @@ -1303,6 +1311,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(discard_idle_interval),
>   	ATTR_LIST(gc_idle_interval),
>   	ATTR_LIST(umount_discard_timeout),
> +	ATTR_LIST(bggc_block_io),
>   #ifdef CONFIG_F2FS_IOSTAT
>   	ATTR_LIST(iostat_enable),
>   	ATTR_LIST(iostat_period_ms),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
