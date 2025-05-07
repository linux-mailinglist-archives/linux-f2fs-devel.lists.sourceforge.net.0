Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EA3AAD478
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 06:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Qx+AykVXTYz89kS3fxxwEe0ZoVpq51lpLblcswL/9M=; b=fKRkS1Z6F8SGH+5wwolNbouDPW
	Fm710Ssb+sAjLHNdM+0dleObTnW5+eGXkiNaec7wTo04gJBARsfdAuns5bvVqPYG5eMpzHCtzgN2T
	xEcV4zqwL4c8STU1TkjLeM4iPmM1k1srivqoS5WeWQRK0BSY5dKGZHjtqMfbXSw9VrDc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCWRb-0006vj-2O;
	Wed, 07 May 2025 04:31:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uCWRa-0006vd-2b
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 04:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=49AIIW96JWllaa1YmYUPAYhw2d2W46toSX/rE4cdEvw=; b=b4GHT1LYeAMJxTZrj01JR+s9nu
 1MGYdz9FYQ4L9oAfE40ppf4svYT8Z6K3fI9JhuIwacOSowil6HrvG+2D2OtNE6VHwslBH3jwsA+n3
 6G0jjnvk2NuAhviVsBVGlkSi/7MeENJRgzl1LsgwVDjpHmc6QMeNHKxGcY1qzksfc96s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=49AIIW96JWllaa1YmYUPAYhw2d2W46toSX/rE4cdEvw=; b=X7XyivZWtjmJZsPRu6G4PWPn16
 iZujGTkZ9gEgH1YqP1R61vNMBnkxI59xzY+otgFNI4NOZgGQMNx0CDndmMsx+u4HfekA1GBZbyqji
 F0N2WHhoME6CAPuN/wdV0JRAsC8sL8e6pAVxXAl/CgLI98CTghY/TVWPjcM5nc9V3GDs=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uCWRI-00039F-GX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 04:31:41 +0000
X-AuditID: a67dfc59-057ff7000000aab6-22-681ae1fee4ce
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Date: Wed,  7 May 2025 13:30:37 +0900
Message-ID: <20250507043038.591-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250507043038.591-1-yohan.joung@sk.com>
References: <20250507043038.591-1-yohan.joung@sk.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsXC9ZZnkS7DI6kMg1Ptahanp55lspjavpfR
 4sn6WcwWlxa5W1zeNYfNgdVjwaZSj02rOtk8di/4zOTxeZNcAEsUl01Kak5mWWqRvl0CV0bP
 bcOC/zoVsy7NZm5gnKLaxcjJISFgIvHr6jdWGHvhuoNMIDabgIbEn95eZhBbRMBJ4v+NdvYu
 Ri4OZoE2Ron2o01gDcICHhL/b79kB7FZBFQlzrz7DWbzCphKLN26hgViqKbEji/nwYZyCphJ
 HD/8kBHEFgKqmfFtExNEvaDEyZlPwOqZBeQlmrfOZgZZJiHQwSbRPH0BI8QgSYmDK26wTGDk
 n4WkZxaSngWMTKsYRTLzynITM3OM9YqzMyrzMiv0kvNzNzECA3JZ7Z/IHYzfLgQfYhTgYFTi
 4T3wUzJDiDWxrLgy9xCjBAezkgjv/ftAId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxG38pThATS
 E0tSs1NTC1KLYLJMHJxSDYweO3Y/ae0JjXg46Z3/2n2vT5YfVnPzrM+X3le1wjNrvjeb+po/
 76xa/GfUp/SJ33z9KCr28oKgP7+Xba1LqLlrfTNy68NwLZn7H6/M79xS9zLDqunBl1ix6baz
 HT1W2vVcbCx+ZvNaZY/0yRmfjtZbv7HNslq7g30OP9vL1SUN7Q1y7yzKZbcqsRRnJBpqMRcV
 JwIAP2gAYEQCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXCNUNlju6/h1IZBuv/qFucnnqWyWJq+15G
 iyfrZzFbXFrkbnF51xw2iwlzrzJZvN96j9GB3WPBplKPTas62Tx2L/jM5PHttofH501yAaxR
 XDYpqTmZZalF+nYJXBk9tw0L/utUzLo0m7mBcYpqFyMnh4SAicTCdQeZQGw2AQ2JP729zCC2
 iICTxP8b7exdjFwczAJtjBLtR5tYQRLCAh4S/2+/ZAexWQRUJc68+w1m8wqYSizduoYFYqim
 xI4v58GGcgqYSRw//JARxBYCqpnxbRMTRL2gxMmZT8DqmQXkJZq3zmaewMgzC0lqFpLUAkam
 VYwimXlluYmZOWZ6xdkZlXmZFXrJ+bmbGIEhtqz2z6QdjN8uux9iFOBgVOLhPfBTMkOINbGs
 uDL3EKMEB7OSCO/9+0Ah3pTEyqrUovz4otKc1OJDjNIcLErivF7hqQlCAumJJanZqakFqUUw
 WSYOTqkGRpW1/+acm/i5M8OsasWcubpzyxZsY5x95VzC4eLwaRE20y4vq4yYXjNnxiw+yaOF
 Zj8eL1qZq9agELRDIm9NwbOfJ3d0tlo+bX59Yt/6nlSVoOO/Hj2OO35MUuiuxKYTTz5NrQy9
 Om1HhK6s86TpjZOuTr4VrSqWd8t+xRpmx6NfD7vumdQeoTJXiaU4I9FQi7moOBEASLF83S0C
 AAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  when performing buffered writes in a large section, overhead
 is incurred due to the iteration through ckpt_valid_blocks within the section.
 when SEGS_PER_SEC is 128, this overhead accounts for 20% wit [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1uCWRI-00039F-GX
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: add ckpt_valid_blocks to the
 section entry
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

when performing buffered writes in a large section,
overhead is incurred due to the iteration through
ckpt_valid_blocks within the section.
when SEGS_PER_SEC is 128, this overhead accounts for 20% within
the f2fs_write_single_data_page routine.
as the size of the section increases, the overhead also grows.
to handle this problem ckpt_valid_blocks is
added within the section entries.

Test
insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
make_f2fs /dev/block/nullb0
make_f2fs -s 128 /dev/block/nullb0
fio --bs=512k --size=1536M --rw=write --name=1
--filename=/mnt/test_dir/seq_write
--ioengine=io_uring --iodepth=64 --end_fsync=1

before
SEGS_PER_SEC 1
2556MiB/s
SEGS_PER_SEC 128
2145MiB/s

after
SEGS_PER_SEC 1
2556MiB/s
SEGS_PER_SEC 128
2556MiB/s

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 29 ++++++++++++++++++++++-------
 fs/f2fs/segment.h | 29 ++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 671bc5a8fd4a..09b66a755559 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2447,7 +2447,7 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
  * that the consecutive input blocks belong to the same segment.
  */
 static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
-				block_t blkaddr, unsigned int offset, int del)
+				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
 {
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2492,15 +2492,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 				f2fs_test_and_clear_bit(offset + i, se->discard_map))
 			sbi->discard_blks++;
 
