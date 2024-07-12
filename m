Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB61B92F655
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 09:40:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sSAss-0004hD-HA;
	Fri, 12 Jul 2024 07:40:02 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sSAsq-0004gR-PM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lj/cuQ1Czjgy9QA0uAa1psowiqr5it+1m2cMXAHJLfo=; b=aonFsx77wuRMBxd6YRHH5RPa9T
 /f7NmsJYaTrlr0pAIQWKzKyWwptf/FUPSkaCRP1GbF22cQlvYB1EXPiQ9ASaNcVaC0hI1vtILO092
 zxtGKfTrJgmRC057cx2ga8+OMvsFzZJw5v0sJPhF0geVPDF1QVGc9AJURfmsGMKVap58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lj/cuQ1Czjgy9QA0uAa1psowiqr5it+1m2cMXAHJLfo=; b=F4B1TCzFwcpQRbz3cFYnsOjWhN
 zVPtEg0rTutdbROirw513HChe5UyZYaBK+g3YXuV5Ww/H0t5B28+Bbl1uuByzILVCT28KYQI3OA5T
 1wAwn5fsb2QxE2y7IQbuNZkpEoKwWY8Uc6BfbSHnYhdFdX3x60SmA7Rjim8u3hv4SCII=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sSAsq-0005tF-K8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31E32CE171E;
 Fri, 12 Jul 2024 07:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D75C3277B;
 Fri, 12 Jul 2024 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720769987;
 bh=Vkv2hkTj6jUrBuGBjjiUQk+2437j+iYhMlHx5xjRaVA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mqZI7G5lcjbFhCFcN67a0abyhRICV9V/vBXICIp0vI21Av1C/ewX2DnI1DydxKKiY
 NiP/+A9cIQt0ZGCV6m2N9NxBYX9GyU9HGImXendezqgbZA6x+iY7xodvkgGVKQ+0+Y
 tWJsqNda30wQR/Y7qz20CNepFx36SUQfkgRaNXAQIAPvBqoR3Dj3PjehK4PHysdOQl
 Q5DK6yWTuSp2m5CjU2TxNOtmCizMj1qHCTIT0rJQTnNiDJ5Mxb6wiVyx2ABgl+5EHS
 VnyMzI/NNVRbpkxySV96pDV0MZGk6TUJbpZumAT/mjr9MMWFj78PZ+TXE2tX6bg2jL
 fHsHZMNUWcsqw==
