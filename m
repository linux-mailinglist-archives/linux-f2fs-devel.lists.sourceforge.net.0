Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877C116979
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 10:36:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieFT7-0007b2-MJ; Mon, 09 Dec 2019 09:36:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ieFT5-0007au-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 09:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KIHVjyl4B3eDix21V3DIKehX0EOLvlJYziFMznubadg=; b=eh4hCB7H3EXnmGlal6dwvwpC6w
 bDuL6GPFu2iV7leb+Ckj3PEa0P4/g8QuNnzDU1L+TZQ6/v+1H0WxhbztNL5yiCodpsEAlHaIhMVhG
 lNqnO/ZhxY30hotaZXk26gSsUpXUSyZ+cHKcCVKnmlI4joxiN5LvgYlB0oskaD0aeZiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KIHVjyl4B3eDix21V3DIKehX0EOLvlJYziFMznubadg=; b=Jkz3JWIcGoKPJ4PgL9yKfN+lnU
 soMvKAQRKIbTn8h9U4Ui9kB5Wfbsh1IrRxojxlisHhLlyG6l4/+h/RDdtoKTpJspDCTFHh6UT06Uf
 +8KrHr5qNU752Qp4boV+4V2YwookX+6yiF87v3tDRT/Td2LaZZho2Nl0N1wC/rDZE810=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieFT2-00FFZO-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 09:36:39 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 71AF6C5C1C4B8E41D1ED;
 Mon,  9 Dec 2019 17:36:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Dec 2019
 17:36:24 +0800
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20191202094043.892258-1-shinichiro.kawasaki@wdc.com>
 <20191202094043.892258-3-shinichiro.kawasaki@wdc.com>
 <bb00d068-9ad5-4685-1745-ba485ee5c2ad@huawei.com>
 <20191209072831.2abtj3yiebzdbwzd@shindev.dhcp.fujisawa.hgst.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <869ca2fe-f69f-3dcf-08a4-5f865b8662d9@huawei.com>
Date: Mon, 9 Dec 2019 17:36:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191209072831.2abtj3yiebzdbwzd@shindev.dhcp.fujisawa.hgst.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieFT2-00FFZO-Ey
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: Check write pointer consistency
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/12/9 15:28, Shinichiro Kawasaki wrote:
> On Dec 09, 2019 / 10:04, Chao Yu wrote:
>> On 2019/12/2 17:40, Shin'ichiro Kawasaki wrote:
>>> To catch f2fs bugs in write pointer handling code for zoned block
>>> devices, check write pointers of non-open zones that current segments do
>>> not point to. Do this check at mount time, after the fsync data recovery
>>> and current segments' write pointer consistency fix. Or when fsync data
>>> recovery is disabled by mount option, do the check when there is no fsync
>>> data.
>>>
>>> Check two items comparing write pointers with valid block maps in SIT.
>>> The first item is check for zones with no valid blocks. When there is no
>>> valid blocks in a zone, the write pointer should be at the start of the
>>> zone. If not, next write operation to the zone will cause unaligned write
>>> error. If write pointer is not at the zone start, reset the write pointer
>>> to place at the zone start.
>>>
>>> The second item is check between the write pointer position and the last
>>> valid block in the zone. It is unexpected that the last valid block
>>> position is beyond the write pointer. In such a case, report as a bug.
>>> Fix is not required for such zone, because the zone is not selected for
>>> next write operation until the zone get discarded.
>>>
>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>>> ---
>>>  fs/f2fs/f2fs.h    |   1 +
>>>  fs/f2fs/segment.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++
>>>  fs/f2fs/super.c   |  11 ++++
>>>  3 files changed, 138 insertions(+)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 002c417b0a53..23a84d7f17b8 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -3156,6 +3156,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
>>>  			unsigned int val, int alloc);
>>>  void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
>>>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
>>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
>>>  int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
>>>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
>>>  int __init f2fs_create_segment_manager_caches(void);
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index 9b6c7ab67b93..48903b7a9d25 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -4370,6 +4370,90 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
>>>  
>>>  #ifdef CONFIG_BLK_DEV_ZONED
>>>  
>>> +static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
>>> +				    struct f2fs_dev_info *fdev,
>>> +				    struct blk_zone *zone)
>>> +{
>>> +	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
>>> +	block_t zone_block, wp_block, last_valid_block;
>>> +	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
>>> +	int i, s, b, ret;
>>> +	struct seg_entry *se;
>>> +
>>> +	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
>>> +		return 0;
>>> +
>>> +	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
>>> +	wp_segno = GET_SEGNO(sbi, wp_block);
>>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
>>> +	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
>>> +	zone_segno = GET_SEGNO(sbi, zone_block);
>>> +	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
>>> +
>>> +	if (zone_segno >= MAIN_SEGS(sbi))
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * Skip check of zones cursegs point to, since
>>> +	 * fix_curseg_write_pointer() checks them.
>>> +	 */
>>> +	for (i = 0; i < NO_CHECK_TYPE; i++)
>>> +		if (zone_secno == GET_SEC_FROM_SEG(sbi,
>>> +						   CURSEG_I(sbi, i)->segno))
>>> +			return 0;
>>> +
>>> +	/*
>>> +	 * Get last valid block of the zone.
>>> +	 */
>>> +	last_valid_block = zone_block - 1;
>>> +	for (s = sbi->segs_per_sec - 1; s >= 0; s--) {
>>> +		segno = zone_segno + s;
>>> +		se = get_seg_entry(sbi, segno);
>>> +		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
>>> +			if (f2fs_test_bit(b, se->cur_valid_map)) {
>>> +				last_valid_block = START_BLOCK(sbi, segno) + b;
>>> +				break;
>>> +			}
>>> +		if (last_valid_block >= zone_block)
>>> +			break;
>>> +	}
>>> +
>>> +	/*
>>> +	 * If last valid block is beyond the write pointer, report the
>>> +	 * inconsistency. This inconsistency does not cause write error
>>> +	 * because the zone will not be selected for write operation until
>>> +	 * it get discarded. Just report it.
>>> +	 */
>>> +	if (last_valid_block >= wp_block) {
>>> +		f2fs_notice(sbi, "Valid block beyond write pointer: "
>>> +			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
>>> +			    GET_SEGNO(sbi, last_valid_block),
>>> +			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
>>> +			    wp_segno, wp_blkoff);
>>> +		return 0;
>>> +	}
>>> +
>>> +	/*
>>> +	 * If there is no valid block in the zone and if write pointer is
>>> +	 * not at zone start, reset the write pointer.
>>> +	 */
>>> +	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
>>> +		f2fs_notice(sbi,
>>> +			    "Zone without valid block has non-zero write "
>>> +			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
>>> +			    wp_segno, wp_blkoff);
>>> +		ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_RESET,
>>> +				       zone->start, zone->len, GFP_NOFS);
>>
>> Should use __f2fs_issue_discard_zone() to cover multi-device support?
> 
> Yes, __f2fs_issue_discard_zone() for each device adds more check and I think
> it is safer for multi-device case. Will re-post the patch with you suggest.
> 
>>
>>> +		if (ret) {
>>> +			f2fs_notice(sbi, "Reset zone failed: %s (errno=%d)",
>>> +				    fdev->path, ret);
>>> +			return ret;
>>> +		}
>>
>> Just out of curiosity, how long will RESET command take normally?
> 
> Though I don't have accurate numbers, it takes around 10 milliseconds to
> complete one RESET command for one zone with my system. Assuming the number

