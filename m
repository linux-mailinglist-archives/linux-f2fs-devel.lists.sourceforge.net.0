Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0FB7FFAA9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 20:01:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8mI0-0007q8-Cg;
	Thu, 30 Nov 2023 19:01:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1r8mHz-0007q2-I3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 19:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZH66FSbqTtLyEkw8kmAeDgzq/FPNsIgX5VDI1dVCNc0=; b=eFQnwELYz8VFnQ9DZWatJDWQ1U
 oPPPgzSQ0rSoiH4uyzaAyWNBTSzIdiX+CLAS9OGJxaP8zf0Eug5QFX1fsOjf5IbeNoIQkBDBCziiJ
 HsMdDg0hggEAeoMa9ahJynNUTBAHd7rpGpmt6y2LYV9UECQZJKYDAQq2TEg27Oez67FA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZH66FSbqTtLyEkw8kmAeDgzq/FPNsIgX5VDI1dVCNc0=; b=L
 ff3vQOGV6AWNZk5yNYEGQWhGcKYyCXsUcPwqP+XPVYjOlnGopx4CbzXgp1Et4DhAYm2T5q3+w5Epc
 o8d28sjGLpSxD/lmkNGXuXZm788kqq+D8EcaldkihH4tf4OqFWXD7lT3wEFZGvzK2+Oyeb0MlYQS0
 21xMjzwqlX4ZjHZw=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r8mHx-0008D2-Nu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 19:01:31 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6cd97c135e8so1192497b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 11:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701370884; x=1701975684; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZH66FSbqTtLyEkw8kmAeDgzq/FPNsIgX5VDI1dVCNc0=;
 b=kVb+nvu2evUuZQSm46PkQed12ERShksxBoMW3oSCkUJ53JzWf9aKB0drvbUHh2k1gu
 n2zjhTMz+eYgUiA26EEvpigaix8Rh1YJvY+tx1hM8PtgDlPPjODknYLXQGtmljEVl9f0
 vXPHrNZzsGQwpGo01mzaUCjIEEJovHNGYDkk/wj24VQLEyWMFVWuuVeE7kdtKWLtJmch
 eiGN1PxdjWoHIc/NoJSclL/nvb/VVGFOAaPw6/ST2hEBMNjHba39ncEXEK4kGV25Qemn
 FwuDuHD+fv37b6s6XkqXHIrlwEyLwN+h2ZyKNR3aXiD1laewAioVUZrOMgDSSUVU5qjH
 /ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701370884; x=1701975684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZH66FSbqTtLyEkw8kmAeDgzq/FPNsIgX5VDI1dVCNc0=;
 b=pVaSdiV2Sy9pgpRGk4bQBuMACFYdoEQiHSBfXZtpqeF0u6jVN9ob6hoNWGmEmSNyip
 hIv36qFignRHwO/HN7buh5cK0bYbw5eTcWxe9Wv8zfPNbydklJXvnQ72Dw7uwVEsYp70
 D2YPykKjR4HFvE6osLL7gQgK0EqjU5f4FGEav2k/81dX+eKLJeC482apyK+TFtyZxvej
 YjEmnqD8fOlhqEKIMB+R9ETbq4mpE+HkdrBmttYVE9lwAb5nHa3h1USNkTPG5dQN84rj
 QLPZNVbZMtZOax8EuMFqytSX8VkhsNz2h1w0mYYUQxLALpMy05pjFxncLJLuGGny8qeR
 OYhA==
X-Gm-Message-State: AOJu0YwaWgj+CRlnpKObArkJg4CIZDCn15MJiJbhpKkBESrqup/LcK52
 xZFAG9Qlm5BuXuOBdHAe9RnJ6oeqPmU=
X-Google-Smtp-Source: AGHT+IGAURcN/3Q/MuxFTgfLKfseyft5tJyEJn2MluJ/8xZV0WXkNsq1Tkx3I6peBtbsD3YX1Vt50g==
X-Received: by 2002:a05:6a20:3943:b0:18c:f42d:43f1 with SMTP id
 r3-20020a056a20394300b0018cf42d43f1mr9400784pzg.20.1701370883441; 
 Thu, 30 Nov 2023 11:01:23 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:3de6:7d51:1685:446f])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a056a001ad100b006cbe1bb5e3asm1546300pfv.138.2023.11.30.11.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 11:01:23 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 30 Nov 2023 11:01:19 -0800
Message-ID: <20231130190119.1281671-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Support zoned ufs devices. 1. implemented
 out-place updates 2. keep roll forward recovery intact 3. open block device
 files with O_SYNC to comply with zoned device's write rules Signed-off-by:
 Daeho Jeong --- fsck/defrag.c | 2 +- fsck/dir.c | 47 +++++++++++----
 fsck/f2fs.h
 | 3 +- fsck/fsck.c | 96 +++++++++++++++++++ fsck/fsck.h | 31 +++++++---
 fsck/main.c | 3 + [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.173 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r8mHx-0008D2-Nu
Subject: [f2fs-dev] [PATCH] f2fs-tools: support zoned ufs devices
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

Support zoned ufs devices.
1. implemented out-place updates
2. keep roll forward recovery intact
3. open block device files with O_SYNC to comply with zoned device's
   write rules

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/defrag.c  |   2 +-
 fsck/dir.c     |  47 +++++++++++----
 fsck/f2fs.h    |   3 +-
 fsck/fsck.c    |  96 +++++++++++++++++++------------
 fsck/fsck.h    |  31 +++++++---
 fsck/main.c    |   3 +
 fsck/mount.c   | 151 ++++++++++++++++++++++++++++++++++++++++---------
 fsck/node.c    |  30 ++++++++--
 fsck/node.h    |   1 +
 fsck/resize.c  |   2 +-
 fsck/segment.c | 120 ++++++++++++++++++++++++++++++++++-----
 fsck/xattr.c   |   7 ++-
 lib/libf2fs.c  |  32 +++++++----
 13 files changed, 405 insertions(+), 120 deletions(-)

diff --git a/fsck/defrag.c b/fsck/defrag.c
index 90c2962..361fe73 100644
--- a/fsck/defrag.c
+++ b/fsck/defrag.c
@@ -49,7 +49,7 @@ static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
 	/* if data block, read node and update node block */
 	if (IS_DATASEG(type))
 		update_data_blkaddr(sbi, le32_to_cpu(sum.nid),
-				le16_to_cpu(sum.ofs_in_node), to);
+				le16_to_cpu(sum.ofs_in_node), to, NULL);
 	else
 		update_nat_blkaddr(sbi, 0, le32_to_cpu(sum.nid), to);
 
