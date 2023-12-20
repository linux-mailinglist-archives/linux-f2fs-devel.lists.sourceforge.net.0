Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0908C81A07D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 15:00:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFx7J-0006tO-Hx;
	Wed, 20 Dec 2023 14:00:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFx7H-0006tD-U1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 14:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADmk9SW4UgZx1Gt8dfBrDImUmmYFyOX+V1ThXwqp8CA=; b=FriS97tcILDXZZZEkcoD2u4tJE
 ob+b7vtnBfdlf/LXOIh2gHvbN64U61VPXDcuz+05dR2rDMjXHvY17ilW30pn6iMMAnygJWsMW/kT8
 5/OK2L5cRh8rs1mR2yCMkcMRyn94vqqzlywQVVigv0JF6ovDPhYsoLCvO+tfBZt4A3o8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADmk9SW4UgZx1Gt8dfBrDImUmmYFyOX+V1ThXwqp8CA=; b=mU8gVH4wKUqLY/nGci7spcgI2Q
 ev2NoX1IkMs7ou6HelSv9PBrcIUQGXxka74glFL4oVfCkmyueJbvp+7LRjDreDpH/bv/naFNTAH9U
 bx/WzmUb1Nr1B7r99J5tw5TMO3UXpjGahRUjf8IuOWld9E+8+svaIbH9l59L7Ca8n+80=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFx7C-0001KX-Sn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 14:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76EEE61652
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Dec 2023 13:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAC2C433CB;
 Wed, 20 Dec 2023 13:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703080792;
 bh=W2roxFRnwD7OFBUoZGhnWeFociodl3+VYdCaqAo2V0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rA/+TbY9/3iHsCkeDwv3DGjklnUjcgF96veKb4IYxEeTOefB7KB+7XvuI8qB5jT/h
 3cbxpx5O7v+qc0fzfLQ9FTnTSkx3IJ+851v7UHN0SFcKkFmExcWdFrohLiLEZKDEgH
 rZckz4T6zWbNAU6HrsBZbaotesOY1v3lPOBrgwI/LRdbF4CPv83r9fI3V2YwIR781f
 K4CWRsiy61oSa8uIwRQkStY2nm3F5aKG6WN4tZxnXute+XP3dpkLxbDMkWjS+CxkzV
 ZAtr44wtznR3668+oZvk3VCHLSfI8mEMznTB4ZgFl/X3fsaqN+Cx7JF14MA/V/Ex+1
 HWtB6HauAfwHg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 20 Dec 2023 21:59:34 +0800