Okay, as RESET command cover large-sized area, I guess we can afford such delay
during mount(), what I'm concerning is we will trigger synchoronous RESET
command during checkpoint(), as we will unlock cp_rwsem after handling RESET
command, so it potentially hangs fs operations long time once there is many
pending RESET commands, maybe we can improve RESET command handling like we did
for discard, anyway it's another topic.

Thanks,

> of zones to discard here is small, I think the additional overhead is small
> enough to ignore.
> 
> Thanks!
> 
>>
>> Thanks,
>>
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
>>>  						  block_t zone_blkaddr)
>>>  {
>>> @@ -4442,6 +4526,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
>>>  		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
>>>  	allocate_segment_by_default(sbi, type, true);
>>>  
>>> +	/* check consistency of the zone curseg pointed to */
>>> +	if (check_zone_write_pointer(sbi, zbd, &zone))
>>> +		return -EIO;
>>> +
>>>  	/* check newly assigned zone */
>>>  	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
>>>  	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
>>> @@ -4492,11 +4580,49 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
>>>  
>>>  	return 0;
>>>  }
>>> +
>>> +struct check_zone_write_pointer_args {
>>> +	struct f2fs_sb_info *sbi;
>>> +	struct f2fs_dev_info *fdev;
>>> +};
>>> +
>>> +static int check_zone_write_pointer_cb(struct blk_zone *zone, unsigned int idx,
>>> +				      void *data) {
>>> +	struct check_zone_write_pointer_args *args;
>>> +	args = (struct check_zone_write_pointer_args *)data;
>>> +
>>> +	return check_zone_write_pointer(args->sbi, args->fdev, zone);
>>> +}
>>> +
>>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
>>> +{
>>> +	int i, ret;
>>> +	struct check_zone_write_pointer_args args;
>>> +
>>> +	for (i = 0; i < sbi->s_ndevs; i++) {
>>> +		if (!bdev_is_zoned(FDEV(i).bdev))
>>> +			continue;
>>> +
>>> +		args.sbi = sbi;
>>> +		args.fdev = &FDEV(i);
>>> +		ret = blkdev_report_zones(FDEV(i).bdev, 0, BLK_ALL_ZONES,
>>> +					  check_zone_write_pointer_cb, &args);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>>  #else
>>>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
>>>  {
>>>  	return 0;
>>>  }
>>> +
>>> +int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
>>> +{
>>> +	return 0;
>>> +}
>>>  #endif
>>>  
>>>  /*
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 5111e1ffe58a..755ad57c795b 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -3544,6 +3544,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>>  			goto free_meta;
>>>  		}
>>>  	}
>>> +
>>> +	/*
>>> +	 * If the f2fs is not readonly and fsync data recovery succeeds,
>>> +	 * check zoned block devices' write pointer consistency.
>>> +	 */
>>> +	if (!err && !f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
>>> +		err = f2fs_check_write_pointer(sbi);
>>> +		if (err)
>>> +			goto free_meta;
>>> +	}
>>> +
>>>  reset_checkpoint:
>>>  	/* f2fs_recover_fsync_data() cleared this already */
>>>  	clear_sbi_flag(sbi, SBI_POR_DOING);
>>>
> 
> --
> Best Regards,
> Shin'ichiro Kawasaki.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