diff --git a/fsck/dir.c b/fsck/dir.c
index d51176a..3fac850 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -220,7 +220,7 @@ static void f2fs_update_dentry(nid_t ino, int file_type,
  */
 int f2fs_add_link(struct f2fs_sb_info *sbi, struct f2fs_node *parent,
 			const unsigned char *name, int name_len, nid_t ino,
-			int file_type, block_t p_blkaddr, int inc_link)
+			int file_type, block_t *p_blkaddr, int inc_link)
 {
 	int level = 0, current_depth, bit_pos;
 	int nbucket, nblock, bidx, block;
@@ -232,6 +232,7 @@ int f2fs_add_link(struct f2fs_sb_info *sbi, struct f2fs_node *parent,
 	nid_t pino;
 	unsigned int dir_level;
 	int ret;
+	bool datablk_alloced = false;
 
 	if (parent == NULL)
 		return -EINVAL;
@@ -278,6 +279,7 @@ start:
 
 		if (dn.data_blkaddr == NULL_ADDR) {
 			new_data_block(sbi, dentry_blk, &dn, CURSEG_HOT_DATA);
+			datablk_alloced = true;
 		} else {
 			ret = dev_read_block(dentry_blk, dn.data_blkaddr);
 			ASSERT(ret >= 0);
@@ -295,7 +297,20 @@ add_dentry:
 	make_dentry_ptr(&d, NULL, (void *)dentry_blk, 1);
 	f2fs_update_dentry(ino, file_type, &d, name, name_len, dentry_hash, bit_pos);
 
-	ret = dev_write_block(dentry_blk, dn.data_blkaddr);
+	if (c.zoned_model == F2FS_ZONED_HM) {
+		if (datablk_alloced) {
+			ret = dev_write_block(dentry_blk, dn.data_blkaddr);
+		} else {
+			ret = update_block(sbi, dentry_blk, &dn.data_blkaddr,
+					dn.node_blk);
+			if (dn.inode_blk == dn.node_blk)
+				dn.idirty = 1;
+			else
+				dn.ndirty = 1;
+		}
+	} else {
+		ret = dev_write_block(dentry_blk, dn.data_blkaddr);
+	}
 	ASSERT(ret >= 0);
 
 	/*
@@ -321,13 +336,15 @@ add_dentry:
 	}
 
 	if (dn.ndirty) {
-		ret = dev_write_block(dn.node_blk, dn.node_blkaddr);
+		ret = dn.alloced ?
+			dev_write_block(dn.node_blk, dn.node_blkaddr) :
+			update_block(sbi, dn.node_blk, &dn.node_blkaddr, NULL);
 		ASSERT(ret >= 0);
 	}
 
 	if (dn.idirty) {
 		ASSERT(parent == dn.inode_blk);
-		ret = write_inode(dn.inode_blk, p_blkaddr);
+		ret = update_inode(sbi, dn.inode_blk, p_blkaddr);
 		ASSERT(ret >= 0);
 	}
 
@@ -552,7 +569,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 }
 
 int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
-							block_t p_blkaddr)
+							block_t *p_blkaddr)
 {
 	struct f2fs_inode *inode = &(node->i);
 	unsigned int dir_level = node->i.i_dir_level;
@@ -562,6 +579,7 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 	struct f2fs_dentry_ptr d;
 	unsigned long bit_pos = 0;
 	int ret = 0;
+	bool datablk_alloced = false;
 
 	if (!(inode->i_inline & F2FS_INLINE_DENTRY))
 		return 0;
@@ -570,7 +588,7 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 	memset(inline_data_addr(node), 0, MAX_INLINE_DATA(node));
 	inode->i_inline &= ~F2FS_INLINE_DENTRY;
 
-	ret = dev_write_block(node, p_blkaddr);
+	ret = update_block(sbi, node, p_blkaddr, NULL);
 	ASSERT(ret >= 0);
 
 	memset(&dn, 0, sizeof(dn));
@@ -583,8 +601,10 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 
 		set_new_dnode(&dn, node, NULL, ino);
 		get_dnode_of_data(sbi, &dn, 0, ALLOC_NODE);
-		if (dn.data_blkaddr == NULL_ADDR)
+		if (dn.data_blkaddr == NULL_ADDR) {
 			new_data_block(sbi, dentry_blk, &dn, CURSEG_HOT_DATA);
+			datablk_alloced = true;
+		}
 
 		make_dentry_ptr(&src, node, (void *)inline_data, 2);
 		make_dentry_ptr(&dst, NULL, (void *)dentry_blk, 1);
@@ -597,7 +617,9 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 		memcpy(dst.dentry, src.dentry, SIZE_OF_DIR_ENTRY * src.max);
 		memcpy(dst.filename, src.filename, src.max * F2FS_SLOT_LEN);
 
-		ret = dev_write_block(dentry_blk, dn.data_blkaddr);
+		ret = datablk_alloced ?
+			dev_write_block(dentry_blk, dn.data_blkaddr) :
+			update_block(sbi, dentry_blk, &dn.data_blkaddr, NULL);
 		ASSERT(ret >= 0);
 
 		MSG(1, "%s: copy inline entry to block\n", __func__);
@@ -687,6 +709,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	struct f2fs_summary sum;
 	block_t blkaddr = NULL_ADDR;
 	int ret;
+	bool nodeblk_alloced = false;
 
 	/* Find if there is a */
 	get_node_info(sbi, de->pino, &ni);
@@ -705,7 +728,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	ASSERT(ret >= 0);
 
 	/* Must convert inline dentry before the following opertions */
-	ret = convert_inline_dentry(sbi, parent, ni.blk_addr);
+	ret = convert_inline_dentry(sbi, parent, &ni.blk_addr);
 	if (ret) {
 		MSG(0, "Convert inline dentry for pino=%x failed.\n", de->pino);
 		ret = -1;
@@ -753,7 +776,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 				le32_to_cpu(child->i.i_namelen),
 				le32_to_cpu(F2FS_NODE_FOOTER(child)->ino),
 				map_de_type(le16_to_cpu(child->i.i_mode)),
-				ni.blk_addr, 1);
+				&ni.blk_addr, 1);
 	if (ret) {
 		MSG(0, "Skip the existing \"%s\" pino=%x ERR=%d\n",
 					de->name, de->pino, ret);
@@ -788,13 +811,15 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	/* write child */
 	set_summary(&sum, de->ino, 0, ni.version);
 	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE, 1);
+	nodeblk_alloced = true;
 	ASSERT(!ret);
 
 	/* update nat info */
 	update_nat_blkaddr(sbi, de->ino, de->ino, blkaddr);
 
 write_child_dir:
-	ret = dev_write_block(child, blkaddr);
+	ret = nodeblk_alloced ? dev_write_block(child, blkaddr) :
+		update_block(sbi, child, &blkaddr, NULL);
 	ASSERT(ret >= 0);
 
 	update_free_segments(sbi);
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index b073a94..e31be22 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -189,6 +189,7 @@ struct curseg_info {
 struct f2fs_sm_info {
 	struct sit_info *sit_info;
 	struct curseg_info *curseg_array;
+	struct curseg_info saved_curseg_warm_node;
 
 	block_t seg0_blkaddr;
 	block_t main_blkaddr;
@@ -238,7 +239,7 @@ struct dnode_of_data {
 	unsigned int ofs_in_node;
 	block_t data_blkaddr;
 	block_t node_blkaddr;
-	int idirty, ndirty;
+	int idirty, ndirty, alloced;
 };
 
 struct hardlink_cache_entry {
diff --git a/fsck/fsck.c b/fsck/fsck.c
index f40b4cd..8acb822 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -45,7 +45,7 @@ static inline int f2fs_test_main_bitmap(struct f2fs_sb_info *sbi, u32 blk)
 						fsck->main_area_bitmap);
 }
 
-static inline int f2fs_clear_main_bitmap(struct f2fs_sb_info *sbi, u32 blk)
+int f2fs_clear_main_bitmap(struct f2fs_sb_info *sbi, u32 blk)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 
@@ -67,7 +67,7 @@ int f2fs_set_sit_bitmap(struct f2fs_sb_info *sbi, u32 blk)
 	return f2fs_set_bit(BLKOFF_FROM_MAIN(sbi, blk), fsck->sit_area_bitmap);
 }
 
-static inline int f2fs_clear_sit_bitmap(struct f2fs_sb_info *sbi, u32 blk)
+int f2fs_clear_sit_bitmap(struct f2fs_sb_info *sbi, u32 blk)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 
@@ -1182,7 +1182,9 @@ check_next:
 				blkaddr,
 				&child, (i_blocks == *blk_cnt),
 				ftype, nid, idx, ni->version,
-				file_is_encrypt(&node_blk->i));
+				file_is_encrypt(&node_blk->i), node_blk);
+		if (blkaddr != le32_to_cpu(node_blk->i.i_addr[ofs + idx]))
+			need_fix = 1;
 		if (!ret) {
 			*blk_cnt = *blk_cnt + 1;
 			if (cur_qtype != -1 && blkaddr != NEW_ADDR)
@@ -1398,7 +1400,9 @@ skip_blkcnt_fix:
 	}
 
 	if (need_fix && f2fs_dev_is_writable()) {
-		ret = dev_write_block(node_blk, ni->blk_addr);
+		if (c.zoned_model == F2FS_ZONED_HM)
+			node_blk->i.i_ext.len = 0;
+		ret = update_block(sbi, node_blk, &ni->blk_addr, NULL);
 		ASSERT(ret >= 0);
 	}
 }
