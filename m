Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D511212912
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jul 2020 18:10:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jr1n4-0001T7-3D; Thu, 02 Jul 2020 16:10:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=44573aa05=aravind.ramesh@wdc.com>)
 id 1jr1mz-0001SS-0o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=puU+/7lkn1vCSY13moeAjROJef0CfzwzuYwuiNDA7q8=; b=KZ6cHqm7D+eHY9IIF72zrCSNW9
 o4dcNF4ILPRnOe64T5bJPkKf6dBGtzUQQxXuKgF3RYj6B2NeIQvjH3YINwaYs18IISGq5yYITrUDV
 qhdvRETFHV6C3W/9zXoZN+JHtZ7XKQ1HNsJEfsftpxWzGiIK87rL9lPshzpphbc0+c44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=puU+/7lkn1vCSY13moeAjROJef0CfzwzuYwuiNDA7q8=; b=PW8G9eQ4tJrzwtpUsBUGQtGVbV
 BWcEP5CBZBprDoethfSR9nFVmbHm1mtGdHDnRqCTcBpnlr+e9LjjNhZUk7vndF++b+0yCuRBwej5+
 rmVNwvw5et0GaXAq3m5jE7XAbir0FPIDVfkf1Xz5y+C9Es+Ts3s5wZuHQRX8qQ5mYN5Y=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jr1mx-005v6l-J1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593706215; x=1625242215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=psDU1BnTjNuSBGsSZ/FFG4sR+Ydmjys7jN+WlJPAh1s=;
 b=KVDwIbPJkmfJOy2AHezGGO3FoSlZi3OZ1nw4iv+CQTkSDDc0qyRgu43m
 81KtKjlokrxdiOc0PexTwCybVGO+vyCjUW4zxZylk7DjPT/EiloxJUtt7
 /D3ftJ1VEXRvvSIZb4QHv2Fb/N9HheEmkkIIwVdjDmuUHYngoL7WtR8LA
 7PkCrqvZ1nxdWQQpG9WGjSGSHgRSnliUDVxgR8cKfA7XJAsiNE/FsOdg/
 orvdiXEYg9rdMsZoYmo4tzuxcYIs59mBOgCupL09HTMaK73rOd1xIbw1F
 a4HBuKjh7Ob2BEu2t8I6lCAkPcszZ+yx3EV5TdLYAMtQPK5tVFueNRc+5 w==;
IronPort-SDR: puUhvi208yGx/CpDo6FM4QkJFIF7u4u6XrdQuNzxxFSJ9YziDzmOeuK0SsopcBvSv2AWNQJ6QK
 JAV6YZwlR563XRca1UjF5ZosnCnvYLVvwIUNkHvG4MKMP9OoH7nqwgsaSAELJWegJl1H/2J+Nj
 thfEkWN5LQp08QB4Kz3suL7d1Loe1O/zJ3Zgy5rH3PXnsdpZsFzPoXjW2mUJo/N39yia4DLLK8
 MMJXx18XYEr0GTW3mHJZKSRiuwX76kZ6FM7krREbj5+IA5GUr49Gy4yzyAJo7HXqe7xGJEwj6O
 tCg=
X-IronPort-AV: E=Sophos;i="5.75,304,1589212800"; d="scan'208";a="145822163"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 23:54:39 +0800
IronPort-SDR: qlcb52qrfhS2dkazJAKO3hGLDjwmFNDEOvurKZbhzqFGr0ttBxWWuORSbyCSgk3QNIlV+9eGuf
 4i3yWMC7DEtWe828N7xdFDGq67vkIFU8I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:42:52 -0700
IronPort-SDR: uF/hZqYV+V87QseFdoRDz0hipicLlAcdjchV98G63CHTvaaHfDLOtQPzU++UJW7KvDCo8IvHvf
 8tBThzrK+yFA==
WDCIronportException: Internal
Received: from aravind-workstation.hgst.com (HELO localhost.localdomain)
 ([10.64.18.44])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Jul 2020 08:54:36 -0700
From: Aravind Ramesh <aravind.ramesh@wdc.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Jul 2020 21:24:27 +0530
Message-Id: <20200702155427.13372-3-aravind.ramesh@wdc.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200702155427.13372-1-aravind.ramesh@wdc.com>
References: <20200702155427.13372-1-aravind.ramesh@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jr1mx-005v6l-J1
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: validate free seg count on zns
 device
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
Cc: Aravind Ramesh <aravind.ramesh@wdc.com>, matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

NVMe Zoned Namespace devices can have zone-capacity less than zone-size.
Zone-capacity indicates the number of usable blocks in a zone, if
zone-capacity is less than zone-size, then the segments which start
at/after zone-capacity are considered unusable. Only those segments
which start before the zone-capacity are considered as usable and added
to the free_segment_count and free_segment_bitmap of the kernel.

Allow fsck to find the free_segment_count based on the zone-capacity and
compare with checkpoint values.

Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fsck/fsck.c  |  5 ++--
 fsck/fsck.h  |  2 ++
 fsck/mount.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index e110f3d..ba2340d 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1905,11 +1905,12 @@ int fsck_chk_meta(struct f2fs_sb_info *sbi)
 		if (IS_NODESEG(se->type))
 			sit_node_blks += se->valid_blocks;
 	}
