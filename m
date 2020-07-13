Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F921E078
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2020 21:07:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jv3nn-00039L-9U; Mon, 13 Jul 2020 19:07:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jv3nm-000392-3j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 19:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HYQHpFVNcByfgihHwkoyg8IKKdM/w8PTZqQYdsMuVyM=; b=NeQoGi6crarM/lbo/2zQbfkZgu
 BWRCbQDSlJ76BgHr2IAR+Nj+gfgA1Yk4O3BJtS/iGu9/jPhAdt5a7gpPXpcTBN9D4EYOXIHuRZFLh
 8NgkytbBSjLJVUq7RWPM5SMqO+MQCzR1gFlkV9BJsUte3m7siUN1s9dL1Q0E1KvYhaeo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HYQHpFVNcByfgihHwkoyg8IKKdM/w8PTZqQYdsMuVyM=; b=FqaVWy9TIwhRfGLGpzrnFBPDbg
 7dU9pNarqA0Hwt++Iq61HYlZcdEFDvxucY/bQZlXY7QC9KA8qU0zW7/CDmGmLXZqu/WztOw26uGjg
 Lf5T9cwybOLyIM7TOrMrt+B8Z4KbHa3YsI5/GfAKB8yX2m3rY641XufEd2HuBlwrng6g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jv3nk-001sgH-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 19:07:46 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ABF220738;
 Mon, 13 Jul 2020 19:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594667256;
 bh=uzfPu6IvaZx9X/DHGJTrvNJ2a2aolgVBujJ6P/u34bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BsgteGo+73Gre8l32YfWZeYMbtD+WqY/eUzugufsUfCb23l3xKjKwc/NHfKt/FYF6
 Pj5VJCXE+fcMGyi8sBlA1oGQWA0COjQPq6lUSudHTVj3F5ABy79p7UuA5FUvmwNCxO
 R7g2SBOYEo3f0mAhRjueTOOrHFQqi5QW619qkIAc=
Date: Mon, 13 Jul 2020 12:07:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Aravind Ramesh <aravind.ramesh@wdc.com>
Message-ID: <20200713190736.GA3131494@google.com>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
 <20200702155427.13372-3-aravind.ramesh@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702155427.13372-3-aravind.ramesh@wdc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jv3nk-001sgH-Kx
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: validate free seg count on
 zns device
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
Cc: matias.bjorling@wdc.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Aravind,