@@ -1450,7 +1454,9 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 			blkaddr, child,
 			le64_to_cpu(inode->i_blocks) == *blk_cnt, ftype,
 			nid, idx, ni->version,
-			file_is_encrypt(inode));
+			file_is_encrypt(inode), node_blk);
+		if (blkaddr != le32_to_cpu(node_blk->dn.addr[idx]))
+			need_fix = 1;
 		if (!ret) {
 			*blk_cnt = *blk_cnt + 1;
 			if (cur_qtype != -1 && blkaddr != NEW_ADDR)
@@ -1462,7 +1468,7 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 		}
 	}
 	if (need_fix && f2fs_dev_is_writable()) {
-		ret = dev_write_block(node_blk, ni->blk_addr);
+		ret = update_block(sbi, node_blk, &ni->blk_addr, NULL);
 		ASSERT(ret >= 0);
 	}
 	return 0;
@@ -1504,7 +1510,7 @@ skip:
 		nid_t nid = le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid);
 
 		get_node_info(sbi, nid, &ni);
-		ret = dev_write_block(node_blk, ni.blk_addr);
+		ret = update_block(sbi, node_blk, &ni.blk_addr, NULL);
 		ASSERT(ret >= 0);
 	}
 
@@ -1546,7 +1552,7 @@ skip:
 		nid_t nid = le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid);
 
 		get_node_info(sbi, nid, &ni);
-		ret = dev_write_block(node_blk, ni.blk_addr);
+		ret = update_block(sbi, node_blk, &ni.blk_addr, NULL);
 		ASSERT(ret >= 0);
 	}
 
@@ -2004,7 +2010,8 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *sbi,
 }
 
 int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
-		struct child_info *child, int last_blk, int enc_name)
+		struct child_info *child, int last_blk, int enc_name,
+		struct f2fs_node *node_blk)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_dentry_block *de_blk;
@@ -2032,7 +2039,7 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 			NR_DENTRY_IN_BLOCK, last_blk, enc_name);
 
 	if (dentries < 0 && f2fs_dev_is_writable()) {
-		ret = dev_write_block(de_blk, blk_addr);
+		ret = update_block(sbi, de_blk, &blk_addr, node_blk);
 		ASSERT(ret >= 0);
 		DBG(1, "[%3d] Dentry Block [0x%x] Fixed hash_codes\n\n",
 			fsck->dentry_depth, blk_addr);
@@ -2054,7 +2061,7 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 int fsck_chk_data_blk(struct f2fs_sb_info *sbi, int casefolded,
 		u32 blk_addr, struct child_info *child, int last_blk,
 		enum FILE_TYPE ftype, u32 parent_nid, u16 idx_in_node, u8 ver,
-		int enc_name)
+		int enc_name, struct f2fs_node *node_blk)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 
@@ -2088,7 +2095,7 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, int casefolded,
 	if (ftype == F2FS_FT_DIR) {
 		f2fs_set_main_bitmap(sbi, blk_addr, CURSEG_HOT_DATA);
 		return fsck_chk_dentry_blk(sbi, casefolded, blk_addr, child,
-						last_blk, enc_name);
+				last_blk, enc_name, node_blk);
 	} else {
 		f2fs_set_main_bitmap(sbi, blk_addr, CURSEG_WARM_DATA);
 	}
@@ -2456,7 +2463,7 @@ static void fix_hard_links(struct f2fs_sb_info *sbi)
 		FIX_MSG("File: 0x%x i_links= 0x%x -> 0x%x",
 				node->nid, node->links, node->actual_links);
 
-		ret = dev_write_block(node_blk, ni.blk_addr);
+		ret = update_block(sbi, node_blk, &ni.blk_addr, NULL);
 		ASSERT(ret >= 0);
 		tmp = node;
 		node = node->next;
