Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E61B2CCBF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Aug 2025 21:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqEm0i8vkkcrWiN+VQPczxUXn4629ppX2gv3Eys9raI=; b=MNz06PzeEAwx2UGFC3WK6ROAjp
	0Tlrb+iFkHcRg4Pa+POb+wvuDzxh7nVZvnuLFAD/dfIWPM2JGJsn98hqli85KIVqKMLbVabp2JHMC
	iIymKUkNTVBY3J3cnyqOQH7c3DfQVj6xJed/tws9wb+desBXdkHJ3Q9jetzgTWFbYVg8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoRgB-0003du-NH;
	Tue, 19 Aug 2025 19:07:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uoRg9-0003dn-Ib
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 19:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccE2TOAx+By8FIKUj55ihn+xqxHZwjaAv7CF3S2OS9c=; b=RhI/S6InVcMnL//U06vz5nCyjW
 /vJC8Q6icAZIQpywQnSkeSLb9UQyCuyqt7rNgfCjca75Y0Gq8FkOfulq0uAQ19NDok0wfzgDY41lx
 Ei7Ha8gzXMBAFL3uMCSeW6viU4GzhCmAgajBZH5ZRligjgj/BpvPrVn340A4VtyMSXrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccE2TOAx+By8FIKUj55ihn+xqxHZwjaAv7CF3S2OS9c=; b=EaUZ0tW1/xzbiJJXccuMJ40DkW
 V+mQuBmmP0VRMu2oHwWrEf6rRLALQNsq1e1FC/WJuuzE3SEbgW6XYrvTKmwFKAuTuuU8It1voN7LS
 5FV22f/hU+KktUzsvey+a+cFIDsx0brvnQB4SZ2+HvsTMgXmb4pM9Wop+mGCaDJk90wI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uoRg8-0003wg-P5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 19:07:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 545C95C63EC;
 Tue, 19 Aug 2025 19:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EECEC4CEF1;
 Tue, 19 Aug 2025 19:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755630437;
 bh=eSkivWrkug3GfONjQDmW1TAbCR9f3GcfgkKWx1/ROGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tlyDEHvBA2ytL57kOy5X+U/yxVdE9BgpRq2I7Vqo4IZH6dgW11ylOlB4se9g1NGkl
 XqI+0KnDFllq+AZC3GuyVqif5PLz/QS0SSKPMQGt56/N7w6vRXakDVd0tQHChGjFZl
 FDuZWdtsax2hyfSRhzNGJk2qK76qLmF/YVXaDqoe1ggFb3JWqJSWwSZnUJZiU+jJQV
 wyuCSuGMlSpJl/MNYZjOf1MdD4O9fV7s4ppj7Hcq4IeAZVoWH20ClSIX++k4E55cee
 czGnoFbETO5+AVY4a2YiVRgH4c0zxyiOaRUO3/vyRlh1Q6/Rphj1tN6U2CHg/QzP3/
 Z/KZ6WeSJNZSw==
Date: Tue, 19 Aug 2025 19:07:15 +0000
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Message-ID: <aKTLY_wnV4gJlcuS@google.com>
References: <20250815124226.391583-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815124226.391583-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/15,
 Liao Yuanhong wrote: > Introduces two new sys nodes:
 device_border_line and device_alloc_policy. > The device_border_line
 identifies
 the boundary between devices, measured > in sections; it [...] 
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
X-Headers-End: 1uoRg8-0003wg-P5
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use device_alloc_policy to control
 write priority in multi-device setups
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/15, Liao Yuanhong wrote:
> Introduces two new sys nodes: device_border_line and device_alloc_policy.
> The device_border_line identifies the boundary between devices, measured
> in sections; it defaults to the end of the device for single storage
> setups, and the end of the first device for multiple storage setups. The
> device_alloc_policy determines the write strategy, with a default value of
> 0 for normal sequential write strategy. A value of 1 prioritizes writes
> before the device_border_line, while a value of 2 prioritizes writes after
> it.

I think this allocation policy is independent of the partition layout. Instead,
it prioritizes allocating blocks immediately preceding or following a given
logical block address, defined as device_border_line.

