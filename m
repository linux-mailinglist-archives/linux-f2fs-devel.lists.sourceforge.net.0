Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC910E7D1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2019 10:41:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ibiD4-0005p4-R3; Mon, 02 Dec 2019 09:41:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2324aa620=shinichiro.kawasaki@wdc.com>)
 id 1ibiCZ-0005me-3N
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 09:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sO+A9esbd2zyBZfAOK7vQPMb2Z4xOaNg6uK85gthkmg=; b=TITmr8ig/yIzMaCvh9f7WNjGF+
 jenW9uQbaA26xvg8rIRjMW09D2czxzQg+BZu4ST3G0WZVkKBYf00I0hRd8cM0T+IgUb3G2TJcliWo
 2D7kKwIeIlBeR0MkxM3ZIDedkwj45/O6IziH5+3FBsxJERuEpYCzJTZH6eIpUelE78YY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sO+A9esbd2zyBZfAOK7vQPMb2Z4xOaNg6uK85gthkmg=; b=S8Hw8bx+honM0tiqSWqDU2ikGp
 nsmnTRYSGrPYwGzBBfuksHzUSzjniLLaCno0EDzApeO9AdO+3U/E+qGRW3mPvqhBblHl4qw2kXrMU
 pBmj1CxGVyqHf/P4gpPqgqGBKOWK1o9FVlDqlMhWCMkhF/ksfmjNAs91SzWn1FYnUsnU=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ibiCX-002exm-SC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 09:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575279678; x=1606815678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFqAjvAtaJGG3JHEn0vzL2jy2yBgpx9kq1rgn9YoTss=;
 b=qsDbbcL6co9x9Yv7FuPoxvdxUmPcbPmq99n5k38wIoDro5yJus9lPyz1
 NRAJ8C4LFfS79i/3WDcHFnsVswPSfu4lDYthivDX0kbKCN8kt8CHJQNzi
 BbBQmvY12TLXhGt/JLEjrdlsE5FF1ehCPD7MPnZCWC4qQR+5nY5Tt3iuo
 i+xpfeVKLUUaMSaO2/1Fw5fhSJmzNH/bqPt7leNR9d49GRGqX7bl/PUaj
 I5myGpjnW8vGwu89yPvrD5H9Nc+W+WIlyFefsomOhyFz23huCauoN64LF
 efidJJAtsbuKNDwIN4wclexmoP0vB+RINMdE47HnLpIk6Tb9y3W193Z34 g==;
IronPort-SDR: FDtrcfKw5czPDp4TwJTB0JniXaHtnP1e4UjVMI0N5x9XtbqIx93IeKvar7bockNhkV0M6mGBsq
 fFEc4deOv/R+3RQqWx6J9+xYUbvv5acgZ8T+q1o/V4lRiHU0e0MVQ9Pu5/wUMvVvGRFhhE5EoC
 Ggg8KO3WVrYdiDZ3ODlZc1rJo6+wXCoAROEVuEcmzI7dhjSRysCdQsWFV+tzOzQpBiQCJmlDir
 Js/HtanjgUj9oVA5ualtOflTLdaBSh6n+XjOyzDwKtpLDL6LEdix3EzbUgykzylyyisyNt42CR
 lOQ=
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="225835236"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2019 17:41:02 +0800
IronPort-SDR: CMEp2zVS1ZXuvsBokatIg73AHWLTNipy68FmihA/tE4JdYT7F4Nt+rvs4nMqBNyRVIGkOv/JEf
 f7GWrJVxNUmjbx7mkfycFUzZmgwrz8Hi1vWDJbeTiUt4rhh+5RPLqjUv7CGHhzTrEawtD3+S95
 pNdmjlttcyZ3a6uBEOv6oRVEK6saOzoB6MMTRyfcMmAoVMXp4Wjqg0Wp7bVgKbDx0DXOiwLa84
 nwBvuGmYdvejgIPrcGx2b8LsoZt4Jvnwgn1SYGnJDzFs2B9Hq9D3z1Rer2qVTAsxKYo+qGYSmn
 6Uc9IF6YdAFsNqVUBjwUZDAB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 01:35:23 -0800
