Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B73C10C4A5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 09:00:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaEit-0003OJ-SX; Thu, 28 Nov 2019 08:00:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2285f8a38=shinichiro.kawasaki@wdc.com>)
 id 1iaEiq-0003NG-UM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y0q4KwI0x2puImFM4wSQeYFmwG2C40mmoBRE2si947I=; b=J4qKOoZcADseVqcftTWxu3qlSX
 f7oRKp/GHkR2vyvkNgQQj3MX6ZNwM+UlwJwpc/nGb5vcksHBNDm/iT/7G4cvw+kkBvAHE1FTeEKO2
 8/5rTccIzcL1vEf+xdasbwqbMWQDIyo2CVFhNxSg1mGZ46zXrZbPvzLKXzvegjTO0zBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y0q4KwI0x2puImFM4wSQeYFmwG2C40mmoBRE2si947I=; b=SROGLxqxlP5Ut95cvAD1t/1lQZ
 bbBqs/mwsdhE/RQ3Dvo9qEdLEzbDZaKj7UYADL34isfUgp4xxfFouoALBT1fIPoar4lUo802bYdxw
 wCKPg+1ETmLwuuAvovdJw76xFfgNYzIjrOGV1yQala/fN9ECo16a2h3QgdqsEoX8kF8Y=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaEik-00Fq7V-Dt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574928074; x=1606464074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=28E/yTGLr3ItMcB5N+Eq9CJkAiIjKC3FTXk6irq9llw=;
 b=gkxftDxgtIw4AxXZ07ubvaHND297rbDJO/9skYKkWjrhIxWb6Qw3034f
 ACF+rFW1YWVOi6R9GCmLg8hidGJeLHEUYrOrOP4FUN/7QLHSXm7K7Mjas
 4nOOjpyCVDgbKh71CmpowV39SJnGnV7/6/WVdVADzXmTbY5PZQOXDWTxQ
 ltg6+cHmwqoNmrepcVEkNfpqAOKxNyc0Noa+bKZoXpz82XmLa3rLGsZ76
 44JH1p0/FcvT2ibPapaJDw4UWGoblcpMV8v9gzk45GXQTDjMarl8/8rIc
 yRau3tvub5pj7vB0bflXoRh22/X4/sVBZrwRs6CM/sFP4NntrPDWPiOJz w==;
IronPort-SDR: oHtXE3kjBjnUSy3gLa2+Lr1u+5LzfHLNqzSJkeDMz2yhee1yMmtdd6tGkGVl5b0khbdCk0o586
 GaKb4BOaiOf029EBpy5rvchXbFB7omQag2yvuWkc2Wd6gDAMZe9Q1FDpvUU99f6l+xtZEKZbzE
 6BV3UjWI0weDf5DW/ZZaNWexpw9Q4ZvXVqmp//Jx2UjH1RzZXDS2DwzWEAUwR2XHtMq157bTtR
 3ZuVizrvJaBew7AoEEXoPHSdedTfTPa3ubNpSyNNvuABW7eDX2v3m/r9B8nd5W0zV0bD4D9pjq
 fBk=
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; d="scan'208";a="225597363"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 16:00:51 +0800
IronPort-SDR: 2xEB7FvSJ1viUahcY3XRdgGtMWJzlw/zJR3eTV+cqrcX2jr5curGGdiEXCJLr62A/Ri/qAnXV6
 Zkhd9mmowPXPXNIm0UjtsPHc0TUR215F4TKy5EPiWoWWEJN58Ni/ZaVwdeFQlQtSIVttpSJCCA
 /4/VrWQwKUXdaWOHsBL+ClkFJqmuEwR7I6GjdqkPUHKMMy8x9jwQCPPon1PbdDyoNms3bMrndu
 3vh/r9x6CbjPibe0xv8OFCwzJoyK77dMvbdOKaDukjQUdkbrFfBQaWiO3yDsT1dHzZa3GmVb7f
 IVTH5OC4Tzb5ourTbeuVxxK/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 23:54:34 -0800
IronPort-SDR: 9NPLqPouf6w55eJdGzxUXlOmxND1xqkoxNqFfO6g/K/l8JIugreIwSNRWnNCpfJRwClUC/pOC5
 BM5BbcNmHuI4NKkHXxE9lVR1o8wNY+bNtT6NOf45wCgFidNfE2Pw7RmI7xtn3X/PomaPgcGiJ6
 bF802XNlvW9TIQI0rzH+6EijHRoCijc2aqhGmGTxaPxBFS301M6pLZHNJdiIGFgh+GAUY7f7g0
 7dZlhKtHFxelUROuqGK3p2tqio0HJu/KQH+1CfzPDkl8nSQ7mRWGobpZw3rru47+WroLf5mdUJ
 dV0=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Nov 2019 23:59:58 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Nov 2019 16:59:29 +0900
Message-Id: <20191128075930.467833-8-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
References: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaEik-00Fq7V-Dt
Subject: [f2fs-dev] [PATCH v8 7/8] fsck: Check write pointer consistency of
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
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/f2fs.h  |   5 ++
 fsck/fsck.c  | 159 +++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h  |   3 +
 fsck/main.c  |   2 +
 fsck/mount.c |  50 +++++++++++++++-
 5 files changed, 218 insertions(+), 1 deletion(-)

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
index 2ae3bd5..a8cd824 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2181,6 +2181,130 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
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
+	 * If valid blocks exist between the curseg position and the write
+	 * pointer, they are fsync data. This is not an error to fix. Leave it
+	 * for kernel to recover later.
+	 * If valid blocks exist between the curseg's zone start and the curseg
+	 * position, or if there is no valid block in the curseg's zone, fix
+	 * the inconsistency between the curseg and the writ pointer.
+	 * Of Note is that if there is no valid block in the curseg's zone,
+	 * last_vblk_off_in_zone() returns -1 and zone_last_vblock is always
+	 * smaller than cs_block.
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
@@ -2209,6 +2333,10 @@ int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 			return -EINVAL;
 		}
 	}
+
+	if (c.zoned_model == F2FS_ZONED_HM)
+		return check_curseg_write_pointer(sbi, type);
+
 	return 0;
 }
 
@@ -2628,6 +2756,23 @@ out:
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
@@ -2678,6 +2823,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 
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