@@ -2640,13 +2647,8 @@ static int last_vblk_off_in_zone(struct f2fs_sb_info *sbi,
 	for (s = segs_per_zone - 1; s >= 0; s--) {
 		se = get_seg_entry(sbi, zone_segno + s);
 
-		/*
-		 * Refer not cur_valid_map but ckpt_valid_map which reflects
-		 * fsync data.
-		 */
-		ASSERT(se->ckpt_valid_map);
 		for (b = sbi->blocks_per_seg - 1; b >= 0; b--)
-			if (f2fs_test_bit(b, (const char*)se->ckpt_valid_map))
+			if (f2fs_test_bit(b, (const char *)se->cur_valid_map))
 				return b + (s << sbi->log_blocks_per_seg);
 	}
 
@@ -2663,6 +2665,9 @@ static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	int i, ret;
 	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 
+	if (!is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+		return -EINVAL;
+
 	/* get the device the curseg points to */
 	cs_block = START_BLOCK(sbi, curseg->segno) + curseg->next_blkoff;
 	for (i = 0; i < MAX_DEVICES; i++) {
@@ -2695,12 +2700,7 @@ static int check_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	wp_sector = blk_zone_wp_sector(&blkz);
 
 	if (cs_sector == wp_sector) {
-		if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
-			return 0;
-		MSG(0, "Correct write pointer. But, we can't trust it, "
-		    "since the previous mount wasn't safely unmounted: "
-		    "curseg %d[0x%x,0x%x]\n",
-		    type, curseg->segno, curseg->next_blkoff);
+		return 0;
 	} else if (cs_sector > wp_sector) {
 		MSG(0, "Inconsistent write pointer with curseg %d: "
 		    "curseg %d[0x%x,0x%x] > wp[0x%x,0x%x]\n",
@@ -2851,7 +2851,7 @@ static struct f2fs_node *fsck_get_lpf(struct f2fs_sb_info *sbi)
 		}
 
 		/* Must convert inline dentry before adding inodes */
-		err = convert_inline_dentry(sbi, node, ni.blk_addr);
+		err = convert_inline_dentry(sbi, node, &ni.blk_addr);
 		if (err) {
 			MSG(0, "Convert inline dentry for ino=%x failed.\n",
 					lpf_ino);
@@ -2913,7 +2913,7 @@ static int fsck_do_reconnect_file(struct f2fs_sb_info *sbi,
 	get_node_info(sbi, le32_to_cpu(F2FS_NODE_FOOTER(lpf)->ino), &ni);
 	ftype = map_de_type(le16_to_cpu(fnode->i.i_mode));
 	ret = f2fs_add_link(sbi, lpf, (unsigned char *)name, namelen,
-			    ino, ftype, ni.blk_addr, 0);
+			    ino, ftype, &ni.blk_addr, 0);
 	if (ret) {
 		ASSERT_MSG("Failed to add inode [0x%x] to lost+found", ino);
 		return -EINVAL;
@@ -2924,7 +2924,7 @@ static int fsck_do_reconnect_file(struct f2fs_sb_info *sbi,
 	fnode->i.i_namelen = cpu_to_le32(namelen);
 	fnode->i.i_pino = c.lpf_ino;
 	get_node_info(sbi, le32_to_cpu(F2FS_NODE_FOOTER(fnode)->ino), &ni);
-	ret = dev_write_block(fnode, ni.blk_addr);
+	ret = update_block(sbi, fnode, &ni.blk_addr, NULL);
 	ASSERT(ret >= 0);
 
 	DBG(1, "Reconnect inode [0x%x] to lost+found\n", ino);
@@ -2964,6 +2964,8 @@ static inline void release_block(struct f2fs_sb_info *sbi, u64 blkaddr,
 		offset = OFFSET_IN_SEG(sbi, blkaddr);
 		se->valid_blocks--;
 		f2fs_clear_bit(offset, (char *)se->cur_valid_map);
+		if (need_fsync_data_record(sbi))
+			f2fs_clear_bit(offset, (char *)se->ckpt_valid_map);
 		se->dirty = 1;
 		f2fs_clear_sit_bitmap(sbi, blkaddr);
 	}
@@ -3381,12 +3383,16 @@ void fsck_chk_and_fix_write_pointers(struct f2fs_sb_info *sbi)
 	if (c.zoned_model != F2FS_ZONED_HM)
 		return;
 
-	if (check_curseg_offsets(sbi, true) && c.fix_on) {
-		fix_curseg_info(sbi, true);
+	if (c.fix_on) {
+		flush_nat_journal_entries(sbi);
+		flush_sit_journal_entries(sbi);
+
+		if (check_curseg_offsets(sbi, true))
+			fix_curseg_info(sbi, true);
+
+		fix_wp_sit_alignment(sbi);
 		fsck->chk.wp_fixed = 1;
 	}
-
-	fix_wp_sit_alignment(sbi);
 }
 
 int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
@@ -3623,13 +3629,31 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 
 		if (force || c.bug_on || c.bug_nat_bits || c.quota_fixed) {
-			/* flush nats to write_nit_bits below */
-			flush_journal_entries(sbi);
+			if (c.zoned_model != F2FS_ZONED_HM) {
+				/* flush nats to write_nit_bits below */
+				flush_journal_entries(sbi);
+			}
 			fix_hard_links(sbi);
 			fix_nat_entries(sbi);
 			rewrite_sit_area_bitmap(sbi);
-			fix_wp_sit_alignment(sbi);
-			fix_curseg_info(sbi, false);
+			if (c.zoned_model == F2FS_ZONED_HM) {
+				struct curseg_info *curseg;
+				u64 ssa_blk;
+
+				for (i = 0; i < NO_CHECK_TYPE; i++) {
+					curseg = CURSEG_I(sbi, i);
+					ssa_blk = GET_SUM_BLKADDR(sbi,
+							curseg->segno);
+					ret = dev_write_block(curseg->sum_blk,
+							ssa_blk);
+					ASSERT(ret >= 0);
+				}
+				if (c.roll_forward)
+					restore_curseg_warm_node_info(sbi);
+				write_curseg_info(sbi);
+			} else {
+				fix_curseg_info(sbi, false);
+			}
 			fix_checksum(sbi);
 			fix_checkpoints(sbi);
 		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
diff --git a/fsck/fsck.h b/fsck/fsck.h
index d6abf18..f5282e2 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -153,8 +153,7 @@ struct selabel_handle;
 
 static inline bool need_fsync_data_record(struct f2fs_sb_info *sbi)
 {
-	return !is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG) ||
-		c.zoned_model == F2FS_ZONED_HM;
+	return !is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG);
 }
 
 extern int fsck_chk_orphan_node(struct f2fs_sb_info *);
@@ -181,9 +180,10 @@ extern int fsck_chk_didnode_blk(struct f2fs_sb_info *, struct f2fs_inode *,
 		enum FILE_TYPE, struct f2fs_node *, u32 *,
 		struct f2fs_compr_blk_cnt *, struct child_info *);
 extern int fsck_chk_data_blk(struct f2fs_sb_info *, int,
-		u32, struct child_info *, int, enum FILE_TYPE, u32, u16, u8, int);
+		u32, struct child_info *, int, enum FILE_TYPE, u32, u16, u8,
+		int, struct f2fs_node *);
 extern int fsck_chk_dentry_blk(struct f2fs_sb_info *, int,
-		u32, struct child_info *, int, int);
+		u32, struct child_info *, int, int, struct f2fs_node *);
 int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
 		struct child_info *);
 void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
@@ -209,7 +209,9 @@ extern void rewrite_sit_area_bitmap(struct f2fs_sb_info *);
 extern void build_nat_area_bitmap(struct f2fs_sb_info *);
 extern void build_sit_area_bitmap(struct f2fs_sb_info *);
 extern int f2fs_set_main_bitmap(struct f2fs_sb_info *, u32, int);
+extern int f2fs_clear_main_bitmap(struct f2fs_sb_info *, u32);
 extern int f2fs_set_sit_bitmap(struct f2fs_sb_info *, u32);
+extern int f2fs_clear_sit_bitmap(struct f2fs_sb_info *, u32);
 extern void fsck_init(struct f2fs_sb_info *);
 extern int fsck_verify(struct f2fs_sb_info *);
 extern void fsck_free(struct f2fs_sb_info *);
@@ -225,13 +227,18 @@ extern void update_curseg_info(struct f2fs_sb_info *, int);
 extern void zero_journal_entries(struct f2fs_sb_info *);
 extern void flush_sit_entries(struct f2fs_sb_info *);
 extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
+extern void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
+				 int i);
 extern void write_curseg_info(struct f2fs_sb_info *);
+extern void save_curseg_warm_node_info(struct f2fs_sb_info *);
+extern void restore_curseg_warm_node_info(struct f2fs_sb_info *);
 extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
 extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
 extern void update_superblock(struct f2fs_super_block *, int);
-extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
+extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
+			struct f2fs_node *);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
 
 extern void print_raw_sb_info(struct f2fs_super_block *);
@@ -294,6 +301,8 @@ void set_data_blkaddr(struct dnode_of_data *);
 block_t new_node_block(struct f2fs_sb_info *,
 					struct dnode_of_data *, unsigned int);
 int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype);
