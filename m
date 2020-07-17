Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B62235E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 09:28:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwKnC-0001YV-MA; Fri, 17 Jul 2020 07:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jwKnB-0001YN-7B
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 07:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kE6K2XAkrY4quYI3wlKioodegG3c3RZFhV61okfPkgo=; b=QRWbytn5s6NEwwvI2Tbsx7DAPZ
 rpCGRFnIWBzIIGIJNkAio4Bph1wBOKPcrhnNytmIWUmPepNgen6p6SfUeDZoAOXUgM2yEt0QKNomJ
 V447ZyozvZz/pnYvM8cN3VIF/PqOf0hwqYFGA0yFnvxU7BAO7jntk35+Z/itk+T63h2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kE6K2XAkrY4quYI3wlKioodegG3c3RZFhV61okfPkgo=; b=LL4TarKLO9KeVv5E5aMs6tEKNC
 0YHmr/LBSlhMxr3r8Ue1MtWK1DUrsd12ImLwITbnWPpGTnZyuJtRh9lnnAc1OXsr4fRhnci1+CoFT
 OShatH9P2rQGWaeSWzSdSndmt0jdAlvHxmB1gCkQa5+DpCJRav88+iOjnuARCQtjM618=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwKn6-0044PI-RU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 07:28:25 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 382BEE27F36B1F6B3938;
 Fri, 17 Jul 2020 15:28:13 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Jul
 2020 15:28:08 +0800
To: Aravind Ramesh <aravind.ramesh@wdc.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
 <20200702155427.13372-2-aravind.ramesh@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c9bf27ba-ca48-cd54-4567-305e42f66dc2@huawei.com>