As such, can you generalize the terms here like "sysfs/allocate_section_hint"
with "sysfs/allocate_section_policy" having one of the belows?
  ALLOCATE_FORWARD_NOHINT = 0 by default,
  ALLOCATE_FORWARD_WITHIN_HINT,
  ALLOCATE_FORWARD_FROM_HINT

And, some comments below as well.

> 
> This strategy addresses the issue where, despite F2FS supporting multiple
> devices, SOC vendors lack multi-device support (currently only supporting
> zoned devices). As a workaround, multiple storage devices are mapped to a
> single dm device. Both this workaround and the F2FS multi-device solution
> may require prioritizing writing to certain devices, such as a device with
> better performance or when switching is needed due to performance
> degradation near a device's end. For scenarios with more than two devices,
> sort them at mount time to utilize this feature.
> 
> This patch covers both the F2FS multi-device solution and the single dm
> device mapping for multiple devices. Additionally, there is functional
> overlap with blkzone_alloc_policy. Future consideration might involve
> integrating blkzone_alloc_policy into device_alloc_policy, as zoned devices
> are a special case of multi-device setups.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 22 ++++++++++++++++++++++
>  fs/f2fs/f2fs.h                          |  8 ++++++++
>  fs/f2fs/gc.c                            |  5 +++++
>  fs/f2fs/segment.c                       | 17 ++++++++++++++++-
>  fs/f2fs/super.c                         |  4 ++++
>  fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
>  6 files changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bc0e7fefc39d..2ef3ba36a775 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -883,3 +883,25 @@ Date:		June 2025
>  Contact:	"Daeho Jeong" <daehojeong@google.com>
>  Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
>  		Default: 1
> +
> +What:		/sys/fs/f2fs/<disk>/device_border_line
> +Date:		August 2025
> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
> +Description:	Indicates the border line between the first device and others in amulti-devices

Typo: amulti-devices

