Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8152F7004A3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 May 2023 12:04:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pxPdT-00009M-RA;
	Fri, 12 May 2023 10:04:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pxPdS-00009G-BA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 10:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Se97dhIGY3W+s+ekmGDeCmU+PPtEE1/bdv9KHq2fpFA=; b=caY4MSsmjdveiXo5AjE1+B/lgZ
 yv0kt7CYXFR7r/EEWiMMK4F83iNsB5vmS47mXswFXgRmvzgOd53R1ONVAIYvaIH1BkgTr9d0NXWcz
 deKS/PdH2oxL76Z/K1A3Gka5Ypoo/ogtUy5Msi7RjqNNj2fVqrN3CQInyGAVN0/a7XY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Se97dhIGY3W+s+ekmGDeCmU+PPtEE1/bdv9KHq2fpFA=; b=NCJrSFxJYe3HzJqIb6tFQZ/xL8
 9xk6uXGpV25DIw1aYOpQCyStrt7fFeGeSYa/2efRtr20ABM2AkwPX7pTPZUv3G8smsxIb129NLJGD
 XWiwQjGRTg0EstZizcCnKNWo8EkXeWnuDsG/fE9A/DXaGLpc3MNsyWYy68RyHYlCp5pc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pxPdS-004LeP-14 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 10:04:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A44A060B7D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 May 2023 10:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B68C4339B;
 Fri, 12 May 2023 10:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683885860;
 bh=0I9BcCMbg57042PZ9psBsrZc7/NzJdfA0pvmLIQsofc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sxVr3zAV2U9ua15LmyfsyrwR9kmds5ZYQqLmKCB2W5OTJmp50l0rbbpvz/i+c7S6r
 nxhh2mOSAOrzbN+J/oRF8QCXx2oDvMsSz/cknAuGowk88vvKITNSqRiZoLcFgvir4V
 ng+8viaujQX0LtejetXUPTLY1UZJ0IVDUaBq3PoDnCqIf4XPObc0E6oqJtmO2zYA3r
 VbTdWocw1OofgBCHMC9LVPvrmNzk8LPhIuWdMx0OBp+wYEwKslMhD2nBvUfLPq9OhF
 amVaTNbYDyFsZXERNU+R5S1WPzuDMAmdHGZT/Gjxq9phI7HE45Zl1i70yQ9U6SMLk/
 KO1E6laIpOX3w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 12 May 2023 18:03:52 +0800
Message-Id: <20230512100354.4072489-2-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512100354.4072489-1-chao@kernel.org>
References: <20230512100354.4072489-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  use f2fs_is_valid_blkaddr() instead of IS_VALID_BLK_ADDR()
 to check validity of data/node's block address. use is_valid_data_blkaddr()
 in sanity_check_nid() to check NULL_ADDR as NEW_ADDR, and print the value
 in error path explicitly. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pxPdS-004LeP-14
Subject: [f2fs-dev] [PATCH 2/4] fsck.f2fs: use f2fs_is_valid_blkaddr()
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

use f2fs_is_valid_blkaddr() instead of IS_VALID_BLK_ADDR() to
check validity of data/node's block address.

use is_valid_data_blkaddr() in sanity_check_nid() to check NULL_ADDR
as NEW_ADDR, and print the value in error path explicitly.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/dump.c  |  5 +++--
 fsck/f2fs.h  | 15 +--------------
 fsck/fsck.c  | 23 +++++++++++++----------
 fsck/fsck.h  |  2 ++
 fsck/mount.c |  4 +++-
 5 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index b8f6144..dd1f0ab 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -278,7 +278,8 @@ static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
 		return;
 
 	/* get data */
-	if (blkaddr == NEW_ADDR || !IS_VALID_BLK_ADDR(sbi, blkaddr)) {
+	if (blkaddr == NEW_ADDR ||
+			!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC)) {
 		memset(buf, 0, F2FS_BLKSIZE);
 	} else {
 		int ret;
@@ -588,7 +589,7 @@ int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 	DBG(1, "nat_entry.version     [0x%x]\n", ni.version);
 	DBG(1, "nat_entry.ino         [0x%x]\n", ni.ino);
 
-	if (!IS_VALID_BLK_ADDR(sbi, ni.blk_addr)) {
+	if (!f2fs_is_valid_blkaddr(sbi, ni.blk_addr, DATA_GENERIC)) {
 		MSG(force, "Invalid node blkaddr: %u\n\n", ni.blk_addr);
 		goto out;
 	}
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index e65644e..9791071 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -108,6 +108,7 @@ enum {
 	META_SSA,
 	META_MAX,
 	META_POR,
+	DATA_GENERIC,
 };
 
 #define MAX_RA_BLOCKS	64
@@ -520,20 +521,6 @@ static inline bool IS_VALID_NID(struct f2fs_sb_info *sbi, u32 nid)
 			<< (sbi->log_blocks_per_seg - 1)));
 }
 
