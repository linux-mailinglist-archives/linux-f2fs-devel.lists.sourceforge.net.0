Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C01D1185D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 10:36:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+c2iVbnyssVEs3GBw2KodttwPiAzkv0LcT6s/8VlGs=; b=BZ2wurU6KwuT8yOpjQscAVGpK6
	JhfDj5ocFi/3LDhX6Eec4U1mEXBxgUU8YB2UMS+6j34a9mv+GcJIAiHiFdtwd31EBLMg94yKQs84Y
	LcAlrZuN2E0vhD78RLgKBfI8G7zlGCeN32DxP9YLF++21Z5wm+eHmnUZSiO8ciJlun2g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfELK-0001fp-3a;
	Mon, 12 Jan 2026 09:36:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=465c55cf5=wuboo@amazon.com>) id 1vfELI-0001fi-0X
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iMFLFRX1BEyRwDeCWYXq94bFOxXuyLwWLPONnmnFTt4=; b=BPT215/SeKySwTyQCmLOl7qdcG
 JtDXKpQ5Y7ktYBQsduDFIsrmfpJNfHuemy5UVsUD/P/c1X3vRsvn/OysaU44upOq3GxNqv9Kg1By5
 5Y1s9sh6FGVrVYfZM3WS4rMgPVF2kW7AOdi0NSmb9FqYMqjlLMO5QGN/Sp87KAnY5kVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iMFLFRX1BEyRwDeCWYXq94bFOxXuyLwWLPONnmnFTt4=; b=h
 XaamZEywc9X9UXGZNO9KWgfzGEquAlsGEdpT6zpvqqPNedR7aeKJsfuIrsYbkfI+KPdxe/15lzBbQ
 QiVwbHej1wWSZq2opphfO/8lVNzsSfdnR822BYlqnwuM58H7C7Scs6Q6Y5NxIbWZhCMmNVFMHq+1C
 Zfk1AcCgRR2DYJ4I=;
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com
 ([35.155.198.111]) by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfELG-00014F-FV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 09:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1768210566; x=1799746566;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iMFLFRX1BEyRwDeCWYXq94bFOxXuyLwWLPONnmnFTt4=;
 b=I7MUiy939+5fCTP51qPPjb262Pe9PnLkSlPcrIEkVOq+Uaw5k2LFJ8oK
 q/9ZWIzvqiPYPHTB2vqQaL+smZI0fu8FxTWEwKjONR4948Qf1h8NOU9kD
 +wnx0FD/WlAbrlccR3AHtkUUFJnjjf0mSWZYwY7gNjBmmiyhzL+1U9TUJ
 YKHl/DBUWduXTuuZLCnLYNeZf+Fn90VO+PO3/D+LT3W9RGUYHuFqlhIHg
 UInupr2byabo6alM7TUJrws63YFvS6pZK2Oe2WsoZhkKu0Gsa1kfAVmRp
 9F8ma87saL8PrFBb8Rf6BVxiQUCSuDrcLd5zFePu5FM3enb1v0OwNzhi8 w==;
X-CSE-ConnectionGUID: nsOaGevUTiOMMl+TwHCNwQ==
X-CSE-MsgGUID: 7OVhLpLtTbO2qzn83T6bcw==
X-IronPort-AV: E=Sophos;i="6.21,219,1763424000"; d="scan'208";a="10560164"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO
 smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
 by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:20:10 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:19751]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.94:2525] with
 esmtp (Farcaster)
 id 9f3ee95b-244f-4922-a239-ca52bad1a2db; Mon, 12 Jan 2026 09:20:09 +0000 (UTC)
