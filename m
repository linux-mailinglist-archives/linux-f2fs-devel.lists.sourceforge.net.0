Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11D216CAA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 14:19:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsmYz-0001jr-05; Tue, 07 Jul 2020 12:19:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jsmYx-0001jf-0h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 12:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Aox/aY6FVlvNPv/j4Vy1zm51q7FsXtyFcPYyqvMefro=; b=MlKWFXY19CZR17ngQPMHgF92uW
 KkacM+Eo239JamHcQ/LVLgOJS0BviQeCipm0YRN6Sc9r7Ug/vojfOEoeABAvq9dBQycD+sWO/GO3Q
 iO9MUyzmEMiGqmx2VBhQ98X8T2YH+xkbivLHm7/1UWtweu4G0SmxI5fsIXn95d4RN/V0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Aox/aY6FVlvNPv/j4Vy1zm51q7FsXtyFcPYyqvMefro=; b=fp+WK6bk+B1Q9oQlBY12PQZVG2
 i8U5RxqD187mRRCykGumBb1Vp4gjFk10hbAESJn9CL+KXqsPS9KbiGNwyzG9vcd+buY3/reoYHx1F
 +buQD8tPCqRBq0VS6VL+Sg4UbBSWSs8GqmGAKyPFYnL1wtdMdLR3RRi/o1spxzj90vC4=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsmYu-00G8Kx-Iq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 12:19:02 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C971FDF45780AE1AECCC;
 Tue,  7 Jul 2020 20:18:43 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 7 Jul 2020
 20:18:38 +0800
To: Aravind Ramesh <aravind.ramesh@wdc.com>, <jaegeuk@kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <hch@lst.de>
References: <20200702155401.13322-1-aravind.ramesh@wdc.com>
 <20200702155401.13322-2-aravind.ramesh@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d262eba9-31d5-6205-3244-b5176a17637c@huawei.com>
