Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C5200442
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 10:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:Message-Id:Date:To:Sender:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZonNEX3YAA78vog7hiiLpkar+yT8J+i4m8qS0JSkhk=; b=G1+Z+txoyu0SIx/DX/gt+7hyvF
	XkOQwFg0eqTSgivcVlp4xVfjcXdCRE3hAowFlyet1B/jTWdxSgcFXPb3/s0VPnNOvHTc5Zx5hZkcy
	+LcInA4Z2SAovQYTECtCPVPFuIJoPDge7gEpuAvGYNVW3C8fvYOf1yclk4xod0bGmk8Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmCf4-0003Ls-Pt; Fri, 19 Jun 2020 08:46:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhaowuyun@wingtech.com>) id 1jmCf3-0003Lk-Ba
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 08:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oPhfw82hCUp271SEkySFbEH9UE1Dnboa8QUVpJeiqWo=; b=G3PVVr6hLx3fnwleLtbe/LHF7M
 y4ZympLBDV3ZdHgSZ8OZ9oGZtUlcMnmgC5QN7mZmR/OfF4Z18Re2k/7SW+AEQvv2D2W1f1sTOaq0y
 TTjBJAI4yVP6q0eo0q0tmjscq2jPaLSOUBW5VMUdz6qj0Pa2bDMNr5xVYUExOtVyfr2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oPhfw82hCUp271SEkySFbEH9UE1Dnboa8QUVpJeiqWo=; b=jjiWVvpPErPmYseyDtlvjditui
 uRT1rCNP6u23g1SeJnVUddM29ofBBzCA+MFU3znSw/VRTIkV4PC2SX7LEJr0i33a6N8d3mT8LEtXl
 2QaG115JmiYhNmY2iO/XuQM0/kLKDeoVHmRyezKzh1NFLwLH+PrhxxN7z2ZBavjykEFY=;
Received: from mx.wingtech.com ([180.166.216.14] helo=mail.wingtech.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1jmCf1-009nZ2-F5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 08:46:09 +0000
Received: from mx.wingtech.com ([192.168.2.43])
 by mail.wingtech.com  with SMTP id 05J8jran032180-05J8jrao032180
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 19 Jun 2020 16:45:53 +0800
Received: from 192.168.51.143 (HELO ZHAOWUYUN.WINGTECH.COM);
 Fri, 19 Jun 2020 16:45:50 +0800
To: yuchao0@huawei.com, jaegeuk@kernel.org
Date: Fri, 19 Jun 2020 16:45:44 +0800
Message-Id: <1592556344-2301-1-git-send-email-zhaowuyun@wingtech.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wingtech.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1jmCf1-009nZ2-F5
Subject: [f2fs-dev] [PATCH v3] f2fs-tools: introduce set_node_footer to
 initialize node footer
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
From: zhaowuyun--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhaowuyun@wingtech.com
Cc: zhaowuyun@wingtech.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wuyun Zhao <zhaowuyun@wingtech.com>

the filesystem will use the cold flag, so deal with it to avoid
potential issue of inconsistency

Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>
---
 fsck/dir.c         |  7 ++-----
 fsck/node.c        | 12 +++++-------
 include/f2fs_fs.h  | 23 +++++++++++++++++++++++
 mkfs/f2fs_format.c | 34 +++++++++++++---------------------
 4 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 5f4f75e..b067aec 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -517,11 +517,8 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 	}
 
 	set_file_temperature(sbi, node_blk, de->name);