X-Farcaster-Flow-ID: 9f3ee95b-244f-4922-a239-ca52bad1a2db
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 12 Jan 2026 09:20:03 +0000
Received: from dev-dsk-wuboo-2c-a25afee0.us-west-2.amazon.com (172.23.177.110)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 12 Jan 2026 09:20:03 +0000
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Mon, 12 Jan 2026 09:19:58 +0000
Message-ID: <20260112091958.39067-1-wuboo@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Originating-IP: [172.23.177.110]
X-ClientProxiedBy: EX19D046UWA003.ant.amazon.com (10.13.139.18) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ADDRS_PER_INODE and ADDRS_PER_BLOCK are macros of a function,
 and if the compiler does not optimize the code (-O0 for example), they would
 be called in every single loop, which could cause significant [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfELG-00014F-FV
Subject: [f2fs-dev] [PATCH] f2fs-tools: optimize the addrs_per_block/inode
 loop
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <wuboo@amazon.com>
Cc: wubo.oduw@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ADDRS_PER_INODE and ADDRS_PER_BLOCK are macros of a function, and if the
compiler does not optimize the code (-O0 for example), they would be
called in every single loop, which could cause significant performance
drops in some cases.

This scenario has been found before, refer to:
Commit: 1bb669e ("fsck.f2fs: avoid unnecessary recalculation")

To avoid this performance drop as much as possible, I changed the
function to 'inline' definition, which could mitigate such cases in
the future.

Signed-off-by: Wu Bo <wuboo@amazon.com>
---
 fsck/dump.c       |  5 +++--
 fsck/fsck.c       | 15 ++++++++++-----
 fsck/mount.c      |  4 +++-
 include/f2fs_fs.h | 12 +++++++++++-
 lib/libf2fs.c     | 11 -----------
 5 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index f5c95de..a5f344b 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -495,7 +495,7 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 {
 	u32 i = 0;
 	u64 ofs = 0;
-	u32 addr_per_block;
+	u32 addr_per_block, addr_per_inode;
 	u16 type = le16_to_cpu(node_blk->i.i_mode);
 	int ret = 0;
 
@@ -543,9 +543,10 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	}
 
 	addr_per_block = ADDRS_PER_BLOCK(&node_blk->i);
+	addr_per_inode = ADDRS_PER_INODE(&node_blk->i);
 
 	/* check data blocks in inode */
-	for (i = 0; i < ADDRS_PER_INODE(&node_blk->i); i++, ofs++)
+	for (i = 0; i < addr_per_inode; i++, ofs++)
 		dump_data_blk(sbi, ofs * F2FS_BLKSIZE, le32_to_cpu(
 			node_blk->i.i_addr[get_extra_isize(node_blk) + i]), type);
 
diff --git a/fsck/fsck.c b/fsck/fsck.c
index db44f9d..1627bd0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1516,8 +1516,9 @@ int fsck_chk_dnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 	bool compressed = i_flags & F2FS_COMPR_FL;
 	bool compr_rel = inode->i_inline & F2FS_COMPRESS_RELEASED;
 	u32 cluster_size = 1 << inode->i_log_cluster_size;
+	u32 addrs = ADDRS_PER_BLOCK(inode);
 
-	for (idx = 0; idx < ADDRS_PER_BLOCK(inode); idx++, child->pgofs++) {
+	for (idx = 0; idx < addrs; idx++, child->pgofs++) {
 		block_t blkaddr = le32_to_cpu(node_blk->dn.addr[idx]);
 
 		check_extent_info(child, blkaddr, 0);
@@ -1617,6 +1618,7 @@ int fsck_chk_didnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 {
 	int i = 0;
 	int need_fix = 0, ret = 0;
+	u32 addrs = ADDRS_PER_BLOCK(inode);
 
 	fsck_reada_all_direct_node_blocks(sbi, node_blk);
 
@@ -1637,7 +1639,7 @@ int fsck_chk_didnode_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 				FIX_MSG("Set double indirect node 0x%x -> 0", i);
 			}
 skip:
-			child->pgofs += ADDRS_PER_BLOCK(inode) * NIDS_PER_BLOCK;
+			child->pgofs += addrs * NIDS_PER_BLOCK;
 		}
 	}
 
@@ -3173,7 +3175,7 @@ static void fsck_disconnect_file_dnode(struct f2fs_sb_info *sbi,
 {
 	struct f2fs_node *node;
 	struct node_info ni;
-	u32 addr;
+	u32 addr, addr_per_block;
 	int i, err;
 
 	node = calloc(F2FS_BLKSIZE, 1);
@@ -3187,7 +3189,8 @@ static void fsck_disconnect_file_dnode(struct f2fs_sb_info *sbi,
 	release_block_cnt(sbi, dealloc);
 	release_block(sbi, ni.blk_addr, dealloc);
 
-	for (i = 0; i < ADDRS_PER_BLOCK(inode); i++) {
+	addr_per_block = ADDRS_PER_BLOCK(inode);
+	for (i = 0; i < addr_per_block; i++) {
 		addr = le32_to_cpu(node->dn.addr[i]);
 		if (!addr)
 			continue;
@@ -3302,8 +3305,10 @@ static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
 
 	/* clear data counters */
 	if (!(node->i.i_inline & (F2FS_INLINE_DATA | F2FS_INLINE_DENTRY))) {
+		u32 addrs = ADDRS_PER_INODE(&node->i);
+
 		ofs = get_extra_isize(node);
-		for (i = 0; i < ADDRS_PER_INODE(&node->i); i++) {
+		for (i = 0; i < addrs; i++) {
 			block_t addr = le32_to_cpu(node->i.i_addr[ofs + i]);
 			if (!addr)
 				continue;
diff --git a/fsck/mount.c b/fsck/mount.c
index 6f640a0..990f1e0 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -281,6 +281,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 	u32 namelen = le32_to_cpu(inode->i_namelen);
 	int enc_name = file_enc_name(inode);
 	int ofs = get_extra_isize(node);
+	u32 addrs;
 
 	pretty_print_filename(inode->i_name, namelen, en, enc_name);
 	if (name && en[0]) {
@@ -350,7 +351,8 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	for (i = 0; i < ADDRS_PER_INODE(inode); i++) {
+	addrs = ADDRS_PER_INODE(inode);
+	for (i = 0; i < addrs; i++) {
 		block_t blkaddr;
 		char *flag = "";
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 3095b59..d0877b9 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1660,7 +1660,6 @@ struct f2fs_configuration {
 extern int utf8_to_utf16(char *, const char *, size_t, size_t);
 extern int utf16_to_utf8(char *, const char *, size_t, size_t);
 extern int log_base_2(uint32_t);
-extern unsigned int addrs_per_page(struct f2fs_inode *, bool);
 extern u64 f2fs_max_file_offset(struct f2fs_inode *);
 extern __u32 f2fs_inode_chksum(struct f2fs_node *);
 extern __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *);
@@ -2212,4 +2211,15 @@ static inline bool __time_to_inject(int type, const char *func,
 	return false;
 }
 
+static inline unsigned int addrs_per_page(struct f2fs_inode *i, bool is_inode)
+{
+	unsigned int addrs = is_inode ? CUR_ADDRS_PER_INODE(i) -
+		get_inline_xattr_addrs(i) : DEF_ADDRS_PER_BLOCK;
+
+	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
+			!(le32_to_cpu(i->i_flags) & F2FS_COMPR_FL))
+		return addrs;
+	return ALIGN_DOWN(addrs, 1 << i->i_log_cluster_size);
+}
+
 #endif	/*__F2FS_FS_H */
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 1a496b7..13e4d0d 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -516,17 +516,6 @@ opaque_seq:
 	return __f2fs_dentry_hash(name, len);
 }
 
-unsigned int addrs_per_page(struct f2fs_inode *i, bool is_inode)
-{
-	unsigned int addrs = is_inode ? CUR_ADDRS_PER_INODE(i) -
-		get_inline_xattr_addrs(i) : DEF_ADDRS_PER_BLOCK;
-
-	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
-			!(le32_to_cpu(i->i_flags) & F2FS_COMPR_FL))
-		return addrs;
-	return ALIGN_DOWN(addrs, 1 << i->i_log_cluster_size);
-}
-
 u64 f2fs_max_file_offset(struct f2fs_inode *i)
 {
 	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