Date: Tue, 7 Jul 2020 20:18:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200702155401.13322-2-aravind.ramesh@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsmYu-00G8Kx-Iq
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: support zone capacity less than
 zone size
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
Cc: niklas.cassel@wdc.com, Damien.LeMoal@wdc.com, matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/2 23:54, Aravind Ramesh wrote:
> NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
> Zone-capacity indicates the maximum number of sectors that are usable in
> a zone beginning from the first sector of the zone. This makes the sectors
> sectors after the zone-capacity till zone-size to be unusable.
> This patch set tracks zone-size and zone-capacity in zoned devices and
> calculate the usable blocks per segment and usable segments per section.
> 
> If zone-capacity is less than zone-size mark only those segments which
> start before zone-capacity as free segments. All segments at and beyond
> zone-capacity are treated as permanently used segments. In cases where
> zone-capacity does not align with segment size the last segment will start
> before zone-capacity and end beyond the zone-capacity of the zone. For
> such spanning segments only sectors within the zone-capacity are used.
> 
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  fs/f2fs/f2fs.h    |   5 ++
>  fs/f2fs/segment.c | 136 ++++++++++++++++++++++++++++++++++++++++++++--
>  fs/f2fs/segment.h |   6 +-
>  fs/f2fs/super.c   |  41 ++++++++++++--
>  4 files changed, 176 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6e47618a357..73219e4e1ba4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1232,6 +1232,7 @@ struct f2fs_dev_info {
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	unsigned int nr_blkz;		/* Total number of zones */
>  	unsigned long *blkz_seq;	/* Bitmap indicating sequential zones */
> +	block_t *zone_capacity_blocks;  /* Array of zone capacity in blks */
>  #endif
>  };
>  
> @@ -3395,6 +3396,10 @@ void f2fs_destroy_segment_manager_caches(void);
>  int f2fs_rw_hint_to_seg_type(enum rw_hint hint);
>  enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
>  			enum page_type type, enum temp_type temp);
> +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> +			unsigned int segno);
> +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> +			unsigned int segno);
>  
>  /*
>   * checkpoint.c
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index c35614d255e1..d2156f3f56a5 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4294,9 +4294,12 @@ static void init_free_segmap(struct f2fs_sb_info *sbi)
>  {
>  	unsigned int start;
>  	int type;
> +	struct seg_entry *sentry;
>  
>  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
> -		struct seg_entry *sentry = get_seg_entry(sbi, start);
> +		if (f2fs_usable_blks_in_seg(sbi, start) == 0)

If usable blocks count is zero, shouldn't we update SIT_I(sbi)->written_valid_blocks
as we did when there is partial usable block in current segment?

> +			continue;
> +		sentry = get_seg_entry(sbi, start);
>  		if (!sentry->valid_blocks)
>  			__set_free(sbi, start);
>  		else
> @@ -4316,7 +4319,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
>  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>  	struct free_segmap_info *free_i = FREE_I(sbi);
>  	unsigned int segno = 0, offset = 0, secno;
> -	unsigned short valid_blocks;
> +	unsigned short valid_blocks, usable_blks_in_seg;
>  	unsigned short blks_per_sec = BLKS_PER_SEC(sbi);
>  
>  	while (1) {
> @@ -4326,9 +4329,10 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
>  			break;
>  		offset = segno + 1;
>  		valid_blocks = get_valid_blocks(sbi, segno, false);
> -		if (valid_blocks == sbi->blocks_per_seg || !valid_blocks)
> +		usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
> +		if (valid_blocks == usable_blks_in_seg || !valid_blocks)

It needs to traverse .cur_valid_map bitmap to check whether blocks in range of
[0, usable_blks_in_seg] are all valid or not, if there is at least one usable
block in the range, segment should be dirty.

One question, if we select dirty segment which across zone-capacity as opened
segment (in curseg), how can we avoid allocating usable block beyong zone-capacity
in such segment via .cur_valid_map?

>  			continue;
> -		if (valid_blocks > sbi->blocks_per_seg) {
> +		if (valid_blocks > usable_blks_in_seg) {
>  			f2fs_bug_on(sbi, 1);
>  			continue;
>  		}
> @@ -4678,6 +4682,101 @@ int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
>  
>  	return 0;
>  }
> +
> +static bool is_conv_zone(struct f2fs_sb_info *sbi, unsigned int zone_idx,
> +						unsigned int dev_idx)
> +{
> +	if (!bdev_is_zoned(FDEV(dev_idx).bdev))
> +		return true;
> +	return !test_bit(zone_idx, FDEV(dev_idx).blkz_seq);
> +}
> +
> +/* Return the zone index in the given device */
> +static unsigned int get_zone_idx(struct f2fs_sb_info *sbi, unsigned int secno,
> +					int dev_idx)
> +{
> +	block_t sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
> +
> +	return (sec_start_blkaddr - FDEV(dev_idx).start_blk) >>
> +						sbi->log_blocks_per_blkz;
> +}
> +
> +/*
> + * Return the usable segments in a section based on the zone's
> + * corresponding zone capacity. Zone is equal to a section.
> + */
> +static inline unsigned int f2fs_usable_zone_segs_in_sec(
> +		struct f2fs_sb_info *sbi, unsigned int segno)
> +{
> +	unsigned int dev_idx, zone_idx, unusable_segs_in_sec;
> +
> +	dev_idx = f2fs_target_device_index(sbi, START_BLOCK(sbi, segno));
> +	zone_idx = get_zone_idx(sbi, GET_SEC_FROM_SEG(sbi, segno), dev_idx);
> +
> +	/* Conventional zone's capacity is always equal to zone size */
> +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> +		return sbi->segs_per_sec;
> +
> +	/*
> +	 * If the zone_capacity_blocks array is NULL, then zone capacity
> +	 * is equal to the zone size for all zones
> +	 */
> +	if (!FDEV(dev_idx).zone_capacity_blocks)
> +		return sbi->segs_per_sec;
> +
> +	/* Get the segment count beyond zone capacity block */
> +	unusable_segs_in_sec = (sbi->blocks_per_blkz -
> +				FDEV(dev_idx).zone_capacity_blocks[zone_idx]) >>
> +				sbi->log_blocks_per_seg;
> +	return sbi->segs_per_sec - unusable_segs_in_sec;
> +}
> +
> +/*
> + * Return the number of usable blocks in a segment. The number of blocks
> + * returned is always equal to the number of blocks in a segment for
> + * segments fully contained within a sequential zone capacity or a
> + * conventional zone. For segments partially contained in a sequential
> + * zone capacity, the number of usable blocks up to the zone capacity
> + * is returned. 0 is returned in all other cases.
> + */
> +static inline unsigned int f2fs_usable_zone_blks_in_seg(
> +			struct f2fs_sb_info *sbi, unsigned int segno)
> +{
> +	block_t seg_start, sec_start_blkaddr, sec_cap_blkaddr;
> +	unsigned int zone_idx, dev_idx, secno;
> +
> +	secno = GET_SEC_FROM_SEG(sbi, segno);
> +	seg_start = START_BLOCK(sbi, segno);
> +	dev_idx = f2fs_target_device_index(sbi, seg_start);
> +	zone_idx = get_zone_idx(sbi, secno, dev_idx);
> +
> +	/*
> +	 * Conventional zone's capacity is always equal to zone size,
> +	 * so, blocks per segment is unchanged.
> +	 */
> +	if (is_conv_zone(sbi, zone_idx, dev_idx))
> +		return sbi->blocks_per_seg;
> +
> +	if (!FDEV(dev_idx).zone_capacity_blocks)
> +		return sbi->blocks_per_seg;
> +
> +	sec_start_blkaddr = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, secno));
> +	sec_cap_blkaddr = sec_start_blkaddr +
> +				FDEV(dev_idx).zone_capacity_blocks[zone_idx];
> +
> +	/*
> +	 * If segment starts before zone capacity and spans beyond
> +	 * zone capacity, then usable blocks are from seg start to
> +	 * zone capacity. If the segment starts after the zone capacity,
> +	 * then there are no usable blocks.
> +	 */
> +	if (seg_start >= sec_cap_blkaddr)
> +		return 0;
> +	if (seg_start + sbi->blocks_per_seg > sec_cap_blkaddr)
> +		return sec_cap_blkaddr - seg_start;
> +
> +	return sbi->blocks_per_seg;
> +}
>  #else
>  int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
>  {
> @@ -4688,7 +4787,36 @@ int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
>  {
>  	return 0;
>  }
> +
> +static inline unsigned int f2fs_usable_zone_blks_in_seg(struct f2fs_sb_info *sbi,
> +							unsigned int segno)
> +{
> +	return 0;
> +}
> +
> +static inline unsigned int f2fs_usable_zone_segs_in_sec(struct f2fs_sb_info *sbi,
> +							unsigned int segno)
> +{
> +	return 0;
> +}
>  #endif
> +unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
> +					unsigned int segno)
> +{
> +	if (f2fs_sb_has_blkzoned(sbi))
> +		return f2fs_usable_zone_blks_in_seg(sbi, segno);
> +
> +	return sbi->blocks_per_seg;
> +}
> +
> +unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
> +					unsigned int segno)
> +{
> +	if (f2fs_sb_has_blkzoned(sbi))
> +		return f2fs_usable_zone_segs_in_sec(sbi, segno);
> +
> +	return sbi->segs_per_sec;
> +}
>  
>  /*
>   * Update min, max modified time for cost-benefit GC algorithm
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index f261e3e6a69b..79b0dc33feaf 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -411,6 +411,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
>  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>  	unsigned int next;
> +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
>  
>  	spin_lock(&free_i->segmap_lock);
>  	clear_bit(segno, free_i->free_segmap);
> @@ -418,7 +419,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
>  
>  	next = find_next_bit(free_i->free_segmap,
>  			start_segno + sbi->segs_per_sec, start_segno);
> -	if (next >= start_segno + sbi->segs_per_sec) {
> +	if (next >= start_segno + usable_segs) {
>  		clear_bit(secno, free_i->free_secmap);
>  		free_i->free_sections++;
>  	}
> @@ -444,6 +445,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>  	unsigned int next;
> +	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
>  
>  	spin_lock(&free_i->segmap_lock);
>  	if (test_and_clear_bit(segno, free_i->free_segmap)) {
> @@ -453,7 +455,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>  			goto skip_free;
>  		next = find_next_bit(free_i->free_segmap,
>  				start_segno + sbi->segs_per_sec, start_segno);
> -		if (next >= start_segno + sbi->segs_per_sec) {
> +		if (next >= start_segno + usable_segs) {
>  			if (test_and_clear_bit(secno, free_i->free_secmap))
>  				free_i->free_sections++;
>  		}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 80cb7cd358f8..2686b07ae7eb 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1164,6 +1164,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
>  		blkdev_put(FDEV(i).bdev, FMODE_EXCL);
>  #ifdef CONFIG_BLK_DEV_ZONED
>  		kvfree(FDEV(i).blkz_seq);
> +		kvfree(FDEV(i).zone_capacity_blocks);

Now, f2fs_kzalloc won't allocate vmalloc's memory, so it's safe to use kfree().

>  #endif
>  	}
>  	kvfree(sbi->devs);
> @@ -3039,13 +3040,26 @@ static int init_percpu_info(struct f2fs_sb_info *sbi)
>  }
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
> +
> +struct f2fs_report_zones_args {
> +	struct f2fs_dev_info *dev;
> +	bool zone_cap_mismatch;
> +};
> +
>  static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
> -			       void *data)
> +			      void *data)
>  {
> -	struct f2fs_dev_info *dev = data;
> +	struct f2fs_report_zones_args *rz_args = data;
> +
> +	if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
> +		return 0;
> +
> +	set_bit(idx, rz_args->dev->blkz_seq);
> +	rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> +						F2FS_LOG_SECTORS_PER_BLOCK;
> +	if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> +		rz_args->zone_cap_mismatch = true;
>  
> -	if (zone->type != BLK_ZONE_TYPE_CONVENTIONAL)
> -		set_bit(idx, dev->blkz_seq);
>  	return 0;
>  }
>  
> @@ -3053,6 +3067,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>  {
>  	struct block_device *bdev = FDEV(devi).bdev;
>  	sector_t nr_sectors = bdev->bd_part->nr_sects;
> +	struct f2fs_report_zones_args rep_zone_arg;
>  	int ret;
>  
>  	if (!f2fs_sb_has_blkzoned(sbi))
> @@ -3078,12 +3093,26 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>  	if (!FDEV(devi).blkz_seq)
>  		return -ENOMEM;
>  
> -	/* Get block zones type */
> +	/* Get block zones type and zone-capacity */
> +	FDEV(devi).zone_capacity_blocks = f2fs_kzalloc(sbi,
> +					FDEV(devi).nr_blkz * sizeof(block_t),
> +					GFP_KERNEL);
> +	if (!FDEV(devi).zone_capacity_blocks)
> +		return -ENOMEM;
> +
> +	rep_zone_arg.dev = &FDEV(devi);
> +	rep_zone_arg.zone_cap_mismatch = false;
> +
>  	ret = blkdev_report_zones(bdev, 0, BLK_ALL_ZONES, f2fs_report_zone_cb,
> -				  &FDEV(devi));
> +				  &rep_zone_arg);
>  	if (ret < 0)
>  		return ret;

Missed to call kfree(FDEV(devi).zone_capacity_blocks)?

>  
> +	if (!rep_zone_arg.zone_cap_mismatch) {
> +		kvfree(FDEV(devi).zone_capacity_blocks);

Ditto, kfree().

Thanks,

> +		FDEV(devi).zone_capacity_blocks = NULL;
> +	}
> +
>  	return 0;
>  }
>  #endif
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
