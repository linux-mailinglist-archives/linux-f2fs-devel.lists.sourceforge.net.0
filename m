Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA079FBEAF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70L-0008O2-K0; Thu, 14 Nov 2019 04:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70K-0008Nm-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fvJj/uKzNCgMBbQuNw1+wb3psyGLRIlzitT6R7gwr2o=; b=L/QsbxntX2ecREPXX0EP9nVeYi
 aHSLqqUh797ROqAVRwvbPYfkpJ0r4Upqz2Jlbgvwj4XrkFM6b6diz/SllLFz62jX5XaEQ3CEOn2x3
 z0hJUrL76hxPGhHXn2a9MIoNVSwLquSAqSMCP4D4suAKsDHWchEataa24tsCdpBp2Ibc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fvJj/uKzNCgMBbQuNw1+wb3psyGLRIlzitT6R7gwr2o=; b=QI/Ln9dm0HQjpq7NDFjY84S3ab
 Z8FH18qXhD5g/HN6PMRbNfVod2pkG53HjULXYor6FgzayyGdK806KWgExokEXoU2PxFbdNJjFr8ET
 MaHNekARQKqUdBZIhO6lvxSgfc0F0E8bCgNeNOEWgTjDThAEdnLuTGIjuqMixeEUZzjM=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV70G-002ZD6-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706709; x=1605242709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KROO+EwBD8BSa2STTPJxPzlFifyq4I+ukeu5jO8TWNM=;
 b=DeqW08KkO6Vg48SGJNNRAxqffzzveEf2+MHwTgeAqoxC36Ht42NSwvy7
 8RRATlmcKPio6JS4vpoIsBZe6OPu1isH+vAR0lTqpUUOoPmwDDysYJ1Z0
 dal2K9xk1fwF9TPtoAgepq9Z9oMDpUSYK2RgXDTu0qGXGqLgXvoMlMw6X
 Jb67y1Qok3Chfe/E3nt47EX3nd8vNqTFzQ3N48vaNBM6MPYUB1sR+Ulp7
 YOaMpSUnBs92Lgzzf6/ukumO5a0iEWJ/ERz/sKIxq3CRWNrDAWquW569O
 JCDg7ZKkLpP8vsqy31UkN2QYzPuT1xbTNufNmZU4A4KiKyq7Al+HAlvj8 A==;
IronPort-SDR: y/S/Ijt5MJBNJJNUrQr3Q7VuOR8+O2w2v+53je0UeCU55py67vyXE6Om6eD5mIpLMTZluSoHFq
 AaX8ZEtq54cpwQd+LIWU67Qb+rm4qw1woAu1aTiPMeuLibtkuhgjPQ+ykLtoU8IMTgvmjkF1wo
 MyP/x75hpoLIhdDgiClZB7qpjKo29DEIVA35wB7z80/c1DlYxHQ1kGcchBr4tmVrrcKS4JSJMe
 iRMOf88Peil5n2nzrF2qMXAuuVZV/CC9iH4Q32x8nnmMzN9ZY60jQQ73MAmGaKeNANPaPo2mru
 89w=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411455"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:45:05 +0800
IronPort-SDR: KEUwspFdFON2iH1gpLySlhZ+V5re7ePX6ZQUseJaRzpMIqwXA+qV21wuWPoe1YG98+bEcXvxVo
 tZ0xFIM9YjjbFsB7WwnwpXaugJUovUXh5wv6Tv9NLrM5VovxncDhauI16mxLr65+7Vpa9M2CoZ
 42gMEC0GcyGVgWiIkZeU1YbzwrAJpKLCcyeurOYOhEuHFnLMZqT5K8w08vb+VhrQ+rLCV2qDFF
 745sbOITh0v26jOXyP5/JKJ3qx9K0x+ZA+zYlJjbqpk4etQocxcNFl4qEvJwp7vlQUzxesPqZE
 z+UMiZvfyEeERBEHK3S2j5hS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:40:04 -0800
