Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4BDE6C92
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 07:55:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOywI-00042l-ME; Mon, 28 Oct 2019 06:55:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOywH-00042E-4s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t20H2mRRKEFgmzrqH9T0U8Qgvy5foO+cYV8b4p2FO60=; b=MUWCPRw9uvgCXj2YMDXUNRdOgw
 ePZ67aTfvhysZdGCGs9GFfdAVJ0muJmqRWUa/wuzMS7g4QqnS+zSxcAyGaJy5xK0qEoOiDNyP2tlW
 8dVgSBlRQRxh2luVGkpj3BTnHaBU11T5VpuZKMMNFjSnGn9tzMDF2iz45nAbiyofkDgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t20H2mRRKEFgmzrqH9T0U8Qgvy5foO+cYV8b4p2FO60=; b=ek8MmPde5htJFoqk8jStWaoRMc
 YaNILdLZdhIJakvFY63brU6mGePDcTGA4Y8/Lsq2VZaiV3RrxK0XZ6EXqBooOB/DDR6ryg0qUiGjx
 79jocO8HM8kIs3JQfSL8X81pgttUPRRbKU1TTv66bf+yVnqHfOABT7KU+jjOan+8iUUc=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOywD-0031HF-4C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572245738; x=1603781738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IaM3eufRgUnEo5G3ihLMJlEpOSOwvy4uujH+7nu1BdY=;
 b=WAunUkYyuYAO6qUdzj33ALwIg8Yq6pjjxQUXzkD8/SW4m88Knmw89hdx
 coEpB7Lojba/RblS6J4c7F7AR6GUwwOyZpv5RBHVR4S2lbF+SwLmZFIYe
 blF97t78dG0Ib2kDI3fY3ICTXSaquWY5IG6WAeZaWoVaUCiBBBPJ7OY0W
 SvucANeBuDBS0VAhJe4Fi50wY6okfwYVDnXH/tSTdu5DGuzi0CvL3HKXO
 pkQF5Y01Lvc/HDkoIK8q3DtcyOqvNZk2ppSPTkj3mdNrxLA3ncVyqY7Gr
 7jhb7PuqWg0+ZYahaa0opIxgVD0R1W3474lHD1QSBUnbRAprIuVlamQag Q==;
IronPort-SDR: UtZ8aOP7Ej56aYhOplXndkzWO73T5WPPhea4HETfMxTHZhE3jcZNLuA7AL6xr++tb+CO5iTJAy
 KGyB4g2OD/XfMTZsTOO01cd5/22Tg1pWYPU/2AJv9x3Xv955b08sXGMYPaHDgQY0MCX+ttWPIP
 QsKOmZu2gSlkBu0Ar7eg7Hy2taEATSL9BQhkMwtLRR0FvQj04+UbgGbeRqo/X1G7ouk2A2VLEu
 nlqniozTMFQ3XczMefhaUGqlmVDZlCtgCVCAbl3vbydR0ThzFmDgJl1Mh5KJAds6WC3GDVcyOp
 /BI=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="125879638"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:27 +0800
IronPort-SDR: Reki6pY56zbXcpsJfaTS6Tza6/BoaZdaIEIyIUc/W245Z779S2m0pCLXw1XBoLM1pwbvg6oui2
 6EaDSncVe5Sr2Gyip/H5gVyuW/0o3hT15LgnX4pDeGyYL+Vt7fqkW7u+0OtrwBVeV8AwxBucJ/
 UO7E6B/2JaT9/FFyvOvXorSZHslSV3qsspz7AA2KGF0wkiRxAVLAh/71ixzucCbXtaDeyn1qmC
 hpqeO9LAQpKQXmI+Bdp8iWmF9YQXmvXXgCXZ2zICkI1UNIFZxHB7JWbxtA4gQVl0qkUYqRyBVy
 4r9VbdohZrwRQA1Sxup2t5F5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:48 -0700
IronPort-SDR: j+Tj8fWhQFVp44/nauhwU06Cz5NgsnCNxVSVm/0VyEEalIGx2SVAKkyQRPUtgFtKQP6AfI6mpj
 gx+S7PzW+sK6biaSzjY4snOMxULdues0RmrYZqFLatFn4XJHexB2JKdH4WECRAVde3fcTPOOrs
 wJ1o0PxQIN5ZdTwrjNSWnfsbvE2t5NSAlr3ke7ejkT57NwIVMIKOpYhGvB9keSRsmowgpdBVgx
 V1C4dcaPAJ2PBNBDnXPEc2TsSLDjtOJQQ5l/wfVIlcXrqdoXPAl+Jk4tqCW5CT0gFvkw72U09S
 cHs=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:26 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:11 +0900
Message-Id: <20191028065512.27876-8-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iOywD-0031HF-4C
Subject: [f2fs-dev] [PATCH v6 7/8] fsck: Check write pointer consistency of
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
block is beyond the write pointer position, report to indicate f2fs bug.
If 'fix_on' flag is set, assign a new zone to the current segment.

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
 fsck/fsck.c  | 154 +++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h  |   3 +
 fsck/main.c  |   2 +
 fsck/mount.c |  49 +++++++++++++++-
 5 files changed, 212 insertions(+), 1 deletion(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 399c74d..07513cb 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -429,6 +429,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
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
index 2ae3bd5..e0eda4e 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2181,6 +2181,125 @@ static void fix_checkpoints(struct f2fs_sb_info *sbi)
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
+	unsigned int s;
+	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
+	struct seg_entry *se;
+	block_t b;
+	int ret = -1;
+
+	for (s = 0; s < segs_per_zone; s++) {
+		se = get_seg_entry(sbi, zone_segno + s);
+
+		/*
+		 * Refer not cur_valid_map but ckpt_valid_map which reflects
+		 * fsync data.
+		 */
+		ASSERT(se->ckpt_valid_map);
+		for (b = 0; b < sbi->blocks_per_seg; b++)
+			if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map))
+				ret = b + (s << sbi->log_blocks_per_seg);
+	}
+
+	return ret;
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
+	if (cs_block <= zone_last_vblock) {
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
@@ -2209,6 +2328,10 @@ int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 			return -EINVAL;
 		}
 	}
+
+	if (c.zoned_model == F2FS_ZONED_HM)
+		return check_curseg_write_pointer(sbi, type);
+
 	return 0;
 }
 
@@ -2628,6 +2751,23 @@ out:
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
@@ -2678,6 +2818,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 
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
index 8c62a14..9a7d499 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -602,6 +602,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
 
 	print_cp_state(flag);
 
+	fsck_chk_and_fix_write_pointers(sbi);
+
 	fsck_chk_curseg_info(sbi);
 
 	if (!c.fix_on && !c.bug_on) {
diff --git a/fsck/mount.c b/fsck/mount.c
index 2979865..5085e6c 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2465,6 +2465,52 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
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
 int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_type, bool new_sec)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -2517,7 +2563,8 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_t
 					break;
 			}
 
-			if (i == sbi->segs_per_sec) {
+			if (i == sbi->segs_per_sec &&
+			    write_pointer_at_zone_start(sbi, segno)) {
 				set_section_type(sbi, segno, want_type);
 				return 0;
 			}
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
