Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E2EFC06
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 12:06:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRwfG-0002gE-TJ; Tue, 05 Nov 2019 11:06:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iRwfF-0002g4-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 11:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZNqLbLRgCWpHin/zyIQkUzvQbcgB5D1dStj9IrNdQo4=; b=So8BZvh+xmYZHH92IYVRPQlNrc
 K/iVVW58d73k0DZ0QYmAlRhXDoWGqIcW18b67AaxUfZw36eWQmb9JA6W5VHEKL8eN2kvdr77pU9bC
 vaJjff0szj4Rr4TW48f4ePQa0Pw7P1YXSmfLqCWnhPV8WbF+jDXbjExbjeTx6Xmb2c0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZNqLbLRgCWpHin/zyIQkUzvQbcgB5D1dStj9IrNdQo4=; b=UPFMYnAT/uAfxblSwjjlCT4Eba
 WszLivWAIEkWoAiiaowdHTO3mq4RHUwd3lwUnEg6K6v3R5ESfzK9yKT+AKgu3Y/m1cMLcJP7mvHE+
 IZLXdICU1Q62bAeLqSUndoHBhmZafbDBfqvWa2cSEv1HZ7nWSphKw5at8YR2JG1hKlUY=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRwfC-0015Dc-Lt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 11:06:21 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EFF2F636EABF8DBF48A9;
 Tue,  5 Nov 2019 19:06:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 19:06:05 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
 <20191028065512.27876-8-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a7c0f0e1-390f-636d-ac96-7644ecf29779@huawei.com>
Date: Tue, 5 Nov 2019 19:06:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191028065512.27876-8-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRwfC-0015Dc-Lt
Subject: Re: [f2fs-dev] [PATCH v6 7/8] fsck: Check write pointer consistency
 of open zones
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
> On sudden f2fs shutdown, write pointers of zoned block devices can go
> further but f2fs meta data keeps current segments at positions before the
> write operations. After remounting the f2fs, this inconsistency causes
> write operations not at write pointers and "Unaligned write command"
> error is reported.
> 
> To avoid the error, have f2fs.fsck check consistency of write pointers
> of open zones that current segments point to. Compare each current
> segment's position and the write pointer position of the open zone. If
> inconsistency is found and 'fix_on' flag is set, assign a new zone to the
> current segment and check the newly assigned zone has write pointer at
> the zone start. Leave the original zone as is to keep data recorded in
> it.
> 
> To care about fsync data, refer each seg_entry's ckpt_valid_map to get
> the last valid block in the zone. If the last valid block is beyond the
> current segments position, fsync data exits in the zone. In case fsync
> data exists, do not assign a new zone to the current segment not to lose
> the fsync data. It is expected that the kernel replay the fsync data and
> fix the write pointer inconsistency at mount time.
> 
> Also check consistency between write pointer of the zone the current
> segment points to with valid block maps of the zone. If the last valid
> block is beyond the write pointer position, report to indicate f2fs bug.
> If 'fix_on' flag is set, assign a new zone to the current segment.
> 
> When inconsistencies are found, turn on 'bug_on' flag in fsck_verify() to
> ask users to fix them or not. When inconsistencies get fixed, turn on
> 'force' flag in fsck_verify() to enforce fixes in following checks.
> 
> This check and fix is done twice. The first is done at the beginning of
> do_fsck() function so that other fixes can reflect the current segment
> modification. The second is done in fsck_verify() to reflect updated meta
> data by other fixes.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  fsck/f2fs.h  |   5 ++
>  fsck/fsck.c  | 154 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  fsck/fsck.h  |   3 +
>  fsck/main.c  |   2 +
>  fsck/mount.c |  49 +++++++++++++++-
>  5 files changed, 212 insertions(+), 1 deletion(-)
> 
> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> index 399c74d..07513cb 100644
> --- a/fsck/f2fs.h
> +++ b/fsck/f2fs.h
> @@ -429,6 +429,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
>  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
>  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (sbi->blocks_per_seg - 1))
>  
> +#define GET_SEC_FROM_SEG(sbi, segno)					\
> +	((segno) / (sbi)->segs_per_sec)
> +#define GET_SEG_FROM_SEC(sbi, secno)					\
> +	((secno) * (sbi)->segs_per_sec)
> +
>  #define FREE_I_START_SEGNO(sbi)						\
>  	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
>  #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 2ae3bd5..e0eda4e 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2181,6 +2181,125 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
>  	fix_checkpoint(sbi);
>  }
>  
> +#ifdef HAVE_LINUX_BLKZONED_H
> +
> +/*
> + * Refer valid block map and return offset of the last valid block in the zone.
> + * Obtain valid block map from SIT and fsync data.
> + * If there is no valid block in the zone, return -1.
> + */
> +static int last_vblk_off_in_zone(struct f2fs_sb_info *sbi,
> +				 unsigned int zone_segno)
> +{
> +	unsigned int s;
> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
> +	struct seg_entry *se;
> +	block_t b;
> +	int ret = -1;
> +
> +	for (s = 0; s < segs_per_zone; s++) {
> +		se = get_seg_entry(sbi, zone_segno + s);
> +
> +		/*
> +		 * Refer not cur_valid_map but ckpt_valid_map which reflects
> +		 * fsync data.
> +		 */
> +		ASSERT(se->ckpt_valid_map);
> +		for (b = 0; b < sbi->blocks_per_seg; b++)
> +			if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map))
> +				ret = b + (s << sbi->log_blocks_per_seg);

