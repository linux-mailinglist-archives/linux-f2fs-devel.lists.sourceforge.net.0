Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA167F6D9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 10:54:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLhux-0002N6-Q9;
	Sat, 28 Jan 2023 09:54:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLhup-0002Ll-SJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 09:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UVdALRLDLrVSDnKCTRPxVB4UW4eRF4XYg8Ukc6Qtipo=; b=LA2nOsk8NwE7z38x5irb2qANZs
 YyhlsOhMiy/wi38XXM6LOzKqTcfFv8jrd5pUcDMkCX92Y7SR4Uu2J4YPud+gHlTvDklUv23wyVykH
 0QRu7AzolgQJTiwzmJiDV6obKkskC0hs9BbnRs8fw8JFOmeIm1jEz4wiIO5ac/wPmT4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UVdALRLDLrVSDnKCTRPxVB4UW4eRF4XYg8Ukc6Qtipo=; b=c1Xy6hnl4nZH70BKaZGQGh78hb
 UgYpm5BQTY95YICHzrvdxBNiPqPDqM9JDom2++IcnIxA1cxbcFN6IN+0L+J0HkpONJNTYGMfyWslb
 7WmytpKAqRCTI+2npWVkHmdi0NgjNBIGKYRqkHZpO814HlEgkipt8A09ZgpmkzLj40kQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLhui-001ZCW-Lf for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 09:54:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40F4A60AFF;
 Sat, 28 Jan 2023 09:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896D0C433D2;
 Sat, 28 Jan 2023 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674899658;
 bh=sxJtaZxPq2MZjUNksG2MAR/7m8EWH47yu/4vwO5FWK0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Gh6AVtgaOY2bKtLsXBuOqlptXuP5Y/2uBDo9RjlgUndqyT/TQ0DbDFpD1mMVOQ/c+
 yZrgwPGdb0O5KTAqKZidpIf1oqRzC0BmkmG0UX30o4n5R+O8TJm3N0Q1039NpnIZCw
 4uom45/ylSWWmK22DLvH60IRkM0SaOUks9xBNyJkal7Po4BWy4jZkJvOW4NxIWRfJO
 BBxMdFMHTa1+J531COcjQ5Rail/L1xot/BN0BeCdMm4U/a6Y5oNGW6TYOGFhp0ONRJ
 d5L1EBQYfvh7HnZKstYfRNoANTQZshxfF8qmfvjzYNQbrYnYnxvag8sbRCD06sbAES
 02tzXpjPP8mCg==
