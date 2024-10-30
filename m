Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC979B602E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2024 11:32:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6608-0001m1-FZ;
	Wed, 30 Oct 2024 10:32:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t6606-0001lo-Sn
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQgBom3vHVzftnDbn6ZEE5QR9oQcH6SWEKIOc9wjxtg=; b=JUEAtwSMjJgafqOrZ6uoEdXh7k
 TYrJ3Odio+DVuYt34zq5rfuv3s49Fxy8vD88eGbGBP7Jy7WW+Vp0emLapT1qECrNVN0Ul3dgZ+JhB
 wur6T/3o6msdeb5jKAzMJxs91n2Enf/jQImVyS5WLBWqw/tWe0MXurpzjQ6dqBb69Z48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tQgBom3vHVzftnDbn6ZEE5QR9oQcH6SWEKIOc9wjxtg=; b=MMelRi7ZQBtZ0a1yC/Jf320jLx
 JLuESormVJUX4SeO5M6g3Z6IxhXWMedpLqjjnPVIN4t38JY8xBA/wncF2MHEJv0HC4alLY0tdtySK
 FuMjIsVHZeUO62ngkMQ/3VN7+76rPfXtJQFhp/buEUadQt/7clTShJe+kojj3ddhCXvU=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6605-0002F6-03 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 10:32:30 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49UAVixk026962;
 Wed, 30 Oct 2024 18:31:44 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Xdk1Q5J9Rz2K4lHM;
 Wed, 30 Oct 2024 18:31:06 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 30 Oct 2024 18:31:42 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 30 Oct 2024 18:31:35 +0800
Message-ID: <20241030103136.2874140-5-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030103136.2874140-1-yi.sun@unisoc.com>
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49UAVixk026962
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: New function can process some consecutive blocks at a time.
 Function f2fs_invalidate_blocks()->down_write() and up_write() are very
 time-consuming, 
 so if f2fs_invalidate_blocks() can process consecutive blocks at one time,
 it will save a lot of time. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1t6605-0002F6-03
Subject: [f2fs-dev] [PATCH v2 4/5] f2fs: add parameter @len to
 f2fs_invalidate_blocks()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com, yi.sun@unisoc.com,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

New function can process some consecutive blocks at a time.

Function f2fs_invalidate_blocks()->down_write() and up_write()
are very time-consuming, so if f2fs_invalidate_blocks() can
process consecutive blocks at one time, it will save a lot of time.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/compress.c |  4 +--
 fs/f2fs/f2fs.h     |  3 +-
 fs/f2fs/file.c     |  8 +++---
 fs/f2fs/node.c     |  4 +--
 fs/f2fs/segment.c  | 69 ++++++++++++++++++++++++++++++++++++++--------
 5 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e607a7885b57..02ad0ff29cf2 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1374,7 +1374,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			if (blkaddr == COMPRESS_ADDR)
 				fio.compr_blocks++;
 			if (__is_valid_data_blkaddr(blkaddr))
-				f2fs_invalidate_blocks(sbi, blkaddr);
+				f2fs_invalidate_blocks(sbi, blkaddr, 1);
 			f2fs_update_data_blkaddr(&dn, COMPRESS_ADDR);
 			goto unlock_continue;
 		}
@@ -1384,7 +1384,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 		if (i > cc->valid_nr_cpages) {
 			if (__is_valid_data_blkaddr(blkaddr)) {
-				f2fs_invalidate_blocks(sbi, blkaddr);
+				f2fs_invalidate_blocks(sbi, blkaddr, 1);
 				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
 			}
 			goto unlock_continue;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index addd49af57ec..4bb459157adf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3716,7 +3716,8 @@ int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
 int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
 int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
-void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
+void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
+						unsigned int len);
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
 int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 75a8b22da664..13594bb502d1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -652,7 +652,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 				valid_blocks++;
 		}
 
-		f2fs_invalidate_blocks(sbi, blkaddr);
+		f2fs_invalidate_blocks(sbi, blkaddr, 1);
 
 		if (!released || blkaddr != COMPRESS_ADDR)
 			nr_free++;
@@ -750,7 +750,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		unsigned int i;
 
 		for (i = 0; i < ei.len; i++)
-			f2fs_invalidate_blocks(sbi, ei.blk + i);
+			f2fs_invalidate_blocks(sbi, ei.blk + i, 1);
 
 		dec_valid_block_count(sbi, inode, ei.len);
 		f2fs_update_time(sbi, REQ_TIME);
@@ -1319,7 +1319,7 @@ static int __roll_back_blkaddrs(struct inode *inode, block_t *blkaddr,
 		ret = f2fs_get_dnode_of_data(&dn, off + i, LOOKUP_NODE_RA);
 		if (ret) {
 			dec_valid_block_count(sbi, inode, 1);
-			f2fs_invalidate_blocks(sbi, *blkaddr);
+			f2fs_invalidate_blocks(sbi, *blkaddr, 1);
 		} else {
 			f2fs_update_data_blkaddr(&dn, *blkaddr);
 		}
@@ -1571,7 +1571,7 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 			break;
 		}
 
