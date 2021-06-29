Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01D3B6DF8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jun 2021 07:36:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ly6QV-00032p-CK; Tue, 29 Jun 2021 05:36:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1ly6QT-00032X-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Jun 2021 05:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dDg0tVp8wr8xWShFT+St0MhpcX1mA3zJsdBFu2iXw+Q=; b=TOiN35QxSHiRUXiglzeQkvPVCQ
 AL89e8ka6kvI8MdRtma25eLKcVWw34fgYyF5gV/7WlaoDVbnjRQ0S3mWW2v/mft3p5riYnkwCNE+y
 6nY+CArFtCy82HloUahXHXDMPKvBcAM5xB1blh80j3/mzWux+dcwo3EX+ZOKSZgdhexM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dDg0tVp8wr8xWShFT+St0MhpcX1mA3zJsdBFu2iXw+Q=; b=J
 kRVA1wr9dWOy8us3zLF5PdlbwCkSbJOkkzi60QzOnysIfxWkhd7UHCbApVvXo+pCaa3oReQItGxt8
 WDQt5z9yUzmfUobJWHOB9WTHmWwOnDueQIU0TnL/ZZwxqHiUijip4dZLxpuHudCEO9pjesvKQYxII
 0/rYn+pUGFx8kvh0=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ly6QP-0008Pe-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Jun 2021 05:36:49 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so1124888pjs.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Jun 2021 22:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDg0tVp8wr8xWShFT+St0MhpcX1mA3zJsdBFu2iXw+Q=;
 b=DS77Ffxy5IL74CKrUcxb+TNAAxCFD86uSKPjNZew3/0yZmTKC7YeGy07yDXKkZ0qsl
 ctl8Ux6X+W2+48SdJOEn/jnOzoresYurXd85oFcjY6ggjAxDl4jiNzR5kPnikstCB96/
 VFzsZ6EsJhEbR2VrwMpUkNDKdr7PDZn+VewKdfufzpWXMTxgQ9Q/cVzJtYzfvzGCMh76
 zvYgRw1juaAxd0TUrQT+VwbKSFCxZ60+rEw7/HeqVR0bE3+IRPuh4bOBDMTPU8c19UKz
 vTyhaAPOZcU+0H5SutBseN6Qz5R++rgFtwgloaq2nzpclIfoXOS1TZjD/ZeCnP4EJNXS
 e+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDg0tVp8wr8xWShFT+St0MhpcX1mA3zJsdBFu2iXw+Q=;
 b=B2jOaREVURW1caUpOYxUWfZk4R5gY7lgzvrWtRvuk8KUwgiEasqvu6j68DfKzkSmLZ
 x4gK9PHuNuP1vcnpvMIkH57ujUKlErMOT76KDsDPeXKp8x+hyttoi1OnYMv8TcT7o94T
 mBWXjJv8qbYDiQ/lwp0K6Ldcf6/vg3YcQ91QMqQYgaUQrP1Ihb9DW6ZBaU/2HqpCmKRI
 ZirjCIDFxtX4hvqjDXepObYYN2tuD2xkMfy7tCBDMSBlTSk5PjFZM3nFUaxSSv2RCp8m
 81clMEl2Vi9/G0H6iVfoRNbelMWTklPnvYutwTzWP23shGb9K65h+JA4e/I9oS3TkflY
 0BAQ==
X-Gm-Message-State: AOAM533L3w77nO7lNZVC5yalTeG3E5rBguUmNL1oWLG89To9FC3nUyrH
 6Z7WzCy/JB22EIgY/N8sl367DYtIYPc=
X-Google-Smtp-Source: ABdhPJznWKHkT8GmE5fEULnnGqoPzXBUHMf6yCbxY9M2j53Tt9tgHVC/QH+Ti5vFZT2z9VmwaFrGeg==
X-Received: by 2002:a17:902:d4cf:b029:128:dbdd:5b5b with SMTP id
 o15-20020a170902d4cfb0290128dbdd5b5bmr8411861plg.3.1624944999741; 
 Mon, 28 Jun 2021 22:36:39 -0700 (PDT)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:c9e4:c001:6004:da74])
 by smtp.gmail.com with ESMTPSA id 69sm16637092pfz.110.2021.06.28.22.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 22:36:39 -0700 (PDT)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Tue, 29 Jun 2021 13:36:31 +0800
