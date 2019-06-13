Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D822433FB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 10:11:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbKpv-0008Iv-8u; Thu, 13 Jun 2019 08:11:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hbKpt-0008IU-Bq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 08:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVlCiyEDRSUOT0jdimGngNP36ybszG4tONc15SFAyRc=; b=NAJQTJiVPTvNU/IwQac8GWrBbw
 YLzLnrGx6PJ6GApaVIZDqUJ2i807RFPsDhK6T3zmHn1NZaGnvqAJi8mcg/NgdCc3ZWDUxUyJDHis2
 kV7cTRkzAc8E7SFWv3cyFoxgqd9iRZWGT7aNOl4XNbey/7fsPGIbrJDStGagiwtOvEDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dVlCiyEDRSUOT0jdimGngNP36ybszG4tONc15SFAyRc=; b=L
 EUYQ4PNve+4tNT4fiEsvw9768Wr4G/ag8em/AhHEF88uYSaR3ASlF67EFstfB+dh3/1OOVsNeBJ56
 BXjA9xwl6S9E8RLEHEBssvFnuXCTPvyfKVDSPVLjDAoLRqqsPPrumS2/b0ERPLbvMSRqLku7YGeq2
 zQx/5RIthXNfIny4=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbKpq-004jpi-5i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 08:11:52 +0000
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 84393BDA7C9289ABC01D;
 Thu, 13 Jun 2019 16:11:43 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 13 Jun 2019 16:11:42 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 13 Jun 2019 16:11:42 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 13 Jun 2019 16:10:51 +0800
Message-ID: <20190613081051.5047-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme755-chm.china.huawei.com (10.3.19.101) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hbKpq-004jpi-5i
Subject: [f2fs-dev] [PATCH] fsck.f2fs: add more sanity check for superblock
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
Cc: jaegeuk@kernel.org, seulbae@gatech.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add more sanity check logic for superblock like we did in kernel side.

This fixes bug reported by Seulbae Kim from bugzilla.

https://bugzilla.kernel.org/show_bug.cgi?id=203861

