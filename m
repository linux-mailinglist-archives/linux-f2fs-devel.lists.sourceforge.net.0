Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43445116B52
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 11:45:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieGXK-0001Yt-3d; Mon, 09 Dec 2019 10:45:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2395697a2=shinichiro.kawasaki@wdc.com>)
 id 1ieGXG-0001Ye-TO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/G0DbqLuFC1dG9V22Tsdde/JPuQCnUl/6PVH3AUTI4s=; b=MGo20F8bWev3mLYbEa0E2gJ0f1
 YZHnM9Wi8vrDC0K83uPYfCP6N/+4SrdLJe7oOujbc3sELt1An1p5XY70qP6S7rjMM8ZDm/8pJq53Z
 h10Zhm5rx4h+zQreRn/w6MckiTt4FTRV09lbxi7zicJvYWjH41SulJv0sr8PyjnWnT6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/G0DbqLuFC1dG9V22Tsdde/JPuQCnUl/6PVH3AUTI4s=; b=fLsLneLXW9yvdc1xW/ad8fGBjx
 GhOkdMNf/aAO0T+UClgjLj7F2Mg4eSZJ0p6kQn0us1XeD5ZTBsNMicUUKfIlshpksDEC3ojERKRq6
 7kEc5sPt8oQGD4nTs6UahCbbkfCfi0/tvAXpGtoTC8cRJ+nI0d4Go392CRJTj32F2Qmo=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieGXD-00FMWj-HL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575888309; x=1607424309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kOn8uBgTxpq+a9UN3MyaCiQ1nYQrrFHBzxbWJNmEGv0=;
 b=YvVfhBWQw/yJTJx7/3KKIMo92B+abkJxblSY80K0y8oWRzHVKuk7EGYa
 6UG4dlyuQey8Wt3f82i3mRmoy5sjhU+NL+v0jRcPgZ5suQWWVvKaSJXXv
 0ky9zfXuNk4uPnmLAbdkzGeN36bBiIip91axg6Jgx7/oX9v48zRDB7jPI
 MF4il/BQXBpIt7HQK0bPd/0gOi8adQYGHMQrn0cncH1CXQ33NpeOLSv+Z
 gLMuJ8sHNm7kY7BNQ1hRUO0LVBl2UZaFsAPEOGDt9Wyj8w72S1T2dWE00
 6fwERfCtB2voLB7ObIXPmIyNrH966TQGvNkOCE6irY7bCof1YuQkDLYhJ Q==;
IronPort-SDR: j+vlO3I32+BPqpmU9FkEK6g5/T1VCN/k4YyKt41T12Kiix3RoKE+dL0qsSyf5lucTlvYBzbcX9
 oprlUNUnTsmh5wlP/CqnzrXd+g/WEGn/xMp6woB5Rrt/dc8mr5m+Du0+j09G3t/eV7AyvBvVCd
 RVlrLnXO2pb2CzgcRSd69q9Xz7RPX7Fl23Ti6zN9iZ26w0bI+hbTcbk7G3CpHwyYAqZOfkSDqQ
 szuvAEc1gGg5c2FZVHx03FphOagymjQuuobemByFNxa+1nFbaMoFLSE6cuPRSvnYH2k7Z946Kb
 FN4=
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="226385649"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2019 18:44:54 +0800
IronPort-SDR: qRAMOCRL3JTUs5fHTB2/OUiV5bF+0H8gsneC720urmACqKjjSOFM7aX1dqGOWhFz1nPNkW4CfS
 XjuPNVTD/66F8sChPfdbYvAUgnzbgaSGaC/xRbB1H2jnLB3gf2yDjn5JnLHv5t30m9CMuKguQV
 5lHh0svx4bxTIEs1kIKIVNv8OKVgjsa7mV2x9ZkzoYjV5yG/wn9gMrvz4b/vkZFiXVuUKQjZie
 t/f495S0UcudoYUtXSpkUWztK3VUojd+6GaOiUuI953RQAUZ6AvR8igQDekQB1gICW90pmf4TW
 B66FdILIZZxDzJJ7atpBMusE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 02:39:28 -0800
IronPort-SDR: Ba6t8+uLDLYXtVV/pte18MQBi6X3XnZBUjWzw/oHp9WOJU1nCvJnuTCJn0MrzIHTd0suNma0TK
 4x+XZE7TNMS3MX/meLiatFjnB6VzOdu/bzl8hpq3+NW1gv/TPkk4rLs3fgP/ozSl68PCDPLfMt
 SXRyP7tOGUPH5/qv0BZaQZxFQWIj0EFfEWsv0d0553KsCau+FUX0OH/RZeqmsjnJj+6K84j2In
 biK2owk47OWJ/lwevmV/0IyB24JG9P15kd/l4VrN6BMnC2DZCiBCWsk52zHp45LxQq15Mv7N2S
 74g=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Dec 2019 02:44:48 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Dec 2019 19:44:44 +0900
Message-Id: <20191209104445.216327-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209104445.216327-1-shinichiro.kawasaki@wdc.com>
References: <20191209104445.216327-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [68.232.143.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieGXD-00FMWj-HL
Subject: [f2fs-dev] [PATCH v5 1/2] f2fs: Check write pointer consistency of
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
 fs/f2fs/segment.c  | 132 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+), 2 deletions(-)

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
index 56e81447e2f3..73473f2eb49a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4368,6 +4368,138 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
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
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