+int update_block(struct f2fs_sb_info *sbi, void *buf, u32 *blkaddr,
+					struct f2fs_node *node_blk);
 
 /* segment.c */
 struct quota_file;
@@ -321,7 +330,7 @@ int inode_set_selinux(struct f2fs_sb_info *, u32, const char *);
 int f2fs_find_path(struct f2fs_sb_info *, char *, nid_t *);
 nid_t f2fs_lookup(struct f2fs_sb_info *, struct f2fs_node *, u8 *, int);
 int f2fs_add_link(struct f2fs_sb_info *, struct f2fs_node *,
-		const unsigned char *, int, nid_t, int, block_t, int);
+		const unsigned char *, int, nid_t, int, block_t *, int);
 struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
 						struct dentry *de);
 
@@ -332,6 +341,14 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
 
 /* dir.c */
 int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
-		block_t p_blkaddr);
+		block_t *p_blkaddr);
+
+/* node.c */
+int update_inode(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
+		u32 *blkaddr);
+
+/* mount.c */
+int flush_nat_journal_entries(struct f2fs_sb_info *sbi);
+int flush_sit_journal_entries(struct f2fs_sb_info *sbi);
 
 #endif /* _FSCK_H_ */
diff --git a/fsck/main.c b/fsck/main.c
index 6d48d40..1affa72 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -834,6 +834,9 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 
 	print_cp_state(flag);
 
+	if (c.roll_forward && c.zoned_model == F2FS_ZONED_HM)
+		save_curseg_warm_node_info(sbi);
+
 	fsck_chk_and_fix_write_pointers(sbi);
 
 	fsck_chk_curseg_info(sbi);
diff --git a/fsck/mount.c b/fsck/mount.c
index 72516f4..1e9762e 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1986,7 +1986,7 @@ void reset_curseg(struct f2fs_sb_info *sbi, int type)
 	if (IS_NODESEG(type))
 		SET_SUM_TYPE(curseg->sum_blk, SUM_TYPE_NODE);
 	se = get_seg_entry(sbi, curseg->segno);
-	se->type = type;
+	se->type = se->orig_type = type;
 	se->dirty = 1;
 }
 
