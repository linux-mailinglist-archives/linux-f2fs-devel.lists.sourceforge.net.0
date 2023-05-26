Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607C7130B9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 May 2023 01:55:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2hGr-0001Qz-Gg;
	Fri, 26 May 2023 23:54:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q2hGb-0001Qq-Lr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 23:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AYvikdDJjA+LVyq9AR3Z0G3xT+qFLkfFl2ruor7w7Qs=; b=ihOzEPonAZJB6A6xilcS5F4T1s
 SrZbaEQwHQQhdXInbspfG25SCVrQq7hhwQCbwfxN12PGre+XK2nkSAKW1hVpd4a6J9mxIXQmBy+G8
 kWOy22/kserkQAhCOcWH3xK4HPARZw9rM+ViRJ6aiN2EblDyY3xeZ+LRsXKLBQUKnn9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AYvikdDJjA+LVyq9AR3Z0G3xT+qFLkfFl2ruor7w7Qs=; b=M
 TZUc9bpiusKVV7AYWoPUOV94cWIGBy69KwpS4j7fe9iGHFTvsLN3NouZqLLJm6CnHperUP0bAABwG
 DlACdli30gXU32OsUP73VLoNVatnGdwxd0xX2QjLevxIr9bCwj4EImU1goV/3xiHyCV2Pb8gNC7w9
 pA1NRmCcPzMsiMms=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2hGZ-0006Fj-Uk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 23:54:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4342B653F4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 May 2023 23:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2032C433EF;
 Fri, 26 May 2023 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685145273;
 bh=qOzVa9ltzfns8jFIGYMtEg3qPi2F+Mojtq6KaVfWko8=;
 h=From:To:Cc:Subject:Date:From;
 b=HHGOr9NtjmH/5sV4rAG9CyhRDziqSTmKfw8QZxYVuDudNrituhgVI6BHRxLkQpMja
 lxTMv5cVyzPrJyov9TbEEbObvO9oSoBZpElFfZFTXCctsj8pYL3ju/1UCnFIbphcZG
 6hBLdDL+A6NddHUOGYvpfWPQ6VeVp6O18+pJzBgwzXWImiQOklhnFd8FQiAFhf3jjy
 KC/82qeCWgWPxFOg9EcVyR8cxHPDLINau29c5sTrS8KwNjBotpj/pgHnK8pIzRrFuE
 ILCnNMwKWybEYbTtzpzwXuqqLeARX0QjJG5RYtF9PelEUPNiGMQ2jvmm8J7rR1KDL3
 g1/2Q6PBSlMbw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 27 May 2023 07:54:22 +0800
Message-Id: <20230526235423.3591350-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduce alloc_next_free_block() to wrap below openned
 codes:
 blkaddr = get_sb(main_blkaddr) + c.cur_seg[curseg_type] * c.blks_per_seg
 + c.curseg_offset[curseg_type];
 Meanwhile add curseg_offset field in f2fs_configuration
 to record last blkaddr in each log. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2hGZ-0006Fj-Uk
Subject: [f2fs-dev] [PATCH v3 3/4] mkfs.f2fs: cleanup w/
 alloc_next_free_block()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce alloc_next_free_block() to wrap below openned codes:

	blkaddr = get_sb(main_blkaddr) +
			c.cur_seg[curseg_type] * c.blks_per_seg +
			c.curseg_offset[curseg_type];

Meanwhile add curseg_offset field in f2fs_configuration to record
last blkaddr in each log.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- rebase the code
 include/f2fs_fs.h  |   2 +
 mkfs/f2fs_format.c | 101 +++++++++++++++++++--------------------------
 2 files changed, 45 insertions(+), 58 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 8475645..05d27ba 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -603,6 +603,8 @@ struct f2fs_configuration {
 
 	/* compression support for sload.f2fs */
 	compress_config_t compress;
+
+	block_t curseg_offset[6];
 };
 
 #ifdef CONFIG_64BIT
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 620f779..2ca5f48 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1230,11 +1230,24 @@ static int f2fs_discard_obsolete_dnode(void)
 }
 #endif
 