Message-Id: <20210629053631.671997-1-robinh3123@gmail.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ly6QP-0008Pe-Oc
Subject: [f2fs-dev] [PATCH] fsck.f2fs: add basic compress related check/fix
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

* check/fix i_compr_blocks
* check/fix compressed flag in i_flags when compression is not
  supported.

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 fsck/fsck.c       | 160 +++++++++++++++++++++++++++++++++++-----------
 fsck/fsck.h       |  14 ++--
 fsck/main.c       |   6 +-
 include/f2fs_fs.h |  15 +++++
 4 files changed, 151 insertions(+), 44 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 80a6d8e..17e3eec 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -533,7 +533,8 @@ out:
 
 int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		u32 nid, enum FILE_TYPE ftype, enum NODE_TYPE ntype,
-		u32 *blk_cnt, struct child_info *child)
+		u32 *blk_cnt, struct f2fs_compr_blk_cnt *cbc,
+		struct child_info *child)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk = NULL;
@@ -547,7 +548,8 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 	if (ntype == TYPE_INODE) {
 		struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 
-		fsck_chk_inode_blk(sbi, nid, ftype, node_blk, blk_cnt, &ni, child);
+		fsck_chk_inode_blk(sbi, nid, ftype, node_blk, blk_cnt, cbc,
+				&ni, child);
 		quota_add_inode_usage(fsck->qctx, nid, &node_blk->i);
 	} else {
 		switch (ntype) {
@@ -555,19 +557,19 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 			f2fs_set_main_bitmap(sbi, ni.blk_addr,
 							CURSEG_WARM_NODE);
 			fsck_chk_dnode_blk(sbi, inode, nid, ftype, node_blk,
-					blk_cnt, child, &ni);
+					blk_cnt, cbc, child, &ni);
 			break;
 		case TYPE_INDIRECT_NODE:
 			f2fs_set_main_bitmap(sbi, ni.blk_addr,
 							CURSEG_COLD_NODE);
 			fsck_chk_idnode_blk(sbi, inode, ftype, node_blk,
-					blk_cnt, child);
+					blk_cnt, cbc, child);
 			break;
 		case TYPE_DOUBLE_INDIRECT_NODE:
 			f2fs_set_main_bitmap(sbi, ni.blk_addr,
 							CURSEG_COLD_NODE);
 			fsck_chk_didnode_blk(sbi, inode, ftype, node_blk,
-					blk_cnt, child);
+					blk_cnt, cbc, child);
 			break;
 		default:
 			ASSERT(0);
@@ -667,7 +669,8 @@ void fsck_reada_all_direct_node_blocks(struct f2fs_sb_info *sbi,
 /* start with valid nid and blkaddr */
 void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		enum FILE_TYPE ftype, struct f2fs_node *node_blk,
-		u32 *blk_cnt, struct node_info *ni, struct child_info *child_d)
+		u32 *blk_cnt, struct f2fs_compr_blk_cnt *cbc,
+		struct node_info *ni, struct child_info *child_d)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct child_info child;
@@ -675,6 +678,12 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	u32 i_links = le32_to_cpu(node_blk->i.i_links);
 	u64 i_size = le64_to_cpu(node_blk->i.i_size);
 	u64 i_blocks = le64_to_cpu(node_blk->i.i_blocks);
+	bool compr_supported = c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION);
+	u32 i_flags = le32_to_cpu(node_blk->i.i_flags);
+	bool compressed = (i_flags & F2FS_COMPR_FL)? true: false;
+	bool compr_rel = (node_blk->i.i_inline & F2FS_COMPRESS_RELEASED)?
+			true : false;
+	u64 i_compr_blocks = le64_to_cpu(node_blk->i.i_compr_blocks);
 	nid_t i_xattr_nid = le32_to_cpu(node_blk->i.i_xattr_nid);
 	int ofs;
 	char *en;
@@ -683,7 +692,23 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	unsigned short i_gc_failures;
 	int need_fix = 0;
 	int ret;
+	u32 cluster_size = 1 << node_blk->i.i_log_cluster_size;
 