-	if (fsck->chk.sit_free_segs + sit_valid_segs != TOTAL_SEGS(sbi)) {
+	if (fsck->chk.sit_free_segs + sit_valid_segs !=
+				get_usable_seg_count(sbi)) {
 		ASSERT_MSG("SIT usage does not match: sit_free_segs %u, "
 				"sit_valid_segs %u, total_segs %u",
 			fsck->chk.sit_free_segs, sit_valid_segs,
-			TOTAL_SEGS(sbi));
+			get_usable_seg_count(sbi));
 		return -EINVAL;
 	}
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index bc6a435..e86730c 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -224,6 +224,8 @@ extern u32 update_nat_bits_flags(struct f2fs_super_block *,
 				struct f2fs_checkpoint *, u32);
 extern void write_nat_bits(struct f2fs_sb_info *, struct f2fs_super_block *,
 			struct f2fs_checkpoint *, int);
+extern unsigned int get_usable_seg_count(struct f2fs_sb_info *);
+extern bool is_usable_seg(struct f2fs_sb_info *, unsigned int);
 
 /* dump.c */
 struct dump_option {
diff --git a/fsck/mount.c b/fsck/mount.c
index d0f2eab..72ca0cb 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -30,6 +30,76 @@
 #define ACL_OTHER		(0x20)
 #endif
 
+static int get_device_idx(struct f2fs_sb_info *sbi, u_int32_t segno)
+{
+	block_t seg_start_blkaddr;
+	int i;
+
+	seg_start_blkaddr = SM_I(sbi)->main_blkaddr +
+				segno * DEFAULT_BLOCKS_PER_SEGMENT;
+	for (i = 0; i < c.ndevs; i++)
+		if (c.devices[i].start_blkaddr <= seg_start_blkaddr &&
+			c.devices[i].end_blkaddr > seg_start_blkaddr)
+			return i;
+	return 0;
+}
+
+#ifdef HAVE_LINUX_BLKZONED_H
+
+static int get_zone_idx_from_dev(struct f2fs_sb_info *sbi,
+					u_int32_t segno, u_int32_t dev_idx)
+{
+	block_t seg_start_blkaddr = START_BLOCK(sbi, segno);
+
+	return (seg_start_blkaddr - c.devices[dev_idx].start_blkaddr) >>
+			log_base_2(sbi->segs_per_sec * sbi->blocks_per_seg);
+}
+
+bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	unsigned int secno = segno / sbi->segs_per_sec;
+	block_t seg_start = START_BLOCK(sbi, segno);
+	block_t blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;
+	unsigned int dev_idx = get_device_idx(sbi, segno);
+	unsigned int zone_idx = get_zone_idx_from_dev(sbi, segno, dev_idx);
+	unsigned int sec_off = SM_I(sbi)->main_blkaddr >>
+						log_base_2(blocks_per_sec);
+
+	if (zone_idx < c.devices[dev_idx].nr_rnd_zones)
+		return true;
+
+	if (c.devices[dev_idx].zoned_model != F2FS_ZONED_HM)
+		return true;
+
+	return seg_start < ((sec_off + secno) * blocks_per_sec) +
+				c.devices[dev_idx].zone_cap_blocks[zone_idx];
+}
+
+unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)
+{
+	unsigned int i, usable_seg_count = 0;
+
+	for (i = 0; i < TOTAL_SEGS(sbi); i++)
+		if (is_usable_seg(sbi, i))
+			usable_seg_count++;
+
+	return usable_seg_count;
+}
+
+#else
+
+bool is_usable_seg(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	return true;
+}
+
+unsigned int get_usable_seg_count(struct f2fs_sb_info *sbi)
+{
+	return TOTAL_SEGS(sbi);
+}
+
+#endif
+
 u32 get_free_segments(struct f2fs_sb_info *sbi)
 {
 	u32 i, free_segs = 0;
@@ -37,7 +107,8 @@ u32 get_free_segments(struct f2fs_sb_info *sbi)
 	for (i = 0; i < TOTAL_SEGS(sbi); i++) {
 		struct seg_entry *se = get_seg_entry(sbi, i);
 
-		if (se->valid_blocks == 0x0 && !IS_CUR_SEGNO(sbi, i))
+		if (se->valid_blocks == 0x0 && !IS_CUR_SEGNO(sbi, i) &&
+							is_usable_seg(sbi, i))
 			free_segs++;
 	}
 	return free_segs;
@@ -2337,7 +2408,7 @@ void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
 		memcpy(ptr, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
 		ptr += SIT_VBLOCK_MAP_SIZE;
 
-		if (se->valid_blocks == 0x0) {
+		if (se->valid_blocks == 0x0 && is_usable_seg(sbi, segno)) {
 			if (le32_to_cpu(sbi->ckpt->cur_node_segno[0]) == segno ||
 				le32_to_cpu(sbi->ckpt->cur_data_segno[0]) == segno ||
 				le32_to_cpu(sbi->ckpt->cur_node_segno[1]) == segno ||
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
