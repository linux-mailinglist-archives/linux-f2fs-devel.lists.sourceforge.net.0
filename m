Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3ED2001F8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2020 08:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:Message-Id:Date:To:Sender:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h8p3UF5Bp0sM2g2GeLFiSdLON2zafHJNP/EvMPAPvII=; b=hrNqsivzIjOY3OfmXiaftdzCNw
	7c1anvQRXtubLUIBRgQG1JMidrwhPw0tZqNHdW+xyUNFVhvkPY+9HRFF+Aqy4siGOWTLGDvl8SlEi
	3AjB45cmBF0a/PjiJa3wdL0xx8NDWTXVampuMiOmNylUWyDdyK13jIA8yavru+1IxOv4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmAej-0003pD-I3; Fri, 19 Jun 2020 06:37:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhaowuyun@wingtech.com>) id 1jmAei-0003p6-DA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 06:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iBnn4vgPgsP9j8MLOPlVFbhIiIRiyfwtzgdLitsPx9E=; b=UCuPqRSZ66BOTEU9ylWXGC32ww
 3jfEWTWfPOBav/yH4+FZXG4vEf8Zma42uYwbbxKK6SMFN2+JcOSCvF75DxR/lmZXEbMfRjhiBv41D
 TzPVmN0+bU2ZVUh6uYioE37Lp4LS2iLAJOQKHxa0Fka8adsxS9IPLvHTB+Y/s+VrjpA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iBnn4vgPgsP9j8MLOPlVFbhIiIRiyfwtzgdLitsPx9E=; b=LUXJ2LY/lDfW4kQTwVXDpf3pA2
 u7w/sgpz+w+eCZW0xe0ldrIENSW1sOmr3671USX+qMXtkTqBgZPQkutdYSQC5jyoVtB5a/PnARU9V
 b5BwNXLTZK6zd1XrkKKca7qG4kNdX6S5p2/5pI7lE5mO8E2IRwjaQjsd57o1U/4kmiUo=;
Received: from mx.wingtech.com ([180.166.216.14] helo=mail.wingtech.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1jmAeg-009eNM-0P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jun 2020 06:37:40 +0000
Received: from mx.wingtech.com ([192.168.2.43])
 by mail.wingtech.com  with SMTP id 05J6bOru003593-05J6bOrv003593
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 19 Jun 2020 14:37:24 +0800
Received: from 192.168.51.143 (HELO ZHAOWUYUN.WINGTECH.COM);
 Fri, 19 Jun 2020 14:37:22 +0800
To: jaegeuk@kernel.org, yuchao0@huawei.com
Date: Fri, 19 Jun 2020 14:37:14 +0800
Message-Id: <1592548634-1065-1-git-send-email-zhaowuyun@wingtech.com>
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
X-Headers-End: 1jmAeg-009eNM-0P
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: introduce set_node_footer to
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
 fsck/dir.c         |  6 +-----
 fsck/node.c        |  9 +++++----
 include/f2fs_fs.h  | 20 ++++++++++++++++++++
 mkfs/f2fs_format.c | 14 +++++---------
 4 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 5f4f75e..64aa539 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -517,11 +517,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 	}
 
 	set_file_temperature(sbi, node_blk, de->name);
-
-	node_blk->footer.ino = cpu_to_le32(de->ino);
-	node_blk->footer.nid = cpu_to_le32(de->ino);
-	node_blk->footer.flag = 0;
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	set_node_footer(node_blk, de->ino, de->ino, 0, le64_to_cpu(ckpt->checkpoint_ver), S_ISDIR(mode));
 
 	if (S_ISDIR(mode)) {
 		make_empty_dir(sbi, node_blk);
diff --git a/fsck/node.c b/fsck/node.c
index 229a99c..66e8a81 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -69,16 +69,17 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 	block_t blkaddr = NULL_ADDR;
 	int type;
 	int ret;
+	u32 ino;
+	u64 cp_ver;
 
 	f2fs_inode = dn->inode_blk;
 
 	node_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(node_blk);
 
-	node_blk->footer.nid = cpu_to_le32(dn->nid);
-	node_blk->footer.ino = f2fs_inode->footer.ino;
-	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	ino = le32_to_cpu(f2fs_inode->footer.ino);
+	cp_ver = le64_to_cpu(ckpt->checkpoint_ver);
+	set_node_footer(node_blk, dn->nid, ino, ofs, cp_ver, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
 
 	type = CURSEG_COLD_NODE;
 	if (IS_DNODE(node_blk)) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 709bfd8..3583df4 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -923,6 +923,26 @@ struct f2fs_node {
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
+static inline void set_node_footer(struct f2fs_node *rn, u32 nid, u32 ino, u32 ofs, u64 ver, bool is_dir)
+{
+	rn->footer.nid = cpu_to_le32(nid);
+	rn->footer.ino = cpu_to_le32(ino);
+	rn->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
+	rn->footer.cp_ver = cpu_to_le64(ver);
+	set_cold_node(rn, is_dir);
+}
+
 /*
  * For NAT entries
  */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 44575e0..b371adf 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1101,9 +1101,7 @@ static int f2fs_write_root_inode(void)
 		return -1;
 	}
 
-	raw_node->footer.nid = sb->root_ino;
-	raw_node->footer.ino = sb->root_ino;
-	raw_node->footer.cp_ver = cpu_to_le64(1);
+	set_node_footer(raw_node, le32_to_cpu(sb->root_ino), le32_to_cpu(sb->root_ino), 0, 1, 1);
 	raw_node->footer.next_blkaddr = cpu_to_le32(
 			get_sb(main_blkaddr) +
 			c.cur_seg[CURSEG_HOT_NODE] *
@@ -1256,6 +1254,7 @@ static int f2fs_write_qf_inode(int qtype)
 	u_int64_t main_area_node_seg_blk_offset = 0;
 	__le32 raw_id;
 	int i;
+	u32 qf_ino;
 
 	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
@@ -1263,9 +1262,8 @@ static int f2fs_write_qf_inode(int qtype)
 		return -1;
 	}
 
-	raw_node->footer.nid = sb->qf_ino[qtype];
-	raw_node->footer.ino = sb->qf_ino[qtype];
-	raw_node->footer.cp_ver = cpu_to_le64(1);
+	qf_ino = le32_to_cpu(sb->qf_ino[qtype]);
+	set_node_footer(raw_node, qf_ino, qf_ino, 0, 1, 0);
 	raw_node->footer.next_blkaddr = cpu_to_le32(
 			get_sb(main_blkaddr) +
 			c.cur_seg[CURSEG_HOT_NODE] *
@@ -1457,9 +1455,7 @@ static int f2fs_write_lpf_inode(void)
 		return -1;
 	}
 
-	raw_node->footer.nid = cpu_to_le32(c.lpf_ino);
-	raw_node->footer.ino = raw_node->footer.nid;
-	raw_node->footer.cp_ver = cpu_to_le64(1);
+	set_node_footer(raw_node, c.lpf_ino, c.lpf_ino, 0, 1, 1);
 	raw_node->footer.next_blkaddr = cpu_to_le32(
 			get_sb(main_blkaddr) +
 			c.cur_seg[CURSEG_HOT_NODE] * c.blks_per_seg +
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
