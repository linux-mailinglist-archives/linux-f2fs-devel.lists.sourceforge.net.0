Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F152213B7DB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 03:41:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irYcF-0002iu-QV; Wed, 15 Jan 2020 02:41:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=276f86f0a=shinichiro.kawasaki@wdc.com>)
 id 1irYcE-0002iN-Bc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zKUztrn3JUckA6x32IqC3sU/SqqVppsY3dtwD6REBHA=; b=jcTXnoCo0K52vucJ2xeTVhVj2C
 QWJIgztFZ9XPSDTJfs2eGnhQYegBEN+/A8VGQitRS3JVycFVgiajmAnRJvT3kqHsXAX3szO0iFEMK
 HvIj47RINzgSrRgoiIBxzUvw+2sY8ZSgnATQiBP0+F3/tfgNAOfQqYo/AY7VfIwPEWkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zKUztrn3JUckA6x32IqC3sU/SqqVppsY3dtwD6REBHA=; b=CiIwAJDg5o6koaqXideYdtyUC/
 1OuZm5QerQvG2NTpT/MMmL5M9gbrX3IZCEyV9I5bH0xS/u/jxLW4P7kwTsGELWC7/6qML0HT+Sv2f
 NBNzCDjiPOQ79fNDwkh7PEO54O3Kj9vY5SSKvHNy8uJJ+QzbfDt0F+28pOgon6rkrgWQ=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irYcC-003pRt-Of
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1579056064; x=1610592064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8RqMdmsf5krt8/g7kbyEByA7ZilKA2HTnGm6Dc28fuk=;
 b=he2RZTtFqrb1d5MD5Kjug7WqGRXyRmF5eZpuXMphJWAS+sdQ2IlFwh3S
 ynv6PcZV7bgWujyMXPhvq5jeCQ76LwBhbqcfcHtYBfnpl7KmerJq6gY2K
 bJXJpRmH41TO4EwB0ZuCatvNDrYrQrM/V6+3Tuc/4RE0XQxy9bWTjLHDQ
 vMhYGzJrqVzg8lyEJ8QcvHEem6C8rLgZ+e/lM6GMzVpCeK9txnZJbRWIh
 F8tybcP5gG/zihvJ2dC538q4CF1YKBcSLzJZKtyI7jTKQUIRbaQ/uavzX
 4H4tVo1K6lqw4vGzX2D93UY1fi7QvP0WavUSS0oN3ZQVn6mj+mLSYNrYN A==;
IronPort-SDR: 7bABq+pOFt8bdaGrYrO7kJGX6cHDAnH7JSZXPwZ3rbN81yMiKXiFU+pcn8I8VjPM0ReISy5wbE
 tqAiSOngTlWZz3FzTfiYjTtZTmNHr+1h21M6lGrF5aFutnool9KZPjU2sRm/+hK0PBHMN5nvas
 SBooE9fJmhWBjsLqfAXUIsS276ooBT65DTG0MuHHoiWO+S+5Z4Kw7s0/88fYvHK+yV09xNDOFI
 2XRHlAKbErMtCoC7PcBX4oITw48GjnlBZO7z66lhXtGhTptG4GxAyle3XteveXSX01zoN7hclF
 czw=
X-IronPort-AV: E=Sophos;i="5.70,320,1574092800"; d="scan'208";a="129009367"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2020 10:25:28 +0800
IronPort-SDR: pDZ9TNE1JBtTyKLyl0+UCl1G5Ppc4nFo8l/hNRQF9CixHbx9NyAh/Hft0kDrYE2tNE4Ta1ZB3P
 lIsk7n1/KRzsw57pAz+inb3coWL7GQrC8G0K2c6zTu+C9iogtQsULUtQvanxQHmKCaZFto9kHD
 SGUb8FT05WIOScbLNPiJNGr3Q6KS9OZH6OpBPgC/XMvumUlHInJdXd5Lh4zhxcWMfgPWlgxi3z
 I2nOn8RMmw3kR8IcsZrbhJMt+rdi1loIc3TtIcU3G22gaN3hNaJYLznzK+EKENpRvTIIQhjyWr
 Vf28LcP3QlqESnZA9uqlqj9y
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 18:19:04 -0800
IronPort-SDR: 3+bIDEK2SImFgQBRneGYBTpSt2gT+mRxsFxMR/USoEcYvhLfkkkROTwRzb5o7TyEkVEt/81Q81
 ZfvRR6L3q/5kv4wYsjG2Rt8MYqXeTeOu4fWLrr+TyUoryCfttXV+Pods96B+BKet4M+yY8hCsR
 cbyyrHXFMeyV/SBHFs6Ci4w29/ZqhFlpe5xSuhD7FtHHmztN8h7GjGIN56XKPY3h/wxghD5bXM
 vWX3EBWLiutle1vRW6nO7GG9UvDHbN+qB9hb8NkDyAftYlm/8iyke+hwcgcT24w5OkJl6Paxh0
 LIA=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jan 2020 18:25:27 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Jan 2020 11:25:09 +0900
Message-Id: <20200115022509.199291-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115022509.199291-1-shinichiro.kawasaki@wdc.com>
References: <20200115022509.199291-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1irYcC-003pRt-Of
Subject: [f2fs-dev] [PATCH v6 2/2] f2fs: Check write pointer consistency of
 non-open zones
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

To catch f2fs bugs in write pointer handling code for zoned block
devices, check write pointers of non-open zones that current segments do
not point to. Do this check at mount time, after the fsync data recovery
and current segments' write pointer consistency fix. Or when fsync data
recovery is disabled by mount option, do the check when there is no fsync
data.