> +		setup. It defaults to the end of the first device in sections. For a single storage
> +		device, it defaults to the total number of sections. It can be manually set to match
> +		scenarios where multi-devices are mapped to the same dm device.
> +
> +What:		/sys/fs/f2fs/<disk>/device_alloc_policy
> +Date:		August 2025
> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
> +Description:	Controls write priority in multi-device setups. A value of 0 means normal writing.
> +		A value of 1 prioritizes writing to devices before the device_border_line. A value of 2
> +		prioritizes writing to devices after the device_border_line. The default is 0.
> +
> +		=======================  ======================================================
> +		value					 description
> +		device_alloc_policy = 0  Normal writing
> +		device_alloc_policy = 1  Prioritize writing to device before device_border_line
> +		device_alloc_policy = 2  Prioritize writing to device after device_border_line
> +		======================== ======================================================
> \ No newline at end of file
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 46be7560548c..4af5f2ad0b2b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
>  	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
>  };
>  
> +enum device_allocation_policy {
> +	DEVICE_ALLOC_PRIOR_NORMAL,
> +	DEVICE_ALLOC_PRIOR_FRONT,
> +	DEVICE_ALLOC_PRIOR_BACK,
> +};
> +
>  /*
>   * An implementation of an rwsem that is explicitly unfair to readers. This
>   * prevents priority inversion when a low-priority reader acquires the read lock
> @@ -1804,6 +1810,8 @@ struct f2fs_sb_info {
>  	spinlock_t dev_lock;			/* protect dirty_device */
>  	bool aligned_blksize;			/* all devices has the same logical blksize */
>  	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
> +	unsigned int device_border_line;	/* the boundary position between devices */
> +	unsigned int device_alloc_policy;	/* determine the device writing priority */
>  
>  	/* For write statistics */
>  	u64 sectors_written_start;
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 098e9f71421e..5fd5cc3c70b3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2182,6 +2182,8 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
>  	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
>  	MAIN_SECS(sbi) += secs;
> +	if (sbi->device_border_line > MAIN_SECS(sbi))
> +		sbi->device_border_line = MAIN_SECS(sbi);
>  	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
>  	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
>  	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
> @@ -2189,6 +2191,9 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  	if (f2fs_is_multi_device(sbi)) {
>  		int last_dev = sbi->s_ndevs - 1;
>  
> +		sbi->device_border_line = FDEV(0).total_segments /
> +					SEGS_PER_SEC(sbi);
> +
>  		FDEV(last_dev).total_segments =
>  				(int)FDEV(last_dev).total_segments + segs;
>  		FDEV(last_dev).end_blk =
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index cc82d42ef14c..0b0427c7995a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2807,6 +2807,10 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>  	}
>  #endif
>  
> +	if (sbi->device_alloc_policy == DEVICE_ALLOC_PRIOR_BACK &&
> +		hint < sbi->device_border_line)
> +		hint = sbi->device_border_line;
> +
>  find_other_zone:
>  	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>  
> @@ -2828,13 +2832,24 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>  #endif
>  
>  	if (secno >= MAIN_SECS(sbi)) {
> -		secno = find_first_zero_bit(free_i->free_secmap,
> +		if (sbi->device_alloc_policy == DEVICE_ALLOC_PRIOR_BACK) {
> +			secno = find_next_zero_bit(free_i->free_secmap,
> +							MAIN_SECS(sbi), sbi->device_border_line);
> +			if (secno >= MAIN_SECS(sbi))
> +				secno = find_first_zero_bit(free_i->free_secmap,
> +								MAIN_SECS(sbi));
> +		} else
> +			secno = find_first_zero_bit(free_i->free_secmap,
>  							MAIN_SECS(sbi));

Coding style:
  if () {
  } else {
  }

>  		if (secno >= MAIN_SECS(sbi)) {
>  			ret = -ENOSPC;
>  			f2fs_bug_on(sbi, !pinning);
>  			goto out_unlock;
>  		}
> +	} else if (sbi->device_alloc_policy == DEVICE_ALLOC_PRIOR_FRONT &&
> +				secno >= sbi->device_border_line) {
> +		secno = find_first_zero_bit(free_i->free_secmap,
> +							MAIN_SECS(sbi));
>  	}
>  	segno = GET_SEG_FROM_SEC(sbi, secno);
>  	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index e16c4e2830c2..d3de907d8aaa 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3860,6 +3860,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  	segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
>  	secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
>  	total_sections = le32_to_cpu(raw_super->section_count);
> +	sbi->device_border_line = total_sections;
>  
>  	/* blocks_per_seg should be 512, given the above check */
>  	blocks_per_seg = BIT(le32_to_cpu(raw_super->log_blocks_per_seg));
> @@ -4629,6 +4630,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  
>  	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
>  	sbi->aligned_blksize = true;
> +	sbi->device_alloc_policy = DEVICE_ALLOC_PRIOR_NORMAL;
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	sbi->max_open_zones = UINT_MAX;
>  	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
> @@ -4659,6 +4661,8 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  					SEGS_TO_BLKS(sbi,
>  					FDEV(i).total_segments) - 1 +
>  					le32_to_cpu(raw_super->segment0_blkaddr);
> +				sbi->device_border_line = FDEV(i).total_segments /
> +							SEGS_PER_SEC(sbi);
>  			} else {
>  				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
>  				FDEV(i).end_blk = FDEV(i).start_blk +
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index f736052dea50..3af77f37fb64 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -866,6 +866,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "device_border_line")) {
> +		if (t < 0 || t > MAIN_SECS(sbi))
> +			return -EINVAL;
> +		sbi->device_border_line = t;
> +		return count;
> +	}
> +
> +	if (!strcmp(a->attr.name, "device_alloc_policy")) {
> +		if (t < DEVICE_ALLOC_PRIOR_NORMAL || t > DEVICE_ALLOC_PRIOR_BACK)
> +			return -EINVAL;
> +		sbi->device_alloc_policy = t;
> +		return count;
> +	}

Doesn't it need to check some assumption like the single device case?

> +
>  	*ui = (unsigned int)t;
>  
>  	return count;
> @@ -1138,6 +1152,8 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
>  F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
>  F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
>  F2FS_SBI_GENERAL_RW_ATTR(dir_level);
> +F2FS_SBI_GENERAL_RW_ATTR(device_border_line);
> +F2FS_SBI_GENERAL_RW_ATTR(device_alloc_policy);
>  #ifdef CONFIG_F2FS_IOSTAT
>  F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
>  F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
> @@ -1371,6 +1387,8 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(max_read_extent_count),
>  	ATTR_LIST(carve_out),
>  	ATTR_LIST(reserved_pin_section),
> +	ATTR_LIST(device_border_line),
> +	ATTR_LIST(device_alloc_policy),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs);
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