+static block_t alloc_next_free_block(int curseg_type, int blkcnt)
+{
+	block_t blkaddr;
+
+	blkaddr = get_sb(main_blkaddr) +
+		c.cur_seg[curseg_type] * c.blks_per_seg +
+		c.curseg_offset[curseg_type];
+
+	c.curseg_offset[curseg_type] += blkcnt;
+
+	return blkaddr;
+}
+
 static int f2fs_write_root_inode(void)
 {
 	struct f2fs_node *raw_node = NULL;
-	uint64_t data_blk_nor;
-	uint64_t main_area_node_seg_blk_offset = 0;
+	block_t data_blkaddr;
+	block_t node_blkaddr;
 
 	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
@@ -1248,24 +1261,15 @@ static int f2fs_write_root_inode(void)
 	if (c.lpf_ino)
 		raw_node->i.i_links = cpu_to_le32(3);
 
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] *
-			c.blks_per_seg + 1);
-
-	data_blk_nor = get_sb(main_blkaddr) +
-		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg;
-	raw_node->i.i_addr[get_extra_isize(raw_node)] = cpu_to_le32(data_blk_nor);
-
-	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
-	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
-					c.blks_per_seg;
-
-	DBG(1, "\tWriting root inode (hot node), %x %x %x at offset 0x%08"PRIu64"\n",
-			get_sb(main_blkaddr),
-			c.cur_seg[CURSEG_HOT_NODE],
-			c.blks_per_seg, main_area_node_seg_blk_offset);
-	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
+	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA, 1);
+	raw_node->i.i_addr[get_extra_isize(raw_node)] =
+				cpu_to_le32(data_blkaddr);
+
+	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
+	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
+
+	DBG(1, "\tWriting root inode (hot node), offset 0x%x\n", node_blkaddr);
+	if (write_inode(raw_node, node_blkaddr) < 0) {
 		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
 		free(raw_node);
 		return -1;
@@ -1349,8 +1353,8 @@ static int f2fs_write_default_quota(int qtype, unsigned int blkaddr,
 static int f2fs_write_qf_inode(int qtype, int offset)
 {
 	struct f2fs_node *raw_node = NULL;
-	uint64_t data_blk_nor;
-	uint64_t main_area_node_seg_blk_offset = 0;
+	block_t data_blkaddr;
+	block_t node_blkaddr;
 	__le32 raw_id;
 	int i;
 
@@ -1366,14 +1370,10 @@ static int f2fs_write_qf_inode(int qtype, int offset)
 	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
 	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
 
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] *
-			c.blks_per_seg + 1 + qtype + 1);
+	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
+	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
-	data_blk_nor = get_sb(main_blkaddr) +
-		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg + 1
-		+ offset * QUOTA_DATA(i);
+	data_blkaddr = alloc_next_free_block(CURSEG_HOT_DATA, QUOTA_DATA(i));
 
 	if (qtype == 0)
 		raw_id = raw_node->i.i_uid;
@@ -1385,24 +1385,17 @@ static int f2fs_write_qf_inode(int qtype, int offset)
 		ASSERT(0);
 
 	/* write two blocks */
-	if (f2fs_write_default_quota(qtype, data_blk_nor, raw_id)) {
+	if (f2fs_write_default_quota(qtype, data_blkaddr, raw_id)) {
 		free(raw_node);
 		return -1;
 	}
 
 	for (i = 0; i < QUOTA_DATA(qtype); i++)
 		raw_node->i.i_addr[get_extra_isize(raw_node) + i] =
-					cpu_to_le32(data_blk_nor + i);
+					cpu_to_le32(data_blkaddr + i);
 
-	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
-	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
-					c.blks_per_seg + offset + 1;
-
-	DBG(1, "\tWriting quota inode (hot node), %x %x %x at offset 0x%08"PRIu64"\n",
-			get_sb(main_blkaddr),
-			c.cur_seg[CURSEG_HOT_NODE],
-			c.blks_per_seg, main_area_node_seg_blk_offset);
-	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
+	DBG(1, "\tWriting quota inode (hot node), offset 0x%x\n", node_blkaddr);
+	if (write_inode(raw_node, node_blkaddr) < 0) {
 		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
 		free(raw_node);
 		return -1;
@@ -1492,8 +1485,8 @@ static block_t f2fs_add_default_dentry_lpf(void)
 static int f2fs_write_lpf_inode(void)
 {
 	struct f2fs_node *raw_node;
-	uint64_t main_area_node_seg_blk_offset;
-	block_t data_blk_nor;
+	block_t data_blkaddr;
+	block_t node_blkaddr;
 	int err = 0;
 
 	ASSERT(c.lpf_ino);
@@ -1510,28 +1503,20 @@ static int f2fs_write_lpf_inode(void)
 	raw_node->i.i_namelen = le32_to_cpu(strlen(LPF));
 	memcpy(raw_node->i.i_name, LPF, strlen(LPF));
 
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
-			1 + c.quota_inum + 1);
+	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE, 1);
+	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
-	data_blk_nor = f2fs_add_default_dentry_lpf();
-	if (data_blk_nor == 0) {
+	data_blkaddr = f2fs_add_default_dentry_lpf();
+	if (data_blkaddr == 0) {
 		MSG(1, "\tError: Failed to add default dentries for lost+found!!!\n");
 		err = -1;
 		goto exit;
 	}
-	raw_node->i.i_addr[get_extra_isize(raw_node)] = cpu_to_le32(data_blk_nor);
-
-	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
-	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
-		c.blks_per_seg + c.quota_inum + 1;
+	raw_node->i.i_addr[get_extra_isize(raw_node)] = cpu_to_le32(data_blkaddr);
 
-	DBG(1, "\tWriting lost+found inode (hot node), %x %x %x at offset 0x%08"PRIu64"\n",
-			get_sb(main_blkaddr),
-			c.cur_seg[CURSEG_HOT_NODE],
-			c.blks_per_seg, main_area_node_seg_blk_offset);
-	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
+	DBG(1, "\tWriting lost+found inode (hot node), offset 0x%x\n",
+								node_blkaddr);
+	if (write_inode(raw_node, node_blkaddr) < 0) {
 		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
 		err = -1;
 		goto exit;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
