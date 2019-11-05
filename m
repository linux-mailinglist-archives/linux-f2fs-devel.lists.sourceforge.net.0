Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFECEFD1A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 13:23:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRxrW-00064H-V7; Tue, 05 Nov 2019 12:23:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iRxrV-00064A-Pu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 12:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YzN40PzCyVApWPQbcevjyzVDctNXcX6etzK74kc+KIo=; b=AuKExoEJiOTmH5IFv8pJC3Fdbz
 lzs6k1L8g6I4uD5fNXTQ+PmbvZZNRhvcHCQeXnQnPjWTIyrQIuUozinpyXSfFKN4jele2I2/LVZTn
 2MnAFksb3Gq3LB8Gcoz6Oe5KG7CjkWl9MYHzCpATvq5PErqQnZlVkWkuo98SgR+QmlbA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YzN40PzCyVApWPQbcevjyzVDctNXcX6etzK74kc+KIo=; b=fOV03iFrlB/XZqLNeXSWMlmh6K
 TXVmce88yJ3W60D9IoE+wAopE0W3gn+MCMLi4dxUSWF3UsAW0XkH+RDOPL6v1eBK5IH0beoT3CeHb
 6iWyrjcj/hyUKYksM3xOIW1IlKovqB0jjtf+Z4vuQG7vWZdel8xRq063DfN1893o+08w=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRxrR-000r7A-76
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 12:23:05 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A06DF76CC894DC939062;
 Tue,  5 Nov 2019 20:22:51 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 20:22:50 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191028065801.28220-1-shinichiro.kawasaki@wdc.com>
 <20191028065801.28220-3-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <673218f1-ced2-132e-a91a-7554b6aad1d9@huawei.com>
Date: Tue, 5 Nov 2019 20:22:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191028065801.28220-3-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRxrR-000r7A-76
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Check write pointer consistency
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

