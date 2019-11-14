Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1BFC162
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 09:19:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVALT-00065f-73; Thu, 14 Nov 2019 08:19:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iVALR-00065X-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eCDCGXITK4oVL9esYCCIuyuLm1WXeRDRoDmA3osofPI=; b=BJGRhmlTs7G6jymFUSMXpfoLLE
 hVu4E86YSvWfCb5qQoZ0wsDiG16ecan6jcudpe0LNKewKLuxyb7L2rQTXYrl9MM1orn+IKTUza0mv
 yJGM4mY/Pew7y7lATf2EjLu+Ybxn3fdoTZcI3gmpU51dIqr6k0BVX3fNucJKgX4yF328=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eCDCGXITK4oVL9esYCCIuyuLm1WXeRDRoDmA3osofPI=; b=LWVBMPi7t+ClcGL/TibKpbiztK
 sCzow0qL+tZ1HfDKJ0o/AgI/TNfcxK3Sxke0congTXEl8D3tEzhTSCj7QJVTKnLRx+b7Fzx+7AUVt
 Knk+rryFd4FBtaIDDlY6f69IrZq9+0m+RsZZbV7EcNcHy7M6M5x6ldgJwCWeq6VfloBY=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVALQ-002o7p-9p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573719553; x=1605255553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3owjmxc6gRY8OWZ7rHmZyARdyCVlUM1ndR/N4sXQBI=;
 b=D57k2cPLlvFGcvUYn2zHdtBpZqXN5+oZVbsLr5jjuWrhQkFXCO/qLcBk
 fenKZBXZgKDQ/+S0t1zUzQm/9AKDAuf7Csh3ucsafGtpFyV9e3VAb/5Zq
 fwVGO2FkHSb9cA41GjPgo40HHMqEeOYnqMl+AJUraLhdEvec9ryo8QJ2f
 W4KA5e4GotT929RFt7Bg+Y/rwq0Lu4kddQP42p1Uy0wgxvOZX9IaLuCJ2
 pFhMWm6TRD9YzlFeHHwcD9FTfoV8EongxUBMqme+xYXS3QR9GD2J23ESY
 LbbThCFNcsU0bhvWd3uz+TYXp7ugRnCoUIbk12LmqwixtJGGorgZmbj6L w==;
IronPort-SDR: JASJeevidty+Jdt3q8jfqi9qxMIdokakxk6kPGjXePPLM2f3GKqSSARtKdK+3lv9u11gk70O/+
 QQB9UHtdD3LmvUpGE9ObykJoTL0BurCgKgfCcPLwU/uiHzaXTBNRFkPw2IM6JoXEJ2XacLvgAa
 S7IvLA+ALEoUw3Y5i1efrGJum8yZCyZfxBqbSYW5Agpe24pgFr3dRX/dECUQl4EMt21IuhV3ba
 7J6IMGiYbb2a4vyEHgmC9E1E+PJCwxcaMJ2GswOflT9QJl306HpqjrAs2ahEuSwk8Vy7bKMLxy
 OCY=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="123753821"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 16:19:07 +0800
IronPort-SDR: 58oSWNAY81hc2PHcMQ5Ok4nK67m6l5jvT1nkzMYRopCosqnHJrQQDIGbWonPLUZAd2T6J/3pOo
 w2BmeQImXyMYNotcAbH03JudhvPiymlN//CrLOk0pOqMffTVeQqJtaE5tTOb2qDjGy/MHsXe+S
 nX67+4s0byQaMn7/5qz7LFVpV9HAwBpxJR5++FILQhv4RGWVlJXTDQY+rO5uJycjk5GYU5+RhV
 IwRDrnPiZsEuekdsrePDUDt0wikQoNMVdenVmR3ydmnrYjt99DjpLsypE6kcMWt2z781vYkr8Q
 vm5aUDIYy7ZAXTtxsx6IGqj1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 00:14:05 -0800
IronPort-SDR: gVBZa/JkhIm4qb2Wl0owVkQ/Nuii6kyMBTMdC8v009W/uGvCsg6gTZj1gTqYYfOyEj4bYar96p
 VyC079ZRQ0JU/XRxpzLQebzY2Y9r6WngQQkth2F7hMOYFTfMdk6zNS9SwccarcOgkQxN2rcX5m
 BZLarXkb25tEP6mx0FkkxNjlsBEyx7qph5R+bcv29qLCUYITiMYxWty1VtA2Z9w/9gTynzQMoX
 1ygH1NBodaCJTj2rGD8PznM48/dH14t2YkINa585Wufb5ELi7DZJ9VdqI8I08dFT5Hd0t2HTXO
 KV8=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Nov 2019 00:19:07 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 17:19:02 +0900
Message-Id: <20191114081903.312260-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
References: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iVALQ-002o7p-9p
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: Check write pointer consistency of
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
write pointer at zone start. If not, make mount fail and ask users to run
fsck.

Perform the consistency check during fsync recovery. Not to lose the
fsync data, do the check after fsync data gets restored and before
checkpoint commit which flushes data at current segment positions. Not to
cause conflict with kworker's dirfy data/node flush, do the fix within
SBI_POR_DOING protection.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fs/f2fs/f2fs.h     |   1 +
 fs/f2fs/recovery.c |  17 ++++++-
 fs/f2fs/segment.c  | 120 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4024790028aa..a2e24718c13b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3136,6 +3136,7 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
+int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
 int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 783773e4560d..712054ed8d64 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -784,9 +784,22 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
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
+	if (!ret && !err && !f2fs_readonly(sbi->sb)
+	    && f2fs_sb_has_blkzoned(sbi)) {
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
index 808709581481..6ece146dab34 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4331,6 +4331,126 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
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
+static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
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
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return -EINVAL;
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
