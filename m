Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B9C42518
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 08 Nov 2025 03:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7loNQKN6Vw/ODl31otfnPVilzwD5/TZBjvJdQzQ5ybY=; b=BTDfOX2gu3xl1zj1bixTYko35r
	DPWRLbKDCKJzR7Vj8dsN/qFiR9+Ldz3xMQkpQFaw3a7w1rNxXyCZG+HIe7jbbGq3X5BmzD059Rp+2
	0q532T/mFzSj6G4nfIXUwV00UY2VLHggWVuEijAtyaErkG+3e51X3iluSUP3nYcCbp48=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHYti-0002ej-St;
	Sat, 08 Nov 2025 02:41:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vHYth-0002ec-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Nov 2025 02:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iSRJspKoWU3ZxKKoFgeOT7eotKfPYeldy5Y8UvDq428=; b=Bc/d7e3iKhh4pmAdaWiYXeBpUc
 XeZL4PPsE5f4CaDq4sIIhPoXLNCtJ7mH5d1rqzwXec7irwO2u8SJIzCx37bxNWiZxKoRWNpPoFSVE
 x5ky/k5bxM3x+N/Ib+8yoQ3quwfuRxFlSPkSNkeDoJ73pAmuGnjLNp9jz5tO/Y3u+zt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iSRJspKoWU3ZxKKoFgeOT7eotKfPYeldy5Y8UvDq428=; b=jt/QAvgpWLFwCiiqPZjkWYlGgq
 h7qDYncXaTTYjRbFOEpCBLy0YOgpHDUUCe+oIZW6YD0sByF+kpWFtNkhgvp0WMLLsksivcqfic7xY
 rHbtwIVYIVkalB0gDIU/g6xJ/O9BLE/pGvhxlTE9V/hW2Wh8+6W7rdO3IyMb0nzFP8RE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHYth-0001hk-67 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Nov 2025 02:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8672840A30;
 Sat,  8 Nov 2025 02:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A62C116B1;
 Sat,  8 Nov 2025 02:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762569698;
 bh=u+KkRsy3pYdYyRokCwsqnS2R4vMoj5vU+RKZUr0CvOI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qVjXy1RZAaigTTAelQoyx9xbVGSVLMN04BedlIItHsV40n/RgjEfIsiYsHlUXOiG4
 t84DUocK3UBJnA/51uTTgOTxr5iT8+uGmCpXYROC11WHjtO/04B6eZ5ZLUe4/bIkgh
 3hdJXehsd2m4IaGBrCWHgLdW51BciLWqdNdgIw1Zih3kbqVlC3lm7RemMoX9t783tD
 Ttoy3LT3TNWqTTn6B8EZI39xEUcQcVg6mk5xwb9uV5fjlV9YhgF2ZxjG46W/YJt0fq
 Pe/JwSYpUmJ7Vu9CeKyNBfyELEhdQ+f5aJJMzxDeEIszVapjHNWKppeeubQDMcu0K+
 f6IqfyKGFlH0A==