IronPort-SDR: k94rww3IrdZVOzsXJfwCvTHcKErOF5Lt+GTyCcyuASqxisi10fjxXfUUAfC1Mm/keS9tG5emr0
 muVnSm2pZmaPC2zwW1V6vE+BlzV1Is1k+nf/rLbXGBFJ6uvOubJibCNJmOv1aBs6WeJw09KQ71
 jp1IgE2lzLGDMWiGoXalaLRRmqoZ/Sq6wL6hj6GHb09aSoln8BGjzhUpwcpL1usPBf4L8J4Ry3
 P4Uh8TDmshEQz9w4SrR9e86LX4ilGZvpHbIzekrVC3/+vq57+2/mXZ1RygZV+OIkrOKF0pRtG/
 fsU=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Dec 2019 01:40:53 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  2 Dec 2019 18:40:42 +0900
Message-Id: <20191202094043.892258-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191202094043.892258-1-shinichiro.kawasaki@wdc.com>
References: <20191202094043.892258-1-shinichiro.kawasaki@wdc.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ibiCX-002exm-SC
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: Check write pointer consistency of
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

To avoid the error, compare current segments with write pointers of open
zones the current segments point to, during mount operation. If the write
pointer position is not aligned with the current segment position, assign
a new zone to the current segment. Also check the newly assigned zone has
write pointer at zone start. If not, reset write pointer of the zone.

Perform the consistency check during fsync recovery. Not to lose the
fsync data, do the check after fsync data gets restored and before
checkpoint commit which flushes data at current segment positions. Not to
cause conflict with kworker's dirfy data/node flush, do the fix within
SBI_POR_DOING protection.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/f2fs.h     |   1 +
 fs/f2fs/recovery.c |  20 ++++++-
 fs/f2fs/segment.c  | 131 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a888a063c7f..002c417b0a53 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3155,6 +3155,7 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
+int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
 int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 76477f71d4ee..763d5c0951d1 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -723,6 +723,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	int ret = 0;
 	unsigned long s_flags = sbi->sb->s_flags;
 	bool need_writecp = false;
+	bool fix_curseg_write_pointer = false;
 #ifdef CONFIG_QUOTA
 	int quota_enabled;
 #endif
@@ -774,6 +775,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 		sbi->sb->s_flags = s_flags;
 	}
 skip:
+	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
+
 	destroy_fsync_dnodes(&inode_list, err);
 	destroy_fsync_dnodes(&tmp_inode_list, err);
 
@@ -784,9 +787,22 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (err) {
 		truncate_inode_pages_final(NODE_MAPPING(sbi));
 		truncate_inode_pages_final(META_MAPPING(sbi));
-	} else {
-		clear_sbi_flag(sbi, SBI_POR_DOING);
 	}
+
+	/*
+	 * If fsync data succeeds or there is no fsync data to recover,
+	 * and the f2fs is not read only, check and fix zoned block devices'
+	 * write pointer consistency.
+	 */
+	if (!err && fix_curseg_write_pointer && !f2fs_readonly(sbi->sb) &&
+			f2fs_sb_has_blkzoned(sbi)) {
+		err = f2fs_fix_curseg_write_pointer(sbi);
+		ret = err;
+	}
+
+	if (!err)
+		clear_sbi_flag(sbi, SBI_POR_DOING);
+
 	mutex_unlock(&sbi->cp_mutex);
 
 	/* let's drop all the directory inodes for clean checkpoint */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 56e81447e2f3..9b6c7ab67b93 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4368,6 +4368,137 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
