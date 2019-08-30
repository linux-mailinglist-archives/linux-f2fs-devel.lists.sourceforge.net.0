Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B083A34D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 12:20:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3e0f-0006n2-Of; Fri, 30 Aug 2019 10:20:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=138d41eff=shinichiro.kawasaki@wdc.com>)
 id 1i3e0c-0006mk-Hv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 10:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ETr6MWxSmdr+kRk8tLzGSlNfKjCuln7nVFHWbTbK9k=; b=HsMhP4vhB7h1m7EaGgISTCW2RA
 TLVXZe7p968EJ9I2ajtPebOdDqgCxq/R/KeNk5IdBLatIL7toVKhKgz0HAXGf67EDAhLq9afNlMDK
 0oYxFgb8rv4SpUyxw5dMbVHGTwuhjt9WqKuB5D7MtkMN0SqGRHkefbpK50I+3ZViYtxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ETr6MWxSmdr+kRk8tLzGSlNfKjCuln7nVFHWbTbK9k=; b=QKFpGs3AHp5vk1BrUvGd+szdlN
 VGy1BQaPzSHj0NnsFpold0UYCP5tGjOIEyhVMhgz4KY2ubI08WaJytVeG1ja1g/eeRl5ITtLHbqiF
 w9KOKWPKc0QA9xeGDMM9owTR4niFM4bveOhEuzNLasfHh+UuX9mswBCtUhTePotQlIqY=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3e0b-003oEo-1w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 10:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567160438; x=1598696438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZQmtVly/jQRgDRjyOSRUxC0NfWpa//7VkJbT4W5VJNc=;
 b=gxZoUj/8BiiP+A/qD+phKrsMYKIe9wfh+yJeOCt7hCMiooJMcghOdkWH
 nFEh2heh3f8+DeWZQUFe1Nbsn+P+AfiHUlDgNHfgGJgiUyLOL6FxVDgjx
 qhgnD3zGZHbScCgwFuSNxMMwd3GYTpMWIqvlJHk0ezmt5BzDvorYGaLFm
 lG5vyVxmqc72TWHthgUfRj4tZ/SZrr2/X14pcrLIjkyIdMqxHlpWv0XmL
 UPDj/IC+kCXGcHTJdGOv7ZECd/wnYThtzAZgkKoHDj995PPqV57ZWrVpP
 B0HZc5p8GEnbXQfIbD+NIFYQNYMy6kvykCM94IUAMz+gZ9UkcgmruL0fE Q==;
IronPort-SDR: 4n39DA91zsm2Yc6GPDEcoAbAszZjQM/dqLDgoL/AylUmhW1TWjoyGK/zGOu06hP9HV46olMD4s
 TFUBsTVc7sIF+0qwTAN3wlrI7IkLCZtxUjznWBGYXauaxMITBzgI5jMYZL02ZyUH+tfqqImYbJ
 esjZzZrknx3y05ewzn0ocUk3/eV/OsmZUqesRzSgUCUc73qVNNd6/7TqU/WsRnLxa3rhjlQkDX
 N5nzkW/iCV9RsRzhR345ZeyR8CNl3ZYugQ+BOvG/9OuD9GhiLz7OdC/A5p55lxJC1MN4O3jytC
 H4s=
X-IronPort-AV: E=Sophos;i="5.64,447,1559491200"; d="scan'208";a="217553614"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2019 18:20:28 +0800
IronPort-SDR: 48xOw7bqxgJOEt/y8R5lOa2I9UpdjJqfrub4CQzkhWrlq8KLzxMaVYIbvifHqKYGpP6GA5yRzc
 b8rhC8Fnc6/fSBv6QSnA5dzD2mH95qQ4TUX7ghXoF5enMETk8VxemO5Y6Mdvq425W8W01rfcA6
 2U2gw/YEAWt1eAXaWLUIVhAKv4AeqBSW83woZLzWsnO1Il4PP6n2up+bIZeYWVwHZh/yGD4p1f
 jlwHYzjB1zLQnKFs8mBBdCEtcDZY2NomVej1LVATSjzORZQGtedDuOYfp+bfV6nbCJLdqjDwJR
 nCXk5LkkrqAe9VkpG8/V0zcF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 03:16:56 -0700
IronPort-SDR: JIUQzvDtWAKf9VC/puklV1N5ve2NjErw/1/fiuiyR/QUWhgcxKBwKWfGioKzbX9jPR9r6+egZ9
 I9nQP0M0mwWfHP91q/QgZ4czMr5z4yA2x1saV1TWHPI9jj4tQnvjRzTGWAILplTWybiZuJAu9d
 dzh3egpaATpRjg8xlABvdK8F3s9nzCenbHJgyWUNrPaDHfB8ifAhiLVw2Gwburd0kJ2XXUXHNY
 zALJDCz2NXN13iSWPUfiPEPbgyNETifLAOOAxe9spPnedjBEcPsiEV8UCTqTo+P4P1xGr1IgwE
 iKE=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 Aug 2019 03:19:49 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Aug 2019 19:19:36 +0900