On 2019/10/28 14:58, Shin'ichiro Kawasaki wrote:
> To catch f2fs bugs in write pointer handling code for zoned block
> devices, check write pointers of non-open zones that current segments do
> not point to. Do this check at mount time, after the fsync data recovery
> and current segments' write pointer consistency fix. Check two items
> comparing write pointers with valid block maps in SIT.
> 
> The first item is check for zones with no valid blocks. When there is no
> valid blocks in a zone, the write pointer should be at the start of the
> zone. If not, next write operation to the zone will cause unaligned write
> error. If write pointer is not at the zone start, make mount fail and ask
> users to run fsck.
> 
> The second item is check between the write pointer position and the last
> valid block in the zone. It is unexpected that the last valid block
> position is beyond the write pointer. In such a case, report as the bug.
> Fix is not required for such zone, because the zone is not selected for
> next write operation until the zone get discarded.
> 
> Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
> in segment.c also.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fs/f2fs/f2fs.h    |   3 +
>  fs/f2fs/segment.c | 147 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/super.c   |  11 ++--
>  3 files changed, 157 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0216282c5b80..e8524be17852 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
>  			unsigned int val, int alloc);
>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only);
> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
>  int __init f2fs_create_segment_manager_caches(void);
> @@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
>  
>  	return test_bit(zno, FDEV(devi).blkz_seq);
>  }
> +
> +#define F2FS_REPORT_NR_ZONES   4096
>  #endif
>  
>  static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 2b6e637dd6d3..20ef5b3705e1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4333,6 +4333,131 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  
> +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
> +				    struct f2fs_dev_info *fdev,
> +				    struct blk_zone *zone)
> +{
> +	unsigned int s, wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
> +	block_t zone_block, wp_block, last_valid_block, b;
> +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> +	int i;
> +	struct seg_entry *se;
> +
> +	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
> +	wp_segno = GET_SEGNO(sbi, wp_block);
> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> +	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
> +	zone_segno = GET_SEGNO(sbi, zone_block);
> +	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
> +
> +	if (zone_segno >= MAIN_SEGS(sbi))
> +		return 0;
> +
> +	/*
> +	 * If a curseg points to the zone, skip check because the zone
> +	 * may have fsync data that valid block map does not mark.

None-curseg zone may also contain fsynced data as well? Maybe we can only verify
on clean image or recovered image?

> +	 */
> +	for (i = 0; i < NO_CHECK_TYPE; i++)
> +		if (zone_secno == GET_SEC_FROM_SEG(sbi,
> +						   CURSEG_I(sbi, i)->segno))
> +			return 0;
> +
> +	/*
> +	 * Get last valid block of the zone.
> +	 */
> +	last_valid_block = zone_block - 1;
> +	for (s = 0; s < sbi->segs_per_sec; s++) {
> +		segno = zone_segno + s;
> +		se = get_seg_entry(sbi, segno);
> +		for (b = 0; b < sbi->blocks_per_seg; b++)
> +			if (f2fs_test_bit(b, se->cur_valid_map))
> +				last_valid_block = START_BLOCK(sbi, segno) + b;
> +	}

We search bitmap table reversedly.

> +
> +	/*
> +	 * If last valid block is beyond the write pointer, report the
> +	 * inconsistency. This inconsistency does not cause write error
> +	 * because the zone will not be selected for write operation until
> +	 * it get discarded. Just report it.
> +	 */
> +	if (last_valid_block >= wp_block) {
> +		f2fs_notice(sbi, "Valid block beyond write pointer: "
> +			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
> +			    GET_SEGNO(sbi, last_valid_block),
> +			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
> +			    wp_segno, wp_blkoff);
> +		return 0;
> +	}
> +
> +	/*
> +	 * If there is no valid block in the zone and if write pointer is
> +	 * not at zone start, report the error to run fsck and mark the
> +	 * zone as used.
> +	 */
> +	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
> +		f2fs_notice(sbi,
> +			    "Zone without valid block has non-zero write "
> +			    "pointer, run fsck to fix: wp[0x%x,0x%x]",
> +			    wp_segno, wp_blkoff);
> +		__set_inuse(sbi, zone_segno);

Why do we need to set it inused? if this is necessary, we need to call this
under free_i->segmap_lock.

Thanks,

> +		f2fs_stop_checkpoint(sbi, true);
> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int check_dev_write_pointer(struct f2fs_sb_info *sbi,
> +				   struct f2fs_dev_info *fdev) {
> +	sector_t nr_sectors = fdev->bdev->bd_part->nr_sects;
> +	sector_t sector = 0;
> +	struct blk_zone *zones;
> +	unsigned int i, nr_zones;
> +	unsigned int n = 0;
> +	int err = -EIO;
> +
> +	if (!bdev_is_zoned(fdev->bdev))
> +		return 0;
> +
> +	zones = f2fs_kzalloc(sbi,
> +			     array_size(F2FS_REPORT_NR_ZONES,
> +					sizeof(struct blk_zone)),
> +			     GFP_KERNEL);
> +	if (!zones)
> +		return -ENOMEM;
> +
> +	/* Get block zones type */
> +	while (zones && sector < nr_sectors) {
> +
> +		nr_zones = F2FS_REPORT_NR_ZONES;
> +		err = blkdev_report_zones(fdev->bdev, sector, zones, &nr_zones);
> +		if (err)
> +			break;
> +		if (!nr_zones) {
> +			err = -EIO;
> +			break;
> +		}
> +
> +		for (i = 0; i < nr_zones; i++) {
> +			if (zones[i].type == BLK_ZONE_TYPE_SEQWRITE_REQ) {
> +				err = check_zone_write_pointer(sbi, fdev,
> +							       &zones[i]);
> +				if (err)
> +					break;
> +			}
> +			sector += zones[i].len;
> +			n++;
> +		}
> +		if (err)
> +			break;
> +	}
> +
> +	kvfree(zones);
> +
> +	return err;
> +}
> +
>  static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
>  						  block_t zone_blkaddr)
>  {
> @@ -4404,6 +4529,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type,
>  		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
>  	allocate_segment_by_default(sbi, type, true);
>  
> +	/* check consistency of the zone curseg pointed to */
> +	if (check_zone_write_pointer(sbi, zbd, &zone))
> +		return -EIO;
> +
>  	/* check newly assigned zone */
>  	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
>  	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
> @@ -4451,11 +4580,29 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only)
>  
>  	return 0;
>  }
> +
> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < sbi->s_ndevs; i++) {
> +		ret = check_dev_write_pointer(sbi, &FDEV(i));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
>  #else
>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only)
>  {
>  	return 0;
>  }
> +
> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
> +{
> +	return 0;
> +}
>  #endif
>  
>  /*
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ebd0ae02a260..357b8f7fd333 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2890,8 +2890,6 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>  	if (!FDEV(devi).blkz_seq)
>  		return -ENOMEM;
>  
> -#define F2FS_REPORT_NR_ZONES   4096
> -
>  	zones = f2fs_kzalloc(sbi,
>  			     array_size(F2FS_REPORT_NR_ZONES,
>  					sizeof(struct blk_zone)),
> @@ -3509,7 +3507,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  		err = f2fs_recover_fsync_data(sbi, false);
>  		if (err < 0) {
> -			if (err != -ENOMEM)
> +			if (err != -ENOMEM &&
> +			    !is_sbi_flag_set(sbi, SBI_NEED_FSCK))
>  				skip_recovery = true;
>  			need_fsck = true;
>  			f2fs_err(sbi, "Cannot recover all fsync data errno=%d",
> @@ -3526,8 +3525,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		}
>  	}
>  
> -	/* check zoned block devices' write pointer consistency */
> +	/* fix and check zoned block devices' write pointer consistency */
>  	if (f2fs_sb_has_blkzoned(sbi)) {
> +		err = f2fs_check_write_pointer(sbi);
> +		if (err)
> +			goto free_meta;
> +
>  		err = f2fs_fix_curseg_write_pointer(sbi, f2fs_readonly(sb));
>  		if (err)
>  			goto free_meta;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