Reproted-by: Seulbae Kim <seulbae@gatech.edu>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c      | 96 ++++++++++++++++++++++++++++++++++++++++++-----
 include/f2fs_fs.h |  2 +
 2 files changed, 88 insertions(+), 10 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 8d5d5cf..f295642 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -601,38 +601,117 @@ static int verify_sb_chksum(struct f2fs_super_block *sb)
 int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 {
 	unsigned int blocksize;
+	unsigned int segment_count, segs_per_sec, secs_per_zone;
+	unsigned int total_sections, blocks_per_seg;
 
 	if ((get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) &&
 					verify_sb_chksum(sb))
 		return -1;
 
-	if (F2FS_SUPER_MAGIC != get_sb(magic))
+	if (F2FS_SUPER_MAGIC != get_sb(magic)) {
+		MSG(0, "Magic Mismatch, valid(0x%x) - read(0x%x)\n",
+			F2FS_SUPER_MAGIC, get_sb(magic));
 		return -1;
+	}
 
-	if (F2FS_BLKSIZE != PAGE_CACHE_SIZE)
+	if (F2FS_BLKSIZE != PAGE_CACHE_SIZE) {
+		MSG(0, "Invalid page_cache_size (%d), supports only 4KB\n",
+			PAGE_CACHE_SIZE);
 		return -1;
+	}
 
 	blocksize = 1 << get_sb(log_blocksize);
-	if (F2FS_BLKSIZE != blocksize)
+	if (F2FS_BLKSIZE != blocksize) {
+		MSG(0, "Invalid blocksize (%u), supports only 4KB\n",
+			blocksize);
 		return -1;
+	}
 
 	/* check log blocks per segment */
-	if (get_sb(log_blocks_per_seg) != 9)
+	if (get_sb(log_blocks_per_seg) != 9) {
+		MSG(0, "Invalid log blocks per segment (%u)\n",
+			get_sb(log_blocks_per_seg));
 		return -1;
+	}
 
 	/* Currently, support 512/1024/2048/4096 bytes sector size */
 	if (get_sb(log_sectorsize) > F2FS_MAX_LOG_SECTOR_SIZE ||
-			get_sb(log_sectorsize) < F2FS_MIN_LOG_SECTOR_SIZE)
+			get_sb(log_sectorsize) < F2FS_MIN_LOG_SECTOR_SIZE) {
+		MSG(0, "Invalid log sectorsize (%u)\n", get_sb(log_sectorsize));
 		return -1;
+	}
 
 	if (get_sb(log_sectors_per_block) + get_sb(log_sectorsize) !=
-						F2FS_MAX_LOG_SECTOR_SIZE)
+						F2FS_MAX_LOG_SECTOR_SIZE) {
+		MSG(0, "Invalid log sectors per block(%u) log sectorsize(%u)\n",
+			get_sb(log_sectors_per_block),
+			get_sb(log_sectorsize));
+		return -1;
+	}
+
+	segment_count = get_sb(segment_count);
+	segs_per_sec = get_sb(segs_per_sec);
+	secs_per_zone = get_sb(secs_per_zone);
+	total_sections = get_sb(section_count);
+
+	/* blocks_per_seg should be 512, given the above check */
+	blocks_per_seg = 1 << get_sb(log_blocks_per_seg);
+
+	if (segment_count > F2FS_MAX_SEGMENT ||
+			segment_count < F2FS_MIN_SEGMENTS) {
+		MSG(0, "\tInvalid segment count (%u)\n", segment_count);
 		return -1;
+	}
+
+	if (total_sections > segment_count ||
+			total_sections < F2FS_MIN_SEGMENTS ||
+			segs_per_sec > segment_count || !segs_per_sec) {
+		MSG(0, "\tInvalid segment/section count (%u, %u x %u)\n",
+			segment_count, total_sections, segs_per_sec);
+		return 1;
+	}
+
+	if ((segment_count / segs_per_sec) < total_sections) {
+		MSG(0, "Small segment_count (%u < %u * %u)\n",
+			segment_count, segs_per_sec, total_sections);
+		return 1;
+	}
+
+	if (segment_count > (get_sb(block_count) >> 9)) {
+		MSG(0, "Wrong segment_count / block_count (%u > %llu)\n",
+			segment_count, get_sb(block_count));
+		return 1;
+	}
+
+	if (secs_per_zone > total_sections || !secs_per_zone) {
+		MSG(0, "Wrong secs_per_zone / total_sections (%u, %u)\n",
+			secs_per_zone, total_sections);
+		return 1;
+	}
+	if (get_sb(extension_count) > F2FS_MAX_EXTENSION ||
+			sb->hot_ext_count > F2FS_MAX_EXTENSION ||
+			get_sb(extension_count) +
+			sb->hot_ext_count > F2FS_MAX_EXTENSION) {
+		MSG(0, "Corrupted extension count (%u + %u > %u)\n",
+			get_sb(extension_count),
+			sb->hot_ext_count,
+			F2FS_MAX_EXTENSION);
+		return 1;
+	}
+
+	if (get_sb(cp_payload) > (blocks_per_seg - F2FS_CP_PACKS)) {
+		MSG(0, "Insane cp_payload (%u > %u)\n",
+			get_sb(cp_payload), blocks_per_seg - F2FS_CP_PACKS);
+		return 1;
+	}
 
 	/* check reserved ino info */
 	if (get_sb(node_ino) != 1 || get_sb(meta_ino) != 2 ||
-					get_sb(root_ino) != 3)
+						get_sb(root_ino) != 3) {
+		MSG(0, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)\n",
+			get_sb(node_ino), get_sb(meta_ino), get_sb(root_ino));
 		return -1;
+	}
 
 	/* Check zoned block device feature */
 	if (c.devices[0].zoned_model == F2FS_ZONED_HM &&
@@ -641,9 +720,6 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 	}
 
-	if (get_sb(segment_count) > F2FS_MAX_SEGMENT)
-		return -1;
-
 	if (sanity_check_area_boundary(sb, sb_addr))
 		return -1;
 	return 0;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 1890975..9f1e86c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -662,6 +662,8 @@ struct f2fs_super_block {
 #define CP_ORPHAN_PRESENT_FLAG	0x00000002
 #define CP_UMOUNT_FLAG		0x00000001
 
+#define F2FS_CP_PACKS		2	/* # of checkpoint packs */
+
 struct f2fs_checkpoint {
 	__le64 checkpoint_ver;		/* checkpoint block version number */
 	__le64 user_block_count;	/* # of user blocks */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