Message-Id: <20190830101936.32265-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
References: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1i3e0b-003oEo-1w
Subject: [f2fs-dev] [PATCH v4 2/2] fsck.f2fs: Check write pointer
 consistency with current segments
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

On sudden f2fs shutdown, zoned block device status and f2fs current
segment positions in meta data can be inconsistent. When f2fs shutdown
happens before write operations completes, write pointers of zoned block
devices can go further but f2fs meta data keeps current segments at
positions before the write operations. After remounting the f2fs, the
inconsistency causes write operations not at write pointers and
"Unaligned write command" error is reported. This error was observed when
xfstests test case generic/388 was run with f2fs on a zoned block device.

To avoid the error, have f2fs.fsck check consistency between each current
segment's position and the write pointer of the zone the current segment
points to. If the write pointer goes advance from the current segment,
fix the current segment position setting at same as the write pointer
position. If the write pointer goes to the zone end, find a new zone and
set the current segment position at the new zone start. In case the write
pointer is behind the current segment, write zero data at the write
pointer position to make write pointer position at same as the current
segment.

When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
ask users to fix them or not. When inconsistencies get fixed, turn on
'force' flag in fsck_verify() to enforce fixes in following checks. This
position fix is done at the beginning of do_fsck() function so that other
checks reflect the current segment modification.

Also add GET_SEC_FROM_SEG and GET_SEG_FROM_SEC macros in fsck/fsck.h to
simplify the code.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fsck/f2fs.h |   5 ++
 fsck/fsck.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h |   3 +
 fsck/main.c |   2 +
 4 files changed, 208 insertions(+)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 4dc6698..2c1c2b3 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -337,6 +337,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
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
index 8953ca1..a0f6849 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2574,6 +2574,190 @@ out:
 	return cnt;
 }
 
