Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2446FC164
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 09:19:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVALU-0000ia-Hk; Thu, 14 Nov 2019 08:19:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iVALT-0000iP-00
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yD8y/g3am21m1UX4MDeuZHZgmdV+nItahfu4HuDa2Dw=; b=QSIGzbtucjJPL9W4fycUKCCs31
 miofhf3/b305PmQhmPCMQ7cfvYO/XWe+KNfSG8LPv53ex9uiPtfbXsYevye40IM6BXkDougT9QOQS
 2gT02N7k2m60m+hku+k2WbXcZPyIcuD5RoHraplGuhMvkfeNKyDsVs5KnQBJhTmUFXnA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yD8y/g3am21m1UX4MDeuZHZgmdV+nItahfu4HuDa2Dw=; b=l7SRcPFHXVGvpZ52RS9G2qseqT
 RlGyQotzSvdbNOl/nt8g+qBdd3rs/+McXCdG61MmNEIehrweoa1aXZTOlLvGTRs3X8eYa79qD7dnT
 gudmNBAGqfyz2jdXYetn7EfTT8i/znFzur/XU7VS7XehdwWKqUKUYP2gnX/74fsF8Pgo=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVALR-002o7p-JX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573719554; x=1605255554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVGEIE8uKevZ0aJl6dYMBetQKwsVRlDfohkLxCTekbY=;
 b=LX7HLxziAjSqwmSr9OezlTL46uP/TegDs2C2Qfnufqy/2tEBiFQjaZ9a
 t4ZfbpVglR0Ahj7dW0+3jWyJtnkie5C8wMQLHVBql4wSOCehiJabXYHS2
 8jGFCCt67E7GCXirMw4JZD/DCWhVGPIMzb18ARrxV8yRbrkY6qSxrs/rR
 DRRsQX+V++yGcRNGoLtlhUSptLC7dKX3eAuAZV1v12vuU4aahqsaJaoWg
 8OQskYUJyHb+UpfdYU1/bISFABZayrSLdTZFQX24kFA1JIFeaB39A+efZ
 Pz+6hoMTnek3eXucjAI5vfABqj/o6vjOOwzMzZgVmEAQgeOpE6nR/GhHY Q==;
IronPort-SDR: P/m/bRMPRtyEsLtQtHvshQUhAm8xgz8WAWvlPR6U1QETqE9ay/Vnj50boa97WbMBc4oGNf8c72
 pCztwvPDu2r+ClhN7OlUVxOD4ev/UcXnGeI8XyaEsGBg5TBNGsYXN2MfIoJVYkLl8TfUEBm2qo
 TCLIsltVtI1xFynwSYqsxAq7vyYXCGCzDVkxJ69+ODyMPfqf4/5iqKZM5Xp7wDfRNhL7myJstR
 qgcSAi75yo5ua8yquKB2f+K5kHrElJkYrF7QTjswa00aZaS6goBYNFODioB+KGok1FrFx4UThz
 GNU=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="123753824"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 16:19:08 +0800
IronPort-SDR: WBK3jRnmblHjDYsmpO83E6D2jE7pZiEJwDdg9M2z/yHy3/v+au86ByCF8nZGTQjxnHyKOsBu3N
 gYgdRO78gk9uzaXPLdEBkUG2YVQBZL26WBHpXSaG5Exm6UsAAsmkc61pPRBLse3kTyloroPshf
 lZgmGFZaHzOyC3Ft0WFoRd5nQw/Cf4bLvY934JNgd6anOv5UPEN7uDaxk91uicdCPlv49t/foQ
 eCV9Aa6ildyKiSuDtppNd0O1YI3/JcaNTjzT4BunWcM/o5ZJKmehHpHbwMNvejC8WS0q+6sSDl
 2YtZt1uDRTfF3H6ul/XzK+re
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 00:14:07 -0800
IronPort-SDR: TU7cPwpyHYN9PhdhPmA2W1bw1PyQaGeBc+ufnS3XX13NgMG6CWDgEs3M5CPbUDru819Uu7ryxl
 z8lh3W1HG+6Y5GoTXe0yCo67KXgo+EPaT46WVbJXIrJm7IOYmfNqRHZ9HlicpXo7i4DEL0LRWm
 M8uF2d2E08A9W+FdWcsqBOiCmXHfu9sl/q89kmLnn+ITVZuyYyshtWNpLIrjnOMGOQ5SetrWCX
 psNEPxK3EPtyuvCDz44rQ3Yczhj0mZRMpEAMbxuOuKIUgDkymCaJ8DkznBqUjgXlg0Pm0yhePF
 gdI=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Nov 2019 00:19:08 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 17:19:03 +0900