On 07/02, Aravind Ramesh wrote:
> NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> Zone-capacity indicates the number of usable blocks in a zone, if
> zone-capacity is less than zone-size, then the segments which start
> at/after zone-capacity are considered unusable. Only those segments
> which start before the zone-capacity are considered as usable and added
> to the free_segment_count and free_segment_bitmap of the kernel.
> 
> Allow fsck to find the free_segment_count based on the zone-capacity and
> compare with checkpoint values.
> 
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fsck/fsck.c  |  5 ++--
>  fsck/fsck.h  |  2 ++
>  fsck/mount.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 78 insertions(+), 4 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index e110f3d..ba2340d 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -1905,11 +1905,12 @@ int fsck_chk_meta(struct f2fs_sb_info *sbi)
>  		if (IS_NODESEG(se->type))
>  			sit_node_blks += se->valid_blocks;
>  	}
> -	if (fsck->chk.sit_free_segs + sit_valid_segs != TOTAL_SEGS(sbi)) {
> +	if (fsck->chk.sit_free_segs + sit_valid_segs !=
> +				get_usable_seg_count(sbi)) {
>  		ASSERT_MSG("SIT usage does not match: sit_free_segs %u, "
>  				"sit_valid_segs %u, total_segs %u",
>  			fsck->chk.sit_free_segs, sit_valid_segs,
> -			TOTAL_SEGS(sbi));
> +			get_usable_seg_count(sbi));
>  		return -EINVAL;
>  	}
>  
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index bc6a435..e86730c 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -224,6 +224,8 @@ extern u32 update_nat_bits_flags(struct f2fs_super_block *,
>  				struct f2fs_checkpoint *, u32);
>  extern void write_nat_bits(struct f2fs_sb_info *, struct f2fs_super_block *,
>  			struct f2fs_checkpoint *, int);
> +extern unsigned int get_usable_seg_count(struct f2fs_sb_info *);
> +extern bool is_usable_seg(struct f2fs_sb_info *, unsigned int);
>  
>  /* dump.c */
>  struct dump_option {
> diff --git a/fsck/mount.c b/fsck/mount.c
> index d0f2eab..72ca0cb 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -30,6 +30,76 @@
>  #define ACL_OTHER		(0x20)
>  #endif
>  
> +static int get_device_idx(struct f2fs_sb_info *sbi, u_int32_t segno)
> +{
> +	block_t seg_start_blkaddr;
> +	int i;
> +
> +	seg_start_blkaddr = SM_I(sbi)->main_blkaddr +
> +				segno * DEFAULT_BLOCKS_PER_SEGMENT;
> +	for (i = 0; i < c.ndevs; i++)
> +		if (c.devices[i].start_blkaddr <= seg_start_blkaddr &&
> +			c.devices[i].end_blkaddr > seg_start_blkaddr)
> +			return i;
> +	return 0;
> +}
> +
> +#ifdef HAVE_LINUX_BLKZONED_H
> +
> +static int get_zone_idx_from_dev(struct f2fs_sb_info *sbi,
> +					u_int32_t segno, u_int32_t dev_idx)
> +{
> +	block_t seg_start_blkaddr = START_BLOCK(sbi, segno);
> +
> +	return (seg_start_blkaddr - c.devices[dev_idx].start_blkaddr) >>
> +			log_base_2(sbi->segs_per_sec * sbi->blocks_per_seg);
> +}
> +
> +bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
> +{
> +	unsigned int secno = segno / sbi->segs_per_sec;
> +	block_t seg_start = START_BLOCK(sbi, segno);
> +	block_t blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;
> +	unsigned int dev_idx = get_device_idx(sbi, segno);
> +	unsigned int zone_idx = get_zone_idx_from_dev(sbi, segno, dev_idx);
> +	unsigned int sec_off = SM_I(sbi)->main_blkaddr >>
> +						log_base_2(blocks_per_sec);
> +
> +	if (zone_idx < c.devices[dev_idx].nr_rnd_zones)
> +		return true;
> +
> +	if (c.devices[dev_idx].zoned_model != F2FS_ZONED_HM)
> +		return true;
> +
> +	return seg_start < ((sec_off + secno) * blocks_per_sec) +
> +				c.devices[dev_idx].zone_cap_blocks[zone_idx];
> +}
> +
> +unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)
> +{
> +	unsigned int i, usable_seg_count = 0;
> +
> +	for (i = 0; i < TOTAL_SEGS(sbi); i++)
> +		if (is_usable_seg(sbi, i))
> +			usable_seg_count++;
> +
> +	return usable_seg_count;
> +}
> +
> +#else
> +
> +bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)

I've applied the below small change to avoid Android build error.

--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -88,7 +88,7 @@ unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)

 #else

-bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
+bool is_usable_seg(struct f2fs_sb_info *UNUSED(sbi), unsigned int UNUSED(segno))
 {
        return true;
 }

Thanks,

> +{
> +	return true;
> +}
> +
> +unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)
> +{
> +	return TOTAL_SEGS(sbi);
> +}
> +
> +#endif
> +
>  u32 get_free_segments(struct f2fs_sb_info *sbi)
>  {
>  	u32 i, free_segs = 0;
> @@ -37,7 +107,8 @@ u32 get_free_segments(struct f2fs_sb_info *sbi)
>  	for (i = 0; i < TOTAL_SEGS(sbi); i++) {
>  		struct seg_entry *se = get_seg_entry(sbi, i);
>  
> -		if (se->valid_blocks == 0x0 && !IS_CUR_SEGNO(sbi, i))
> +		if (se->valid_blocks == 0x0 && !IS_CUR_SEGNO(sbi, i) &&
> +							is_usable_seg(sbi, i))
>  			free_segs++;
>  	}
>  	return free_segs;
> @@ -2337,7 +2408,7 @@ void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
>  		memcpy(ptr, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
>  		ptr += SIT_VBLOCK_MAP_SIZE;
>  
> -		if (se->valid_blocks == 0x0) {
> +		if (se->valid_blocks == 0x0 && is_usable_seg(sbi, segno)) {
>  			if (le32_to_cpu(sbi->ckpt->cur_node_segno[0]) == segno ||
>  				le32_to_cpu(sbi->ckpt->cur_data_segno[0]) == segno ||
>  				le32_to_cpu(sbi->ckpt->cur_node_segno[1]) == segno ||
> -- 
> 2.19.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
