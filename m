Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9396C81E12D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Dec 2023 15:44:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rHmBw-0003yD-SQ;
	Mon, 25 Dec 2023 14:44:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rHmBt-0003y6-NS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Dec 2023 14:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BYbGJl3Q8xEWgHvvYl8CnVyu3Nhc0hrAIFuc32ZBO+s=; b=kHIycCoHCSXsIjdNfOn8D8I4my
 oKuoIfEwG74U/+LM1Q/ZDSSoY7KNVxywA+mdh1yt4vzeEkqqeJ5FANsEENyEHJ/CQ2pqbik04PyxS
 KCuKGCOER4b5rKIZ2c1+m3JDCZ/mj6oIIUnBTuKLhntkHI4Ql7QElStXTMKqdCBCZakY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BYbGJl3Q8xEWgHvvYl8CnVyu3Nhc0hrAIFuc32ZBO+s=; b=k
 BN3EP023cCWpM5sTI9VgeKPcf7KU+u+k+DVna4QQVBRiwPRQtG1TteNViGK8v4eSkduh/EZvVWkyJ
 Ba+mOrbiPlmujOTR9naGK2jElegU+pBKG3URbB/umPyIYNo23gxNCarf1kzoaCJ9mptChhAOTCiyD
 IKJ2sOX+21el+M/E=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rHmBp-0007JO-3r for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Dec 2023 14:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EDCADCE0E3F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Dec 2023 14:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF10C433C8;
 Mon, 25 Dec 2023 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703515443;
 bh=FbY9QBJBiyqXrDGgjmB+P034Jl9J++LoZZprGV5Z3vw=;
 h=From:To:Cc:Subject:Date:From;
 b=qf2Rfm+eYzv6YconpiHTHxKUR8SQ1YIuspZxMVGLA6FheWm9SirxgDesFSI5EaK1a
 XHXzB3YsgqxbmJvDqj+wrXE9q4/ZjHjxtMPXFaR/t75DFCAwuJmvZN7+/gV5nGVxAs
 oaFqehpK6TEDhD7DXSHxe1sL/oPDHYLsdtuTddzi5lvxN+885EMWXhRaFXwNYKiQqk
 f2yPpGJVq0qWwNscYjm3jcG0tPk4G7U1Hqp/IrIP/tsg4STSN2ERTfVaHOsaQnCyCs
 ZMzDskQxu95lwGEuv52xPEm26vdz5w+Z+ASzfjcx+UNLmS5pPxx3iQmx/fsx8TG8ts
 1GZyv45y/qOHQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 25 Dec 2023 22:43:35 +0800
Message-Id: <20231225144335.2548-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
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
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rHmBp-0007JO-3r
Subject: [f2fs-dev] [PATCH v2 6/6] f2fs: introduce FAULT_INCONSISTENCE
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
v2:
- make __f2fs_is_valid_blkaddr() void.
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
index d32c6209685d..5616fb8ae207 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -206,6 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_DQUOT_INIT	  0x000010000
 			 FAULT_LOCK_OP		  0x000020000
 			 FAULT_BLKADDR		  0x000040000
+			 FAULT_INCONSISTENCE	  0x000080000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index b0597a539fc5..84546f529cf0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -170,12 +170,9 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 	return exist;
 }
 
-bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
+static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
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
index 34b20700b5ec..3985296e64cb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -61,6 +61,7 @@ enum {
 	FAULT_DQUOT_INIT,
 	FAULT_LOCK_OP,
 	FAULT_BLKADDR,
+	FAULT_INCONSISTENCE,
 	FAULT_MAX,
 };
 
@@ -3767,6 +3768,8 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index);
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type);
+bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int type);
 int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 			int type, bool sync);
 void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9f4e21b5916c..b5149f1f2a20 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -590,9 +590,13 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
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
index 206d03c82d96..9a5c5e06f766 100644
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