@@ -2327,7 +2327,6 @@ unsigned char get_seg_type(struct f2fs_sb_info *sbi, struct seg_entry *se)
 struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 				unsigned int segno, int *ret_type)
 {
-	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 	struct f2fs_summary_block *sum_blk;
 	struct curseg_info *curseg;
 	int type, ret;
@@ -2337,8 +2336,8 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 
 	ssa_blk = GET_SUM_BLKADDR(sbi, segno);
 	for (type = 0; type < NR_CURSEG_NODE_TYPE; type++) {
-		if (segno == get_cp(cur_node_segno[type])) {
-			curseg = CURSEG_I(sbi, CURSEG_HOT_NODE + type);
+		curseg = CURSEG_I(sbi, CURSEG_HOT_NODE + type);
+		if (segno == curseg->segno) {
 			if (!IS_SUM_NODE_SEG(curseg->sum_blk)) {
 				ASSERT_MSG("segno [0x%x] indicates a data "
 						"segment, but should be node",
@@ -2352,8 +2351,8 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 	}
 
 	for (type = 0; type < NR_CURSEG_DATA_TYPE; type++) {
-		if (segno == get_cp(cur_data_segno[type])) {
-			curseg = CURSEG_I(sbi, type);
+		curseg = CURSEG_I(sbi, type);
+		if (segno == curseg->segno) {
 			if (IS_SUM_NODE_SEG(curseg->sum_blk)) {
 				ASSERT_MSG("segno [0x%x] indicates a node "
 						"segment, but should be data",
@@ -2425,21 +2424,24 @@ static void get_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
 }
 
 void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
-				u16 ofs_in_node, block_t newaddr)
+		u16 ofs_in_node, block_t newaddr, struct f2fs_node *node_blk)
 {
-	struct f2fs_node *node_blk = NULL;
 	struct node_info ni;
 	block_t oldaddr, startaddr, endaddr;
+	bool node_blk_alloced = false;
 	int ret;
 
-	node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	if (node_blk == NULL) {
+		node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
+		ASSERT(node_blk);
 
-	get_node_info(sbi, nid, &ni);
+		get_node_info(sbi, nid, &ni);
 
-	/* read node_block */
-	ret = dev_read_block(node_blk, ni.blk_addr);
-	ASSERT(ret >= 0);
+		/* read node_block */
+		ret = dev_read_block(node_blk, ni.blk_addr);
+		ASSERT(ret >= 0);
+		node_blk_alloced = true;
+	}
 
 	/* check its block address */
 	if (IS_INODE(node_blk)) {
@@ -2447,33 +2449,46 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 
 		oldaddr = le32_to_cpu(node_blk->i.i_addr[ofs + ofs_in_node]);
 		node_blk->i.i_addr[ofs + ofs_in_node] = cpu_to_le32(newaddr);
-		ret = write_inode(node_blk, ni.blk_addr);
-		ASSERT(ret >= 0);
+		if (node_blk_alloced) {
+			ret = update_inode(sbi, node_blk, &ni.blk_addr);
+			ASSERT(ret >= 0);
+		}
 	} else {
 		oldaddr = le32_to_cpu(node_blk->dn.addr[ofs_in_node]);
 		node_blk->dn.addr[ofs_in_node] = cpu_to_le32(newaddr);
-		ret = dev_write_block(node_blk, ni.blk_addr);
-		ASSERT(ret >= 0);
-	}
+		if (node_blk_alloced) {
+			ret = update_block(sbi, node_blk, &ni.blk_addr, NULL);
+			ASSERT(ret >= 0);
+		}
 
-	/* check extent cache entry */
-	if (!IS_INODE(node_blk)) {
-		get_node_info(sbi, le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino), &ni);
+		/* change node_blk with inode to update extent cache entry */
+		get_node_info(sbi, le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino),
+				&ni);
 
 		/* read inode block */
+		if (!node_blk_alloced) {
+			node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
+			ASSERT(node_blk);
+
+			node_blk_alloced = true;
+		}
 		ret = dev_read_block(node_blk, ni.blk_addr);
 		ASSERT(ret >= 0);
 	}
 
+	/* check extent cache entry */
 	startaddr = le32_to_cpu(node_blk->i.i_ext.blk_addr);
 	endaddr = startaddr + le32_to_cpu(node_blk->i.i_ext.len);
 	if (oldaddr >= startaddr && oldaddr < endaddr) {
 		node_blk->i.i_ext.len = 0;
 
 		/* update inode block */
-		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
+		if (node_blk_alloced)
+			ASSERT(update_inode(sbi, node_blk, &ni.blk_addr) >= 0);
 	}
-	free(node_blk);
+
+	if (node_blk_alloced)
+		free(node_blk);
 }
 
 void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
@@ -2744,7 +2759,7 @@ void rewrite_sit_area_bitmap(struct f2fs_sb_info *sbi)
 	free(sit_blk);
 }
 
-static int flush_sit_journal_entries(struct f2fs_sb_info *sbi)
+int flush_sit_journal_entries(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
 	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
@@ -2778,7 +2793,7 @@ static int flush_sit_journal_entries(struct f2fs_sb_info *sbi)
 	return i;
 }
 
-static int flush_nat_journal_entries(struct f2fs_sb_info *sbi)
+int flush_nat_journal_entries(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
 	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
@@ -2893,7 +2908,8 @@ void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
 	for (i = 0; i < sbi->segs_per_sec; i++) {
 		struct seg_entry *se = get_seg_entry(sbi, segno + i);
 
-		se->type = type;
+		se->type = se->orig_type = type;
+		se->dirty = 1;
 	}
 }
 
@@ -2943,6 +2959,17 @@ static bool write_pointer_at_zone_start(struct f2fs_sb_info *UNUSED(sbi),
 
 #endif
 
+static void zero_journal_entries_with_type(struct f2fs_sb_info *sbi, int type)
+{
+	struct f2fs_journal *journal =
+		F2FS_SUMMARY_BLOCK_JOURNAL(CURSEG_I(sbi, type)->sum_blk);
+
+	if (type == CURSEG_HOT_DATA)
+		journal->n_nats = 0;
+	else if (type == CURSEG_COLD_DATA)
+		journal->n_sits = 0;
+}
+
 int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 						int want_type, bool new_sec)
 {
@@ -2954,6 +2981,49 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
 	u64 end_blkaddr = (get_sb(segment_count_main) <<
 			get_sb(log_blocks_per_seg)) + get_sb(main_blkaddr);
 
+	if (c.zoned_model == F2FS_ZONED_HM && !new_sec) {
+		struct curseg_info *curseg = CURSEG_I(sbi, want_type);
+		unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
+		char buf[F2FS_BLKSIZE];
+		u64 ssa_blk;
+		int ret;
+
+		*to = NEXT_FREE_BLKADDR(sbi, curseg);
+		curseg->next_blkoff++;
+
+		if (curseg->next_blkoff == sbi->blocks_per_seg) {
+			segno = curseg->segno + 1;
+			if (!(segno % segs_per_zone)) {
+				u64 new_blkaddr = SM_I(sbi)->main_blkaddr;
+
+				ret = find_next_free_block(sbi, &new_blkaddr, 0,
+						want_type, true);
+				if (ret)
+					return ret;
+				segno = GET_SEGNO(sbi, new_blkaddr);
+			}
+
+			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
+			ret = dev_write_block(curseg->sum_blk, ssa_blk);
+			ASSERT(ret >= 0);
+
+			curseg->segno = segno;
+			curseg->next_blkoff = 0;
+			curseg->alloc_type = LFS;
+
+			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
+			ret = dev_read_block(&buf, ssa_blk);
+			ASSERT(ret >= 0);
+
+			memcpy(curseg->sum_blk, &buf, SUM_ENTRIES_SIZE);
+
+			reset_curseg(sbi, want_type);
+			zero_journal_entries_with_type(sbi, want_type);
+		}
+
+		return 0;
+	}
+
 	if (*to > 0)
 		*to -= left;
 	if (SM_I(sbi)->free_segments <= SM_I(sbi)->reserved_segments + 1)
@@ -3013,7 +3083,7 @@ next_segment:
 	return -1;
 }
 
-static void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
+void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 				 int i)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
@@ -3061,6 +3131,8 @@ bypass_ssa:
 
 	/* update se->types */
 	reset_curseg(sbi, i);
+	if (c.zoned_model == F2FS_ZONED_HM)
+		zero_journal_entries_with_type(sbi, i);
 
 	FIX_MSG("Move curseg[%d] %x -> %x after %"PRIx64"\n",
 		i, old_segno, curseg->segno, from);
@@ -3111,6 +3183,26 @@ void write_curseg_info(struct f2fs_sb_info *sbi)
 	}
 }
 
+void save_curseg_warm_node_info(struct f2fs_sb_info *sbi)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
+	struct curseg_info *saved_curseg = &SM_I(sbi)->saved_curseg_warm_node;
+
+	saved_curseg->alloc_type = curseg->alloc_type;
+	saved_curseg->segno = curseg->segno;
+	saved_curseg->next_blkoff = curseg->next_blkoff;
+}
+
+void restore_curseg_warm_node_info(struct f2fs_sb_info *sbi)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
+	struct curseg_info *saved_curseg = &SM_I(sbi)->saved_curseg_warm_node;
+
+	curseg->alloc_type = saved_curseg->alloc_type;
+	curseg->segno = saved_curseg->segno;
+	curseg->next_blkoff = saved_curseg->next_blkoff;
+}
+
 int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 					struct f2fs_nat_entry *raw_nat)
 {
@@ -3280,6 +3372,9 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 		struct curseg_info *curseg = CURSEG_I(sbi, i);
 		u64 ssa_blk;
 
+		if (!(flags & CP_UMOUNT_FLAG) && IS_NODESEG(i))
+			continue;
+
 		ret = dev_write_block(curseg->sum_blk, cp_blk_no++);
 		ASSERT(ret >= 0);
 
diff --git a/fsck/node.c b/fsck/node.c
index d53756d..7f062f0 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -69,6 +69,8 @@ int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype)
 	F2FS_NODE_FOOTER(raw_node)->cp_ver = cpu_to_le64(cp_ver);
 
 	get_node_info(sbi, ino, &ni);
+	if (ni.ino != ino)
+		ni.version = 0;
 	set_summary(&sum, ino, 0, ni.version);
 	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE, 1);
 	if (ret) {
@@ -255,6 +257,7 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 	block_t nblk[4];
 	struct node_info ni;
 	int level, i;
+	bool parent_alloced = false;
 	int ret;
 
 	level = get_node_path(dn->inode_blk, index, offset, noffset);
@@ -274,6 +277,14 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 			f2fs_alloc_nid(sbi, &nids[i]);
 
 			dn->nid = nids[i];
+			set_nid(parent, offset[i - 1], nids[i], i == 1);
+
+			/* Parent node has changed */
+			if (!parent_alloced)
+				ret = update_block(sbi, parent, &nblk[i - 1], NULL);
+			else
+				ret = dev_write_block(parent, nblk[i - 1]);
+			ASSERT(ret >= 0);
 
 			/* Function new_node_blk get a new f2fs_node blk and update*/
 			/* We should make sure that dn->node_blk == NULL*/
@@ -284,7 +295,9 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 				return -EINVAL;
 			}
 
-			set_nid(parent, offset[i - 1], nids[i], i == 1);
+			parent_alloced = true;
+			if (i == level)
+				dn->alloced = 1;
 		} else {
 			/* If Sparse file no read API, */
 			struct node_info ni;
@@ -299,11 +312,6 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 			nblk[i] = ni.blk_addr;
 		}
 
-		if (mode == ALLOC_NODE){
-			/* Parent node may have changed */
-			ret = dev_write_block(parent, nblk[i - 1]);
-			ASSERT(ret >= 0);
-		}
 		if (i != 1)
 			free(parent);
 
@@ -319,3 +327,13 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 	dn->node_blkaddr = nblk[level];
 	return 0;
 }
