Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1C3AE1B0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jun 2021 04:40:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lv9qu-0002OI-MS; Mon, 21 Jun 2021 02:39:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lv9qp-0002Ni-KH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A9RlcjVYH7KrtSiviA8d8dFu5Q/1MmOhKQNfTWorhdQ=; b=gMxIU5PY+hHiyCycQmYbEGko4p
 v/V8ioglRduU1GsUjdo8lY+QRv9Tsa9ZNUga2uC1ghwTj1c56PWOmL+LRu7dptp0GRT0zCNBQlJoz
 E2J3Vnx4QZgnqdIV4UEMTZtqJYTZWKpfQq+uqWjDkE8uTNDOxj8Acrx6zQb1rSH6CzZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A9RlcjVYH7KrtSiviA8d8dFu5Q/1MmOhKQNfTWorhdQ=; b=f+Xrhl4hlS5KJd005llDeGoDC6
 apt8RMM2WbKPyg5Us6aadjLk7Os4cq/eEOI3TRSslZNrowNjIPHFtwrxLhzsnGh9H9Os+FQqX2xa2
 jOOFuidiAjK4bIwNv29tG6UbUddRWEE7ayu55ImhuGXNlQ2JSYZR5v8Zb6oL895dTTC0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lv9ql-000564-23
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:39:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1396A611C0;
 Mon, 21 Jun 2021 02:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624243183;
 bh=7mKO2vf9N/DBW1nn8EPTMeif/bSKg1boOWaqZly8MWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jnJfFjzxa2oA+Anf+lZbx6FH+9FB2z6kXTn5bCcV3Nhdu4N58SFPWjgIn/aiAbHIp
 5/ohDM+UrhSPifkdKnTfqCXNQdOcCk9eNtYq9de0gQfSnkbrkBIIgH1cCydv5vUxZz
 TGiJxNvAowpjQytgeV2jHyCSHsCf8D7mgq8YwJr7quG6WzEHWhBPgoLWV/+NibswPy
 9f3jZlEq6xOpX07zOIwL28NkbTJ2VrrKHbqsucJVW9dUc/I/wpicSaxVso2yP99kKl
 9qhwufoDShF/R/nx1Q2zHKqvLS9ais401ix3T5Y4PaRMwyaR82KKxEjEFfO4a7qLin
 e+ARw7Y72/0UA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Jun 2021 19:39:38 -0700
Message-Id: <20210621023939.1510591-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210621023939.1510591-1-jaegeuk@kernel.org>
References: <20210621023939.1510591-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [198.145.29.99 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lv9ql-000564-23
Subject: [f2fs-dev] [PATCH 3/4] f2fs-tools: fix wrong file offset
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This fixes wrong file offset updates.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/dump.c | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index f9ef5725c7be..2f796b81febc 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -293,27 +293,20 @@ static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
 }
 
 static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
-						u32 nid, u64 *ofs)
+				u32 nid, u32 addr_per_block, u64 *ofs)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk;
 	u32 skip = 0;
 	u32 i, idx = 0;
 
-	get_node_info(sbi, nid, &ni);
-
-	node_blk = calloc(BLOCK_SZ, 1);
-	ASSERT(node_blk);
-
-	dev_read_block(node_blk, ni.blk_addr);
-
 	switch (ntype) {
 	case TYPE_DIRECT_NODE:
-		skip = idx = ADDRS_PER_BLOCK(&node_blk->i);
+		skip = idx = addr_per_block;
 		break;
 	case TYPE_INDIRECT_NODE:
 		idx = NIDS_PER_BLOCK;
-		skip = idx * ADDRS_PER_BLOCK(&node_blk->i);
+		skip = idx * addr_per_block;
 		break;
 	case TYPE_DOUBLE_INDIRECT_NODE:
 		skip = 0;
@@ -323,26 +316,37 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 
 	if (nid == 0) {
 		*ofs += skip;
-		goto out;
+		return;
 	}
 
-	for (i = 0; i < idx; i++, (*ofs)++) {
+	get_node_info(sbi, nid, &ni);
+
+	node_blk = calloc(BLOCK_SZ, 1);
+	ASSERT(node_blk);
+
+	dev_read_block(node_blk, ni.blk_addr);
+
+	for (i = 0; i < idx; i++) {
 		switch (ntype) {
 		case TYPE_DIRECT_NODE:
 			dump_data_blk(sbi, *ofs * F2FS_BLKSIZE,
 					le32_to_cpu(node_blk->dn.addr[i]));
+			(*ofs)++;
 			break;
 		case TYPE_INDIRECT_NODE:
 			dump_node_blk(sbi, TYPE_DIRECT_NODE,
-					le32_to_cpu(node_blk->in.nid[i]), ofs);
+					le32_to_cpu(node_blk->in.nid[i]),
+					addr_per_block,
+					ofs);
 			break;
 		case TYPE_DOUBLE_INDIRECT_NODE:
 			dump_node_blk(sbi, TYPE_INDIRECT_NODE,
-					le32_to_cpu(node_blk->in.nid[i]), ofs);
+					le32_to_cpu(node_blk->in.nid[i]),
+					addr_per_block,
+					ofs);
 			break;
 		}
 	}
-out:
 	free(node_blk);
 }
 
@@ -421,6 +425,7 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 {
 	u32 i = 0;
 	u64 ofs = 0;
+	u32 addr_per_block;
 
 	if((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		DBG(3, "ino[0x%x] has inline data!\n", nid);
@@ -431,6 +436,7 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	}
 
 	c.show_file_map_max_offset = f2fs_max_file_offset(&node_blk->i);
+	addr_per_block = ADDRS_PER_BLOCK(&node_blk->i);
 
 	/* check data blocks in inode */
 	for (i = 0; i < ADDRS_PER_INODE(&node_blk->i); i++, ofs++)
@@ -441,13 +447,19 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	for (i = 0; i < 5; i++) {
 		if (i == 0 || i == 1)
 			dump_node_blk(sbi, TYPE_DIRECT_NODE,
-					le32_to_cpu(node_blk->i.i_nid[i]), &ofs);
+					le32_to_cpu(node_blk->i.i_nid[i]),
+					addr_per_block,
+					&ofs);
 		else if (i == 2 || i == 3)
 			dump_node_blk(sbi, TYPE_INDIRECT_NODE,
-					le32_to_cpu(node_blk->i.i_nid[i]), &ofs);
+					le32_to_cpu(node_blk->i.i_nid[i]),
+					addr_per_block,
+					&ofs);
 		else if (i == 4)
 			dump_node_blk(sbi, TYPE_DOUBLE_INDIRECT_NODE,
-					le32_to_cpu(node_blk->i.i_nid[i]), &ofs);
+					le32_to_cpu(node_blk->i.i_nid[i]),
+					addr_per_block,
+					&ofs);
 		else
 			ASSERT(0);
 	}
-- 
2.32.0.288.g62a8d224e6-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
