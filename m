Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D27D05FD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Oct 2023 03:04:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qtdw1-0007lL-QU;
	Fri, 20 Oct 2023 01:04:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qtdw0-0007lC-JG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 01:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tZEu1tTHsXOAO6i+L1Ure9U7W9vkxyyQjJZzVAPsBKs=; b=PGI1PvNP11RJJXHT+Q9gJ+srgx
 B33XWkXhM0paeVb/h6PX3cTJhXEetE51U12GubMUmXtVpeFg8rryKbsnZlDFy66j+wqZWLMOAx9C9
 PsJWsI3/K5ffz6BQtlZ4JxkNl80EtVK9XFuFsk2Nyudc2fhnLb2OnYbn802bdPJz00Jk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tZEu1tTHsXOAO6i+L1Ure9U7W9vkxyyQjJZzVAPsBKs=; b=M
 Yf55u6dswDzY9aI/S18HY9YGWefk7I3+MrXwxpx6vAA2ljWaoG77pZIZYB4ryj6+ZL/eiTyDeK6XE
 lwfv7ZzPGmXmBTKXReOWjaEn1wpR8y5D1gF3qbAFAc4mqpY+efANZMqKqh5oGnJ1VRxQcJHZG0ksR
 UUvt6nMA1Pj1O73I=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qtdvw-00037m-69 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Oct 2023 01:04:15 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6b5af4662b7so300237b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Oct 2023 18:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697763846; x=1698368646; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tZEu1tTHsXOAO6i+L1Ure9U7W9vkxyyQjJZzVAPsBKs=;
 b=Ed9tCzuPrxV/lo5m9/8iqKLMqrY1kKHoiyHs7WyI3gwJxE4gekjfWrlOI1T5/T6W8Y
 Jl5ZaTO/WJNHxumEUiVMEDIvEFv5hJnW+xITfo96H5hZFyv9RLIs+UXLD+DwVUzM0OJJ
 +rJNOHOZYkNsp+85KxIKkXURFCTRkpwEPhbkYU4cGdag1BGpPCM5xHHjS0Zedh2xsFC/
 6KQZfao0Hgxl7AwcNXq3G5SE/Easp//iRZGXDaNtRi8rcBe8ik/NLryApLeF3nXcNwow
 N4OMU6Uhr6QWvUpz3LS0QwaYcBI0CNn1DXNyM3peL9tofWwIyvF9HhXbwujJJj0dbt0d
 jM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697763846; x=1698368646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tZEu1tTHsXOAO6i+L1Ure9U7W9vkxyyQjJZzVAPsBKs=;
 b=A3qo8TCv/yAmmnH2fL3Yc+LTiNxiAav8XXHx3P361SvTjn+Hxs2hJyrBvr2QPj8sKR
 HGAtBnh/KhhjXXeU3C7JHLr2e6Puv2bncLV85wbjG/+pLZJtK8rJw+xsGv2ENcBCapdj
 vJJJNqMELpR6QPOOJJo6Bo0lPvu+tWE4FpwoxhAFKhfPjfShUkZw+EbGLipVKivCTof5
 2U/7TmBjEXsszfdlk1+SRyZHmG3OmB+H6fTwE1veuNwyLKGIxoT1uH+pgYX9sSmDICGf
 raXLwTJxBeFH0XJQCV0suBmvfqHJTZZPvEcE/ymFPizB7a4gupDuQBZ6B+9ujzN1G/MB
 KV/w==
X-Gm-Message-State: AOJu0YxB9UswCVVBFRNRZOtCNTxq6PIxpxTM5tIwIDGND+KjF0K+4kVY
 /46i2+ZxJGEfskMa28QRs/A=
X-Google-Smtp-Source: AGHT+IHbC4c1yQxE9Ko2eHYtsHxrXpBjMzoMME8rjWLs4ekZ6ymfBYFv+oJ2WgxF4Qo4UJVue1qEUQ==
X-Received: by 2002:a05:6a21:4887:b0:179:f7cc:c7e6 with SMTP id
 av7-20020a056a21488700b00179f7ccc7e6mr384440pzc.38.1697763845258; 
 Thu, 19 Oct 2023 18:04:05 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:2586:3997:3e90:5b65])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a170902db1100b001c9c6a78a56sm329776plx.97.2023.10.19.18.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 18:04:04 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 19 Oct 2023 18:04:01 -0700