+/*
+ * Search a free section in main area. Start search from the section specified
+ * with segno argument toward main area end. Return first segment of the found
+ * section in segno argument.
+ */
+static int find_next_free_section(struct f2fs_sb_info *sbi,
+				  unsigned int *segno)
+{
+	unsigned int i, sec, section_valid_blocks;
+	unsigned int end_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr)
+		+ SM_I(sbi)->main_segments;
+	unsigned int end_sec = GET_SEC_FROM_SEG(sbi, end_segno);
+	struct seg_entry *se;
+	struct curseg_info *cs;
+
+	for (sec = GET_SEC_FROM_SEG(sbi, *segno); sec < end_sec; sec++) {
+		/* find a section without valid blocks */
+		section_valid_blocks = 0;
+		for (i = 0; i < sbi->segs_per_sec; i++) {
+			se = get_seg_entry(sbi, GET_SEG_FROM_SEC(sbi, sec) + i);
+			section_valid_blocks += se->valid_blocks;
+		}
+		if (section_valid_blocks)
+			continue;
+
+		/* check the cursegs do not use the section */
+		for (i = 0; i < NO_CHECK_TYPE; i++) {
+			cs = &SM_I(sbi)->curseg_array[i];
+			if (GET_SEC_FROM_SEG(sbi, cs->segno) == sec)
+				break;
+		}
+		if (i >= NR_CURSEG_TYPE) {
+			*segno = GET_SEG_FROM_SEC(sbi, sec);
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+struct write_pointer_check_data {
+	struct f2fs_sb_info *sbi;
+	struct device_info *dev;
+};
+
+static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
+{
+	struct write_pointer_check_data *wpd = opaque;
+	struct f2fs_sb_info *sbi = wpd->sbi;
+	struct device_info *dev = wpd->dev;
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
+	unsigned int zone_segno, wp_segno, new_segno;
+	struct seg_entry *se;
+	struct curseg_info *cs;
+	int cs_index, ret;
+	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
+	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
+	void *zero_blk;
+
+	if (blk_zone_conv(blkz))
+		return 0;
+
+	zone_block = dev->start_blkaddr
+		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
+	zone_segno = GET_SEGNO(sbi, zone_block);
+	wp_block = dev->start_blkaddr
+		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
+	wp_segno = GET_SEGNO(sbi, wp_block);
+	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
+
+	/* find the curseg which points to the zone */
+	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
+		cs = &SM_I(sbi)->curseg_array[cs_index];
+		if (zone_segno <= cs->segno &&
+		    cs->segno < zone_segno + segs_per_zone)
+			break;
+	}
+
+	if (cs_index >= NR_CURSEG_TYPE)
+		return 0;
+
+	/* check write pointer consistency with the curseg in the zone */
+	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
+	if (wp_block == cs_block)
+		return 0;
+
+	if (!c.fix_on) {
+		MSG(0, "Inconsistent write pointer: "
+		    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
+		    cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
+		fsck->chk.wp_inconsistent_zones++;
+		return 0;
+	}
+
+	/*
+	 * If the curseg is in advance from the write pointer, write zero to
+	 * move the write pointer forward to the same position as the curseg.
+	 */
+	if (wp_block < cs_block) {
+		ret = 0;
+		zero_blk = calloc(BLOCK_SZ, 1);
+		if (!zero_blk)
+			return -EINVAL;
+
+		FIX_MSG("Advance write pointer to match with curseg %d: "
+			"[0x%x,0x%x]->[0x%x,0x%x]",
+			cs_index, wp_segno, wp_blkoff,
+			cs->segno, cs->next_blkoff);
+		for (b = wp_block; b < cs_block && !ret; b++)
+			ret = dev_write_block(zero_blk, b);
+
+		fsck->chk.wp_fixed_zones++;
+		free(zero_blk);
+		return ret;
+	}
+
+	if (wp_segno == zone_segno + segs_per_zone) {
+		/*
+		 * If the write pointer is in advance from the curseg and at
+		 * the zone end (section end), search a new free zone (section)
+		 * between the curseg and main area end.
+		 */
+		new_segno = wp_segno;
+		ret = find_next_free_section(sbi, &new_segno);
+		if (ret) {
+			/* search again from main area start */
+			new_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr);
+			ret = find_next_free_section(sbi, &new_segno);
+		}
+		if (ret) {
+			MSG(0, "Free section not found\n");
+			return ret;
+		}
+		FIX_MSG("New section for curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
+			cs_index, cs->segno, cs->next_blkoff, new_segno, 0);
+		cs->segno = new_segno;
+		cs->next_blkoff = 0;
+	} else {
+		/*
+		 * If the write pointer is in advance from the curseg within
+		 * the zone, modify the curseg position to be same as the
+		 * write pointer.
+		 */
+		ASSERT(wp_segno < zone_segno + segs_per_zone);
+		FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
+			cs_index, cs->segno, cs->next_blkoff,
+			wp_segno, wp_blkoff);
+		cs->segno = wp_segno;
+		cs->next_blkoff = wp_blkoff;
+	}
+
+	se = get_seg_entry(sbi, cs->segno);
+	se->type = cs_index;
+	fsck->chk.wp_fixed_zones++;
+
+	return 0;
+}
+
+void fsck_chk_write_pointers(struct f2fs_sb_info *sbi)
+{
+	unsigned int i;
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	struct write_pointer_check_data wpd = {	sbi, NULL };
+
+	if (c.zoned_model != F2FS_ZONED_HM)
+		return;
+
+	for (i = 0; i < MAX_DEVICES; i++) {
+		if (!c.devices[i].path)
+			break;
+
+		wpd.dev = c.devices + i;
+		if (f2fs_report_zones(i, fsck_chk_write_pointer, &wpd)) {
+			printf("[FSCK] Write pointer check failed: %s\n",
+			       c.devices[i].path);
+			return;
+		}
+	}
+
+	if (fsck->chk.wp_fixed_zones && c.fix_on)
+		write_curseg_info(sbi);
+}
+
 int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg;
@@ -2624,6 +2808,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 
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
+		if (fsck->chk.wp_fixed_zones && c.fix_on)
+			force = 1;
+	}
+
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
 		for (i = 0; i < fsck->nr_nat_entries; i++)
 			if (f2fs_test_bit(i, fsck->nat_area_bitmap) != 0)
diff --git a/fsck/fsck.h b/fsck/fsck.h
index d38e8de..aa3dbe7 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -80,6 +80,8 @@ struct f2fs_fsck {
 		u32 multi_hard_link_files;
 		u64 sit_valid_blocks;
 		u32 sit_free_segs;
+		u32 wp_fixed_zones;
+		u32 wp_inconsistent_zones;
 	} chk;
 
 	struct hard_link_node *hard_link_list_head;
@@ -156,6 +158,7 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
 		struct child_info *);
 void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
 int fsck_chk_meta(struct f2fs_sb_info *sbi);
+void fsck_chk_write_pointers(struct f2fs_sb_info *);
 int fsck_chk_curseg_info(struct f2fs_sb_info *);
 void pretty_print_filename(const u8 *raw_name, u32 len,
 			   char out[F2FS_PRINT_NAMELEN], int enc_name);
diff --git a/fsck/main.c b/fsck/main.c
index 9aca024..4b4a789 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -584,6 +584,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
 
 	print_cp_state(flag);
 
+	fsck_chk_write_pointers(sbi);
+
 	fsck_chk_curseg_info(sbi);
 
 	if (!c.fix_on && !c.bug_on) {
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