Message-ID: <989046e3-b288-d966-1d21-2fccabdcb72d@kernel.org>
Date: Sat, 28 Jan 2023 17:54:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230120134029.69200-1-frank.li@vivo.com>
 <20230120134029.69200-4-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230120134029.69200-4-frank.li@vivo.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/20 21:40, Yangtao Li wrote: > User can control f2fs
 ipu policy through /sys/fs/f2fs/<disk>/ipu_policy, > export related definitions
 and introduce new macro to make it more > convenient for u [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLhui-001ZCW-Lf
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: move ipu_policy definitions to
 separated file
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

On 2023/1/20 21:40, Yangtao Li wrote:
> User can control f2fs ipu policy through /sys/fs/f2fs/<disk>/ipu_policy,
> export related definitions and introduce new macro to make it more
> convenient for users to use.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 25 ++++++------
>   fs/f2fs/segment.c                       |  2 +-
>   fs/f2fs/segment.h                       | 37 ++---------------
>   fs/f2fs/super.c                         |  2 +-
>   fs/f2fs/sysfs.c                         |  2 +-
>   include/uapi/linux/f2fs.h               | 54 +++++++++++++++++++++++++
>   6 files changed, 73 insertions(+), 49 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 64b15a28fe30..d05ad2bc56d1 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -49,18 +49,19 @@ Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
>   Description:	Controls the in-place-update policy.
>   		updates in f2fs. User can set:
>   
> -		====  =================
> -		0x01  F2FS_IPU_FORCE
> -		0x02  F2FS_IPU_SSR
> -		0x04  F2FS_IPU_UTIL
> -		0x08  F2FS_IPU_SSR_UTIL
> -		0x10  F2FS_IPU_FSYNC
> -		0x20  F2FS_IPU_ASYNC
> -		0x40  F2FS_IPU_NOCACHE
> -		0x80  F2FS_IPU_HONOR_OPU_WRITE
> -		====  =================
> -
> -		Refer segment.h for details.
> +		====  ============================
> +		0x00  SET_F2FS_IPU_DISABLE
> +		0x01  SET_F2FS_IPU_FORCE
> +		0x02  SET_F2FS_IPU_SSR
> +		0x04  SET_F2FS_IPU_UTIL
> +		0x08  SET_F2FS_IPU_SSR_UTIL
> +		0x10  SET_F2FS_IPU_FSYNC
> +		0x20  SET_F2FS_IPU_ASYNC
> +		0x40  SET_F2FS_IPU_NOCACHE
> +		0x80  SET_F2FS_IPU_HONOR_OPU_WRITE
> +		====  ============================
> +
> +		Refer include/uapi/linux/f2fs.h for details.
>   
>   What:		/sys/fs/f2fs/<disk>/min_ipu_util
>   Date:		November 2013
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a007f5084e84..c56f5a80d3a6 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -5138,7 +5138,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
>   		sm_info->rec_prefree_segments = DEF_MAX_RECLAIM_PREFREE_SEGMENTS;
>   
>   	if (!f2fs_lfs_mode(sbi))
> -		sm_info->ipu_policy = BIT(F2FS_IPU_FSYNC);
> +		sm_info->ipu_policy = SET_F2FS_IPU_FSYNC;
>   	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
>   	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
>   	sm_info->min_seq_blocks = sbi->blocks_per_seg;
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 50c63155ad56..c064ddffe91b 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -7,6 +7,7 @@
>    */
>   #include <linux/blkdev.h>
>   #include <linux/backing-dev.h>
> +#include <uapi/linux/f2fs.h>
>   
>   /* constant macro */
>   #define NULL_SEGNO			((unsigned int)(~0))
> @@ -646,51 +647,19 @@ static inline int utilization(struct f2fs_sb_info *sbi)
>   					sbi->user_block_count);
>   }
>   
> -/*
> - * Sometimes f2fs may be better to drop out-of-place update policy.
> - * And, users can control the policy through sysfs entries.
> - * There are five policies with triggering conditions as follows.
> - * F2FS_IPU_FORCE - all the time,
> - * F2FS_IPU_SSR - if SSR mode is activated,
> - * F2FS_IPU_UTIL - if FS utilization is over threashold,
> - * F2FS_IPU_SSR_UTIL - if SSR mode is activated and FS utilization is over
> - *                     threashold,
> - * F2FS_IPU_FSYNC - activated in fsync path only for high performance flash
> - *                     storages. IPU will be triggered only if the # of dirty
> - *                     pages over min_fsync_blocks. (=default option)
> - * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
> - * F2FS_IPU_NOCACHE - disable IPU bio cache.
> - * F2FS_IPU_HONOR_OPU_WRITE - use OPU write prior to IPU write if inode has
> - *                            FI_OPU_WRITE flag.
> - * F2FS_IPU_DISABLE - disable IPU. (=default option in LFS mode)
> - */

IMO, we'd better to move these comments into sysfs-fs-f2fs as ipu_policy
interface's documents.

