Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371013B7D9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 03:41:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irYcC-0001ml-32; Wed, 15 Jan 2020 02:41:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=276f86f0a=shinichiro.kawasaki@wdc.com>)
 id 1irYcA-0001ma-T6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ophzevd79f0U/7xC+xUerQjORsRcthE1tBJket+5Q+c=; b=Cm21G9aPDEElJzSLjGLGyHTDVp
 B7OzIUbezPAmrnWT4zeKjAfArQ77vKIpbjQeeToFVOTpTxD9KclWdJRfY+4Gq1Kr/MEQ4qzDoOHiq
 AFtZCcv2vBgBtlru8UR/pnxRHjCAuIOPKwThY4m+BniCzxGhPvcq2hzn39q4DCQSKl9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ophzevd79f0U/7xC+xUerQjORsRcthE1tBJket+5Q+c=; b=XdP1MM+gYMNDq3Fv70n7LccMyE
 hk9IJ6YhYlyYMkKfl1h8YhHltnhPjg9IcCK/+1630RYlfq8KVLnsk13Dd0WabMZcW/CCfnWFa4FpV
 gKWW7jGkoJjvv1yLTuIJEDmWnuy6YrqHHUWigRdRhHivD3vJN08R1FBdhDW2H/wRQS8s=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irYc9-003pRg-14
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1579056062; x=1610592062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M8EbB9BktAgoHqMQQtd+mflLSUIMyOYN3r+oEB+YFdc=;
 b=nntNqQp72HvyZJgTC5/cs7Z+2R6kdzbaPuNqYMTLj6QDwMTRhKqCCN+0
 S7Bxdd/NUlO+DeBN1GDB+t3Myr8aSvDBHJJRtscgDvtMb9Xrt8FbSVvBp
 LQIxcwiHh7+0VjguAGIkNLBeT62Bu+MhEC0d/yhRiwS4YaV5vTE3lXe9L
 aU1x7aZeF7/s777b8mcm4wme+7vgGS4mxLY9+1qRCROzI5VWZCjypuTaP
 aCYEC+G9hQyzdAML9b3pZl1TO2Z2MRky4HN4uKXvnB7JJq4iYRGjd+9HY
 /B2V0aokVLlbvD9UC9ysI1939mfqx8xAXGZ5sdmU8hGpxaJBD6spoOU70 A==;
IronPort-SDR: Y3cJBt5LWEZycBB+1/F3xfAsbHct7uspa1ICjLB+Kdw/kbkf3Czb5wBDxq2mBYj4ANc2K5EknR
 aiVXehUEdaClwCh0XRHjriLRevZdeRPsBTGwA4aG6iXEh4DwWCBUQVx0Op0CsbSh36RmZi6dnT
 t58eNOPjMMTSc10lva+NGjRhkfHt7bN1fj9UIle/otsRrpnh5Z7mE1wf0WWS8R05Ogu1A1psxw
 +eWqum00FIRnmRlyetAbeuFDOQvK90dKua8QmSsOBX96yirwRSqqBczmf9WvjjEkQg9evajeh7
 mx0=
X-IronPort-AV: E=Sophos;i="5.70,320,1574092800"; d="scan'208";a="128158037"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2020 10:25:12 +0800
IronPort-SDR: V49J5hu+2CNWb0gRux875pdDJTME6bIXJpVGo8L3+lXXGjsSJmmgpq1A57FAT12z2LhHI3zupJ
 /HbqxT7hTGHCbQ891byKmzdJWRSINL+geiAMeww6XF3MzmTf4pdEcOmOgJiMG6no9/rZ0ELrfE
 JNVgRZATZ4C8iXxBJZBwCOHpjMeXJOcixk/S6k0v+rS5Azn6CUP3OWaPWqwCbafNYbOucEQhFc
 abL0nQQSsX/OPaGCFRoNpvjDiM4Ul3HIQ+dl6FjweCCsUSPG5WaTlKKLx9CQOtW/1uS367SDey
 4YR0zMV1tKCpm9qMgAfCWgTu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 18:18:49 -0800
IronPort-SDR: zf03kiUByaxRMrFhNp7L/Y3SUfo8SBJ5/2JuEC435S79Bzx2pa7SNZEvgw6S4b8vnNzklO0zHn
 6+jRWC+MGYhC+JFBkaBLtiDXsEmaEgnlnhywEBCNEhwaOq4woERBOvcQuNzQ7DQpUw6w6uDbpy
 nRy197k4ZMTkMOSyMqE7fWtjURjpipUYhzshetrEYBlZrNT+UnCgUK0+5rifFlkIVR7u24OnLi
 Ow7he/NvrCh9n/Lqbs2ANONSeesFMYsjjQbxQsPKF7sbA1jmT/9pSk/4g9iJC4cZp2aOi8amZ0
 g4Y=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jan 2020 18:25:12 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Jan 2020 11:25:08 +0900
Message-Id: <20200115022509.199291-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115022509.199291-1-shinichiro.kawasaki@wdc.com>
References: <20200115022509.199291-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1irYc9-003pRg-14
Subject: [f2fs-dev] [PATCH v6 1/2] f2fs: Check write pointer consistency of
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
Cc: YueHaibing <yuehaibing@huawei.com>
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
index 56e81447e2f3..5c3018743a9f 100644
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
+	block_t cs_zone_block, wp_block;
+	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	sector_t zone_sector;
+	int err;
+
+	cs_section = GET_SEC_FROM_SEG(sbi, cs->segno);
+	cs_zone_block = START_BLOCK(sbi, GET_SEG_FROM_SEC(sbi, cs_section));
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
+		err = __f2fs_issue_discard_zone(sbi, zbd->bdev,
+				zone_sector >> log_sectors_per_block,
+				zone.len >> log_sectors_per_block);
+		if (err) {
+			f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
+				 zbd->path, err);
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
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