-		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
 			se->ckpt_valid_blocks -= 1;
+			if (__is_large_section(sbi))
+				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
+		}
 	}
 
 	return del;
 }
 
 static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
-				block_t blkaddr, unsigned int offset, int del)
+				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
 {
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2533,12 +2536,18 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
 	 * or newly invalidated.
 	 */
 	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
-		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
+		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
 			se->ckpt_valid_blocks++;
+			if (__is_large_section(sbi))
+				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
+		}
 	}
 
-	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
+	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
 		se->ckpt_valid_blocks += del;
+		if (__is_large_section(sbi))
+			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
+	}
 
 	return del;
 }
@@ -2569,9 +2578,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
 	} else {
-		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
 	}
 
 	__mark_sit_entry_dirty(sbi, segno);
@@ -5029,6 +5038,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 	up_read(&curseg->journal_rwsem);
 
+	/* update ckpt_ckpt_valid_block */
+	if (__is_large_section(sbi)) {
+		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
+			set_ckpt_valid_blocks(sbi, segno);
+	}
+
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index f5d30f32ebdb..e91d944f003a 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -211,6 +211,7 @@ struct seg_entry {
 
 struct sec_entry {
 	unsigned int valid_blocks;	/* # of valid blocks in a section */
+	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
 };
 
 #define MAX_SKIP_GC_COUNT			16
@@ -347,20 +348,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
 static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
 				unsigned int segno, bool use_section)
 {
-	if (use_section && __is_large_section(sbi)) {
-		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
-		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
-		unsigned int blocks = 0;
-		int i;
+	if (use_section && __is_large_section(sbi))
+		return get_sec_entry(sbi, segno)->ckpt_valid_blocks;
+	else
+		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+}
+
+static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
+		unsigned int segno)
+{
+	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
+	unsigned int blocks = 0;
+	int i;
 
-		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
-			struct seg_entry *se = get_seg_entry(sbi, start_segno);
+	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, start_segno);
 
-			blocks += se->ckpt_valid_blocks;
-		}
-		return blocks;
+		blocks += se->ckpt_valid_blocks;
 	}
-	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
 }
 
 static inline void seg_info_from_raw_sit(struct seg_entry *se,
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
