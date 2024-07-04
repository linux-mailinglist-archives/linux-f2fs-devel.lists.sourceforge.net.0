Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B31A9271FC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 10:46:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPI71-0004dh-Mz;
	Thu, 04 Jul 2024 08:46:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sPI70-0004dU-K9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 08:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MW2zYKCFM0itTPO5deZmv0x8siibhKPXWW7S2uDZzc4=; b=dkpOkgTIfJ2WkOfDYLer+noQfh
 b9DL7fBJUseY7XD2chwDfDSiH0jtf/Hxk4qZbO1NEL2bjVuubDa3RInK7tW93PSgqSkbAg15NyajK
 2l5CEJYHp9aAvsQu4w/qABnZUDcdLn4tb8ubXanRtsFf+aUBfJ/9ugIiI/ZdHX0JESk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MW2zYKCFM0itTPO5deZmv0x8siibhKPXWW7S2uDZzc4=; b=Q1DKKr7XIMFFAnWYSUTlLlY0Ml
 Az1tRWepcyPRZAAaV2yZBZfQzLTZowj/DsF8Jb1VvXHUFT0vG3ExVH0g9y+62tOBiySYIQ1xQLgRZ
 USNXPHFoaRCBzFzC+vLE4xY41J+suAmeXy6k2ZVSF6C6N14daiZdnbCKU+LYeh9B2uaM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPI70-0001zL-Rw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 08:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9A1C624FB;
 Thu,  4 Jul 2024 08:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CD1C3277B;
 Thu,  4 Jul 2024 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720082796;
 bh=ZxRLkDRdvAg3y5cVKYOdLAYOAli7hUoWN2F6wd8SGsg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mtl92JMjymjC+BRRawFCLgS4lRWNWJo5JiHwak1oxHrXC8sez3cJXddYh2zVie9MA
 MLLYpjDkdtjBvmMNcX/f0Fp1bWLr0rf/oNoeobhdbeGkQpuK7lhX78WClQ1tU/Tz+C
 zp83gLhCHzGp6jTYxHGLqcf+29DFDJkxFF0usLBgzaoSYQNF14j3PuP2rpFuKmTIot
 GMVn+Yo/i3fKsW/8uPT0Q2a2aE7fizDaXli0Ej0Eihf1A2+iVmLVztRp3ioM9BMSrQ
 JvkCxCYz4AeuE2bOhXHEjwhLf6cimvQKe7I1gGBE/RIdfIF5RWi7y0IXie7rjJ2XUS
 C68G/NTlOuQFg==
Message-ID: <cbc18f90-9c5a-49b0-9c6f-d1fbab0f2df1@kernel.org>
Date: Thu, 4 Jul 2024 16:46:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240702062952.28859-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240702062952.28859-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/2 14:29, Liao Yuanhong wrote: > Currently, we are
 using a mix of traditional UFS and zone UFS to support > some functionalities
 that cannot be achieved on zone UFS alone. However, > there ar [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPI70-0001zL-Rw
Subject: Re: [f2fs-dev] [PATCH] f2fs:Add write priority option based on zone
 UFS
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

On 2024/7/2 14:29, Liao Yuanhong wrote:
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

Use blkzone_alloc_policy instead of zlu_io_enable? Not sure.

Should update manual of f2fs sysfs entry.

> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>   fs/f2fs/f2fs.h    |  5 +++++
>   fs/f2fs/segment.c | 23 ++++++++++++++++++++++-
>   fs/f2fs/sysfs.c   | 13 +++++++++++++
>   3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f7ee6c5e371e..7ba782bd15b2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1781,6 +1781,11 @@ struct f2fs_sb_info {
>   	u64 committed_atomic_block;
>   	u64 revoked_atomic_block;
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	/* For adjust the priority writing position of data in zone UFS */
> +	unsigned int zlu_io_enable;		/* data write mode */
> +#endif

#ifdef CONFIG_BLK_DEV_ZONED
	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
	/* For adjust the priority writing position of data in zone UFS */
	unsigned int zlu_io_enable;		/* data write mode */
#endif

> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	struct kmem_cache *page_array_slab;	/* page array entry */
>   	unsigned int page_array_slab_size;	/* default page array slab size */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 4db1add43e36..327457c28700 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2686,17 +2686,38 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
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
> +		if (sbi->zlu_io_enable == 2)		/* Prioritize writing to traditional UFS */

Please use a macro instead of magic number.

> +			segno = 0;
> +		else
> +			segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
>   		hint = GET_SEC_FROM_SEG(sbi, segno);
>   	}
> +#endif
>   
>   find_other_zone:
>   	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
> +
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
> +		if (sbi->zlu_io_enable == 1) {		/* Write only to zone UFS */

Ditto.

And we'd better initialize it w/ default policy in somewhere.

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
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index fee7ee45ceaa..bc9e5e8bb749 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -627,6 +627,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   	}
>   #endif
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (!strcmp(a->attr.name, "zlu_io_enable")) {

Should check validation of new value?

> +		sbi->zlu_io_enable = t;
> +		return count;
> +	}
> +#endif
> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	if (!strcmp(a->attr.name, "compr_written_block") ||
>   		!strcmp(a->attr.name, "compr_saved_block")) {
> @@ -1006,6 +1013,9 @@ F2FS_SBI_GENERAL_RW_ATTR(dir_level);
>   F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
>   F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
>   #endif
> +#ifdef CONFIG_BLK_DEV_ZONED
> +F2FS_SBI_GENERAL_RW_ATTR(zlu_io_enable);

#ifdef CONFIG_BLK_DEV_ZONED
F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
F2FS_SBI_GENERAL_RW_ATTR(zlu_io_enable);
#endif

Thanks,

> +#endif
>   F2FS_SBI_GENERAL_RW_ATTR(readdir_ra);
>   F2FS_SBI_GENERAL_RW_ATTR(max_io_bytes);
>   F2FS_SBI_GENERAL_RW_ATTR(data_io_flag);
> @@ -1153,6 +1163,9 @@ static struct attribute *f2fs_attrs[] = {
>   #ifdef CONFIG_F2FS_IOSTAT
>   	ATTR_LIST(iostat_enable),
>   	ATTR_LIST(iostat_period_ms),
> +#endif
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	ATTR_LIST(zlu_io_enable),
>   #endif
>   	ATTR_LIST(readdir_ra),
>   	ATTR_LIST(max_io_bytes),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