Minor thing, I guess we only need to find last valid block in target zone?

int s, b;

for (s = segs_per_zone - 1; s >= 0; s--) {
	for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
		if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map)) {
			ret = b + (s << sbi->log_blocks_per_seg);
			break;
		}
}

> +	}
> +
> +	return ret;
> +}
> +
> +static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> +{
> +	struct curseg_info *curseg = CURSEG_I(sbi, type);
> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> +	struct blk_zone blkz;
> +	block_t cs_block, wp_block, zone_last_vblock;
> +	u_int64_t cs_sector, wp_sector;
> +	int i, ret;
> +	unsigned int zone_segno;
> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> +
> +	/* get the device the curseg points to */
> +	cs_block = START_BLOCK(sbi, curseg->segno) + curseg->next_blkoff;
> +	for (i = 0; i < MAX_DEVICES; i++) {
> +		if (!c.devices[i].path)
> +			break;
> +		if (c.devices[i].start_blkaddr <= cs_block &&
> +		    cs_block <= c.devices[i].end_blkaddr)
> +			break;
> +	}
> +
> +	if (i >= MAX_DEVICES)
> +		return -EINVAL;
> +
> +	/* get write pointer position of the zone the curseg points to */
> +	cs_sector = (cs_block - c.devices[i].start_blkaddr)
> +		<< log_sectors_per_block;
> +	ret = f2fs_report_zone(i, cs_sector, &blkz);
> +	if (ret)
> +		return ret;
> +
> +	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
> +		return 0;
> +
> +	/* check consistency between the curseg and the write pointer */
> +	wp_block = c.devices[i].start_blkaddr +
> +		(blk_zone_wp_sector(&blkz) >> log_sectors_per_block);
> +	wp_sector = blk_zone_wp_sector(&blkz);
> +
> +	if (cs_sector == wp_sector)
> +		return 0;
> +
> +	if (cs_sector > wp_sector) {
> +		MSG(0, "Inconsistent write pointer with curseg %d: "
> +		    "curseg %d[0x%x,0x%x] > wp[0x%x,0x%x]\n",
> +		    type, type, curseg->segno, curseg->next_blkoff,
> +		    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> +		fsck->chk.wp_inconsistent_zones++;
> +		return -EINVAL;
> +	}
> +
> +	MSG(0, "Write pointer goes advance from curseg %d: "
> +	    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
> +	    type, type, curseg->segno, curseg->next_blkoff,
> +	    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
> +
> +	zone_segno = GET_SEG_FROM_SEC(sbi,
> +				      GET_SEC_FROM_SEG(sbi, curseg->segno));
> +	zone_last_vblock = START_BLOCK(sbi, zone_segno) +
> +		last_vblk_off_in_zone(sbi, zone_segno);
> +
> +	/*
> +	 * If fsync data exists between the curseg and the last valid block,
> +	 * it is not an error to fix. Leave it for kernel to recover later.
> +	 */
> +	if (cs_block <= zone_last_vblock) {

According to above comments, should condition be?

if (cs_block < zone_last_vblock && zone_last_vblock <= wp_block)

> +		MSG(0, "Curseg has fsync data: curseg %d[0x%x,0x%x] "
> +		    "last valid block in zone[0x%x,0x%x]\n",
> +		    type, curseg->segno, curseg->next_blkoff,
> +		    GET_SEGNO(sbi, zone_last_vblock),
> +		    OFFSET_IN_SEG(sbi, zone_last_vblock));
> +		return 0;
> +	}
> +
> +	fsck->chk.wp_inconsistent_zones++;
> +	return -EINVAL;
> +}
> +
> +#else
> +
> +static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
> +{
> +	return 0;
> +}
> +
> +#endif
> +
>  int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> @@ -2209,6 +2328,10 @@ int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
>  			return -EINVAL;
>  		}
>  	}
> +
> +	if (c.zoned_model == F2FS_ZONED_HM)
> +		return check_curseg_write_pointer(sbi, type);
> +
>  	return 0;
>  }
>  
> @@ -2628,6 +2751,23 @@ out:
>  	return cnt;
>  }
>  
> +/*
> + * Check and fix consistency with write pointers at the beginning of
> + * fsck so that following writes by fsck do not fail.
> + */
> +void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
> +{
> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
> +
> +	if (c.zoned_model != F2FS_ZONED_HM)
> +		return;
> +
> +	if (check_curseg_offsets(sbi) && c.fix_on) {
> +		fix_curseg_info(sbi);
> +		fsck->chk.wp_fixed = 1;
> +	}
> +}
> +
>  int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
>  {
>  	struct curseg_info *curseg;
> @@ -2678,6 +2818,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
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
> +		if (fsck->chk.wp_fixed && c.fix_on)
> +			force = 1;
> +	}
> +
>  	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
>  		for (i = 0; i < fsck->nr_nat_entries; i++)
>  			if (f2fs_test_bit(i, fsck->nat_area_bitmap) != 0)
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index 75052d8..c4432e8 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -80,6 +80,8 @@ struct f2fs_fsck {
>  		u32 multi_hard_link_files;
>  		u64 sit_valid_blocks;
>  		u32 sit_free_segs;
> +		u32 wp_fixed;
> +		u32 wp_inconsistent_zones;
>  	} chk;
>  
>  	struct hard_link_node *hard_link_list_head;
> @@ -162,6 +164,7 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
>  		struct child_info *);
>  void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
>  int fsck_chk_meta(struct f2fs_sb_info *sbi);
> +void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *);
>  int fsck_chk_curseg_info(struct f2fs_sb_info *);
>  void pretty_print_filename(const u8 *raw_name, u32 len,
>  			   char out[F2FS_PRINT_NAMELEN], int enc_name);
> diff --git a/fsck/main.c b/fsck/main.c
> index 8c62a14..9a7d499 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -602,6 +602,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>  
>  	print_cp_state(flag);
>  
> +	fsck_chk_and_fix_write_pointers(sbi);
> +
>  	fsck_chk_curseg_info(sbi);
>  
>  	if (!c.fix_on && !c.bug_on) {
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 2979865..5085e6c 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2465,6 +2465,52 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
>  	}
>  }
>  
> +#ifdef HAVE_LINUX_BLKZONED_H
> +
> +static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
> +					unsigned int zone_segno)
> +{
> +	u_int64_t sector;
> +	struct blk_zone blkz;
> +	block_t block = START_BLOCK(sbi, zone_segno);
> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> +	int ret, j;
> +
> +	if (c.zoned_model != F2FS_ZONED_HM)
> +		return true;
> +
> +	for (j = 0; j < MAX_DEVICES; j++) {
> +		if (!c.devices[j].path)
> +			break;
> +		if (c.devices[j].start_blkaddr <= block &&
> +		    block <= c.devices[j].end_blkaddr)
> +			break;
> +	}
> +
> +	if (j >= MAX_DEVICES)
> +		return false;
> +
> +	sector = (block - c.devices[j].start_blkaddr) << log_sectors_per_block;
> +	ret = f2fs_report_zone(j, sector, &blkz);
> +	if (ret)
> +		return false;
> +
> +	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
> +		return true;
> +
> +	return blk_zone_sector(&blkz) == blk_zone_wp_sector(&blkz);
> +}
> +
> +#else
> +
> +static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
> +					unsigned int zone_segno)
> +{
> +	return true;
> +}
> +
> +#endif
> +
>  int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_type, bool new_sec)
>  {
>  	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> @@ -2517,7 +2563,8 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_t
>  					break;
>  			}
>  
> -			if (i == sbi->segs_per_sec) {
> +			if (i == sbi->segs_per_sec &&
> +			    write_pointer_at_zone_start(sbi, segno)) {
>  				set_section_type(sbi, segno, want_type);
>  				return 0;
>  			}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