-		f2fs_invalidate_blocks(sbi, dn->data_blkaddr);
+		f2fs_invalidate_blocks(sbi, dn->data_blkaddr, 1);
 		f2fs_set_data_blkaddr(dn, NEW_ADDR);
 	}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index af36c6d6542b..db15d6a90f67 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -916,7 +916,7 @@ static int truncate_node(struct dnode_of_data *dn)
 	}
 
 	/* Deallocate node address */
-	f2fs_invalidate_blocks(sbi, ni.blk_addr);
+	f2fs_invalidate_blocks(sbi, ni.blk_addr, 1);
 	dec_valid_node_count(sbi, dn->inode, dn->nid == dn->inode->i_ino);
 	set_node_addr(sbi, &ni, NULL_ADDR, false);
 
@@ -2761,7 +2761,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 	if (err)
 		return err;
 
-	f2fs_invalidate_blocks(sbi, ni.blk_addr);
+	f2fs_invalidate_blocks(sbi, ni.blk_addr, 1);
 	dec_valid_node_count(sbi, inode, false);
 	set_node_addr(sbi, &ni, NULL_ADDR, false);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 92ddff285a65..67f2bfdeb6ec 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -245,7 +245,7 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 		if (!__is_valid_data_blkaddr(new_addr)) {
 			if (new_addr == NULL_ADDR)
 				dec_valid_block_count(sbi, inode, 1);
-			f2fs_invalidate_blocks(sbi, dn.data_blkaddr);
+			f2fs_invalidate_blocks(sbi, dn.data_blkaddr, 1);
 			f2fs_update_data_blkaddr(&dn, new_addr);
 		} else {
 			f2fs_replace_block(sbi, &dn, dn.data_blkaddr,
@@ -2558,29 +2558,76 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 		get_sec_entry(sbi, segno)->valid_blocks += del;
 }
 
-void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
+static void __f2fs_invalidate_blocks(struct f2fs_sb_info *sbi,
+					block_t addr, block_t end)
 {
 	unsigned int segno = GET_SEGNO(sbi, addr);
 	struct sit_info *sit_i = SIT_I(sbi);
+	unsigned int seg_num = GET_SEGNO(sbi, end) - segno + 1;
+	unsigned int i = 1, max_blocks = sbi->blocks_per_seg, len;
+	block_t addr_start = addr;
 
-	f2fs_bug_on(sbi, addr == NULL_ADDR);
-	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
-		return;
-
-	f2fs_invalidate_internal_cache(sbi, addr, 1);
+	f2fs_invalidate_internal_cache(sbi, addr, end - addr + 1);
 
 	/* add it into sit main buffer */
 	down_write(&sit_i->sentry_lock);
 
-	update_segment_mtime(sbi, addr, 0);
-	update_sit_entry(sbi, addr, -1);
+	if (seg_num == 1)
+		len = end - addr + 1;
+	else
+		len = max_blocks - GET_BLKOFF_FROM_SEG0(sbi, addr);
 
-	/* add it into dirty seglist */
-	locate_dirty_segment(sbi, segno);
+	do {
+		update_segment_mtime(sbi, addr_start, 0);
+		update_sit_entry(sbi, addr_start, -len);
+
+		/* add it into dirty seglist */
+		locate_dirty_segment(sbi, segno);
+
+		/* update @addr_start and @len and @segno */
+		addr_start = START_BLOCK(sbi, ++segno);
+		if (++i == seg_num)
+			len = GET_BLKOFF_FROM_SEG0(sbi, end) + 1;
+		else
+			len = max_blocks;
+	} while (i <= seg_num);
 
 	up_write(&sit_i->sentry_lock);
 }
 
+void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi,
+				block_t addr, unsigned int len)
+{
+	unsigned int i;
+	/* Temporary record location */
+	block_t addr_start = addr, addr_end;
+
+	if (len == 0)
+		return;
+
+	for (i = 0; i < len; i++) {
+		addr_end = addr + i;
+
+		f2fs_bug_on(sbi, addr_end == NULL_ADDR);
+
+		if (addr_end == NEW_ADDR || addr_end == COMPRESS_ADDR) {
+			if (addr_start == addr_end) {
+				addr_end = addr_start = addr_end + 1;
+				continue;
+			}
+
+			__f2fs_invalidate_blocks(sbi, addr_start, addr_end - 1);
+			addr_end = addr_start = addr_end + 1;
+		}
+	}
+
+	if (addr_end >= (addr + len))
+		return;
+
+	__f2fs_invalidate_blocks(sbi, addr_start, addr_end);
+
+}
+
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
