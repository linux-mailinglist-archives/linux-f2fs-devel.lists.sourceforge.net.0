Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A7E6C99
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 07:58:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOyyn-0000k6-Fk; Mon, 28 Oct 2019 06:58:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOyyl-0000jy-Pl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=55mYxeQwvePODyg9cY6912xjiXRmYMEu6Qj0o4+TY9M=; b=fTG+YcDlWIC913WEtAtCwo3ydR
 bQuKzVZcfXuPZP/BkMzh4qxY5RsJUuyCgsVwMp0RwXiC9XWIt/r4lbbAS7P+ncA6RbryzgOojPMCr
 f1zlEx6oj1vJFnKRB+K389kz9afT+rrLkrUjaJ52W4531FvcKhpQHhjKxa02PnsbB2cI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55mYxeQwvePODyg9cY6912xjiXRmYMEu6Qj0o4+TY9M=; b=hFKX0/8gVkxxCHwGOxq+/77mY+
 WXFENmuuIPGCtuSg32Nqez9WCPh2U+ve06+lAoJG0QS5JMq1UtK/8Q07LwPWrt7durNj+5U6w6pN3
 29sKIsMs2NNuJ4r4Wsnve0oylQWziE6Pdhte9h4WfzF0QWQ1YySkXt8rOIdPRP5Y7E4c=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOyyk-0031Si-6M
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572245923; x=1603781923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQK0uQRndyzXJcY2l/RCicPsBWnw/AncczvRl4C2cus=;
 b=TYrLPPN2AoBz4n6JO3GEO2fPRPALTDie1aBZYTEPRvzfY84gKZsiD9oV
 vHKxR5Dao9fTq06s7pC2Fc6RaOeqtQOkDkbXqSy34XtEPhGkjAuIxBQrJ
 gwqzOkuza9RZgaJ32wAkkL2CdyQ2dz2wq8QBEkLJbd9nHvWQkAAM8/+Fg
 +QBpQuBe7LChA8vLvl8ipWikaTEEpRRDV7AtxGouVm1FCm+c+iSyCVlIN
 OhS1UekciYaHnsMrbwEXLQzUEEVOIsmGZwB9dECpBss2BgPAV08CImFtJ
 ZIgLvi5dUWX4abZaixxtW67ZYMDKKCtBRECpRk5t7OF206DcouyL2m3QH Q==;
IronPort-SDR: 8FP8BJBtp5McD18v0p/OjP0F2P+gs75ZAtMN8jNJMaSqtNtDUfVLfeqw275z3pj/rUKojtUVsi
 UgTh9cpYiWS6EZFXh8ohozHWp6pWArsJt6V1wLNWjTYUI4/XI7EmyS1LbAcpVBRd+c5TtatG8C
 k8Fzw/zjbTM4XebhHlXL14MO2lbheuy6AxIrynB8ugDcF6Snx1nhYhjmQ6Jnx/Fg5uGiunaRHI
 K8UC7vasQrxQfD9WSY3UXUw74b0yolvAiHVp/fMyxJHafSF2gSBGWns4Kh2d/3d4UaMib1AJQT
 8CY=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="222612150"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:58:30 +0800
IronPort-SDR: VcTzu7gV/DnD2fgEdUL1cTjIaAdLg3zctomW+oTJ6yjHY9VgwAmWJNjYQBxMuOgtZ5w2ABPG1g
 16Swe8g/F6VOuMsRHLWLNkCGttQm3b3pRXZ+8a5FqQvdy7xsmh85AWo8c3DfVjQCThKEN5/+8i
 VO57RL/2lAGpYpjV8BAmTOl2YoZYAVpcBnfUfqNZMqbQYC4OSHH+HYNI9To50uFHXG/opC/yBb
 HbmoypNz2ySgoPsTtj5Jxc9j1o3+uRQ4y0RfNZRJdNJSWkpvxRkx4Sbqa/quMETh1fkYGJXWC1
 3Ws2tKl3MoRiiLMtRlm6lmv/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:53:33 -0700