Message-ID: <20231020010401.2666246-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong When we detect quota inode corruption, we
 better deallocate the current space and allocate new ones for a clean start.
 Signed-off-by: Daeho Jeong --- fsck/fsck.c | 148
 +++++++++++++++++++++++++++++++++++
 fsck/segment.c | 5 +- 2 files changed, 109 insertions(+), 44 deletions(-)
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qtdvw-00037m-69
Subject: [f2fs-dev] [PATCH] f2fs-tools: do not reuse corrupted quota inodes
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

When we detect quota inode corruption, we better deallocate the current
space and allocate new ones for a clean start.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c    | 148 +++++++++++++++++++++++++++++++++++--------------
 fsck/segment.c |   5 +-
 2 files changed, 109 insertions(+), 44 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 99cface..dc8e282 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -67,6 +67,14 @@ int f2fs_set_sit_bitmap(struct f2fs_sb_info *sbi, u32 blk)
 	return f2fs_set_bit(BLKOFF_FROM_MAIN(sbi, blk), fsck->sit_area_bitmap);
 }
 
+static inline int f2fs_clear_sit_bitmap(struct f2fs_sb_info *sbi, u32 blk)
+{
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+
+	return f2fs_clear_bit(BLKOFF_FROM_MAIN(sbi, blk),
+						fsck->sit_area_bitmap);
+}
+
 static int add_into_hard_link_list(struct f2fs_sb_info *sbi,
 						u32 nid, u32 link_cnt)
 {
@@ -2150,6 +2158,9 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
 	return ret;
 }
 
