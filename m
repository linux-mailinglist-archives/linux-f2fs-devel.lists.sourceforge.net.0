Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAF8A11D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 08:36:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3E2K-0002rr-0j; Thu, 29 Aug 2019 06:36:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=137b9bc1e=shinichiro.kawasaki@wdc.com>)
 id 1i3E2I-0002rh-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 06:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4tAQmMpnw/waj5I3ItapC6tbQl8QQodNqswzHyxePIg=; b=amm0umpX+LEOBR+u7oHK9Ycu8p
 QhzuycPSfOkgO3UVE7pFNYFgeh7Tr97DSV5q8q596tVvYI7zrlCIXiX+DGH34ph5SZfckaBS74pAo
 QP+KKLwvVpd4NN98T3kx6uPH6p7mp+2mKx5cPC/Fuwxpgqs9s+28O1B35Ek1R43KBPjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4tAQmMpnw/waj5I3ItapC6tbQl8QQodNqswzHyxePIg=; b=PTfo0XP4E3d8fBRJjI6mBFBjl4
 a9TKqeTi+fxURS2KfOHAm0Rto6NwA9E9xgIYnRjqaKnBiN/vKKIvT6uu7s1kHfUXjtaKfOKUPJCir
 Q0SmOI2bV72uATKedpJtgWOo3BJIKl3nT3cHqaB00ezInwJVTBxSYJwG8l4gI+FBbaiE=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3E2G-007Woo-W5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 06:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567060556; x=1598596556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l56ov0uJ33jnNmW2FF1EvctiwQd62/ba/Y2aTuUh+Is=;
 b=Dxcdt5f3m/TkSxENgg/u1GN7T0VfB6/9VhCOQ2O7SjloeL4jJoT0PSiG
 s5WcHKHG1enwJr8S26gUVIxkFJ5ysdOzU5Ulad5Q3DPVfZH+gDU16SGkf
 +VntuLMxiFcWfid9EyYefzWfZDkfX81xXXNGWftlGZlAR8Wht97IGx+WJ
 QlSJIJg+u5nG7TCjS+UsTJvj0DFhFRA/i4GEAvcMcv2gsrS1csY3jeCoD
 X5YKU2AX+XDM4VzNK9OoGBrDYLexDBBg4/Hz9N1i7jSDM7BMGY+aTfWsY
 Dnqc2s24brQme/VgyYHXK1fvTQ0mJlk+7liGm0mWu94JQHXqIldjleZvG A==;
IronPort-SDR: XoVjyQ9EXvOL99IxTaCmDd4hiWvCt5KI05dKHOH4am/wyzvRu1M+LAW0XUkeqRAfokbDFXmNwg
 jBnFe1a0y+d+PgCLjTfgVz41+nqs/JW3H0uwwtap3qDLYeIEBUDRw2hP9ZzSigBS+n5MjTTOb+
 gc/Z+iAtuFArNy8ZGCEjknA1vzslcEs++vZBWayhbobhw7EU5vZLBxfg7lW6UhrIwGl7AgsjpJ
 phu1X+r1O8ZdbmtiWdOtOByT5vGDzaY+G/fvbnXGXVRfittxUBgMHO+S5OPDf+sLi6gmxshPLJ
 N+A=
X-IronPort-AV: E=Sophos;i="5.64,442,1559491200"; d="scan'208";a="223584765"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2019 14:35:51 +0800
IronPort-SDR: Gc9c8Lb59dwvz6zt8WI94KNlaiLee+GEoqa2u3viqbqqP9avAtskWMU39YeMYmY9jHb1o3ZXC9
 0RpSZ5/66DWBqqFm3l++rIlbVZbJyZuwZwo7iGiovEn0Z+RbyBp1OKmpol54HEBcMuI/P2j/zE
 sRz8gEKFC8I0DrpkEZOpPCauKDE/EN+OEGfuzif22a+4egpqRdjw7Rw42C565JX4/Iv/NoTCqo
 iOpCVmPsnhyJm9y562MdUAUz/XPVU5YspGs6YrvxT3h2BvAcW/iv6QXckr3p5VcL4VXskALRtG
 HjZQjBLpV3ptimybGmC5yR1G
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 23:33:00 -0700
IronPort-SDR: wxVcPLb5muAOFdWX9MmHfBiPjmlJAmv+HNYDYo/DbIbeZZ46x20PTRTfzqZB4NO3Oj72tCys+D
 EiZNS14acnO3182OTASVP0MfLkx1QcQSxWbnIXMLPUlJwYAjdSvLMFablNvXD6cW9vvfYtu/O7
 hoGHdmsHZGjJa35SSbQGjYW7JnpaiJS4/wQrk9RnabuSnh7s2tENifMNToHLSsM1YOqdhAueKo
 OjwTFWYSOvbURemp9eOKbp7VJCIPGvZWIWL0gPGYOheKiufGM5hbCnadx/QB18AnIc5FH8YP1K
 +L0=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Aug 2019 23:35:51 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 29 Aug 2019 15:35:31 +0900
Message-Id: <20190829063531.658-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
References: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1i3E2G-007Woo-W5
Subject: [f2fs-dev] [PATCH v3 2/2] fsck.f2fs: Check write pointer
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
position. In case the write pointer is behind the current segment, write
zero data at the write pointer position to make write pointer position at
same as the current segment.

When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
ask users to fix them or not. When inconsistencies get fixed, turn on
'force' flag in fsck_verify() to enforce fixes in following checks. This
position fix is done at the beginning of do_fsck() function so that other
checks reflect the current segment modification.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h |   3 ++
 fsck/main.c |   2 +
 3 files changed, 136 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 8953ca1..f45ca39 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2574,6 +2574,123 @@ out:
 	return cnt;
 }
 
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
+	unsigned int zone_segno, wp_segno;
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
+	/*
+	 * If the write pointer is in advance from the curseg, modify the
+	 * curseg position to be same as the write pointer.
+	 */
+	FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
+		cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
+	se = get_seg_entry(sbi, wp_segno);
+	se->type = cs_index;
+	cs->segno = wp_segno;
+	cs->next_blkoff = wp_blkoff;
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
@@ -2624,6 +2741,20 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 
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
