Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B600B1D457
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 10:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5XHu1A69LaYwH1vaecbxxR9fDhVACYIFbV9H/NwwLE=; b=ZTA1CvNGt7/7fLOaEiKhj0LDns
	fu90LEPZTRoZaPBb9E8wWTdkNY8u7w/k3Dyf7PC8KyPcDVd/5ofS4JeD427ebF6dnHzhbs8p4exeD
	V8A5/tg41fMtU8KqUHTT6QKRpM5AjTrZ1cWAH98dldG/lKXalSZ1fnjcNFHHPeXaJDPY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujw8y-0005VP-78;
	Thu, 07 Aug 2025 08:38:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujw8w-0005VG-MU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 08:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v6sNO2ZYhPQYGcQltYow/q7AiaojYT/FojyXVP3GiFo=; b=XWZeZ16bJaHTZ7YTaymv3/nair
 pV/ydxlVKzamlKGeyQQSkCPTXULYx1le2MbvsxprGkN/Aj7x36fIfhXtcCVAZZ6XGusFgHSgRclR3
 0MCvvBdaeNvVTnw35gJpgttcj4g3qfXgqHGxay3+Sl/06xPEaVU33wXe8IuqhQuQXZlk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v6sNO2ZYhPQYGcQltYow/q7AiaojYT/FojyXVP3GiFo=; b=aId3nnxMArzwfbpCRTxAY9K7ce
 zIxMekz3iQ9uxr+lF+qXkwzYzbI2bpGplYYrBz7u4tEPaPGSwly6vzXPtmgELPRYEvAMmiT7zfcOu
 W6TDdf5LpZMqtZcCqH3uMLdIQGdVZXsa338Zue0PdRTEMBorkvXwDcw6scR9AVtILyGY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujw8w-00074E-2h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 08:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4DEB5C479A;
 Thu,  7 Aug 2025 08:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF30C4CEEB;
 Thu,  7 Aug 2025 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754555908;
 bh=Z8juUoPKnzPVrOKAT2bg4L+pwxA3Dh5VzHaqon9AtdY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=a4i1S7z08sK8aku7qzbi7wmNbi4FqPzUt5FTlSf2dqaMKdRhjru56Dhd7iSbmWZNe
 R4dasbTCY5TIpttRvcLMEzdkJ4w/2u8MFPl0mYrLlqQg+GbfpwTZCfm4g9ngw3GSDB
 p7U6WeFgj0kFPiqD+T+KxzXfGC3CQvLsgMyKeHP4TBK4inkJMpUzRj2/F9uqPe77pH
 GYLEo0MwBnepe3ByTekS6X4zdRM1k17TZGf9oF2w6TdK0u+v+7mI7QfVdCR1YtjvYu
 NvKm2n/B94fuwZTG7NyCTTaGOt2omobcRtz4ThsVbwrlfqFR1hPma0aRTWSZBB90U6
 sc3teWMF04WPA==
Message-ID: <ee0b8b83-a368-4529-b25d-d3b1c6291648@kernel.org>
Date: Thu, 7 Aug 2025 16:38:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250805132208.486601-1-liaoyuanhong@vivo.com>
 <20250806070905.71012-1-liaoyuanhong@vivo.com>
Content-Language: en-US
In-Reply-To: <20250806070905.71012-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/6/25 15:09, Liao Yuanhong wrote: > Currently, we have
 encountered some issues while testing ZUFS. In > situations near the storage
 limit (e.g., 50GB remaining), and after > simulating fragmentati [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujw8w-00074E-2h
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Add bggc_block_io to adjust the
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/6/25 15:09, Liao Yuanhong wrote:
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
> Changes in v2:
> 	Non ZUFS can also be adjusted through this option.
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
>  fs/f2fs/f2fs.h                          | 18 +++++++++++-------
>  fs/f2fs/super.c                         |  2 ++
>  fs/f2fs/sysfs.c                         |  9 +++++++++
>  4 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bc0e7fefc39d..12fda11d4da5 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -883,3 +883,16 @@ Date:		June 2025
>  Contact:	"Daeho Jeong" <daehojeong@google.com>
>  Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
>  		Default: 1
> +
> +What:		/sys/fs/f2fs/<disk>/bggc_block_io
> +Date:		August 2025
> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
> +Description:	Used to adjust the BG_GC priority when issuing IO, with a default value
> +		of 1.

Default value is 2 if CONFIG_BLK_DEV_ZONED is off?

Thanks,

> +
> +		==================  =============================================
> +		value				description
> +		bggc_block_io = 0   Prioritize background GC
> +		bggc_block_io = 1   Stop background GC only when issuing read I/O
> +		bggc_block_io = 2   Stop background GC when issuing I/O
> +		==================  =============================================
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 46be7560548c..fe41b733fbc2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
>  	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
>  };
>  
> +enum bggc_block_io_policy {
> +	BGGC_PRIOR,
> +	READ_IO_PRIOR,
> +	ALL_IO_PRIOR,
> +};
> +
>  /*
>   * An implementation of an rwsem that is explicitly unfair to readers. This
>   * prevents priority inversion when a low-priority reader acquires the read lock
> @@ -1804,6 +1810,7 @@ struct f2fs_sb_info {
>  	spinlock_t dev_lock;			/* protect dirty_device */
>  	bool aligned_blksize;			/* all devices has the same logical blksize */
>  	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
> +	unsigned int bggc_block_io;		/* For adjust the BG_GC priority when issuing IO */
>  
>  	/* For write statistics */
>  	u64 sectors_written_start;
> @@ -2998,13 +3005,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
>  	if (sbi->gc_mode == GC_URGENT_HIGH)
>  		return true;
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
>  	if (sbi->gc_mode == GC_URGENT_MID)
>  		return true;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e16c4e2830c2..a21cecc5424e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4629,9 +4629,11 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  
>  	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
>  	sbi->aligned_blksize = true;
> +	sbi->bggc_block_io = ALL_IO_PRIOR;
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	sbi->max_open_zones = UINT_MAX;
>  	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
> +	sbi->bggc_block_io = READ_IO_PRIOR;
>  #endif
>  
>  	for (i = 0; i < max_devices; i++) {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index f736052dea50..efea15209788 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -674,6 +674,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		sbi->blkzone_alloc_policy = t;
>  		return count;
>  	}
> +
> +	if (!strcmp(a->attr.name, "bggc_block_io")) {
> +		if (t < BGGC_PRIOR || t > ALL_IO_PRIOR)
> +			return -EINVAL;
> +		sbi->bggc_block_io = t;
> +		return count;
> +	}
>  #endif
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -1172,6 +1179,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
>  #ifdef CONFIG_BLK_DEV_ZONED
>  F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
>  F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
> +F2FS_SBI_GENERAL_RW_ATTR(bggc_block_io);
>  #endif
>  F2FS_SBI_GENERAL_RW_ATTR(carve_out);
>  F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
> @@ -1342,6 +1350,7 @@ static struct attribute *f2fs_attrs[] = {
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	ATTR_LIST(unusable_blocks_per_sec),
>  	ATTR_LIST(blkzone_alloc_policy),
> +	ATTR_LIST(bggc_block_io),
>  #endif
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	ATTR_LIST(compr_written_block),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