-static inline bool IS_VALID_BLK_ADDR(struct f2fs_sb_info *sbi, u32 addr)
-{
-	if (addr == NULL_ADDR || addr == NEW_ADDR)
-		return 1;
-
-	if (addr >= le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count) ||
-				addr < SM_I(sbi)->main_blkaddr) {
-		DBG(1, "block addr [0x%x]\n", addr);
-		return 0;
-	}
-	/* next block offset will be checked at the end of fsck. */
-	return 1;
-}
-
 static inline bool is_valid_data_blkaddr(block_t blkaddr)
 {
 	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR ||
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 64db1e5..9180deb 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -236,7 +236,7 @@ static int is_valid_summary(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 	get_node_info(sbi, nid, &ni);
 
-	if (!IS_VALID_BLK_ADDR(sbi, ni.blk_addr))
+	if (!f2fs_is_valid_blkaddr(sbi, ni.blk_addr, DATA_GENERIC))
 		goto out;
 
 	/* read node_block */
@@ -405,12 +405,12 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 		return -EINVAL;
 	}
 
-	if (ni->blk_addr == NEW_ADDR) {
-		ASSERT_MSG("nid is NEW_ADDR. [0x%x]", nid);
+	if (!is_valid_data_blkaddr(ni->blk_addr)) {
+		ASSERT_MSG("nid->blk_addr is 0x%x. [0x%x]", ni->blk_addr, nid);
 		return -EINVAL;
 	}
 
-	if (!IS_VALID_BLK_ADDR(sbi, ni->blk_addr)) {
+	if (!f2fs_is_valid_blkaddr(sbi, ni->blk_addr, DATA_GENERIC)) {
 		ASSERT_MSG("blkaddress is not valid. [0x%x]", ni->blk_addr);
 		return -EINVAL;
 	}
@@ -676,7 +676,7 @@ void fsck_reada_node_block(struct f2fs_sb_info *sbi, u32 nid)
 
 	if (nid != 0 && IS_VALID_NID(sbi, nid)) {
 		get_node_info(sbi, nid, &ni);
-		if (IS_VALID_BLK_ADDR(sbi, ni.blk_addr))
+		if (f2fs_is_valid_blkaddr(sbi, ni.blk_addr, DATA_GENERIC))
 			dev_reada_block(ni.blk_addr);
 	}
 }
@@ -1612,7 +1612,8 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 			struct node_info ni;
 
 			get_node_info(sbi, ino, &ni);
-			if (IS_VALID_BLK_ADDR(sbi, ni.blk_addr)) {
+			if (f2fs_is_valid_blkaddr(sbi, ni.blk_addr,
+							DATA_GENERIC)) {
 				dev_reada_block(ni.blk_addr);
 				name_len = le16_to_cpu(dentry[i].name_len);
 				if (name_len > 0)
@@ -1867,7 +1868,7 @@ int fsck_chk_data_blk(struct f2fs_sb_info *sbi, int casefolded,
 		return 0;
 	}
 
-	if (!IS_VALID_BLK_ADDR(sbi, blk_addr)) {
+	if (!f2fs_is_valid_blkaddr(sbi, blk_addr, DATA_GENERIC)) {
 		ASSERT_MSG("blkaddress is not valid. [0x%x]", blk_addr);
 		return -EINVAL;
 	}
@@ -1939,7 +1940,8 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 			if (c.preen_mode == PREEN_MODE_1 && !c.fix_on) {
 				get_node_info(sbi, ino, &ni);
 				if (!IS_VALID_NID(sbi, ino) ||
-				    !IS_VALID_BLK_ADDR(sbi, ni.blk_addr)) {
+					!f2fs_is_valid_blkaddr(sbi, ni.blk_addr,
+								DATA_GENERIC)) {
 					free(orphan_blk);
 					free(new_blk);
 					return -EINVAL;
@@ -1997,7 +1999,8 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
 		if (c.preen_mode == PREEN_MODE_1 && !c.fix_on) {
 			get_node_info(sbi, ino, &ni);
 			if (!IS_VALID_NID(sbi, ino) ||
-					!IS_VALID_BLK_ADDR(sbi, ni.blk_addr))
+				!f2fs_is_valid_blkaddr(sbi, ni.blk_addr,
+							DATA_GENERIC))
 				return -EINVAL;
 			continue;
 		}
@@ -2136,7 +2139,7 @@ int fsck_chk_meta(struct f2fs_sb_info *sbi)
 			 */
 			continue;
 
-		if (!IS_VALID_BLK_ADDR(sbi, blk)) {
+		if (!f2fs_is_valid_blkaddr(sbi, blk, DATA_GENERIC)) {
 			MSG(0, "\tError: nat entry[ino %u block_addr 0x%x]"
 				" is in valid\n",
 				ino, blk);
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 02dcff8..89b1c6e 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -216,6 +216,8 @@ extern int f2fs_set_sit_bitmap(struct f2fs_sb_info *, u32);
 extern void fsck_init(struct f2fs_sb_info *);
 extern int fsck_verify(struct f2fs_sb_info *);
 extern void fsck_free(struct f2fs_sb_info *);
+extern bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int type);
 extern int f2fs_ra_meta_pages(struct f2fs_sb_info *, block_t, int, int);
 extern int f2fs_do_mount(struct f2fs_sb_info *);
 extern void f2fs_do_umount(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index 16c98cc..f0b0072 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -767,6 +767,7 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 			return 0;
 		break;
 	case META_POR:
+	case DATA_GENERIC:
 		if (blkaddr >= MAX_BLKADDR(sbi) ||
 			blkaddr < MAIN_BLKADDR(sbi))
 			return 0;
@@ -1596,7 +1597,8 @@ static int f2fs_early_init_nid_bitmap(struct f2fs_sb_info *sbi)
 		block_t addr;
 
 		addr = le32_to_cpu(nat_in_journal(journal, i).block_addr);
-		if (!IS_VALID_BLK_ADDR(sbi, addr)) {
+		if (addr != NULL_ADDR &&
+			!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: addr(%u) is invalid!!!\n", addr);
 			journal->n_nats = cpu_to_le16(i);
 			c.fix_on = 1;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
