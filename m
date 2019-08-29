Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E55A1D9C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 16:50:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3LkY-0008Ob-PZ; Thu, 29 Aug 2019 14:50:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i3LkX-0008OR-Pw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 14:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YdxyRpwUBBdJo6PbMLXF6AoEtpEgKuWy8Cum27/cXe0=; b=eNaishNAGYXU92ciWCqfzTICJ/
 REJF5Ry2gqak0Gr3Syg0AdJwCTSVmRGDBZ7uXIYxcc70Ztc7ApU/g/8LLBBKotunYfpAR2kOcGDla
 s1q6G5GOv30EGLS/Qx2N1gIZMGafUAxc9/e5iRVFfGez7ARfXfUmrr19D4kWI6aZd12U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YdxyRpwUBBdJo6PbMLXF6AoEtpEgKuWy8Cum27/cXe0=; b=IzJpsf5f6dXHQGyWMFcZQLsdwT
 aytUFo2bv2IhtLJ1h/NmSjz/H2yy4yXn8eaPjWnQYRnlWLLEegg/yOH27/hc5CL2Pt4Pno4h3w7Hv
 UyrcXC+IV0TuSemhAA9zmP2godRVcKlT4ARv8Phdn1jh8HoK5JZkOdK8WrnmHbQYdCZo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3LkW-00856x-C8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 14:50:09 +0000
Received: from [192.168.0.110] (unknown [180.111.100.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F5B520644;
 Thu, 29 Aug 2019 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567090202;
 bh=6tYBRzu1EIodWuZ+tCOxrrtbvWlcwsNX3a0ngU0XaiU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Te92L5Ig8flAOylti4R0pajYHyRAgb2emSIe0Q0w95Nw2Sf1XG6wKkSWxhSv7A3Ec
 +BalNHDd/zYAh+RX4s/4How9WqTP3aPUSd+5qyxDL7WRBKKvZBQLZG4dO6ZfPkTKhy
 8kY0L8uqr4+2ndOFwutV/Mw1VfCgF3Q6Qw0JrLQg=
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
 <20190829063531.658-3-shinichiro.kawasaki@wdc.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <efa52715-bd4f-f0ca-1bef-93eadd9df510@kernel.org>
Date: Thu, 29 Aug 2019 22:49:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190829063531.658-3-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i3LkW-00856x-C8
Subject: Re: [f2fs-dev] [PATCH v3 2/2] fsck.f2fs: Check write pointer
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

On 2019-8-29 14:35, Shin'ichiro Kawasaki wrote:
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
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fsck/fsck.c | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  fsck/fsck.h |   3 ++
>  fsck/main.c |   2 +
>  3 files changed, 136 insertions(+)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 8953ca1..f45ca39 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2574,6 +2574,123 @@ out:
>  	return cnt;
>  }
>  
> +struct write_pointer_check_data {
> +	struct f2fs_sb_info *sbi;
> +	struct device_info *dev;
> +};
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

I have one more question, if current zone is closed, will wp_blkoff equal to
segment size (wp_block equal to zone size)?

As you know, .next_blkoff should never equal to segment size.

Thanks,

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
> @@ -2624,6 +2741,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
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