IronPort-SDR: KUNLeBLkQueavWC8kfYBC1emC2nMhXJB05YUTuUDd7u4t/C1O0q5zOQV8lB1quUciNbwusd2nf
 kQ1QKsguT7dav7cubPP5viZ0RmVWoWu4rmLhjZwKhxkp7qqZIwSBo3iM6I8vHJSapVjWMdX7In
 D3JeNApWZjR0W661eDKWQCeyfaxKs2HP88q+1KLmCZMyrqjgXXukclEeZcV3YT97NhWiemXp1x
 2gpB6L0rp+0eZELylM9HtAjflFdpC8KgUDn5ZmS9QCsr21D8cc0iOsmRtD7B1ib0BwBp33QQzG
 BgY=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:58:05 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:58:00 +0900
Message-Id: <20191028065801.28220-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028065801.28220-1-shinichiro.kawasaki@wdc.com>
References: <20191028065801.28220-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iOyyk-0031Si-6M
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: Check write pointer consistency of
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
a new zone to the current segments. Also check the newly assigned zone
has write pointer at zone start. If not, make mount fail and ask users to
run fsck.

Perform the consistency check twice. Once during fsync recovery. Not to
lose the fsync data, do the check after fsync data gets restored and
before checkpoint commit which flushes data at current segment positions.
The second check is done at end of f2fs_fill_super() to make sure the
write pointer consistency regardless of fsync data recovery execution.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/f2fs.h     |   1 +
 fs/f2fs/recovery.c |   6 +++
 fs/f2fs/segment.c  | 127 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c    |   8 +++
 4 files changed, 142 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4024790028aa..0216282c5b80 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3136,6 +3136,7 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
+int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only);
 int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 783773e4560d..c75d1cbae4d1 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -795,6 +795,12 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (need_writecp) {
 		set_sbi_flag(sbi, SBI_IS_RECOVERED);
 
+		/* recover zoned block devices' write pointer consistency */
+		if (!err && f2fs_sb_has_blkzoned(sbi)) {
+			err = f2fs_fix_curseg_write_pointer(sbi, false);
+			ret = err;
+		}
+
 		if (!err) {
 			struct cp_control cpc = {
 				.reason = CP_RECOVERY,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 808709581481..2b6e637dd6d3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4331,6 +4331,133 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
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
+					  zone_blkaddr <= FDEV(i).end_blk))
+			return &FDEV(i);
+	}
+
+	return NULL;
+}
+
+static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type,
+				    bool check_only)
+{
+	struct curseg_info *cs = CURSEG_I(sbi, type);
+	struct f2fs_dev_info *zbd;
+	struct blk_zone zone;
+	unsigned int cs_section, wp_segno, wp_blkoff, nr_zones, wp_sector_off;
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
+	nr_zones = 1;
+	err = blkdev_report_zones(zbd->bdev, zone_sector, &zone, &nr_zones);
+	if (err) {
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
+	    wp_sector_off == 0)
+		return 0;
+
+	f2fs_notice(sbi, "Unaligned curseg[%d] with write pointer: "
+		    "curseg[0x%x,0x%x] wp[0x%x,0x%x]",
+		    type, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
+
+	/* if check_only is specified, return error without fix */
+	if (check_only)
+		return -EIO;
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
+	nr_zones = 1;
+	err = blkdev_report_zones(zbd->bdev, zone_sector, &zone, &nr_zones);
+	if (err) {
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
+			    "New section for curseg[%d] is not empty, "
+			    "run fsck to fix: curseg[0x%x,0x%x]",
+			    type, cs->segno, cs->next_blkoff);
+		__set_inuse(sbi, GET_SEGNO(sbi, cs_zone_block));
+		f2fs_stop_checkpoint(sbi, true);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only)
+{
+	int i, ret;
+
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		ret = fix_curseg_write_pointer(sbi, i, check_only);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+#else
+int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, bool check_only)
+{
+	return 0;
+}
+#endif
+
 /*
  * Update min, max modified time for cost-benefit GC algorithm
  */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1443cee15863..ebd0ae02a260 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3525,6 +3525,14 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 			goto free_meta;
 		}
 	}
+
+	/* check zoned block devices' write pointer consistency */
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		err = f2fs_fix_curseg_write_pointer(sbi, f2fs_readonly(sb));
+		if (err)
+			goto free_meta;
+	}
+
 reset_checkpoint:
 	/* f2fs_recover_fsync_data() cleared this already */
 	clear_sbi_flag(sbi, SBI_POR_DOING);
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