>   #define DEF_MIN_IPU_UTIL	70
>   #define DEF_MIN_FSYNC_BLOCKS	8
>   #define DEF_MIN_HOT_BLOCKS	16
>   
>   #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
>   
> -#define F2FS_IPU_DISABLE	0
> -
> -/* Modification on enum should be synchronized with ipu_mode_names array */
> -enum {
> -	F2FS_IPU_FORCE,
> -	F2FS_IPU_SSR,
> -	F2FS_IPU_UTIL,
> -	F2FS_IPU_SSR_UTIL,
> -	F2FS_IPU_FSYNC,
> -	F2FS_IPU_ASYNC,
> -	F2FS_IPU_NOCACHE,
> -	F2FS_IPU_HONOR_OPU_WRITE,
> -	F2FS_IPU_MAX,
> -};
> -
>   #define F2FS_IPU_POLICY(name)					\
>   static inline int IS_##name(struct f2fs_sb_info *sbi)		\
>   {								\
> -	return SM_I(sbi)->ipu_policy & BIT(name);		\
> +	return TEST_##name(SM_I(sbi)->ipu_policy);		\
>   }
>   
> +F2FS_IPU_POLICY(F2FS_IPU_DISABLE);
>   F2FS_IPU_POLICY(F2FS_IPU_FORCE);
>   F2FS_IPU_POLICY(F2FS_IPU_SSR);
>   F2FS_IPU_POLICY(F2FS_IPU_UTIL);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ebc76683f05d..b19085fa335a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4085,7 +4085,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
>   		if (f2fs_block_unit_discard(sbi))
>   			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
>   		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS)
> -			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
> +			SM_I(sbi)->ipu_policy = SET_F2FS_IPU_FORCE | SET_F2FS_IPU_HONOR_OPU_WRITE;
>   	}
>   
>   	sbi->readdir_ra = true;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index aaf5d8650518..375ace5f330d 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -165,7 +165,7 @@ static ssize_t ipu_mode_show(struct f2fs_attr *a,
>   {
>   	int len = 0, i = 0;
>   
> -	if (SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE)
> +	if (IS_F2FS_IPU_DISABLE(sbi))
>   		return sysfs_emit(buf, "DISABLE\n");
>   
>   	for_each_set_bit(i, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index 955d440be104..1b672fb6af91 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -5,6 +5,60 @@
>   #include <linux/types.h>
>   #include <linux/ioctl.h>
>   
> +/*
> + * For /sys/fs/f2fs/<disk>/ipu_policy entry
> + *
> + * Sometimes f2fs may be better to drop out-of-place update policy.
> + * And, users can control the policy through sysfs entries.
> + * There are five policies with triggering conditions as follows.
> + * F2FS_IPU_FORCE - all the time,
> + * F2FS_IPU_SSR - if SSR mode is activated,
> + * F2FS_IPU_UTIL - if FS utilization is over threashold,
> + * F2FS_IPU_SSR_UTIL - if SSR mode is activated and FS utilization is over
> + *                     threashold,
> + * F2FS_IPU_FSYNC - activated in fsync path only for high performance flash
> + *                     storages. IPU will be triggered only if the # of dirty
> + *                     pages over min_fsync_blocks. (=default option)
> + * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
> + * F2FS_IPU_NOCACHE - disable IPU bio cache.
> + * F2FS_IPU_HONOR_OPU_WRITE - use OPU write prior to IPU write if inode has
> + *                            FI_OPU_WRITE flag.
> + * F2FS_IPU_DISABLE - disable IPU. (=default option in LFS mode)
> + */
> +#define F2FS_IPU_DISABLE	0
> +/* Modification on enum should be synchronized with ipu_mode_names array */
> +enum {
> +	F2FS_IPU_FORCE,
> +	F2FS_IPU_SSR,
> +	F2FS_IPU_UTIL,
> +	F2FS_IPU_SSR_UTIL,
> +	F2FS_IPU_FSYNC,
> +	F2FS_IPU_ASYNC,
> +	F2FS_IPU_NOCACHE,
> +	F2FS_IPU_HONOR_OPU_WRITE,
> +	F2FS_IPU_MAX,
> +};
> +
> +#define SET_F2FS_IPU_DISABLE				F2FS_IPU_DISABLE
> +#define SET_F2FS_IPU_FORCE					BIT(F2FS_IPU_FORCE)
> +#define SET_F2FS_IPU_SSR					BIT(F2FS_IPU_SSR)
> +#define SET_F2FS_IPU_UTIL					BIT(F2FS_IPU_UTIL)
> +#define SET_F2FS_IPU_SSR_UTIL				BIT(F2FS_IPU_SSR_UTIL)
> +#define SET_F2FS_IPU_FSYNC					BIT(F2FS_IPU_FSYNC)
> +#define SET_F2FS_IPU_ASYNC					BIT(F2FS_IPU_ASYNC)
> +#define SET_F2FS_IPU_NOCACHE				BIT(F2FS_IPU_NOCACHE)
> +#define SET_F2FS_IPU_HONOR_OPU_WRITE		BIT(F2FS_IPU_HONOR_OPU_WRITE)
> +
> +#define TEST_F2FS_IPU_DISABLE(val)			((val) == F2FS_IPU_DISABLE)
> +#define TEST_F2FS_IPU_FORCE(val)			((val) & BIT(F2FS_IPU_FORCE))
> +#define TEST_F2FS_IPU_SSR(val)				((val) & BIT(F2FS_IPU_SSR))
> +#define TEST_F2FS_IPU_UTIL(val)				((val) & BIT(F2FS_IPU_UTIL))
> +#define TEST_F2FS_IPU_SSR_UTIL(val)			((val) & BIT(F2FS_IPU_SSR_UTIL))
> +#define TEST_F2FS_IPU_FSYNC(val)			((val) & BIT(F2FS_IPU_FSYNC))
> +#define TEST_F2FS_IPU_ASYNC(val)			((val) & BIT(F2FS_IPU_ASYNC))
> +#define TEST_F2FS_IPU_NOCACHE(val)			((val) & BIT(F2FS_IPU_NOCACHE))
> +#define TEST_F2FS_IPU_HONOR_OPU_WRITE(val)	((val) & BIT(F2FS_IPU_HONOR_OPU_WRITE))

I don't see any strong reason to add these sysfs related definition to uapi,
according to other filesystems' implementation, I guess describing the usage
of ipu_policy clearly is enough.

Thanks,

> +
>   /*
>    * f2fs-specific ioctl commands
>    */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