+	if (!compr_supported && compressed) {
+		/*
+		 * The 'compression' flag in i_flags affects the traverse of
+		 * the node tree.  Thus, it must be fixed unconditionally
+		 * in the memory (node_blk).
+		 */
+		node_blk->i.i_flags &= ~cpu_to_le32(F2FS_COMPR_FL);
+		compressed = false;
+		if (c.fix_on) {
+			need_fix = 1;
+			FIX_MSG("[0x%x] i_flags=0x%x -> 0x%x",
+					nid, i_flags, node_blk->i.i_flags);
+		}
+		i_flags &= ~F2FS_COMPR_FL;
+	}
 	memset(&child, 0, sizeof(child));
 	child.links = 2;
 	child.p_ino = nid;
@@ -897,31 +922,45 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		/* check extent info */
 		check_extent_info(&child, blkaddr, 0);
 
+		if (blkaddr == NULL_ADDR)
+			continue;
 		if (blkaddr == COMPRESS_ADDR) {
-			if (node_blk->i.i_compr_blocks) {
+			if (!compressed || (child.pgofs &
+					(cluster_size - 1)) != 0) {
+				if (c.fix_on) {
+					node_blk->i.i_addr[ofs + idx] =
+							NULL_ADDR;
+					need_fix = 1;
+					FIX_MSG("[0x%x] i_addr[%d] = 0", nid,
+							ofs + idx);
+				}
+				continue;
+			}
+			if (!compr_rel) {
 				fsck->chk.valid_blk_cnt++;
 				*blk_cnt = *blk_cnt + 1;
+				cbc->cheader_pgofs = child.pgofs;
+				cbc->cnt++;
 			}
 			continue;
 		}
-
-		if (blkaddr != 0) {
-			ret = fsck_chk_data_blk(sbi,
-					IS_CASEFOLDED(&node_blk->i),
-					blkaddr,
-					&child, (i_blocks == *blk_cnt),
-					ftype, nid, idx, ni->version,
-					file_is_encrypt(&node_blk->i));
-			if (!ret) {
-				*blk_cnt = *blk_cnt + 1;
-				if (cur_qtype != -1 && blkaddr != NEW_ADDR)
-					qf_last_blkofs[cur_qtype] = child.pgofs;
-			} else if (c.fix_on) {
-				node_blk->i.i_addr[ofs + idx] = 0;
-				need_fix = 1;
-				FIX_MSG("[0x%x] i_addr[%d] = 0",
-							nid, ofs + idx);
-			}
+		if (!compr_rel && blkaddr == NEW_ADDR &&
+				child.pgofs - cbc->cheader_pgofs < cluster_size)
+			cbc->cnt++;
+		ret = fsck_chk_data_blk(sbi,
+				IS_CASEFOLDED(&node_blk->i),
+				blkaddr,
+				&child, (i_blocks == *blk_cnt),
+				ftype, nid, idx, ni->version,
+				file_is_encrypt(&node_blk->i));
+		if (!ret) {
+			*blk_cnt = *blk_cnt + 1;
+			if (cur_qtype != -1 && blkaddr != NEW_ADDR)
+				qf_last_blkofs[cur_qtype] = child.pgofs;
+		} else if (c.fix_on) {
+			node_blk->i.i_addr[ofs + idx] = 0;
+			need_fix = 1;
+			FIX_MSG("[0x%x] i_addr[%d] = 0", nid, ofs + idx);
 		}
 	}
 
@@ -948,7 +987,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 			goto skip;
 
 		ret = fsck_chk_node_blk(sbi, &node_blk->i, i_nid,
-					ftype, ntype, blk_cnt, &child);
+				ftype, ntype, blk_cnt, cbc, &child);
 		if (!ret) {
 			*blk_cnt = *blk_cnt + 1;
 		} else if (ret == -EINVAL) {
@@ -992,6 +1031,16 @@ check:
 					nid, i_blocks, *blk_cnt);
 		}
 	}
+
+	if (compressed && i_compr_blocks != cbc->cnt) {
+		if (c.fix_on) {
+			node_blk->i.i_compr_blocks = cpu_to_le64(cbc->cnt);
+			need_fix = 1;
+			FIX_MSG("[0x%x] i_compr_blocks=0x%08"PRIx64" -> 0x%x",
+					nid, i_compr_blocks, cbc->cnt);
+		}
+	}
+
 skip_blkcnt_fix:
 	en = malloc(F2FS_PRINT_NAMELEN);
 	ASSERT(en);