+#ifdef CONFIG_BLK_DEV_ZONED
+
+static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
+						  block_t zone_blkaddr)
+{
+	int i;
+
+	for (i = 0; i < sbi->s_ndevs; i++) {
+		if (!bdev_is_zoned(FDEV(i).bdev))
+			continue;
+		if (sbi->s_ndevs == 1 || (FDEV(i).start_blk <= zone_blkaddr &&
+				zone_blkaddr <= FDEV(i).end_blk))
+			return &FDEV(i);
+	}
+
+	return NULL;
+}
+
+static int report_one_zone_cb(struct blk_zone *zone, unsigned int idx,
+			      void *data) {
+	memcpy(data, zone, sizeof(struct blk_zone));
+	return 0;
+}
+
+static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
+{
+	struct curseg_info *cs = CURSEG_I(sbi, type);
+	struct f2fs_dev_info *zbd;
+	struct blk_zone zone;
+	unsigned int cs_section, wp_segno, wp_blkoff, wp_sector_off;
+	block_t cs_zone_block, wp_block, cs_block;
+	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	sector_t zone_sector;
+	int err;
+
+	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
+	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
+	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
+
+	zbd = get_target_zoned_dev(sbi, cs_zone_block);
+	if (!zbd)
+		return 0;
+
+	/* report zone for the sector the curseg points to */
+	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
+		<< log_sectors_per_block;
+	err = blkdev_report_zones(zbd->bdev, zone_sector, 1,
+				  report_one_zone_cb, &zone);
+	if (err != 1) {
+		f2fs_err(sbi, "Report zone failed: %s errno=(%d)",
+			 zbd->path, err);
+		return err;
+	}
+
+	if (zone.type != BLK_ZONE_TYPE_SEQWRITE_REQ)
+		return 0;
+
+	wp_block = zbd->start_blk + (zone.wp >> log_sectors_per_block);
+	wp_segno = GET_SEGNO(sbi, wp_block);
+	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
+	wp_sector_off = zone.wp & GENMASK(log_sectors_per_block - 1, 0);
+
+	if (cs->segno == wp_segno && cs->next_blkoff == wp_blkoff &&
+		wp_sector_off == 0)
+		return 0;
+
+	f2fs_notice(sbi, "Unaligned curseg[%d] with write pointer: "
+		    "curseg[0x%x,0x%x] wp[0x%x,0x%x]",
+		    type, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
+
+	f2fs_notice(sbi, "Assign new section to curseg[%d]: "
+		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
+	allocate_segment_by_default(sbi, type, true);
+
+	/* check newly assigned zone */
+	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
+	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
+
+	zbd = get_target_zoned_dev(sbi, cs_zone_block);
+	if (!zbd)
+		return 0;
+
+	zone_sector = (sector_t)(cs_zone_block - zbd->start_blk)
+		<< log_sectors_per_block;
+	err = blkdev_report_zones(zbd->bdev, zone_sector, 1,
+				  report_one_zone_cb, &zone);
+	if (err != 1) {
+		f2fs_err(sbi, "Report zone failed: %s errno=(%d)",
+			 zbd->path, err);
+		return err;
+	}
+
+	if (zone.type != BLK_ZONE_TYPE_SEQWRITE_REQ)
+		return 0;
+
+	if (zone.wp != zone.start) {
+		f2fs_notice(sbi,
+			    "New zone for curseg[%d] is not yet discarded. "
+			    "Reset the zone: curseg[0x%x,0x%x]",
+			    type, cs->segno, cs->next_blkoff);
+		err = blkdev_zone_mgmt(zbd->bdev, REQ_OP_ZONE_RESET,
+				       zone.start, zone.len, GFP_NOFS);
+		if (err) {
+			f2fs_notice(sbi, "Reset zone failed: %s (errno=%d)",
+				    zbd->path, err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
+{
+	int i, ret;
+
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		ret = fix_curseg_write_pointer(sbi, i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+#else
+int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
+{
+	return 0;
+}
+#endif
+
 /*
  * Update min, max modified time for cost-benefit GC algorithm
  */
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