Date: Fri, 17 Jul 2020 15:28:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200702155427.13372-2-aravind.ramesh@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwKn6-0044PI-RU
Subject: Re: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: zns zone-capacity support.
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
Cc: matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/2 23:54, Aravind Ramesh wrote:
> NVM Express Zoned Namespace (ZNS) devices can have zone-capacity(zc) less
> than the zone-size. ZNS defines a per zone capacity which can be equal
> or less than the zone-size. Zone-capacity is the number of usable blocks
> in the zone. In such cases, the filesystem should not write/read beyond the
> zone-capacity. Update the super block with the usable number of blocks
> and free segment count in the ZNS device zones, if zone-capacity is less
> than zone-size. Set reserved segment count and overprovision ratio based
> on the usable segments in the zone.
> 
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  configure.ac        |  4 ++++
>  include/f2fs_fs.h   | 40 +++++++++++++++++++++++++++++++----
>  lib/libf2fs_io.c    |  1 +
>  lib/libf2fs_zoned.c | 51 +++++++++++++++++++++++++++++++++++++++++++--
>  mkfs/f2fs_format.c  | 26 ++++++++++++++++++-----
>  5 files changed, 111 insertions(+), 11 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 9ac0c24..e9acd1a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -213,6 +213,10 @@ AC_CONFIG_FILES([
>  	tools/f2fs_io/Makefile
>  ])
>  
> +AC_CHECK_MEMBER([struct blk_zone.capacity],
> +		[AC_DEFINE(HAVE_BLK_ZONE_REP_V2, [1], [report zones includes zone capacity])],
> +		[], [[#include <linux/blkzoned.h>]])
> +
>  # export library version info for mkfs/libf2fs_format_la
>  AC_SUBST(FMT_CURRENT, 6)
>  AC_SUBST(FMT_REVISION, 0)
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 709bfd8..40165ed 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -332,6 +332,7 @@ struct device_info {
>  	u_int32_t nr_zones;
>  	u_int32_t nr_rnd_zones;
>  	size_t zone_blocks;
> +	size_t *zone_cap_blocks;
>  };
>  
>  typedef struct {
> @@ -1324,13 +1325,42 @@ blk_zone_cond_str(struct blk_zone *blkz)
>  	return "Unknown-cond";
>  }
>  
> -#define blk_zone_empty(z)	(blk_zone_cond(z) == BLK_ZONE_COND_EMPTY)
> +/*
> + * Handle kernel zone capacity support
> + */
> +#ifndef HAVE_BLK_ZONE_REP_V2
> +#define BLK_ZONE_REP_CAPACITY   (1 << 0)
> +struct blk_zone_v2 {
> +	__u64   start;          /* Zone start sector */
> +	__u64   len;            /* Zone length in number of sectors */
> +	__u64   wp;             /* Zone write pointer position */
> +	__u8    type;           /* Zone type */
> +	__u8    cond;           /* Zone condition */
> +	__u8    non_seq;        /* Non-sequential write resources active */
> +	__u8    reset;          /* Reset write pointer recommended */
> +	__u8    resv[4];
> +	__u64   capacity;       /* Zone capacity in number of sectors */
> +	__u8    reserved[24];
> +};
> +#define blk_zone blk_zone_v2
>  
> +struct blk_zone_report_v2 {
> +	__u64   sector;
> +	__u32   nr_zones;
> +	__u32   flags;
> +struct blk_zone zones[0];
> +};
> +#define blk_zone_report blk_zone_report_v2
> +#endif /* HAVE_BLK_ZONE_REP_V2 */
> +
> +#define blk_zone_empty(z)	(blk_zone_cond(z) == BLK_ZONE_COND_EMPTY)
>  #define blk_zone_sector(z)	(z)->start
>  #define blk_zone_length(z)	(z)->len
>  #define blk_zone_wp_sector(z)	(z)->wp
>  #define blk_zone_need_reset(z)	(int)(z)->reset
>  #define blk_zone_non_seq(z)	(int)(z)->non_seq
> +#define blk_zone_capacity(z, f) ((f & BLK_ZONE_REP_CAPACITY) ? \
> +					(z)->capacity : (z)->len)
>  
>  #endif
>  
> @@ -1342,6 +1372,7 @@ extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
>  extern int f2fs_check_zones(int);
>  int f2fs_reset_zone(int, void *);
>  extern int f2fs_reset_zones(int);
> +extern uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb);
>  
>  #define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
>  #define SEG_ALIGN(blks)		SIZE_ALIGN(blks, c.blks_per_seg)
> @@ -1352,6 +1383,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
>  {
>  	double reserved, ovp, candidate, end, diff, space;
>  	double max_ovp = 0, max_space = 0;
> +	u_int32_t usable_main_segs = f2fs_get_usable_segments(sb);
>  
>  	if (get_sb(segment_count_main) < 256) {
>  		candidate = 10;
> @@ -1365,9 +1397,9 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
>  
>  	for (; candidate <= end; candidate += diff) {
>  		reserved = (2 * (100 / candidate + 1) + 6) *
> -						get_sb(segs_per_sec);
> -		ovp = (get_sb(segment_count_main) - reserved) * candidate / 100;
> -		space = get_sb(segment_count_main) - reserved - ovp;
> +				(usable_main_segs / get_sb(section_count));

It looks segs_per_sec becomes an average value in whole zns device, I'm not sure
whether calculating with divide round down way is safe enough to reserve space,
as it may cut several segments, which may be needed during foreground GC, so I
suggest to use DIV_ROUND_UP() here to avoid boundary issue.

> +		ovp = (usable_main_segs - reserved) * candidate / 100;
> +		space = usable_main_segs - reserved - ovp;
>  		if (max_space < space) {
>  			max_space = space;
>  			max_ovp = candidate;
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index 1f597a9..138285d 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -784,6 +784,7 @@ int f2fs_finalize_device(void)
>  			break;
>  		}
>  		free(c.devices[i].path);
> +		free(c.devices[i].zone_cap_blocks);
>  	}
>  	close(c.kd);
>  
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index efc687c..f98fcdb 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -291,6 +291,13 @@ int f2fs_check_zones(int j)
>  		return -ENOMEM;
>  	}
>  
> +	dev->zone_cap_blocks = malloc(dev->nr_zones * sizeof(size_t));
> +	if (!dev->zone_cap_blocks) {
> +		ERR_MSG("No memory for zone capacity list.\n");
> +		return -ENOMEM;
> +	}
> +	memset(dev->zone_cap_blocks, 0, (dev->nr_zones * sizeof(size_t)));
> +
>  	dev->nr_rnd_zones = 0;
>  	sector = 0;
>  	total_sectors = (dev->total_sectors * c.sector_size) >> 9;
> @@ -335,10 +342,15 @@ int f2fs_check_zones(int j)
>  				    blk_zone_cond_str(blkz),
>  				    blk_zone_sector(blkz),
>  				    blk_zone_length(blkz));
> +				dev->zone_cap_blocks[n] =
> +					blk_zone_length(blkz) >>
> +					(F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
>  			} else {
>  				DBG(2,
> -				    "Zone %05u: type 0x%x (%s), cond 0x%x (%s), need_reset %d, "
> -				    "non_seq %d, sector %llu, %llu sectors, wp sector %llu\n",
> +				    "Zone %05u: type 0x%x (%s), cond 0x%x (%s),"
> +				    " need_reset %d, non_seq %d, sector %llu,"
> +				    " %llu sectors, capacity %llu,"
> +				    " wp sector %llu\n",
>  				    n,
>  				    blk_zone_type(blkz),
>  				    blk_zone_type_str(blkz),
> @@ -348,7 +360,11 @@ int f2fs_check_zones(int j)
>  				    blk_zone_non_seq(blkz),
>  				    blk_zone_sector(blkz),
>  				    blk_zone_length(blkz),
> +				    blk_zone_capacity(blkz, rep->flags),
>  				    blk_zone_wp_sector(blkz));
> +				dev->zone_cap_blocks[n] =
> +					blk_zone_capacity(blkz, rep->flags) >>
> +					(F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
>  			}
>  
>  			sector = blk_zone_sector(blkz) + blk_zone_length(blkz);
> @@ -473,6 +489,33 @@ out:
>  	return ret;
>  }
>  
> +uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
> +{
> +#ifdef HAVE_BLK_ZONE_REP_V2
> +	int i, j;
> +	uint32_t usable_segs = 0, zone_segs;
> +	for (i = 0; i < c.ndevs; i++) {
> +		if (c.devices[i].zoned_model != F2FS_ZONED_HM) {
> +			usable_segs += c.devices[i].total_segments;
> +			continue;
> +		}
> +		for (j = 0; j < c.devices[i].nr_zones; j++) {
> +			zone_segs = c.devices[i].zone_cap_blocks[j] >>
> +					get_sb(log_blocks_per_seg);
> +			if (c.devices[i].zone_cap_blocks[j] %
> +						DEFAULT_BLOCKS_PER_SEGMENT)
> +				usable_segs += zone_segs + 1;
> +			else
> +				usable_segs += zone_segs;
> +		}
> +	}
> +	usable_segs -= (get_sb(main_blkaddr) - get_sb(segment0_blkaddr)) >>
> +						get_sb(log_blocks_per_seg);
> +	return usable_segs;
> +#endif
> +	return get_sb(segment_count_main);
> +}
> +
>  #else
>  
>  int f2fs_report_zone(int i, u_int64_t UNUSED(sector), void *UNUSED(blkzone))
> @@ -527,5 +570,9 @@ int f2fs_reset_zones(int i)
>  	return -1;
>  }
>  
> +uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb)
> +{
> +	return get_sb(segment_count_main);
> +}
>  #endif
>  
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 4999cac..74a81c8 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -425,13 +425,19 @@ static int f2fs_prepare_super_block(void)
>  
>  	set_sb(segment_count_main, get_sb(section_count) * c.segs_per_sec);
>  
> -	/* Let's determine the best reserved and overprovisioned space */
> +	/*
> +	 * Let's determine the best reserved and overprovisioned space.
> +	 * For Zoned device, if zone capacity less than zone size, the segments
> +	 * starting after the zone capacity are unusable in each zone. So get
> +	 * overprovision ratio and reserved seg count based on avg usable
> +	 * segs_per_sec.
> +	 */
>  	if (c.overprovision == 0)
>  		c.overprovision = get_best_overprovision(sb);
>  
>  	c.reserved_segments =
> -			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE)
> -			* c.segs_per_sec;
> +			(2 * (100 / c.overprovision + 1) + NR_CURSEG_TYPE) *
> +			(f2fs_get_usable_segments(sb) / get_sb(section_count));