IronPort-SDR: 7w6e30HraLxy4/IDDrOkCGIwKaGuj6ZsVIKQadxnn+Mj6JvVFtCZ7uCt9NRxoID83NjXve6NM6
 ouqTR7jTmFK8Qha77NUC61D5dXEcHnLVW8saGRNp2Fh84WP99C+9dZKYksRvm9WcT2kQDervMJ
 zs8ZLQx93XpJkv54AQ+XVPckRbHYbDetiAAaW32zVIfPoJwGjZjxJYfty3Kod4Th3hygT8cCRv
 WY2yWDwmvAI1vhE+RZLtup8bbWydjtoKueJ7+KBSH/DJ6QS0cCyXFkCnMPge/bROlJCvq/v7ls
 +74=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:45:05 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:53 +0900
Message-Id: <20191114044454.200461-8-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iV70G-002ZD6-Gf
Subject: [f2fs-dev] [PATCH v7 7/8] fsck: Check write pointer consistency of
 open zones
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

On sudden f2fs shutdown, write pointers of zoned block devices can go
further but f2fs meta data keeps current segments at positions before the
write operations. After remounting the f2fs, this inconsistency causes
write operations not at write pointers and "Unaligned write command"
error is reported.

To avoid the error, have f2fs.fsck check consistency of write pointers
of open zones that current segments point to. Compare each current
segment's position and the write pointer position of the open zone. If
inconsistency is found and 'fix_on' flag is set, assign a new zone to the
current segment and check the newly assigned zone has write pointer at
the zone start. Leave the original zone as is to keep data recorded in
it.

To care about fsync data, refer each seg_entry's ckpt_valid_map to get
the last valid block in the zone. If the last valid block is beyond the
current segments position, fsync data exits in the zone. In case fsync
data exists, do not assign a new zone to the current segment not to lose
the fsync data. It is expected that the kernel replay the fsync data and
fix the write pointer inconsistency at mount time.

Also check consistency between write pointer of the zone the current
segment points to with valid block maps of the zone. If the last valid
block is beyond the write pointer position, report to indicate a bug. If
'fix_on' flag is set, assign a new zone to the current segment.

When inconsistencies are found, turn on 'bug_on' flag in fsck_verify() to
ask users to fix them or not. When inconsistencies get fixed, turn on
'force' flag in fsck_verify() to enforce fixes in following checks.

This check and fix is done twice. The first is done at the beginning of
do_fsck() function so that other fixes can reflect the current segment
modification. The second is done in fsck_verify() to reflect updated meta
data by other fixes.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fsck/f2fs.h  |   5 ++
 fsck/fsck.c  | 152 +++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h  |   3 +
 fsck/main.c  |   2 +
 fsck/mount.c |  50 ++++++++++++++++-
 5 files changed, 211 insertions(+), 1 deletion(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 59d2cc8..55d6b07 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -430,6 +430,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
 	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (sbi->blocks_per_seg - 1))
 
+#define GET_SEC_FROM_SEG(sbi, segno)					\
+	((segno) / (sbi)->segs_per_sec)
+#define GET_SEG_FROM_SEC(sbi, secno)					\
+	((secno) * (sbi)->segs_per_sec)
+
 #define FREE_I_START_SEGNO(sbi)						\
 	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
 #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 2ae3bd5..37ac30a 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2181,6 +2181,123 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
 	fix_checkpoint(sbi);
 }
 
