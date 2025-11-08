Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C344C42543
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 08 Nov 2025 03:58:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/sbp3QwqsnDrVl6+UzCEyu/2OCrcXN8QKwLn+vZnRY=; b=bVDEE3K7/yHY157VMTfQ2G/cJR
	14exsAx3FmU9ukyVebCuxoPs7P/GXfrlMPDysA0BDXN+GCgEhwAQn0CONxZfrT2OqQ8pGFhP1pneO
	HY1b05AONAIxB/oB9FCUEE437lcOJhNu3QMOzFD0/lfvGjxeGma13ffbd2kjYaAK1KV0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHZ9J-0004F6-Cn;
	Sat, 08 Nov 2025 02:57:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vHZ9H-0004Ey-W7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Nov 2025 02:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rj84IxQuG1w3XFQ6nFXn1x7hMc3Dlc7Evq65ImUY1OI=; b=ZG7r/X+4YlLyTBnZJHj4/IaXoT
 K+ovD/8iNghpOsP+X45nYirBDEJ3YlCTpmG4YgNANseyyuRWuiHsBoLQDXL09jGbG0f9S31Rilu9g
 hO4srAEZ0mrk61EKCxTr/U76PY4qOn24LEQd4ImQYH/MRMtlNVo/GeoQY/ELYz0oqcLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rj84IxQuG1w3XFQ6nFXn1x7hMc3Dlc7Evq65ImUY1OI=; b=hxVxlBKA1jucBAB5Ni+iuRP/aU
 5ZTYxZn2uqBW/O+DKdQPMHf47ESPY1TLNIMxmgvNOcHGf94wsm44+bXAn8BcmbtFT/OJN7CJfs0xm
 01xuzPCpa3nsHGtZg2QCQIIutyrHMOjnjW7jBHMdJjVGsIiNvwzKHsiEUGewqEin908E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHZ9H-0002e1-Dm for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Nov 2025 02:57:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A666D601CF;
 Sat,  8 Nov 2025 02:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8108EC113D0;
 Sat,  8 Nov 2025 02:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762570669;
 bh=FpYW3ZuTgw+b6X04TJJf+20jagAbk/TZPQ3ffp1I97k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=NCCaNVlP8JiV9Mt/ifYxLCRbMkg8lBjcoupuC2zxoqbEgL5wxp+V2aUIe67IFRqJo
 w08JK5PVNki+m2kpNAqD8ZTlfKva/mdCDFTiPaYr7PzunCxwB04tFZNi0eLsYXA43N
 tvOdDq6yzTXYJ14ro6iketD0utxj3Bfjx1jy0ZGlrdIXkZ5t+PbhsR/2urraYJrmmu
 TwRsUqWOsAWqNPTBwc/8kAIhJRwnbbz0C1voTWf2FTgY7QKrp7DoIDI9dzP3J6Z/W1
 /2MD6cOPvZ83EmutXsM9qp67JKiZji/f2FOkYC+XDtoF7yWgDlD2HEVTiiWXz2FmVq
 jkIywukles25A==
Message-ID: <6bc90239-b405-4364-ae2c-d98b743b5425@kernel.org>
Date: Sat, 8 Nov 2025 10:57:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
 <20251106091537.3063566-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251106091537.3063566-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/11/6 17:15, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > When the block device reports
 max_open_zones
 == 0, sbi->max_open_zones > is initialized to UINT_MAX. In suc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vHZ9H-0002e1-Dm
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix handling of block devices with
 max_open_zones == 0
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/11/6 17:15, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When the block device reports max_open_zones == 0, sbi->max_open_zones
> is initialized to UINT_MAX. In such cases, F2FS can still be mounted
> successfully (as tested under qemu).
> However, for SSDs, a device reporting max_open_zones == 0 should not be
> mountable, while for SMR HDDs this is acceptable.
> Fix this issue by handling max_open_zones == 0 properly:
> - Disallow mounting on SSDs when max_open_zones == 0.
> - For SMR HDDs, set max_open_zones to the total number of zones.
> - Remove redundant zoned device checks.
> - Add a sysfs entry to expose max_open_zones.
> 
> Fixes: 0f9b12142be1af("f2fs: fix zoned block device information initialization")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/super.c | 36 +++++++++++++++++++++---------------
>   fs/f2fs/sysfs.c |  2 ++
>   2 files changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c055032593b7..7349d9cd901b 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4353,21 +4353,6 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>   	unsigned int max_open_zones;
>   	int ret;
>   
> -	if (!f2fs_sb_has_blkzoned(sbi))
> -		return 0;

init_blkz_info() should only be called if blkzoned feature is on?

> -
> -	if (bdev_is_zoned(FDEV(devi).bdev)) {
> -		max_open_zones = bdev_max_open_zones(bdev);
> -		if (max_open_zones && (max_open_zones < sbi->max_open_zones))
> -			sbi->max_open_zones = max_open_zones;
> -		if (sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> -			f2fs_err(sbi,
> -				"zoned: max open zones %u is too small, need at least %u open zones",
> -				sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> -			return -EINVAL;
> -		}
> -	}
> -
>   	zone_sectors = bdev_zone_sectors(bdev);
>   	if (sbi->blocks_per_blkz && sbi->blocks_per_blkz !=
>   				SECTOR_TO_BLOCK(zone_sectors))
> @@ -4378,6 +4363,27 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>   	if (nr_sectors & (zone_sectors - 1))
>   		FDEV(devi).nr_blkz++;
>   
> +	max_open_zones = bdev_max_open_zones(bdev);
> +	if (!max_open_zones) {
> +		/*
> +		 * SSDs require max_open_zones > 0 to be mountable.

Do you mean we enabled blkzoned feature on a zoned SSD? Such SSD can report zeroed max_open_zones?
If so, can you please add more details in commit message?

> +		 * For HDDs, if max_open_zones is reported as 0, it doesn't matter,
> +		 * set it to FDEV(devi).nr_blkz.
> +		 */
> +		if (bdev_nonrot(bdev)) {
> +			f2fs_err(sbi, "zoned: SSD device %s without open zones", FDEV(devi).path);
> +			return -EINVAL;
> +		}
> +		max_open_zones = FDEV(devi).nr_blkz;
> +	}
> +	sbi->max_open_zones = min_t(unsigned int, max_open_zones, sbi->max_open_zones);
> +	if (sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max open zones %u is too small, need at least %u open zones",
> +			sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> +		return -EINVAL;
> +	}
> +
>   	FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
>   					BITS_TO_LONGS(FDEV(devi).nr_blkz)
>   					* sizeof(unsigned long),
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 98d2cb60e806..d3d268c707a9 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1210,6 +1210,7 @@ F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
>   F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
>   #ifdef CONFIG_BLK_DEV_ZONED
>   F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_blkz);
> +F2FS_SBI_GENERAL_RO_ATTR(max_open_zones);

Need to update manual page as well, what about adding this new sysfs entry in a
separated patch?

Thanks,

>   F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>   #endif
>   F2FS_SBI_GENERAL_RW_ATTR(carve_out);
> @@ -1384,6 +1385,7 @@ static struct attribute *f2fs_attrs[] = {
>   #endif
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	ATTR_LIST(unusable_blocks_per_blkz),
> +	ATTR_LIST(max_open_zones),
>   	ATTR_LIST(blkzone_alloc_policy),
>   #endif
>   #ifdef CONFIG_F2FS_FS_COMPRESSION



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
