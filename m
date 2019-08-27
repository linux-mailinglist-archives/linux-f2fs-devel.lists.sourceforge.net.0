Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 063159DB7A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 04:01:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2QnY-000085-GS; Tue, 27 Aug 2019 02:01:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2QnW-00007w-C9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 02:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PutMHo9R9CDNNN5oJK6UVXra0A+FKJVzSX4oIFaHMtg=; b=lgaKk+QvGubRp5zgqktlzlIqlN
 qYXf+GgKNjSH7ZaJLlR0t5nPk3+BLu4zO1FImE34ooIElZz060CJqjVFZnhznRBLYK4aSqIlucpM8
 dlDzq63JStzfB7HpsrHCTIjDjupE99YSPslghf9WvYYXgCrPz4tCjdxPuphwtePDsRC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PutMHo9R9CDNNN5oJK6UVXra0A+FKJVzSX4oIFaHMtg=; b=Md9POP2xBoGYgtG7w44om4xFWa
 MOhdrhkY5MsvkEJ2I60Iry9xFnVwUZl33FaKx4FRtkaWSE+v9PYMNgUzuDmTbz5RnOtOut68IUJrj
 gYO//d6IieMBGm2YwAJGIMpp2BMUKxFlBngEPhne31bvxyZnOsxr6P7UVu1uhbMjW/aY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2QnU-0041nv-5e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 02:01:26 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EF824DAE13A8FD0BA8E9;
 Tue, 27 Aug 2019 10:01:16 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 27 Aug
 2019 10:01:12 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <20190821044802.29702-4-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <930cac20-bd40-9516-2eae-68754b685f72@huawei.com>
Date: Tue, 27 Aug 2019 10:01:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190821044802.29702-4-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i2QnU-0041nv-5e
Subject: Re: [f2fs-dev] [PATCH v2 3/4] fsck.f2fs: Check write pointer
 consistency with current segments
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

On 2019/8/21 12:48, Shin'ichiro Kawasaki wrote:
> On sudden f2fs shutdown, zoned block device status and f2fs current
> segment positions in meta data can be inconsistent. When f2fs shutdown
> happens before write operations completes, write pointers of zoned block
> devices can go further but f2fs meta data keeps current segments at
> positions before the write operations. After remounting the f2fs, the
> inconsistency causes write operations not at write pointers and
> "Unaligned write command" error is reported. This error was observed when
> xfstests test case generic/388 was run with f2fs on a zoned block device.
> 
> To avoid the error, have f2fs.fsck check consistency between each current
> segment's position and the write pointer of the zone the current segment
> points to. If the write pointer goes advance from the current segment,
> fix the current segment position setting at same as the write pointer
> position. In case the write pointer is behind the current segment, write
> zero data at the write pointer position to make write pointer position at
> same as the current segment.
> 
> When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
> ask users to fix them or not. When inconsistencies get fixed, turn on
> 'force' flag in fsck_verify() to enforce fixes in following checks. This
> position fix is done at the beginning of do_fsck() function so that other
> checks reflect the current segment modification.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fsck/fsck.c | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  fsck/fsck.h |   3 ++
>  fsck/main.c |   2 +
>  3 files changed, 138 insertions(+)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 8953ca1..21a06ac 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2574,6 +2574,125 @@ out:
>  	return cnt;
>  }
>  
> +struct write_pointer_check_data {
> +	struct f2fs_sb_info *sbi;
> +	struct device_info *dev;
> +};
> +
> +#define SECTOR_SHIFT 9
> +
> +static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
> +{
> +	struct write_pointer_check_data *wpd = opaque;
> +	struct f2fs_sb_info *sbi = wpd->sbi;
> +	struct device_info *dev = wpd->dev;
> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> +	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
> +	unsigned int zone_segno, wp_segno;
> +	struct seg_entry *se;
> +	struct curseg_info *cs;
> +	int cs_index, ret;
> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> +	void *zero_blk;
> +
> +	if (blk_zone_conv(blkz))
> +		return 0;
> +
> +	zone_block = dev->start_blkaddr
> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
> +	zone_segno = GET_SEGNO(sbi, zone_block);
> +	wp_block = dev->start_blkaddr
> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
> +	wp_segno = GET_SEGNO(sbi, wp_block);
> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
> +
> +	/* find the curseg which points to the zone */
> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
> +		cs = &SM_I(sbi)->curseg_array[cs_index];
> +		if (zone_segno <= cs->segno &&
> +		    cs->segno < zone_segno + segs_per_zone)
> +			break;
> +	}

Will this happen?

- write checkpoint
- curseg points zone A
- write large number of data
- curseg points zone B, write pointer > 0
- sudden power cut, curseg will be reset to zone A

zone B's write pointer won't be verified due to curseg points to zone A?