+#ifdef HAVE_LINUX_BLKZONED_H
+
+/*
+ * Refer valid block map and return offset of the last valid block in the zone.
+ * Obtain valid block map from SIT and fsync data.
+ * If there is no valid block in the zone, return -1.
+ */
+static int last_vblk_off_in_zone(struct f2fs_sb_info *sbi,
+				 unsigned int zone_segno)
+{
+	int s, b;
+	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
+	struct seg_entry *se;
+
+	for (s = segs_per_zone - 1; s >= 0; s--) {
+		se = get_seg_entry(sbi, zone_segno + s);
+
+		/*
+		 * Refer not cur_valid_map but ckpt_valid_map which reflects
+		 * fsync data.
+		 */
+		ASSERT(se->ckpt_valid_map);
+		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
+			if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map))
+				return b + (s << sbi->log_blocks_per_seg);
+	}
+
+	return -1;
+}
+
+static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, type);
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	struct blk_zone blkz;
+	block_t cs_block, wp_block, zone_last_vblock;
+	u_int64_t cs_sector, wp_sector;
+	int i, ret;
+	unsigned int zone_segno;
+	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+
+	/* get the device the curseg points to */
+	cs_block = START_BLOCK(sbi, curseg->segno) + curseg->next_blkoff;
+	for (i = 0; i < MAX_DEVICES; i++) {
+		if (!c.devices[i].path)
+			break;
+		if (c.devices[i].start_blkaddr <= cs_block &&
+		    cs_block <= c.devices[i].end_blkaddr)
+			break;
+	}
+
+	if (i >= MAX_DEVICES)
+		return -EINVAL;
+
+	/* get write pointer position of the zone the curseg points to */
+	cs_sector = (cs_block - c.devices[i].start_blkaddr)
+		<< log_sectors_per_block;
+	ret = f2fs_report_zone(i, cs_sector, &blkz);
+	if (ret)
+		return ret;
+
+	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
+		return 0;
+
+	/* check consistency between the curseg and the write pointer */
+	wp_block = c.devices[i].start_blkaddr +
+		(blk_zone_wp_sector(&blkz) >> log_sectors_per_block);
+	wp_sector = blk_zone_wp_sector(&blkz);
+
+	if (cs_sector == wp_sector)
+		return 0;
+
+	if (cs_sector > wp_sector) {
+		MSG(0, "Inconsistent write pointer with curseg %d: "
+		    "curseg %d[0x%x,0x%x] > wp[0x%x,0x%x]\n",
+		    type, type, curseg->segno, curseg->next_blkoff,
+		    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
+		fsck->chk.wp_inconsistent_zones++;
+		return -EINVAL;
+	}
+
+	MSG(0, "Write pointer goes advance from curseg %d: "
+	    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
+	    type, type, curseg->segno, curseg->next_blkoff,
+	    GET_SEGNO(sbi, wp_block), OFFSET_IN_SEG(sbi, wp_block));
+
+	zone_segno = GET_SEG_FROM_SEC(sbi,
+				      GET_SEC_FROM_SEG(sbi, curseg->segno));
+	zone_last_vblock = START_BLOCK(sbi, zone_segno) +
+		last_vblk_off_in_zone(sbi, zone_segno);
+
+	/*
+	 * If fsync data exists between the curseg and the last valid block,
+	 * it is not an error to fix. Leave it for kernel to recover later.
+	 */
+	if (cs_block <= zone_last_vblock && zone_last_vblock < wp_block) {
+		MSG(0, "Curseg has fsync data: curseg %d[0x%x,0x%x] "
+		    "last valid block in zone[0x%x,0x%x]\n",
+		    type, curseg->segno, curseg->next_blkoff,
+		    GET_SEGNO(sbi, zone_last_vblock),
+		    OFFSET_IN_SEG(sbi, zone_last_vblock));
+		return 0;
+	}
+
+	fsck->chk.wp_inconsistent_zones++;
+	return -EINVAL;
+}
+
+#else
+
+static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
+{
+	return 0;
+}
+
+#endif
+
 int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -2209,6 +2326,10 @@ int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 			return -EINVAL;
 		}
 	}
+
+	if (c.zoned_model == F2FS_ZONED_HM)
+		return check_curseg_write_pointer(sbi, type);
+
 	return 0;
 }
 
@@ -2628,6 +2749,23 @@ out:
 	return cnt;
 }
 
+/*
+ * Check and fix consistency with write pointers at the beginning of
+ * fsck so that following writes by fsck do not fail.
+ */
+void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+
+	if (c.zoned_model != F2FS_ZONED_HM)
+		return;
+
+	if (check_curseg_offsets(sbi) && c.fix_on) {
+		fix_curseg_info(sbi);
+		fsck->chk.wp_fixed = 1;
+	}
+}
+
 int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg;