@@ -1130,27 +1179,48 @@ skip_blkcnt_fix:
 
 int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		u32 nid, enum FILE_TYPE ftype, struct f2fs_node *node_blk,
-		u32 *blk_cnt, struct child_info *child, struct node_info *ni)
+		u32 *blk_cnt, struct f2fs_compr_blk_cnt *cbc,
+		struct child_info *child, struct node_info *ni)
 {
 	int idx, ret;
 	int need_fix = 0;
 	child->p_ino = nid;
 	child->pp_ino = le32_to_cpu(inode->i_pino);
+	u32 i_flags = le32_to_cpu(inode->i_flags);
+	bool compressed = (i_flags & F2FS_COMPR_FL)? true: false;
+	bool compr_rel = (inode->i_inline & F2FS_COMPRESS_RELEASED)?
+			true : false;
+	u32 cluster_size = 1 << inode->i_log_cluster_size;
 
 	for (idx = 0; idx < ADDRS_PER_BLOCK(inode); idx++, child->pgofs++) {
 		block_t blkaddr = le32_to_cpu(node_blk->dn.addr[idx]);
 
 		check_extent_info(child, blkaddr, 0);
 
-		if (blkaddr == 0x0)
+		if (blkaddr == NULL_ADDR)
 			continue;
 		if (blkaddr == COMPRESS_ADDR) {
-			if (inode->i_compr_blocks) {
+			if (!compressed || (child->pgofs &
+					(cluster_size - 1)) != 0) {
+				if (c.fix_on) {
+					node_blk->dn.addr[idx] = NULL_ADDR;
+					need_fix = 1;
+					FIX_MSG("[0x%x] dn.addr[%d] = 0", nid,
+							idx);
+				}
+				continue;
+			}
+			if (!compr_rel) {
 				F2FS_FSCK(sbi)->chk.valid_blk_cnt++;
 				*blk_cnt = *blk_cnt + 1;
+				cbc->cheader_pgofs = child->pgofs;
+				cbc->cnt++;
 			}
 			continue;
 		}
+		if (!compr_rel && blkaddr == NEW_ADDR && child->pgofs -
+				cbc->cheader_pgofs < cluster_size)
+			cbc->cnt++;
 		ret = fsck_chk_data_blk(sbi, IS_CASEFOLDED(inode),
 			blkaddr, child,
 			le64_to_cpu(inode->i_blocks) == *blk_cnt, ftype,
@@ -1161,7 +1231,7 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 			if (cur_qtype != -1 && blkaddr != NEW_ADDR)
 				qf_last_blkofs[cur_qtype] = child->pgofs;
 		} else if (c.fix_on) {
-			node_blk->dn.addr[idx] = 0;
+			node_blk->dn.addr[idx] = NULL_ADDR;
 			need_fix = 1;
 			FIX_MSG("[0x%x] dn.addr[%d] = 0", nid, idx);
 		}
@@ -1175,7 +1245,7 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 
 int fsck_chk_idnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		enum FILE_TYPE ftype, struct f2fs_node *node_blk, u32 *blk_cnt,
-		struct child_info *child)
+		struct f2fs_compr_blk_cnt *cbc, struct child_info *child)
 {
 	int need_fix = 0, ret;
 	int i = 0;
@@ -1187,7 +1257,8 @@ int fsck_chk_idnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 			goto skip;
 		ret = fsck_chk_node_blk(sbi, inode,
 				le32_to_cpu(node_blk->in.nid[i]),
-				ftype, TYPE_DIRECT_NODE, blk_cnt, child);
+				ftype, TYPE_DIRECT_NODE, blk_cnt,
+				cbc, child);
 		if (!ret)
 			*blk_cnt = *blk_cnt + 1;
 		else if (ret == -EINVAL) {
@@ -1217,7 +1288,7 @@ skip:
 
 int fsck_chk_didnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		enum FILE_TYPE ftype, struct f2fs_node *node_blk, u32 *blk_cnt,
-		struct child_info *child)
+		struct f2fs_compr_blk_cnt *cbc, struct child_info *child)
 {
 	int i = 0;
 	int need_fix = 0, ret = 0;
@@ -1229,7 +1300,7 @@ int fsck_chk_didnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 			goto skip;
 		ret = fsck_chk_node_blk(sbi, inode,
 				le32_to_cpu(node_blk->in.nid[i]),
-				ftype, TYPE_INDIRECT_NODE, blk_cnt, child);
+				ftype, TYPE_INDIRECT_NODE, blk_cnt, cbc, child);
 		if (!ret)
 			*blk_cnt = *blk_cnt + 1;
 		else if (ret == -EINVAL) {
@@ -1474,6 +1545,7 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 	enum FILE_TYPE ftype;
 	int dentries = 0;
 	u32 blk_cnt;
+	struct f2fs_compr_blk_cnt cbc;
 	u8 *name;
 	char en[F2FS_PRINT_NAMELEN];
 	u16 name_len;
@@ -1613,10 +1685,12 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 				dentry, max, i, last_blk, enc_name);
 
 		blk_cnt = 1;