Message-Id: <20231220135934.3471407-6-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220135934.3471407-1-chao@kernel.org>
References: <20231220135934.3471407-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We will encounter below inconsistent status when
 FAULT_BLKADDR
 type fault injection is on. Info: checkpoint state = d6 : nat_bits crc fsck
 compacted_summary orphan_inodes sudden-power-off [ASSERT]
 (fsck_chk_inode_blk:1254)
 --> ino: 0x1c100 has i_blocks: 000000c0, but has 191 blocks [FIX] (f [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFx7C-0001KX-Sn
Subject: [f2fs-dev] [PATCH 6/6] f2fs: introduce FAULT_INCONSISTENCE
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We will encounter below inconsistent status when FAULT_BLKADDR type
fault injection is on.

Info: checkpoint state = d6 :  nat_bits crc fsck compacted_summary orphan_inodes sudden-power-off
[ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c100 has i_blocks: 000000c0, but has 191 blocks
[FIX] (fsck_chk_inode_blk:1260)  --> [0x1c100] i_blocks=0x000000c0 -> 0xbf
[FIX] (fsck_chk_inode_blk:1269)  --> [0x1c100] i_compr_blocks=0x00000026 -> 0x27
[ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1cadb has i_blocks: 0000002f, but has 46 blocks
[FIX] (fsck_chk_inode_blk:1260)  --> [0x1cadb] i_blocks=0x0000002f -> 0x2e
[FIX] (fsck_chk_inode_blk:1269)  --> [0x1cadb] i_compr_blocks=0x00000011 -> 0x12
[ASSERT] (fsck_chk_inode_blk:1254)  --> ino: 0x1c62c has i_blocks: 00000002, but has 1 blocks
[FIX] (fsck_chk_inode_blk:1260)  --> [0x1c62c] i_blocks=0x00000002 -> 0x1

After we inject fault into f2fs_is_valid_blkaddr() during truncation,
a) it missed to increase @nr_free or @valid_blocks
b) it can cause in blkaddr leak in truncated dnode
Which may cause inconsistent status.

This patch separates FAULT_INCONSISTENCE from FAULT_BLKADDR, so that
we can:
a) use FAULT_INCONSISTENCE in f2fs_truncate_data_blocks_range() to
simulate inconsistent issue independently,
b) FAULT_BLKADDR fault will not cause any inconsistent status, we can
just use it to check error path handling in kernel side.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
 Documentation/filesystems/f2fs.rst      |  1 +
 fs/f2fs/checkpoint.c                    | 19 +++++++++++++++----
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/file.c                          |  8 ++++++--
 fs/f2fs/super.c                         |  1 +
 6 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 4f1d4e636d67..649aabac16c2 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -708,6 +708,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_DQUOT_INIT         0x000010000
 		FAULT_LOCK_OP            0x000020000
 		FAULT_BLKADDR            0x000040000
+		FAULT_INCONSISTENCE      0x000080000
 		===================      ===========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 5a1686cdd6b4..dfc1e73b17d9 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -209,6 +209,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_DQUOT_INIT	  0x000010000
 			 FAULT_LOCK_OP		  0x000020000
 			 FAULT_BLKADDR		  0x000040000
+			 FAULT_INCONSISTENCE	  0x000080000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f3f3e98fd6b0..b59db6c1932c 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -170,12 +170,9 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	return exist;
 }
 
-bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
+bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (time_to_inject(sbi, FAULT_BLKADDR))
-		return false;
-
 	switch (type) {
 	case META_NAT:
 		break;
@@ -230,6 +227,20 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 	return true;
 }
 
+bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int type)
+{
+	if (time_to_inject(sbi, FAULT_BLKADDR))
+		return false;
+	return __f2fs_is_valid_blkaddr(sbi, blkaddr, type);
+}
+
+bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int type)
+{
+	return __f2fs_is_valid_blkaddr(sbi, blkaddr, type);
+}
+
 /*
  * Readahead CP/NAT/SIT/SSA/POR pages
  */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9487581db08a..49e4de324841 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -61,6 +61,7 @@ enum {
 	FAULT_DQUOT_INIT,
 	FAULT_LOCK_OP,
 	FAULT_BLKADDR,
+	FAULT_INCONSISTENCE,
 	FAULT_MAX,
 };
 
@@ -3787,6 +3788,8 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index);
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type);
+bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int type);
 int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 			int type, bool sync);
 void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4f3ed627f6a1..6c4c739d73b3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -593,9 +593,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 		f2fs_set_data_blkaddr(dn, NULL_ADDR);
 
 		if (__is_valid_data_blkaddr(blkaddr)) {
-			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
-					DATA_GENERIC_ENHANCE))
+			if (time_to_inject(sbi, FAULT_INCONSISTENCE))
+				continue;
+			if (!f2fs_is_valid_blkaddr_raw(sbi, blkaddr,
+						DATA_GENERIC_ENHANCE)) {
+				f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 				continue;
+			}
 			if (compressed_cluster)
 				valid_blocks++;
 		}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 29b9e6e3eb5f..5659166b3918 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_DQUOT_INIT]	= "dquot initialize",
 	[FAULT_LOCK_OP]		= "lock_op",
 	[FAULT_BLKADDR]		= "invalid blkaddr",
+	[FAULT_INCONSISTENCE]	= "inconsistence",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