Thanks,

> +
> +	if (cs_index >= NR_CURSEG_TYPE)
> +		return 0;
> +
> +	/* check write pointer consistency with the curseg in the zone */
> +	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
> +	if (wp_block == cs_block)
> +		return 0;
> +
> +	if (!c.fix_on) {
> +		MSG(0, "Inconsistent write pointer: "
> +		    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> +		    cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
> +		fsck->chk.wp_inconsistent_zones++;
> +		return 0;
> +	}
> +
> +	/*
> +	 * If the curseg is in advance from the write pointer, write zero to
> +	 * move the write pointer forward to the same position as the curseg.
> +	 */
> +	if (wp_block < cs_block) {
> +		ret = 0;
> +		zero_blk = calloc(BLOCK_SZ, 1);
> +		if (!zero_blk)
> +			return -EINVAL;
> +
> +		FIX_MSG("Advance write pointer to match with curseg %d: "
> +			"[0x%x,0x%x]->[0x%x,0x%x]",
> +			cs_index, wp_segno, wp_blkoff,
> +			cs->segno, cs->next_blkoff);
> +		for (b = wp_block; b < cs_block && !ret; b++)
> +			ret = dev_write_block(zero_blk, b);
> +
> +		fsck->chk.wp_fixed_zones++;
> +		free(zero_blk);
> +		return ret;
> +	}
> +
> +	/*
> +	 * If the write pointer is in advance from the curseg, modify the
> +	 * curseg position to be same as the write pointer.
> +	 */
> +	FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
> +		cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
> +	se = get_seg_entry(sbi, wp_segno);
> +	se->type = cs_index;
> +	cs->segno = wp_segno;
> +	cs->next_blkoff = wp_blkoff;
> +	fsck->chk.wp_fixed_zones++;
> +
> +	return 0;
> +}
> +
> +void fsck_chk_write_pointers(struct f2fs_sb_info *sbi)
> +{
> +	unsigned int i;
> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> +	struct write_pointer_check_data wpd = {	sbi, NULL };
> +
> +	if (c.zoned_model != F2FS_ZONED_HM)
> +		return;
> +
> +	for (i = 0; i < MAX_DEVICES; i++) {
> +		if (!c.devices[i].path)
> +			break;
> +
> +		wpd.dev = c.devices + i;
> +		if (f2fs_report_zones(i, fsck_chk_write_pointer, &wpd)) {
> +			printf("[FSCK] Write pointer check failed: %s\n",
> +			       c.devices[i].path);
> +			return;
> +		}
> +	}
> +
> +	if (fsck->chk.wp_fixed_zones && c.fix_on)
> +		write_curseg_info(sbi);
> +}
> +
>  int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
>  {
>  	struct curseg_info *curseg;
> @@ -2624,6 +2743,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  
>  	printf("\n");
>  
> +	if (c.zoned_model == F2FS_ZONED_HM) {
> +		printf("[FSCK] Write pointers consistency                    ");
> +		if (fsck->chk.wp_inconsistent_zones == 0x0) {
> +			printf(" [Ok..]\n");
> +		} else {
> +			printf(" [Fail] [0x%x]\n",
> +			       fsck->chk.wp_inconsistent_zones);
> +			c.bug_on = 1;
> +		}
> +
> +		if (fsck->chk.wp_fixed_zones && c.fix_on)
> +			force = 1;
> +	}
> +
>  	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
>  		for (i = 0; i < fsck->nr_nat_entries; i++)
>  			if (f2fs_test_bit(i, fsck->nat_area_bitmap) != 0)
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index d38e8de..aa3dbe7 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -80,6 +80,8 @@ struct f2fs_fsck {
>  		u32 multi_hard_link_files;
>  		u64 sit_valid_blocks;
>  		u32 sit_free_segs;
> +		u32 wp_fixed_zones;
> +		u32 wp_inconsistent_zones;
>  	} chk;
>  
>  	struct hard_link_node *hard_link_list_head;
> @@ -156,6 +158,7 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
>  		struct child_info *);
>  void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
>  int fsck_chk_meta(struct f2fs_sb_info *sbi);
> +void fsck_chk_write_pointers(struct f2fs_sb_info *);
>  int fsck_chk_curseg_info(struct f2fs_sb_info *);
>  void pretty_print_filename(const u8 *raw_name, u32 len,
>  			   char out[F2FS_PRINT_NAMELEN], int enc_name);
> diff --git a/fsck/main.c b/fsck/main.c
> index 9aca024..4b4a789 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -584,6 +584,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>  
>  	print_cp_state(flag);
>  
> +	fsck_chk_write_pointers(sbi);
> +
>  	fsck_chk_curseg_info(sbi);
>  
>  	if (!c.fix_on && !c.bug_on) {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