Check two items comparing write pointers with valid block maps in SIT.
The first item is check for zones with no valid blocks. When there is no
valid blocks in a zone, the write pointer should be at the start of the
zone. If not, next write operation to the zone will cause unaligned write
error. If write pointer is not at the zone start, reset the write pointer
to place at the zone start.

The second item is check between the write pointer position and the last
valid block in the zone. It is unexpected that the last valid block
position is beyond the write pointer. In such a case, report as a bug.
Fix is not required for such zone, because the zone is not selected for
next write operation until the zone get discarded.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h    |   1 +
 fs/f2fs/segment.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c   |  11 ++++
 3 files changed, 138 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 002c417b0a53..23a84d7f17b8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3156,6 +3156,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
 int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5c3018743a9f..3ec912bd5504 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4370,6 +4370,90 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
+static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
+				    struct f2fs_dev_info *fdev,
+				    struct blk_zone *zone)
+{
+	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
+	block_t zone_block, wp_block, last_valid_block;
+	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	int i, s, b, ret;
+	struct seg_entry *se;
+
+	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
+		return 0;
+
+	wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
+	wp_segno = GET_SEGNO(sbi, wp_block);
+	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
+	zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
+	zone_segno = GET_SEGNO(sbi, zone_block);
+	zone_secno = GET_SEC_FROM_SEG(sbi, zone_segno);
+
+	if (zone_segno >= MAIN_SEGS(sbi))
+		return 0;
+
+	/*
+	 * Skip check of zones cursegs point to, since
+	 * fix_curseg_write_pointer() checks them.
+	 */
+	for (i = 0; i < NO_CHECK_TYPE; i++)
+		if (zone_secno == GET_SEC_FROM_SEG(sbi,
+						   CURSEG_I(sbi, i)->segno))
+			return 0;
+
+	/*
+	 * Get last valid block of the zone.
+	 */
+	last_valid_block = zone_block - 1;
+	for (s = sbi->segs_per_sec - 1; s >= 0; s--) {
+		segno = zone_segno + s;
+		se = get_seg_entry(sbi, segno);
+		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
+			if (f2fs_test_bit(b, se->cur_valid_map)) {
+				last_valid_block = START_BLOCK(sbi, segno) + b;
+				break;
+			}
+		if (last_valid_block >= zone_block)
+			break;
+	}
+
+	/*
+	 * If last valid block is beyond the write pointer, report the
+	 * inconsistency. This inconsistency does not cause write error
+	 * because the zone will not be selected for write operation until
+	 * it get discarded. Just report it.
+	 */
+	if (last_valid_block >= wp_block) {
+		f2fs_notice(sbi, "Valid block beyond write pointer: "
+			    "valid block[0x%x,0x%x] wp[0x%x,0x%x]",
+			    GET_SEGNO(sbi, last_valid_block),
+			    GET_BLKOFF_FROM_SEG0(sbi, last_valid_block),
+			    wp_segno, wp_blkoff);
+		return 0;
+	}
+
+	/*
+	 * If there is no valid block in the zone and if write pointer is
+	 * not at zone start, reset the write pointer.
+	 */
+	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
+		f2fs_notice(sbi,
+			    "Zone without valid block has non-zero write "
+			    "pointer. Reset the write pointer: wp[0x%x,0x%x]",
+			    wp_segno, wp_blkoff);
+		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
+					zone->len >> log_sectors_per_block);
+		if (ret) {
+			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
+				 fdev->path, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
 						  block_t zone_blkaddr)
 {
@@ -4441,6 +4525,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
 	allocate_segment_by_default(sbi, type, true);
 
+	/* check consistency of the zone curseg pointed to */
+	if (check_zone_write_pointer(sbi, zbd, &zone))
+		return -EIO;
+
 	/* check newly assigned zone */
 	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
 	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
@@ -4492,11 +4580,49 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
 
 	return 0;
 }
+
+struct check_zone_write_pointer_args {
+	struct f2fs_sb_info *sbi;
+	struct f2fs_dev_info *fdev;
+};
+
+static int check_zone_write_pointer_cb(struct blk_zone *zone, unsigned int idx,
+				      void *data) {
+	struct check_zone_write_pointer_args *args;
+	args = (struct check_zone_write_pointer_args *)data;
+
+	return check_zone_write_pointer(args->sbi, args->fdev, zone);
+}
+
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
+{
+	int i, ret;
+	struct check_zone_write_pointer_args args;
+
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		if (!bdev_is_zoned(FDEV(i).bdev))
+			continue;
+
+		args.sbi = sbi;
+		args.fdev = &FDEV(i);
+		ret = blkdev_report_zones(FDEV(i).bdev, 0, BLK_ALL_ZONES,
+					  check_zone_write_pointer_cb, &args);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
 #else
 int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
 {
 	return 0;
 }
+
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
+{
+	return 0;
+}
 #endif
 
 /*
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5111e1ffe58a..755ad57c795b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3544,6 +3544,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 			goto free_meta;
 		}
 	}
+
+	/*
+	 * If the f2fs is not readonly and fsync data recovery succeeds,
+	 * check zoned block devices' write pointer consistency.
+	 */
+	if (!err && !f2fs_readonly(sb) && f2fs_sb_has_blkzoned(sbi)) {
+		err = f2fs_check_write_pointer(sbi);
+		if (err)
+			goto free_meta;
+	}
+
 reset_checkpoint:
 	/* f2fs_recover_fsync_data() cleared this already */
 	clear_sbi_flag(sbi, SBI_POR_DOING);
-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