Ditto, DIV_ROUND_UP()

>  
>  	if (c.overprovision == 0 || c.total_segments < F2FS_MIN_SEGMENTS ||
>  		(c.devices[0].total_sectors *
> @@ -672,19 +678,29 @@ static int f2fs_write_check_point_pack(void)
>  	set_cp(valid_block_count, 2 + c.quota_inum + c.quota_dnum +
>  			c.lpf_inum + c.lpf_dnum);
>  	set_cp(rsvd_segment_count, c.reserved_segments);
> -	set_cp(overprov_segment_count, (get_sb(segment_count_main) -
> +
> +	/*
> +	 * For zoned devices, if zone capacity less than zone size, get
> +	 * overprovision segment count based on usable segments in the device.
> +	 */
> +	set_cp(overprov_segment_count, (f2fs_get_usable_segments(sb) -
>  			get_cp(rsvd_segment_count)) *
>  			c.overprovision / 100);
>  	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
>  			get_cp(rsvd_segment_count));
>  
> +	if (f2fs_get_usable_segments(sb) < (get_cp(rsvd_segment_count) +

equal is not allowed as well?

> +					get_cp(overprov_segment_count))) {
> +		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
> +		goto free_nat_bits;
> +	}
>  	MSG(0, "Info: Overprovision ratio = %.3lf%%\n", c.overprovision);
>  	MSG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
>  					get_cp(overprov_segment_count),
>  					c.reserved_segments);
>  
>  	/* main segments - reserved segments - (node + data segments) */
> -	set_cp(free_segment_count, get_sb(segment_count_main) - 6);
> +	set_cp(free_segment_count, f2fs_get_usable_segments(sb) - 6);
>  	set_cp(user_block_count, ((get_cp(free_segment_count) + 6 -
>  			get_cp(overprov_segment_count)) * c.blks_per_seg));
>  	/* cp page (2), data summaries (1), node summaries (3) */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
