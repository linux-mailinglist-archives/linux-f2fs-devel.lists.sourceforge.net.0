Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D299DEFC6F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 12:32:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRx4a-0003wt-F3; Tue, 05 Nov 2019 11:32:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iRx4Y-0003wl-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 11:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TrI2ETFyYjPyxgFX6gjRjL6kmRWrmO8NbA4GaW7Aafg=; b=g7734KvmYW6g1imtwk22Kr9zHj
 NegO0KfUzR4tjnwfC/PGZpj0Se1D8Ee/+WQ7l2RTS4Q5P6JB6JhbsMFc8PslWvek6Y4gdC1/E2ZVT
 8/+MMNh7lBVcJiZRr5EBfHGCgeKbou9YRZXS2X9Jhqqy0k3yfN1ixSPDqWp5lzJ2dWWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TrI2ETFyYjPyxgFX6gjRjL6kmRWrmO8NbA4GaW7Aafg=; b=NB+knl0YLAqIfwAR1Of4fdwspz
 c4dtE7uSCIKZYNIqsfFn0LOIretzJK5UkJelDQWjdhC4ADKZNMb0bO3elH8Q1y4PF5+0Y18rOH1ZA
 KLJ+VKVQUwgm5DwbDBtczmdMoc0hlvyDnHBe0UnEbkvODnKpoFJOHFktGHtbrWWkxZRE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRx4W-000oHS-U5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 11:32:30 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CD49A7C08FDDD1FC99E3;
 Tue,  5 Nov 2019 19:32:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 19:32:16 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
 <20191028065512.27876-9-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9e4646fb-6c16-b0f6-7fa8-8099018f19ed@huawei.com>
