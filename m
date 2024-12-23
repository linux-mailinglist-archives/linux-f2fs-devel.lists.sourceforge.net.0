Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C479FAB6F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 09:13:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPdYf-0008I7-TM;
	Mon, 23 Dec 2024 08:12:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1tPdYb-0008HZ-MY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HDc1h1mpUKDkwJYsTRuQhBuV3jzpZuQ5Yyus1EWo6Mk=; b=dOKPHtrg7hxromNVRruuhMG+Tk
 PtItHyCudRV6jjgNKw3MC++8FH/MuPYLMDPCXEnpBGePhAiY43icmBB7ZGrr7lveD5pKzsESTNGjx
 wipQ1wpKXn67A3h7PC/YTVB70MFHp4o1qjBW8szDowbXRvtPVN4DcCbaPd0Wr/OIa5u4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HDc1h1mpUKDkwJYsTRuQhBuV3jzpZuQ5Yyus1EWo6Mk=; b=PovflxHwc6/kH6X90coTs1N067
 t0tv1LuJTSwAVNKRU22tLowVp1FcpOlKvpEsgEZF+ZfwryPAmRWZ8suOcDJ9RFLTLXGNGgIjlQ0qU
 6JOfq7v0LGlhmXS3taGDfh3eOJ8nmB/h5kxoY2r75zFgGCjDaViZl3lnksAYCoa/c5oc=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tPdYa-0007EA-3S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 08:12:53 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4BN8ApLH033537;
 Mon, 23 Dec 2024 16:10:51 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YGrHt0vJtz2NksVq;
 Mon, 23 Dec 2024 16:08:26 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 23 Dec 2024 16:10:49 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Mon, 23 Dec 2024 16:10:43 +0800
Message-ID: <20241223081044.1126291-4-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241223081044.1126291-1-yi.sun@unisoc.com>
References: <20241223081044.1126291-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4BN8ApLH033537
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
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tPdYa-0007EA-3S
Subject: [f2fs-dev] [PATCH v4 3/4] f2fs: add parameter @len to
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
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

New function can process some consecutive blocks at a time.

Function f2fs_invalidate_blocks()->down_write() and up_write()
are very time-consuming, so if f2fs_invalidate_blocks() can
process consecutive blocks at one time, it will save a lot of time.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/compress.c |  4 ++--
 fs/f2fs/f2fs.h     |  3 ++-
 fs/f2fs/file.c     |  8 ++++----
 fs/f2fs/node.c     |  4 ++--
 fs/f2fs/segment.c  | 32 +++++++++++++++++++++++++-------
 5 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index be3e6f4d33a2..c5e42eec8ac9 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1380,7 +1380,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			if (blkaddr == COMPRESS_ADDR)
 				fio.compr_blocks++;
 			if (__is_valid_data_blkaddr(blkaddr))
-				f2fs_invalidate_blocks(sbi, blkaddr);
+				f2fs_invalidate_blocks(sbi, blkaddr, 1);
 			f2fs_update_data_blkaddr(&dn, COMPRESS_ADDR);
 			goto unlock_continue;
 		}
@@ -1390,7 +1390,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 		if (i > cc->valid_nr_cpages) {
 			if (__is_valid_data_blkaddr(blkaddr)) {
-				f2fs_invalidate_blocks(sbi, blkaddr);
+				f2fs_invalidate_blocks(sbi, blkaddr, 1);
 				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
 			}
 			goto unlock_continue;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c537f6b5a413..b70fa0e32fe3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3723,7 +3723,8 @@ int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
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
index aa9679b3d8e4..81764b10840b 100644
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
@@ -1323,7 +1323,7 @@ static int __roll_back_blkaddrs(struct inode *inode, block_t *blkaddr,
 		ret = f2fs_get_dnode_of_data(&dn, off + i, LOOKUP_NODE_RA);
 		if (ret) {
 			dec_valid_block_count(sbi, inode, 1);
-			f2fs_invalidate_blocks(sbi, *blkaddr);
+			f2fs_invalidate_blocks(sbi, *blkaddr, 1);
 		} else {
 			f2fs_update_data_blkaddr(&dn, *blkaddr);
 		}
@@ -1575,7 +1575,7 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 			break;
 		}
 
-		f2fs_invalidate_blocks(sbi, dn->data_blkaddr);
+		f2fs_invalidate_blocks(sbi, dn->data_blkaddr, 1);
 		f2fs_set_data_blkaddr(dn, NEW_ADDR);
 	}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c04ee1a7ce57..b09a6d0ee791 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -917,7 +917,7 @@ static int truncate_node(struct dnode_of_data *dn)
 	}
 
 	/* Deallocate node address */
-	f2fs_invalidate_blocks(sbi, ni.blk_addr);
+	f2fs_invalidate_blocks(sbi, ni.blk_addr, 1);
 	dec_valid_node_count(sbi, dn->inode, dn->nid == dn->inode->i_ino);
 	set_node_addr(sbi, &ni, NULL_ADDR, false);
 
@@ -2764,7 +2764,7 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 	if (err)
 		return err;
 
-	f2fs_invalidate_blocks(sbi, ni.blk_addr);
+	f2fs_invalidate_blocks(sbi, ni.blk_addr, 1);
 	dec_valid_node_count(sbi, inode, false);
 	set_node_addr(sbi, &ni, NULL_ADDR, false);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 67d2859831e4..813254dcc00e 100644
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
@@ -2567,25 +2567,43 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 		get_sec_entry(sbi, segno)->valid_blocks += del;
 }
 
-void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
+void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
+				unsigned int len)
 {
 	unsigned int segno = GET_SEGNO(sbi, addr);
 	struct sit_info *sit_i = SIT_I(sbi);
+	block_t addr_start = addr, addr_end = addr + len - 1;
+	unsigned int seg_num = GET_SEGNO(sbi, addr_end) - segno + 1;
+	unsigned int i = 1, max_blocks = sbi->blocks_per_seg, cnt;
 
 	f2fs_bug_on(sbi, addr == NULL_ADDR);
 	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
 		return;
 
-	f2fs_invalidate_internal_cache(sbi, addr, 1);
+	f2fs_invalidate_internal_cache(sbi, addr, len);
 
 	/* add it into sit main buffer */
 	down_write(&sit_i->sentry_lock);
 
-	update_segment_mtime(sbi, addr, 0);
-	update_sit_entry(sbi, addr, -1);
+	if (seg_num == 1)
+		cnt = len;
+	else
+		cnt = max_blocks - GET_BLKOFF_FROM_SEG0(sbi, addr);
 
-	/* add it into dirty seglist */
-	locate_dirty_segment(sbi, segno);
+	do {
+		update_segment_mtime(sbi, addr_start, 0);
+		update_sit_entry(sbi, addr_start, -cnt);
+
+		/* add it into dirty seglist */
+		locate_dirty_segment(sbi, segno);
+
+		/* update @addr_start and @cnt and @segno */
+		addr_start = START_BLOCK(sbi, ++segno);
+		if (++i == seg_num)
+			cnt = GET_BLKOFF_FROM_SEG0(sbi, addr_end) + 1;
+		else
+			cnt = max_blocks;
+	} while (i <= seg_num);
 
 	up_write(&sit_i->sentry_lock);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