@@ -2678,6 +2816,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 
 	printf("\n");
 
+	if (c.zoned_model == F2FS_ZONED_HM) {
+		printf("[FSCK] Write pointers consistency                    ");
+		if (fsck->chk.wp_inconsistent_zones == 0x0) {
+			printf(" [Ok..]\n");
+		} else {
+			printf(" [Fail] [0x%x]\n",
+			       fsck->chk.wp_inconsistent_zones);
+			c.bug_on = 1;
+		}
+
+		if (fsck->chk.wp_fixed && c.fix_on)
+			force = 1;
+	}
+
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
 		for (i = 0; i < fsck->nr_nat_entries; i++)
 			if (f2fs_test_bit(i, fsck->nat_area_bitmap) != 0)
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 75052d8..c4432e8 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -80,6 +80,8 @@ struct f2fs_fsck {
 		u32 multi_hard_link_files;
 		u64 sit_valid_blocks;
 		u32 sit_free_segs;
+		u32 wp_fixed;
+		u32 wp_inconsistent_zones;
 	} chk;
 
 	struct hard_link_node *hard_link_list_head;
@@ -162,6 +164,7 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
 		struct child_info *);
 void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
 int fsck_chk_meta(struct f2fs_sb_info *sbi);
+void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *);
 int fsck_chk_curseg_info(struct f2fs_sb_info *);
 void pretty_print_filename(const u8 *raw_name, u32 len,
 			   char out[F2FS_PRINT_NAMELEN], int enc_name);
diff --git a/fsck/main.c b/fsck/main.c
index 8edb177..cd4ca20 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -625,6 +625,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
 
 	print_cp_state(flag);
 
+	fsck_chk_and_fix_write_pointers(sbi);
+
 	fsck_chk_curseg_info(sbi);
 
 	if (!c.fix_on && !c.bug_on) {
diff --git a/fsck/mount.c b/fsck/mount.c
index fdf1dd7..894ee06 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -12,6 +12,7 @@
 #include "node.h"
 #include "xattr.h"
 #include <locale.h>
+#include <stdbool.h>
 #ifdef HAVE_LINUX_POSIX_ACL_H
 #include <linux/posix_acl.h>
 #endif
@@ -2480,6 +2481,52 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
 	}
 }
 
+#ifdef HAVE_LINUX_BLKZONED_H
+
+static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
+					unsigned int zone_segno)
+{
+	u_int64_t sector;
+	struct blk_zone blkz;
+	block_t block = START_BLOCK(sbi, zone_segno);
+	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	int ret, j;
+
+	if (c.zoned_model != F2FS_ZONED_HM)
+		return true;
+
+	for (j = 0; j < MAX_DEVICES; j++) {
+		if (!c.devices[j].path)
+			break;
+		if (c.devices[j].start_blkaddr <= block &&
+		    block <= c.devices[j].end_blkaddr)
+			break;
+	}
+
+	if (j >= MAX_DEVICES)
+		return false;
+
+	sector = (block - c.devices[j].start_blkaddr) << log_sectors_per_block;
+	ret = f2fs_report_zone(j, sector, &blkz);
+	if (ret)
+		return false;
+
+	if (blk_zone_type(&blkz) != BLK_ZONE_TYPE_SEQWRITE_REQ)
+		return true;
+
+	return blk_zone_sector(&blkz) == blk_zone_wp_sector(&blkz);
+}
+
+#else
+
+static bool write_pointer_at_zone_start(struct f2fs_sb_info *sbi,
+					unsigned int zone_segno)
+{
+	return true;
+}
+
+#endif
+
 int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 						int want_type, bool new_sec)
 {
@@ -2533,7 +2580,8 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 					break;
 			}
 
-			if (i == sbi->segs_per_sec) {
+			if (i == sbi->segs_per_sec &&
+			    write_pointer_at_zone_start(sbi, segno)) {
 				set_section_type(sbi, segno, want_type);
 				return 0;
 			}
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