+		cbc.cnt = 0;
+		cbc.cheader_pgofs = CHEADER_PGOFS_NONE;
 		child->i_namelen = name_len;
 		ret = fsck_chk_node_blk(sbi,
 				NULL, le32_to_cpu(dentry[i].ino),
-				ftype, TYPE_INODE, &blk_cnt, child);
+				ftype, TYPE_INODE, &blk_cnt, &cbc, child);
 
 		if (ret && c.fix_on) {
 			int j;
@@ -1753,6 +1827,7 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, int casefolded,
 int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 {
 	u32 blk_cnt = 0;
+	struct f2fs_compr_blk_cnt cbc = {0, CHEADER_PGOFS_NONE};
 	block_t start_blk, orphan_blkaddr, i, j;
 	struct f2fs_orphan_block *orphan_blk, *new_blk;
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -1784,6 +1859,8 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 			DBG(1, "[%3d] ino [0x%x]\n", i, ino);
 			struct node_info ni;
 			blk_cnt = 1;
+			cbc.cnt = 0;
+			cbc.cheader_pgofs = CHEADER_PGOFS_NONE;
 
 			if (c.preen_mode == PREEN_MODE_1 && !c.fix_on) {
 				get_node_info(sbi, ino, &ni);
@@ -1799,7 +1876,7 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 
 			ret = fsck_chk_node_blk(sbi, NULL, ino,
 					F2FS_FT_ORPHAN, TYPE_INODE, &blk_cnt,
-					NULL);
+					&cbc, NULL);
 			if (!ret)
 				new_blk->ino[new_entry_count++] =
 							orphan_blk->ino[j];
@@ -1829,6 +1906,7 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
 	enum quota_type qtype;
 	int ret = 0;
 	u32 blk_cnt = 0;
+	struct f2fs_compr_blk_cnt cbc = {0, CHEADER_PGOFS_NONE};
 
 	for (qtype = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
 		cur_qtype = qtype;
@@ -1839,6 +1917,8 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
 
 		DBG(1, "qtype [%d] ino [0x%x]\n", qtype, ino);
 		blk_cnt = 1;
+		cbc.cnt = 0;
+		cbc.cheader_pgofs = CHEADER_PGOFS_NONE;
 
 		if (c.preen_mode == PREEN_MODE_1 && !c.fix_on) {
 			get_node_info(sbi, ino, &ni);
@@ -1848,7 +1928,8 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
 			continue;
 		}
 		ret = fsck_chk_node_blk(sbi, NULL, ino,
-				F2FS_FT_REG_FILE, TYPE_INODE, &blk_cnt, NULL);
+				F2FS_FT_REG_FILE, TYPE_INODE, &blk_cnt,
+				&cbc, NULL);
 		if (ret) {
 			ASSERT_MSG("wrong quota inode, qtype [%d] ino [0x%x]",
 								qtype, ino);
@@ -2753,6 +2834,7 @@ static int fsck_reconnect_file(struct f2fs_sb_info *sbi)
 	struct node_info ni;
 	char *reconnect_bitmap;
 	u32 blk_cnt;
+	struct f2fs_compr_blk_cnt cbc;
 	nid_t nid;
 	int err, cnt = 0, ftype;
 
@@ -2796,8 +2878,10 @@ static int fsck_reconnect_file(struct f2fs_sb_info *sbi)
 
 			DBG(1, "Check inode 0x%x\n", nid);
 			blk_cnt = 1;
+			cbc.cnt = 0;
+			cbc.cheader_pgofs = CHEADER_PGOFS_NONE;
 			fsck_chk_inode_blk(sbi, nid, ftype, node,
-					   &blk_cnt, &ni, NULL);
+					   &blk_cnt, &cbc, &ni, NULL);
 
 			f2fs_set_bit(nid, reconnect_bitmap);
 		}
diff --git a/fsck/fsck.h b/fsck/fsck.h
index b9dcd5c..37ff6b2 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -160,16 +160,20 @@ extern int fsck_sanity_check_nid(struct f2fs_sb_info *, u32,
 			struct node_info *);
 extern int fsck_chk_node_blk(struct f2fs_sb_info *, struct f2fs_inode *, u32,
 		enum FILE_TYPE, enum NODE_TYPE, u32 *,
-		struct child_info *);
+		struct f2fs_compr_blk_cnt *, struct child_info *);
 extern void fsck_chk_inode_blk(struct f2fs_sb_info *, u32, enum FILE_TYPE,
-		struct f2fs_node *, u32 *, struct node_info *, struct child_info *);
+		struct f2fs_node *, u32 *, struct f2fs_compr_blk_cnt *,
+		struct node_info *, struct child_info *);
 extern int fsck_chk_dnode_blk(struct f2fs_sb_info *, struct f2fs_inode *,
 		u32, enum FILE_TYPE, struct f2fs_node *, u32 *,
-		struct child_info *, struct node_info *);
+		struct f2fs_compr_blk_cnt *, struct child_info *,
+		struct node_info *);
 extern int fsck_chk_idnode_blk(struct f2fs_sb_info *, struct f2fs_inode *,
-		enum FILE_TYPE, struct f2fs_node *, u32 *, struct child_info *);
+		enum FILE_TYPE, struct f2fs_node *, u32 *,
+		struct f2fs_compr_blk_cnt *, struct child_info *);
 extern int fsck_chk_didnode_blk(struct f2fs_sb_info *, struct f2fs_inode *,
-		enum FILE_TYPE, struct f2fs_node *, u32 *, struct child_info *);
+		enum FILE_TYPE, struct f2fs_node *, u32 *,
+		struct f2fs_compr_blk_cnt *, struct child_info *);
 extern int fsck_chk_data_blk(struct f2fs_sb_info *, int,
 		u32, struct child_info *, int, enum FILE_TYPE, u32, u16, u8, int);
 extern int fsck_chk_dentry_blk(struct f2fs_sb_info *, int,
diff --git a/fsck/main.c b/fsck/main.c
index c0b871b..b917d2e 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -812,6 +812,7 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
 	u32 flag = le32_to_cpu(ckpt->ckpt_flags);
 	u32 blk_cnt;
+	struct f2fs_compr_blk_cnt cbc;
 	errcode_t ret;
 
 	fsck_init(sbi);
@@ -859,6 +860,9 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 
 	/* Traverse all block recursively from root inode */
 	blk_cnt = 1;
+	cbc.cnt = 0;
+	cbc.cheader_pgofs = CHEADER_PGOFS_NONE;
+
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_QUOTA_INO)) {
 		ret = quota_init_context(sbi);
@@ -869,7 +873,7 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 	}
 	fsck_chk_orphan_node(sbi);
 	fsck_chk_node_blk(sbi, NULL, sbi->root_ino_num,
-			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, NULL);
+			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, &cbc, NULL);
 	fsck_chk_quota_files(sbi);
 
 	ret = fsck_verify(sbi);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 8969ae2..7a56326 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -936,6 +936,21 @@ struct f2fs_extent {
 #define F2FS_CASEFOLD_FL	0x40000000 /* Casefolded file */
 #define IS_CASEFOLDED(dir)     ((dir)->i_flags & F2FS_CASEFOLD_FL)
 
+/*
+ * fsck i_compr_blocks counting helper
+ */
+struct f2fs_compr_blk_cnt {
+	/* counting i_compr_blocks, init 0 */
+	u32 cnt;
+
+	/*
+	 * previous seen compression header (COMPR_ADDR) page offsets,
+	 * use CHEADER_PGOFS_NONE for none
+	 */
+	u32 cheader_pgofs;
+};
+#define CHEADER_PGOFS_NONE ((u32) -(1<<MAX_COMPRESS_LOG_SIZE))
+
 /*
  * inode flags
  */
-- 
2.32.0.93.g670b81a890-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