+static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
+			bool dealloc);
+
 int fsck_chk_quota_files(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
@@ -2181,6 +2192,8 @@ int fsck_chk_quota_files(struct f2fs_sb_info *sbi)
 		if (c.fix_on) {
 			DBG(0, "Fixing Quota file ([%3d] ino [0x%x])\n",
 							qtype, ino);
+			fsck_disconnect_file(sbi, ino, true);
+			f2fs_rebuild_qf_inode(sbi, qtype);
 			f2fs_filesize_update(sbi, ino, 0);
 			ret = quota_write_inode(sbi, qtype);
 			if (!ret) {
@@ -2874,10 +2887,53 @@ static int fsck_do_reconnect_file(struct f2fs_sb_info *sbi,
 	return 0;
 }
 
-static void fsck_failed_reconnect_file_dnode(struct f2fs_sb_info *sbi,
-					struct f2fs_inode *inode, nid_t nid)
+static inline void release_inode_cnt(struct f2fs_sb_info *sbi, bool dealloc)
+{
+	F2FS_FSCK(sbi)->chk.valid_inode_cnt--;
+	if (dealloc)
+		sbi->total_valid_inode_count--;
+}
+
+static inline void release_node_cnt(struct f2fs_sb_info *sbi, bool dealloc)
+{
+	F2FS_FSCK(sbi)->chk.valid_node_cnt--;
+	if (dealloc)
+		sbi->total_valid_node_count--;
+}
+
+static inline void release_block_cnt(struct f2fs_sb_info *sbi, bool dealloc)
+{
+	F2FS_FSCK(sbi)->chk.valid_blk_cnt--;
+	if (dealloc)
+		sbi->total_valid_block_count--;
+}
+
+static inline void release_block(struct f2fs_sb_info *sbi, u64 blkaddr,
+			bool dealloc)
+{
+	f2fs_clear_main_bitmap(sbi, blkaddr);
+	if (dealloc) {
+		struct seg_entry *se;
+		u64 offset;
+
+		se = get_seg_entry(sbi, GET_SEGNO(sbi, blkaddr));
+		offset = OFFSET_IN_SEG(sbi, blkaddr);
+		se->valid_blocks--;
+		f2fs_clear_bit(offset, (char *)se->cur_valid_map);
+		se->dirty = 1;
+		f2fs_clear_sit_bitmap(sbi, blkaddr);
+	}
+}
+
+static inline void release_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
+{
+	nullify_nat_entry(sbi, nid);
+	F2FS_FSCK(sbi)->chk.valid_nat_entry_cnt--;
+}
+
+static void fsck_disconnect_file_dnode(struct f2fs_sb_info *sbi,
+			struct f2fs_inode *inode, nid_t nid, bool dealloc)
 {
-	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_node *node;
 	struct node_info ni;
 	u32 addr;
@@ -2890,27 +2946,29 @@ static void fsck_failed_reconnect_file_dnode(struct f2fs_sb_info *sbi,
 	err = dev_read_block(node, ni.blk_addr);
 	ASSERT(err >= 0);
 
-	fsck->chk.valid_node_cnt--;
-	fsck->chk.valid_blk_cnt--;
-	f2fs_clear_main_bitmap(sbi, ni.blk_addr);
+	release_node_cnt(sbi, dealloc);
+	release_block_cnt(sbi, dealloc);
+	release_block(sbi, ni.blk_addr, dealloc);
 
 	for (i = 0; i < ADDRS_PER_BLOCK(inode); i++) {
 		addr = le32_to_cpu(node->dn.addr[i]);
 		if (!addr)
 			continue;
-		fsck->chk.valid_blk_cnt--;
+		release_block_cnt(sbi, dealloc);
 		if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
 			continue;
-		f2fs_clear_main_bitmap(sbi, addr);
+		release_block(sbi, addr, dealloc);
 	}
 
+	if (dealloc)
+		release_nat_entry(sbi, nid);
+
 	free(node);
 }
 
-static void fsck_failed_reconnect_file_idnode(struct f2fs_sb_info *sbi,
-					struct f2fs_inode *inode, nid_t nid)
+static void fsck_disconnect_file_idnode(struct f2fs_sb_info *sbi,
+			struct f2fs_inode *inode, nid_t nid, bool dealloc)
 {
-	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_node *node;
 	struct node_info ni;
 	nid_t tmp;
@@ -2923,24 +2981,26 @@ static void fsck_failed_reconnect_file_idnode(struct f2fs_sb_info *sbi,
 	err = dev_read_block(node, ni.blk_addr);
 	ASSERT(err >= 0);
 
-	fsck->chk.valid_node_cnt--;
-	fsck->chk.valid_blk_cnt--;
-	f2fs_clear_main_bitmap(sbi, ni.blk_addr);
+	release_node_cnt(sbi, dealloc);
+	release_block_cnt(sbi, dealloc);
+	release_block(sbi, ni.blk_addr, dealloc);
 
 	for (i = 0; i < NIDS_PER_BLOCK; i++) {
 		tmp = le32_to_cpu(node->in.nid[i]);
 		if (!tmp)
 			continue;
-		fsck_failed_reconnect_file_dnode(sbi, inode, tmp);
+		fsck_disconnect_file_dnode(sbi, inode, tmp, dealloc);
 	}
 
+	if (dealloc)
+		release_nat_entry(sbi, nid);
+
 	free(node);
 }
 
-static void fsck_failed_reconnect_file_didnode(struct f2fs_sb_info *sbi,
-					struct f2fs_inode *inode, nid_t nid)
+static void fsck_disconnect_file_didnode(struct f2fs_sb_info *sbi,
+			struct f2fs_inode *inode, nid_t nid, bool dealloc)
 {
-	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_node *node;
 	struct node_info ni;
 	nid_t tmp;
@@ -2953,28 +3013,26 @@ static void fsck_failed_reconnect_file_didnode(struct f2fs_sb_info *sbi,
 	err = dev_read_block(node, ni.blk_addr);
 	ASSERT(err >= 0);
 
-	fsck->chk.valid_node_cnt--;
-	fsck->chk.valid_blk_cnt--;
-	f2fs_clear_main_bitmap(sbi, ni.blk_addr);
+	release_node_cnt(sbi, dealloc);
+	release_block_cnt(sbi, dealloc);
+	release_block(sbi, ni.blk_addr, dealloc);
 
 	for (i = 0; i < NIDS_PER_BLOCK; i++) {
 		tmp = le32_to_cpu(node->in.nid[i]);
 		if (!tmp)
 			continue;
-		fsck_failed_reconnect_file_idnode(sbi, inode, tmp);
+		fsck_disconnect_file_idnode(sbi, inode, tmp, dealloc);
 	}
 
+	if (dealloc)
+		release_nat_entry(sbi, nid);
+
 	free(node);
 }
 
-/*
- * Counters and main_area_bitmap are already changed during checking
- * inode block, so clear them. There is no need to clear new blocks
- * allocted to lost+found.
- */
-static void fsck_failed_reconnect_file(struct f2fs_sb_info *sbi, nid_t ino)
+static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
+			bool dealloc)
 {
-	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_node *node;
 	struct node_info ni;
 	nid_t nid;
@@ -2988,18 +3046,18 @@ static void fsck_failed_reconnect_file(struct f2fs_sb_info *sbi, nid_t ino)
 	ASSERT(err >= 0);
 
 	/* clear inode counters */
-	fsck->chk.valid_inode_cnt--;
-	fsck->chk.valid_node_cnt--;
-	fsck->chk.valid_blk_cnt--;
-	f2fs_clear_main_bitmap(sbi, ni.blk_addr);
+	release_inode_cnt(sbi, dealloc);
+	release_node_cnt(sbi, dealloc);
+	release_block_cnt(sbi, dealloc);
+	release_block(sbi, ni.blk_addr, dealloc);
 
 	/* clear xnid counters */
 	if (node->i.i_xattr_nid) {
 		nid = le32_to_cpu(node->i.i_xattr_nid);
-		fsck->chk.valid_node_cnt--;
-		fsck->chk.valid_blk_cnt--;
+		release_node_cnt(sbi, dealloc);
+		release_block_cnt(sbi, dealloc);
 		get_node_info(sbi, nid, &ni);
-		f2fs_clear_main_bitmap(sbi, ni.blk_addr);
+		release_block(sbi, ni.blk_addr, dealloc);
 	}
 
 	/* clear data counters */
@@ -3009,10 +3067,10 @@ static void fsck_failed_reconnect_file(struct f2fs_sb_info *sbi, nid_t ino)
 			block_t addr = le32_to_cpu(node->i.i_addr[ofs + i]);
 			if (!addr)
 				continue;
-			fsck->chk.valid_blk_cnt--;
+			release_block_cnt(sbi, dealloc);
 			if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
 				continue;
-			f2fs_clear_main_bitmap(sbi, addr);
+			release_block(sbi, addr, dealloc);
 		}
 	}
 
@@ -3024,18 +3082,24 @@ static void fsck_failed_reconnect_file(struct f2fs_sb_info *sbi, nid_t ino)
 		switch (i) {
 		case 0: /* direct node */
 		case 1:
-			fsck_failed_reconnect_file_dnode(sbi, &node->i, nid);
+			fsck_disconnect_file_dnode(sbi, &node->i, nid,
+					dealloc);
 			break;
 		case 2: /* indirect node */
 		case 3:
-			fsck_failed_reconnect_file_idnode(sbi, &node->i, nid);
+			fsck_disconnect_file_idnode(sbi, &node->i, nid,
+					dealloc);
 			break;
 		case 4: /* double indirect node */
-			fsck_failed_reconnect_file_didnode(sbi, &node->i, nid);
+			fsck_disconnect_file_didnode(sbi, &node->i, nid,
+					dealloc);
 			break;
 		}
 	}
 
+	if (dealloc)
+		release_nat_entry(sbi, ino);
+
 	free(node);
 }
 
@@ -3121,7 +3185,7 @@ static int fsck_reconnect_file(struct f2fs_sb_info *sbi)
 			if (fsck_do_reconnect_file(sbi, lpf_node, node)) {
 				DBG(1, "Failed to reconnect inode [0x%x]\n",
 				    nid);
-				fsck_failed_reconnect_file(sbi, nid);
+				fsck_disconnect_file(sbi, nid, false);
 				continue;
 			}
 
diff --git a/fsck/segment.c b/fsck/segment.c
index 3a9500f..4b05fd4 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -36,7 +36,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 				ERR_MSG("Not enough space\n");
 				return -ENOSPC;
 			}
-			if (is_node && fsck->chk.valid_node_cnt >=
+			if (is_node && fsck->chk.valid_node_cnt >
 					sbi->total_valid_node_count) {
 				ERR_MSG("Not enough space for node block\n");
 				return -ENOSPC;
@@ -76,7 +76,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 
 	se = get_seg_entry(sbi, GET_SEGNO(sbi, blkaddr));
 	offset = OFFSET_IN_SEG(sbi, blkaddr);
-	se->type = type;
+	se->type = se->orig_type = type;
 	if (se->valid_blocks == 0)
 		SM_I(sbi)->free_segments--;
 	se->valid_blocks++;
@@ -101,6 +101,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 		if (c.func == FSCK) {
 			fsck->chk.valid_blk_cnt++;
 			if (is_node) {
+				fsck->chk.valid_nat_entry_cnt++;
 				fsck->chk.valid_node_cnt++;
 				if (is_inode)
 					fsck->chk.valid_inode_cnt++;
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