-
-	node_blk->footer.ino = cpu_to_le32(de->ino);
-	node_blk->footer.nid = cpu_to_le32(de->ino);
-	node_blk->footer.flag = 0;
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	set_node_footer(node_blk, de->ino, de->ino, 0,
+			le64_to_cpu(ckpt->checkpoint_ver), 0, S_ISDIR(mode));
 
 	if (S_ISDIR(mode)) {
 		make_empty_dir(sbi, node_blk);
diff --git a/fsck/node.c b/fsck/node.c
index 229a99c..ef7ed0b 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -61,7 +61,7 @@ void set_data_blkaddr(struct dnode_of_data *dn)
 block_t new_node_block(struct f2fs_sb_info *sbi,
 				struct dnode_of_data *dn, unsigned int ofs)
 {
-	struct f2fs_node *f2fs_inode;
+	struct f2fs_node *f2fs_inode = dn->inode_blk;
 	struct f2fs_node *node_blk;
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
 	struct f2fs_summary sum;
@@ -69,16 +69,14 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 	block_t blkaddr = NULL_ADDR;
 	int type;
 	int ret;
-
-	f2fs_inode = dn->inode_blk;
+	nid_t ino = le32_to_cpu(f2fs_inode->footer.ino);
+	u64 cp_ver = le64_to_cpu(ckpt->checkpoint_ver);
 
 	node_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(node_blk);
 
-	node_blk->footer.nid = cpu_to_le32(dn->nid);
-	node_blk->footer.ino = f2fs_inode->footer.ino;
-	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	set_node_footer(node_blk, dn->nid, ino, ofs, cp_ver, 0,
+			S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
 
 	type = CURSEG_COLD_NODE;
 	if (IS_DNODE(node_blk)) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 709bfd8..ab19eb7 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -923,6 +923,29 @@ struct f2fs_node {
 	struct node_footer footer;
 } __attribute__((packed));
 
+static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
+{
+	unsigned int flag = le32_to_cpu(rn->footer.flag);
+
+	if (is_dir)
+		flag &= ~(0x1 << COLD_BIT_SHIFT);
+	else
+		flag |= (0x1 << COLD_BIT_SHIFT);
+	rn->footer.flag = cpu_to_le32(flag);
+}
+
+static inline void set_node_footer(struct f2fs_node *rn, nid_t nid, nid_t ino,
+					u32 ofs, u64 ver, block_t blkaddr,
+					bool is_dir)
+{
+	rn->footer.nid = cpu_to_le32(nid);
+	rn->footer.ino = cpu_to_le32(ino);
+	rn->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
+	rn->footer.cp_ver = cpu_to_le64(ver);
+	rn->footer.next_blkaddr = cpu_to_le32(blkaddr);
+	set_cold_node(rn, is_dir);
+}
+
 /*
  * For NAT entries
  */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 44575e0..656023a 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1094,6 +1094,9 @@ static int f2fs_write_root_inode(void)
 	struct f2fs_node *raw_node = NULL;
 	u_int64_t blk_size_bytes, data_blk_nor;
 	u_int64_t main_area_node_seg_blk_offset = 0;
+	nid_t nid = le32_to_cpu(sb->root_ino);
+	block_t blkaddr = get_sb(main_blkaddr) +
+				c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg + 1;
 
 	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
@@ -1101,13 +1104,7 @@ static int f2fs_write_root_inode(void)
 		return -1;
 	}
 
-	raw_node->footer.nid = sb->root_ino;
-	raw_node->footer.ino = sb->root_ino;
-	raw_node->footer.cp_ver = cpu_to_le64(1);
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] *
-			c.blks_per_seg + 1);
+	set_node_footer(raw_node, nid, nid, 0, 1, blkaddr, 1);
 
 	raw_node->i.i_mode = cpu_to_le16(0x41ed);
 	if (c.lpf_ino)
@@ -1256,6 +1253,10 @@ static int f2fs_write_qf_inode(int qtype)
 	u_int64_t main_area_node_seg_blk_offset = 0;
 	__le32 raw_id;
 	int i;
+	nid_t qf_ino = le32_to_cpu(sb->qf_ino[qtype]);
+	block_t blkaddr = get_sb(main_blkaddr) +
+					c.cur_seg[CURSEG_HOT_NODE] *
+					c.blks_per_seg + 1 + qtype + 1;
 
 	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
@@ -1263,13 +1264,7 @@ static int f2fs_write_qf_inode(int qtype)
 		return -1;
 	}
 
-	raw_node->footer.nid = sb->qf_ino[qtype];
-	raw_node->footer.ino = sb->qf_ino[qtype];
-	raw_node->footer.cp_ver = cpu_to_le64(1);
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] *
-			c.blks_per_seg + 1 + qtype + 1);
+	set_node_footer(raw_node, qf_ino, qf_ino, 0, 1, blkaddr, 0);
 
 	raw_node->i.i_mode = cpu_to_le16(0x8180);
 	raw_node->i.i_links = cpu_to_le32(1);
@@ -1447,6 +1442,9 @@ static int f2fs_write_lpf_inode(void)
 	struct f2fs_node *raw_node;
 	u_int64_t blk_size_bytes, main_area_node_seg_blk_offset;
 	block_t data_blk_nor;
+	block_t blkaddr = get_sb(main_blkaddr) +
+				c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
+				1 + c.quota_inum + 1;
 	int err = 0;
 
 	ASSERT(c.lpf_ino);
@@ -1457,13 +1455,7 @@ static int f2fs_write_lpf_inode(void)
 		return -1;
 	}
 
-	raw_node->footer.nid = cpu_to_le32(c.lpf_ino);
-	raw_node->footer.ino = raw_node->footer.nid;
-	raw_node->footer.cp_ver = cpu_to_le64(1);
-	raw_node->footer.next_blkaddr = cpu_to_le32(
-			get_sb(main_blkaddr) +
-			c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
-			1 + c.quota_inum + 1);
+	set_node_footer(raw_node, c.lpf_ino, c.lpf_ino, 0, 1, blkaddr, 1);
 
 	raw_node->i.i_mode = cpu_to_le16(0x41c0); /* 0700 */
 	raw_node->i.i_links = cpu_to_le32(2);
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