Message-ID: <2d7f92f9-41ba-499a-85c5-ed5b24a08866@kernel.org>
Date: Sat, 8 Nov 2025 10:41:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251106091537.3063566-1-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/11/6 17:15, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > sbi->unusable_blocks_per_sec is used only
 within CONFIG_BLK_DEV_ZONED > sections, except for CAP_BLKS_PER_S [...] 
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
X-Headers-End: 1vHYth-0001hk-67
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: rename and refactor
 sbi->unusable_blocks_per_sec
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
> sbi->unusable_blocks_per_sec is used only within CONFIG_BLK_DEV_ZONED
> sections, except for CAP_BLKS_PER_SEC and CAP_SEGS_PER_SEC. This patch
> renames unusable_blocks_per_sec to unusable_blocks_per_blkz and ensures
> that unusable_blocks_per_blkz is properly enclosed within the
> CONFIG_BLK_DEV_ZONED.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/f2fs.h    | 2 +-
>   fs/f2fs/segment.c | 3 +--
>   fs/f2fs/segment.h | 9 +++++++--
>   fs/f2fs/super.c   | 6 +++---
>   fs/f2fs/sysfs.c   | 4 ++--
>   5 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5b4e9548a231..c47a09c7f7e7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1661,6 +1661,7 @@ struct f2fs_sb_info {
>   
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
> +	unsigned int unusable_blocks_per_blkz;	/* F2FS unusable blocks per zone */
>   	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
>   	/* For adjust the priority writing position of data in zone UFS */
>   	unsigned int blkzone_alloc_policy;
> @@ -1732,7 +1733,6 @@ struct f2fs_sb_info {
>   	unsigned int meta_ino_num;		/* meta inode number*/
>   	unsigned int log_blocks_per_seg;	/* log2 blocks per segment */
>   	unsigned int blocks_per_seg;		/* blocks per segment */
> -	unsigned int unusable_blocks_per_sec;	/* unusable blocks per section */
>   	unsigned int segs_per_sec;		/* segments per section */
>   	unsigned int secs_per_zone;		/* sections per zone */
>   	unsigned int total_sections;		/* total section count */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b45eace879d7..54ad774ee338 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -5567,7 +5567,7 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(
>   	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
>   	unsigned int secno;
>   
> -	if (!sbi->unusable_blocks_per_sec)
> +	if (!sbi->unusable_blocks_per_blkz)
>   		return BLKS_PER_SEG(sbi);
>   
>   	secno = GET_SEC_FROM_SEG(sbi, segno);
> @@ -5599,7 +5599,6 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi
>   {
>   	return 0;
>   }
> -
>   #endif
>   unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
>   					unsigned int segno)
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 1ce2c8abaf48..0a1ca929ce1a 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -69,11 +69,16 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>   	((!__is_valid_data_blkaddr(blk_addr)) ?			\
>   	NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),			\
>   		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
> +#ifdef CONFIG_BLK_DEV_ZONED
>   #define CAP_BLKS_PER_SEC(sbi)					\
> -	(BLKS_PER_SEC(sbi) - (sbi)->unusable_blocks_per_sec)
> +	(BLKS_PER_SEC(sbi) - (sbi)->unusable_blocks_per_blkz)
>   #define CAP_SEGS_PER_SEC(sbi)					\
>   	(SEGS_PER_SEC(sbi) -					\
> -	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec))
> +	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_blkz))
> +#else
> +#define CAP_BLKS_PER_SEC(sbi) BLKS_PER_SEC(sbi)
> +#define CAP_SEGS_PER_SEC(sbi) SEGS_PER_SEC(sbi)
> +#endif
>   #define GET_START_SEG_FROM_SEC(sbi, segno)			\
>   	(rounddown(segno, SEGS_PER_SEC(sbi)))
>   #define GET_SEC_FROM_SEG(sbi, segno)				\
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index db7afb806411..c055032593b7 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4333,11 +4333,11 @@ static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
>   		return 0;
>   
>   	set_bit(idx, rz_args->dev->blkz_seq);
> -	if (!rz_args->sbi->unusable_blocks_per_sec) {
> -		rz_args->sbi->unusable_blocks_per_sec = unusable_blocks;
> +	if (!rz_args->sbi->unusable_blocks_per_blkz) {
> +		rz_args->sbi->unusable_blocks_per_blkz = unusable_blocks;
>   		return 0;
>   	}
> -	if (rz_args->sbi->unusable_blocks_per_sec != unusable_blocks) {
> +	if (rz_args->sbi->unusable_blocks_per_blkz != unusable_blocks) {
>   		f2fs_err(rz_args->sbi, "F2FS supports single zone capacity\n");
>   		return -EINVAL;
>   	}
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 6d2a4fba68a2..98d2cb60e806 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1209,7 +1209,7 @@ F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
>   /* read extent cache */
>   F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
>   #ifdef CONFIG_BLK_DEV_ZONED
> -F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
> +F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_blkz);

Yongpeng,

We need to keep userspace sysfs API stable, can we keep the original name?

Thanks,

>   F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>   #endif
>   F2FS_SBI_GENERAL_RW_ATTR(carve_out);
> @@ -1383,7 +1383,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(avg_vblocks),
>   #endif
>   #ifdef CONFIG_BLK_DEV_ZONED
> -	ATTR_LIST(unusable_blocks_per_sec),
> +	ATTR_LIST(unusable_blocks_per_blkz),
>   	ATTR_LIST(blkzone_alloc_policy),
>   #endif
>   #ifdef CONFIG_F2FS_FS_COMPRESSION



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