Date: Tue, 5 Nov 2019 19:32:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191028065512.27876-9-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRx4W-000oHS-U5
Subject: Re: [f2fs-dev] [PATCH v6 8/8] fsck: Check write pointer consistency
 of non-open zones
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/28 14:55, Shin'ichiro Kawasaki wrote:
> To catch f2fs bug in write pointer handling code for zoned block devices,
> have fsck check consistency of write pointers of non-open zones, that
> current segments do not point to. Check two items comparing write pointer
> positions with valid block maps in SIT.
> 
> The first item is check for zones with no valid blocks. When there is no
> valid blocks in a zone, the write pointer should be at the start of the
> zone. If not, next write operation to the zone will cause unaligned write
> error. If write pointer is not at the zone start, reset the zone to move
> the write pointer to the zone start.
> 
> The second item is check between write pointer position and the last
> valid block in the zone. It is unexpected that the last valid block
> position is beyond the write pointer. In such a case, report as the bug.
> Fix is not required for such zone, because the zone is not selected for
> next write operation until the zone get discarded.
> 
> In the same manner as the consistency check for current segments, do the
> check and fix twice: at the beginning of do_fsck() to avoid unaligned
> write error during fsck, and at fsck_verify() to reflect meta data
> updates by fsck.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fsck/fsck.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index e0eda4e..8400929 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2751,6 +2751,122 @@ out:
>  	return cnt;
>  }
>  
> +#ifdef HAVE_LINUX_BLKZONED_H
> +
> +struct write_pointer_check_data {
> +	struct f2fs_sb_info *sbi;
> +	int dev_index;
> +};
> +
> +static int chk_and_fix_wp_with_sit(int i, void *blkzone, void *opaque)
> +{
> +	struct blk_zone *blkz = (struct blk_zone *)blkzone;
> +	struct write_pointer_check_data *wpd = opaque;
> +	struct f2fs_sb_info *sbi = wpd->sbi;
> +	struct device_info *dev = c.devices + wpd->dev_index;
> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> +	block_t zone_block, wp_block, wp_blkoff;
> +	unsigned int zone_segno, wp_segno;
> +	struct curseg_info *cs;
> +	int cs_index, ret, last_valid_blkoff;
> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> +
> +	if (blk_zone_conv(blkz))
> +		return 0;
> +
> +	zone_block = dev->start_blkaddr
> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> +	zone_segno = GET_SEGNO(sbi, zone_block);
> +	if (zone_segno >= MAIN_SEGS(sbi))
> +		return 0;
> +
> +	wp_block = dev->start_blkaddr
> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> +	wp_segno = GET_SEGNO(sbi, wp_block);
> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> +
> +	/* if a curseg points to the zone, skip the check */
> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> +		cs = &SM_I(sbi)->curseg_array[cs_index];
> +		if (zone_segno <= cs->segno &&
> +		    cs->segno < zone_segno + segs_per_zone)
> +			return 0;
> +	}
> +
> +	last_valid_blkoff = last_vblk_off_in_zone(sbi, zone_segno);
> +
> +	/*
> +	 * When there is no valid block in the zone, check write pointer is
> +	 * at zone start. If not, reset the write pointer.
> +	 */
> +	if (last_valid_blkoff < 0 &&
> +	    blk_zone_wp_sector(blkz) != blk_zone_sector(blkz)) {
> +		if (!c.fix_on) {
> +			MSG(0, "Inconsistent write pointer: wp[0x%x,0x%x]\n",
> +			    wp_segno, wp_blkoff);
> +			fsck->chk.wp_inconsistent_zones++;
> +			return 0;
> +		}
> +
> +		FIX_MSG("Reset write pointer of zone at segment 0x%x",
> +			zone_segno);
> +		ret = f2fs_reset_zone(wpd->dev_index, blkz);
> +		if (ret) {
> +			printf("[FSCK] Write pointer reset failed: %s\n",
> +			       dev->path);
> +			return ret;
> +		}
> +		fsck->chk.wp_fixed = 1;
> +		return 0;
> +	}
> +
> +	/*
> +	 * If valid blocks exist in the zone beyond the write pointer, it
> +	 * is a f2fs bug. No need to fix because the zone is not selected

Minor thing, mostly probably it is a f2fs bug, however there should be
software/hardware bug in other layer can cause such inconsistent.. so let's get
rid of such first impression. :)

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> +	 * for the write. Just report it.
> +	 */
> +	if (last_valid_blkoff + zone_block > wp_block) {
> +		MSG(0, "Unexpected invalid write pointer: wp[0x%x,0x%x]\n",
> +		    wp_segno, wp_blkoff);
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static void fix_wp_sit_alignment(struct f2fs_sb_info *sbi)
> +{
> +	unsigned int i;
> +	struct write_pointer_check_data wpd = {	sbi, 0 };
> +
> +	if (c.zoned_model != F2FS_ZONED_HM)
> +		return;
> +
> +	for (i = 0; i < MAX_DEVICES; i++) {
> +		if (!c.devices[i].path)
> +			break;
> +		if (c.devices[i].zoned_model != F2FS_ZONED_HM)
> +			break;
> +
> +		wpd.dev_index = i;
> +		if (f2fs_report_zones(i, chk_and_fix_wp_with_sit, &wpd)) {
> +			printf("[FSCK] Write pointer check failed: %s\n",
> +			       c.devices[i].path);
> +			return;
> +		}
> +	}
> +}
> +
> +#else
> +
> +static void fix_wp_sit_alignment(struct f2fs_sb_info *sbi)
> +{
> +	return;
> +}
> +
> +#endif
> +
>  /*
>   * Check and fix consistency with write pointers at the beginning of
>   * fsck so that following writes by fsck do not fail.
> @@ -2766,6 +2882,8 @@ void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
>  		fix_curseg_info(sbi);
>  		fsck->chk.wp_fixed = 1;
>  	}
> +
> +	fix_wp_sit_alignment(sbi);
>  }
>  
>  int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
> @@ -2984,6 +3102,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  			fix_hard_links(sbi);
>  			fix_nat_entries(sbi);
>  			rewrite_sit_area_bitmap(sbi);
> +			fix_wp_sit_alignment(sbi);
>  			fix_curseg_info(sbi);
>  			fix_checksum(sbi);
>  			fix_checkpoints(sbi);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