Message-Id: <20191114081903.312260-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
References: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iVALR-002o7p-JX
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: Check write pointer consistency of
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
error. If write pointer is not at the zone start, make mount fail and ask
users to run fsck.

The second item is check between the write pointer position and the last
valid block in the zone. It is unexpected that the last valid block
position is beyond the write pointer. In such a case, report as a bug.
Fix is not required for such zone, because the zone is not selected for
next write operation until the zone get discarded.

Also move a constant F2FS_REPORT_ZONE from super.c to f2fs.h to use it
in segment.c also.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/f2fs.h    |   3 +
 fs/f2fs/segment.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c   |  16 ++++-
 3 files changed, 165 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a2e24718c13b..1bb64950d793 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3137,6 +3137,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
 int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
 int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
@@ -3610,6 +3611,8 @@ static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 
 	return test_bit(zno, FDEV(devi).blkz_seq);
 }
+
+#define F2FS_REPORT_NR_ZONES   4096
 #endif
 
 static inline bool f2fs_hw_should_discard(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6ece146dab34..29e3b6f62f8c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4333,6 +4333,133 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
+static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
+				    struct f2fs_dev_info *fdev,
+				    struct blk_zone *zone)
+{
+	unsigned int wp_segno, wp_blkoff, zone_secno, zone_segno, segno;
+	block_t zone_block, wp_block, last_valid_block;
+	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	int i, s, b;
+	struct seg_entry *se;
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
+	 * not at zone start, report the error to run fsck.
+	 */
+	if (last_valid_block + 1 == zone_block && zone->wp != zone->start) {
+		f2fs_notice(sbi,
+			    "Zone without valid block has non-zero write "
+			    "pointer, run fsck to fix: wp[0x%x,0x%x]",
+			    wp_segno, wp_blkoff);
+		f2fs_stop_checkpoint(sbi, true);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int check_dev_write_pointer(struct f2fs_sb_info *sbi,
+				   struct f2fs_dev_info *fdev) {
+	sector_t nr_sectors = fdev->bdev->bd_part->nr_sects;
+	sector_t sector = 0;
+	struct blk_zone *zones;
+	unsigned int i, nr_zones;
+	unsigned int n = 0;
+	int err = -EIO;
+
+	if (!bdev_is_zoned(fdev->bdev))
+		return 0;
+
+	zones = f2fs_kzalloc(sbi,
+			     array_size(F2FS_REPORT_NR_ZONES,
+					sizeof(struct blk_zone)),
+			     GFP_KERNEL);
+	if (!zones)
+		return -ENOMEM;
+
+	/* Get block zones type */
+	while (zones && sector < nr_sectors) {
+
+		nr_zones = F2FS_REPORT_NR_ZONES;
+		err = blkdev_report_zones(fdev->bdev, sector, zones, &nr_zones);
+		if (err)
+			break;
+		if (!nr_zones) {
+			err = -EIO;
+			break;
+		}
+
+		for (i = 0; i < nr_zones; i++) {
+			if (zones[i].type == BLK_ZONE_TYPE_SEQWRITE_REQ) {
+				err = check_zone_write_pointer(sbi, fdev,
+							       &zones[i]);
+				if (err)
+					break;
+			}
+			sector += zones[i].len;
+			n++;
+		}
+		if (err)
+			break;
+	}
+
+	kvfree(zones);
+
+	return err;
+}
+
 static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
 						  block_t zone_blkaddr)
 {
@@ -4399,6 +4526,10 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
 	allocate_segment_by_default(sbi, type, true);
 
+	/* check consistency of the zone curseg pointed to */
+	if (check_zone_write_pointer(sbi, zbd, &zone))
+		return -EIO;
+
 	/* check newly assigned zone */
 	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
 	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
@@ -4444,11 +4575,29 @@ int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
 
 	return 0;
 }
+
+int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
+{
+	int i, ret;
+
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		ret = check_dev_write_pointer(sbi, &FDEV(i));
+		if (ret)
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
index 1443cee15863..8ca772670c67 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2890,8 +2890,6 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	if (!FDEV(devi).blkz_seq)
 		return -ENOMEM;
 
-#define F2FS_REPORT_NR_ZONES   4096
-
 	zones = f2fs_kzalloc(sbi,
 			     array_size(F2FS_REPORT_NR_ZONES,
 					sizeof(struct blk_zone)),
@@ -3509,7 +3507,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 		err = f2fs_recover_fsync_data(sbi, false);
 		if (err < 0) {
-			if (err != -ENOMEM)
+			if (err != -ENOMEM &&
+			    !is_sbi_flag_set(sbi, SBI_NEED_FSCK))
 				skip_recovery = true;
 			need_fsck = true;
 			f2fs_err(sbi, "Cannot recover all fsync data errno=%d",
@@ -3525,6 +3524,17 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