+
+int update_inode(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
+				u32 *blkaddr)
+{
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+		inode->i.i_inode_checksum =
+			cpu_to_le32(f2fs_inode_chksum(inode));
+	return update_block(sbi, inode, blkaddr, NULL);
+}
+
diff --git a/fsck/node.h b/fsck/node.h
index ac0e7b3..19f1e57 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -99,6 +99,7 @@ static inline void set_new_dnode(struct dnode_of_data *dn,
 	dn->nid = nid;
 	dn->idirty = 0;
 	dn->ndirty = 0;
+	dn->alloced = 0;
 }
 
 static inline void inc_inode_blocks(struct dnode_of_data *dn)
diff --git a/fsck/resize.c b/fsck/resize.c
index a3424b4..049ddd3 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -196,7 +196,7 @@ static void migrate_main(struct f2fs_sb_info *sbi, unsigned int offset)
 
 			if (IS_DATASEG(se->type))
 				update_data_blkaddr(sbi, le32_to_cpu(sum.nid),
-					le16_to_cpu(sum.ofs_in_node), to);
+					le16_to_cpu(sum.ofs_in_node), to, NULL);
 			else
 				update_nat_blkaddr(sbi, 0,
 						le32_to_cpu(sum.nid), to);
diff --git a/fsck/segment.c b/fsck/segment.c
index 934004e..9bea105 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -267,6 +267,7 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 	struct node_info ni;
 	struct f2fs_node *inode;
 	char *blk_buffer;
+	void *wbuf;
 	u64 off_in_blk;
 	u64 len_in_blk;
 	u64 written_count;
@@ -274,7 +275,8 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 	block_t blkaddr;
 	void* index_node = NULL;
 	int idirty = 0;
-	int err;
+	int err, ret;
+	bool datablk_alloced = false;
 	bool has_data = (addr_type == WR_NORMAL
 			|| addr_type == WR_COMPRESS_DATA);
 
@@ -323,13 +325,18 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 			dn.data_blkaddr = addr_type;
 			set_data_blkaddr(&dn);
 			idirty |= dn.idirty;
-			if (dn.ndirty)
-				ASSERT(dev_write_block(dn.node_blk,
-						dn.node_blkaddr) >= 0);
+			if (dn.ndirty) {
+				ret = dn.alloced ? dev_write_block(dn.node_blk,
+					dn.node_blkaddr) :
+					update_block(sbi, dn.node_blk,
+					&dn.node_blkaddr, NULL);
+				ASSERT(ret >= 0);
+			}
 			written_count = 0;
 			break;
 		}
 
+		datablk_alloced = false;
 		blkaddr = datablock_addr(dn.node_blk, dn.ofs_in_node);
 		if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR) {
 			err = new_data_block(sbi, blk_buffer,
@@ -338,6 +345,7 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 				break;
 			blkaddr = dn.data_blkaddr;
 			idirty |= dn.idirty;
+			datablk_alloced = true;
 		}
 
 		off_in_blk = offset % F2FS_BLKSIZE;
@@ -349,29 +357,50 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 		if (len_in_blk < F2FS_BLKSIZE) {
 			ASSERT(dev_read_block(blk_buffer, blkaddr) >= 0);
 			memcpy(blk_buffer + off_in_blk, buffer, len_in_blk);
-			ASSERT(dev_write_block(blk_buffer, blkaddr) >= 0);
+			wbuf = blk_buffer;
 		} else {
 			/* Direct write */
-			ASSERT(dev_write_block(buffer, blkaddr) >= 0);
+			wbuf = buffer;
 		}
 
+		if (c.zoned_model == F2FS_ZONED_HM) {
+			if (datablk_alloced) {
+				ret = dev_write_block(wbuf, blkaddr);
+			} else {
+				ret = update_block(sbi, wbuf, &blkaddr,
+						dn.node_blk);
+				if (dn.inode_blk == dn.node_blk)
+					idirty = 1;
+				else
+					dn.ndirty = 1;
+			}
+		} else {
+			ret = dev_write_block(wbuf, blkaddr);
+		}
+		ASSERT(ret >= 0);
+
 		offset += len_in_blk;
 		count -= len_in_blk;
 		buffer += len_in_blk;
 		written_count += len_in_blk;
 
 		dn.ofs_in_node++;
-		if ((--remained_blkentries == 0 || count == 0) && (dn.ndirty))
-			ASSERT(dev_write_block(dn.node_blk, dn.node_blkaddr)
-					>= 0);
+		if ((--remained_blkentries == 0 || count == 0) && (dn.ndirty)) {
+			ret = dn.alloced ?
+				dev_write_block(dn.node_blk, dn.node_blkaddr) :
+				update_block(sbi, dn.node_blk, &dn.node_blkaddr, NULL);
+			ASSERT(ret >= 0);
+		}
 	}
+
 	if (addr_type == WR_NORMAL && offset > le64_to_cpu(inode->i.i_size)) {
 		inode->i.i_size = cpu_to_le64(offset);
 		idirty = 1;
 	}
 	if (idirty) {
+		get_node_info(sbi, ino, &ni);
 		ASSERT(inode == dn.inode_blk);
-		ASSERT(write_inode(inode, ni.blk_addr) >= 0);
+		ASSERT(update_inode(sbi, inode, &ni.blk_addr) >= 0);
 	}
 
 	free(index_node);
@@ -416,7 +445,7 @@ void f2fs_filesize_update(struct f2fs_sb_info *sbi, nid_t ino, u64 filesize)
 
 	inode->i.i_size = cpu_to_le64(filesize);
 
-	ASSERT(write_inode(inode, ni.blk_addr) >= 0);
+	ASSERT(update_inode(sbi, inode, &ni.blk_addr) >= 0);
 	free(inode);
 }
 
@@ -560,7 +589,7 @@ exit:
 		copy_extent_info(&largest_ext, &cur_ext);
 	if (largest_ext.len > 0) {
 		update_extent_info(inode, &largest_ext);
-		ASSERT(write_inode(inode, ni.blk_addr) >= 0);
+		ASSERT(update_inode(sbi, inode, &ni.blk_addr) >= 0);
 	}
 
 	if (index_node)
@@ -620,7 +649,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		ASSERT((unsigned long)n == de->size);
 		memcpy(inline_data_addr(node_blk), buffer, de->size);
 		node_blk->i.i_size = cpu_to_le64(de->size);
-		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
+		ASSERT(update_inode(sbi, node_blk, &ni.blk_addr) >= 0);
 		free(node_blk);
 #ifdef WITH_SLOAD
 	} else if (c.func == SLOAD && c.compress.enabled &&
@@ -642,7 +671,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		node_blk->i.i_flags = cpu_to_le32(F2FS_COMPR_FL);
 		if (c.compress.readonly)
 			node_blk->i.i_inline |= F2FS_COMPRESS_RELEASED;
-		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
+		ASSERT(update_inode(sbi, node_blk, &ni.blk_addr) >= 0);
 
 		while (!eof && (n = bulkread(fd, rbuf, c.compress.cc.rlen,
 				&eof)) > 0) {
@@ -690,7 +719,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 			node_blk->i.i_compr_blocks = cpu_to_le64(cblocks);
 			node_blk->i.i_blocks += cpu_to_le64(cblocks);
 		}
-		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
+		ASSERT(update_inode(sbi, node_blk, &ni.blk_addr) >= 0);
 		free(node_blk);
 
 		if (!c.compress.readonly) {
@@ -725,3 +754,64 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		de->uid, de->gid, de->capabilities, de->size, de->pino);
 	return 0;
 }