Message-ID: <18da111b-d22b-44e1-8ce8-9bfb14a543bf@kernel.org>
Date: Fri, 12 Jul 2024 15:39:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240702062952.28859-1-liaoyuanhong@vivo.com>
 <20240710030608.28496-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240710030608.28496-1-liaoyuanhong@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/10 11:06, Liao Yuanhong wrote: > Currently, we are
 using a mix of traditional UFS and zone UFS to support > some functionalities
 that cannot be achieved on zone UFS alone. However, > there a [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sSAsq-0005tF-K8
Subject: Re: [f2fs-dev] [PATCH v4] f2fs:Add write priority option based on
 zone UFS
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
Cc: linux-kernel@vger.kernel.org, bo.wu@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/10 11:06, Liao Yuanhong wrote:
> Currently, we are using a mix of traditional UFS and zone UFS to support
> some functionalities that cannot be achieved on zone UFS alone. However,
> there are some issues with this approach. There exists a significant
> performance difference between traditional UFS and zone UFS. Under normal
> usage, we prioritize writes to zone UFS. However, in critical conditions
> (such as when the entire UFS is almost full), we cannot determine whether
> data will be written to traditional UFS or zone UFS. This can lead to
> significant performance fluctuations, which is not conducive to
> development and testing. To address this, we have added an option
> zlu_io_enable under sys with the following three modes:
> 1) zlu_io_enable == 0:Normal mode, prioritize writing to zone UFS;
> 2) zlu_io_enable == 1:Zone UFS only mode, only allow writing to zone UFS;
> 3) zlu_io_enable == 2:Traditional UFS priority mode, prioritize writing to
> traditional UFS.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
> v4:
> 	-Change some constant's name.
> ---
> v3:
> 	-Delete excess comments,
> 	-Use enum instead of define,
> 	-Modify some judgment criteria to make them more reasonable.
> ---
> v2:
> 	-Change name to blkzone_alloc_policy,
> 	-Update manual of f2fs sysfs entry,
> 	-Use macro instead of magic number,
> 	-Initialize it w/ default policy in f2fs_scan_devices,
> 	-Add validation check,
> 	-Merged the ifdef PROFIG-BLK-DEV_ZONED area.
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
>   fs/f2fs/f2fs.h                          |  8 ++++++++
>   fs/f2fs/segment.c                       | 25 ++++++++++++++++++++++++-
>   fs/f2fs/super.c                         |  1 +
>   fs/f2fs/sysfs.c                         | 11 +++++++++++
>   5 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index cad6c3dc1f9c..3500920ab7ce 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -763,3 +763,17 @@ Date:		November 2023
>   Contact:	"Chao Yu" <chao@kernel.org>
>   Description:	It controls to enable/disable IO aware feature for background discard.
>   		By default, the value is 1 which indicates IO aware is on.
> +
> +What:		/sys/fs/f2fs/<disk>/blkzone_alloc_policy
> +Date:		July 2024
> +Contact:	"Yuanhong Liao" <liaoyuanhong@vivo.com>
> +Description:	The zone UFS we are currently using consists of two parts:
> +		conventional zones and sequential zones. It can be used to control which part
> +		to prioritize for writes, with a default value of 0.
> +
> +		========================  =========================================
> +		value					  description
> +		blkzone_alloc_policy = 0  Prioritize writing to sequential zones
> +		blkzone_alloc_policy = 1  Only allow writing to sequential zones
> +		blkzone_alloc_policy = 2  Prioritize writing to conventional zones
> +		========================  =========================================
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f7ee6c5e371e..adefd19810ff 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -134,6 +134,12 @@ typedef u32 nid_t;
>   
>   #define COMPRESS_EXT_NUM		16
>   
> +enum blkzone_allocation_policy {
> +	BLKZONE_ALLOC_PRIOR_SEQ;	/* Prioritize writing to sequential zones */
> +	BLKZONE_ALLOC_ONLY_SEQ;		/* Only allow writing to sequential zones */
> +	BLKZONE_ALLOC_PRIOR_CONV;	/* Prioritize writing to conventional zones */

	BLKZONE_ALLOC_PRIOR_SEQ,	/* Prioritize writing to sequential zones */
	BLKZONE_ALLOC_ONLY_SEQ,		/* Only allow writing to sequential zones */
	BLKZONE_ALLOC_PRIOR_CONV	/* Prioritize writing to conventional zones */

> +};
> +
>   /*
>    * An implementation of an rwsem that is explicitly unfair to readers. This
>    * prevents priority inversion when a low-priority reader acquires the read lock
> @@ -1555,6 +1561,8 @@ struct f2fs_sb_info {
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
>   	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
> +	/* For adjust the priority writing position of data in zone UFS */
> +	unsigned int blkzone_alloc_policy;
>   #endif
>   
>   	/* for node-related operations */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 4db1add43e36..026b61602113 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2686,17 +2686,40 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>   			goto got_it;
>   	}
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
>   	/*
>   	 * If we format f2fs on zoned storage, let's try to get pinned sections
>   	 * from beginning of the storage, which should be a conventional one.
>   	 */
>   	if (f2fs_sb_has_blkzoned(sbi)) {
> -		segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
> +		/* Prioritize writing to conventional zones */
> +		if (sbi->blkzone_alloc_policy == BLKZONE_ALLOC_PRIOR_CONV || pinning)
> +			segno = 0;
> +		else
> +			segno = max(first_zoned_segno(sbi), *newseg);
>   		hint = GET_SEC_FROM_SEG(sbi, segno);
>   	}
> +#endif
>   
>   find_other_zone:
>   	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
> +
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
> +		/* Write only to sequential zones */
> +		if (sbi->blkzone_alloc_policy == BLKZONE_ALLOC_ONLY_SEQ) {
> +			hint = GET_SEC_FROM_SEG(sbi, first_zoned_segno(sbi));
> +			secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
> +		} else
> +			secno = find_first_zero_bit(free_i->free_secmap,
> +								MAIN_SECS(sbi));
> +		if (secno >= MAIN_SECS(sbi)) {
> +			ret = -ENOSPC;
> +			goto out_unlock;
> +		}
> +	}
> +#endif
> +
>   	if (secno >= MAIN_SECS(sbi)) {
>   		secno = find_first_zero_bit(free_i->free_secmap,
>   							MAIN_SECS(sbi));
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 4a1bc8f40f9a..95ae6de77939 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4229,6 +4229,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>   	sbi->aligned_blksize = true;
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	sbi->max_open_zones = UINT_MAX;
> +	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
>   #endif
>   
>   	for (i = 0; i < max_devices; i++) {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index fee7ee45ceaa..63ff2d1647eb 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -627,6 +627,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   	}
>   #endif
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (!strcmp(a->attr.name, "blkzone_alloc_policy")) {
> +		if (t < BLKZONE_ALLOC_PRIOR_SEQ || t > BLKZONE_ALLOC_PRIOR_CONV)
> +			return -EINVAL;
> +		sbi->blkzone_alloc_policy = t;
> +		return count;
> +	}
> +#endif
> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	if (!strcmp(a->attr.name, "compr_written_block") ||
>   		!strcmp(a->attr.name, "compr_saved_block")) {
> @@ -1033,6 +1042,7 @@ F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
>   F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
>   #ifdef CONFIG_BLK_DEV_ZONED
>   F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
> +F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>   #endif
>   
>   /* STAT_INFO ATTR */
> @@ -1187,6 +1197,7 @@ static struct attribute *f2fs_attrs[] = {
>   #endif
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	ATTR_LIST(unusable_blocks_per_sec),
> +	ATTR_LIST(blkzone_alloc_policy),
>   #endif
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	ATTR_LIST(compr_written_block),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