+
+int update_block(struct f2fs_sb_info *sbi, void *buf, u32 *blkaddr,
+		struct f2fs_node *node_blk)
+{
+	struct seg_entry *se;
+	struct f2fs_summary sum;
+	u64 new_blkaddr, old_blkaddr = *blkaddr, offset;
+	int ret, type;
+
+	if (c.zoned_model != F2FS_ZONED_HM)
+		return dev_write_block(buf, old_blkaddr);
+
+	/* update sit bitmap & valid_blocks && se->type for old block*/
+	se = get_seg_entry(sbi, GET_SEGNO(sbi, old_blkaddr));
+	offset = OFFSET_IN_SEG(sbi, old_blkaddr);
+	type = se->type;
+	se->valid_blocks--;
+	f2fs_clear_bit(offset, (char *)se->cur_valid_map);
+	if (need_fsync_data_record(sbi))
+		f2fs_clear_bit(offset, (char *)se->ckpt_valid_map);
+	se->dirty = 1;
+	f2fs_clear_main_bitmap(sbi, old_blkaddr);
+	f2fs_clear_sit_bitmap(sbi, old_blkaddr);
+
+	new_blkaddr = SM_I(sbi)->main_blkaddr;
+	if (find_next_free_block(sbi, &new_blkaddr, 0, type, false)) {
+		ERR_MSG("Can't find free block for the update");
+		ASSERT(0);
+	}
+
+	ret = dev_write_block(buf, new_blkaddr);
+	ASSERT(ret >= 0);
+
+	*blkaddr = new_blkaddr;
+
+	/* update sit bitmap & valid_blocks && se->type for new block */
+	se = get_seg_entry(sbi, GET_SEGNO(sbi, new_blkaddr));
+	offset = OFFSET_IN_SEG(sbi, new_blkaddr);
+	se->type = se->orig_type = type;
+	se->valid_blocks++;
+	f2fs_set_bit(offset, (char *)se->cur_valid_map);
+	if (need_fsync_data_record(sbi))
+		f2fs_set_bit(offset, (char *)se->ckpt_valid_map);
+	se->dirty = 1;
+	f2fs_set_main_bitmap(sbi, new_blkaddr, type);
+	f2fs_set_sit_bitmap(sbi, new_blkaddr);
+
+	/* update SSA */
+	get_sum_entry(sbi, old_blkaddr, &sum);
+	update_sum_entry(sbi, new_blkaddr, &sum);
+
+	if (IS_DATASEG(type)) {
+		update_data_blkaddr(sbi, le32_to_cpu(sum.nid),
+				le16_to_cpu(sum.ofs_in_node), new_blkaddr, node_blk);
+	} else
+		update_nat_blkaddr(sbi, 0, le32_to_cpu(sum.nid), new_blkaddr);
+
+	DBG(1, "Update %s block %"PRIx64" -> %"PRIx64"\n",
+		IS_DATASEG(type) ? "data" : "node", old_blkaddr, new_blkaddr);
+	return ret;
+}
diff --git a/fsck/xattr.c b/fsck/xattr.c
index 3163639..241e339 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -94,6 +94,7 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
 	nid_t xnid = le32_to_cpu(inode->i.i_xattr_nid);
 	u64 inline_size = inline_xattr_size(&inode->i);
 	int ret;
+	bool xattrblk_alloced = false;
 
 	memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
 
@@ -109,6 +110,7 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
 		ASSERT(dn.node_blk);
 		xattr_node = dn.node_blk;
 		inode->i.i_xattr_nid = cpu_to_le32(new_nid);
+		xattrblk_alloced = true;
 	} else {
 		set_new_dnode(&dn, inode, NULL, xnid);
 		get_node_info(sbi, xnid, &ni);
@@ -125,7 +127,8 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
 	memcpy(xattr_addr, txattr_addr + inline_size,
 			F2FS_BLKSIZE - sizeof(struct node_footer));
 
-	ret = dev_write_block(xattr_node, blkaddr);
+	ret = xattrblk_alloced ? dev_write_block(xattr_node, blkaddr) :
+		update_block(sbi, xattr_node, &blkaddr, NULL);
 
 free_xattr_node:
 	free(xattr_node);
@@ -250,7 +253,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 	write_all_xattrs(sbi, inode, new_hsize, base_addr);
 
 	/* inode need update */
-	ASSERT(write_inode(inode, ni.blk_addr) >= 0);
+	ASSERT(update_inode(sbi, inode, &ni.blk_addr) >= 0);
 exit:
 	free(inode);
 	free(base_addr);
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 995e42d..624cf57 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -919,6 +919,7 @@ int get_device_info(int i)
 	unsigned char model_inq[6] = {MODELINQUIRY};
 #endif
 	struct device_info *dev = c.devices + i;
+	int flags = O_RDWR;
 
 	if (c.sparse_mode) {
 		fd = open(dev->path, O_RDWR | O_CREAT | O_BINARY, 0644);
@@ -934,20 +935,33 @@ int get_device_info(int i)
 	stat_buf = malloc(sizeof(struct stat));
 	ASSERT(stat_buf);
 
-	if (!c.sparse_mode) {
-		if (stat(dev->path, stat_buf) < 0 ) {
-			MSG(0, "\tError: Failed to get the device stat!\n");
+	if (stat(dev->path, stat_buf) < 0) {
+		MSG(0, "\tError: Failed to get the device stat!\n");
+		free(stat_buf);
+		return -1;
+	}
+
+#ifdef __linux__
+	if (S_ISBLK(stat_buf->st_mode)) {
+		if (f2fs_get_zoned_model(i) < 0) {
 			free(stat_buf);
 			return -1;
 		}
+	}
+#endif
+
+	if (!c.sparse_mode) {
+		if (dev->zoned_model == F2FS_ZONED_HM && c.func == FSCK)
+			flags |= O_DSYNC;
 
 		if (S_ISBLK(stat_buf->st_mode) &&
 				!c.force && c.func != DUMP && !c.dry_run) {
-			fd = open(dev->path, O_RDWR | O_EXCL);
+			flags |= O_EXCL;
+			fd = open(dev->path, flags);
 			if (fd < 0)
 				fd = open_check_fs(dev->path, O_EXCL);
 		} else {
-			fd = open(dev->path, O_RDWR);
+			fd = open(dev->path, flags);
 			if (fd < 0)
 				fd = open_check_fs(dev->path, 0);
 		}
@@ -1047,13 +1061,6 @@ int get_device_info(int i)
 	}
 
 #ifdef __linux__
-	if (S_ISBLK(stat_buf->st_mode)) {
-		if (f2fs_get_zoned_model(i) < 0) {
-			free(stat_buf);
-			return -1;
-		}
-	}
-
 	if (dev->zoned_model != F2FS_ZONED_NONE) {
 
 		/* Get the number of blocks per zones */
@@ -1104,6 +1111,7 @@ int get_device_info(int i)
 		}
 	}
 #endif
+
 	/* adjust wanted_total_sectors */
 	if (c.wanted_total_sectors != -1) {
 		MSG(0, "Info: wanted sectors = %"PRIu64" (in %"PRIu64" bytes)\n",
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
