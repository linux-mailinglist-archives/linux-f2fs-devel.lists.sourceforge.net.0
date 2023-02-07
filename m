Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7368D9B1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 14:51:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPONt-0003EJ-Ai;
	Tue, 07 Feb 2023 13:51:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pPONr-0003E6-0P
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 13:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wiH33mLmuNZ3Rak7QFaH3fOT5RnoglRoWQYht9hATtw=; b=AcEa8t4huoqORvMm36om0x5VZa
 4ZU0tuwGj2VADmcX+B/MwK7bLHyA+AvvCYOiTYGQoMAOh8jVqpoV3udWCFoiToWmC/I/ESrS/8Uje
 rYQB39u2R2KBEPMjZZ+HrmppmL+SjUt63VyLGrAnmjqea1VI9j/nkU8D8x7xm3mvnPU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wiH33mLmuNZ3Rak7QFaH3fOT5RnoglRoWQYht9hATtw=; b=H
 6M9NOi7y4RPssxJexrdaswD7DJlXm+m9btCvtQ4jjmNk9hwzGknUSfzdVlSycnSViCWeOQMQZ8v8S
 Y+GlvM6mnxUkGBNtFDfLhhoO+Hkfh5DCgJt/H8+7aQBZ0S3ITKSM8batQGOnDZOfkvUnGbhkwcEWm
 gxBZx2Kixpk2p668=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPONl-00DgQH-TA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 13:51:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6460DB81989
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Feb 2023 13:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE599C433D2;
 Tue,  7 Feb 2023 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675777887;
 bh=EZKYBpYclv2eyaC70CMbiuy4/z/DP/rVT2+COP6B7k4=;
 h=From:To:Cc:Subject:Date:From;
 b=H9NN8tCu7JU0D8HHeLsn4x7AQrUS0UMDr+gbWOveIWZQu3Mcaw0QL8enNqhV7rfM4
 fTrxPUwPgECH1whC0b5FELUb43G1/cKOgDLc4Hsgd1JPNo7iTqYljE1iJgj5LlLV4U
 Ur6XPUNoF2OousCijZ7cyey/VQ2uSFgy852BXKCUuRzZR/nWV+8WQoi+ZePQgur9d7
 F1Rzm/f6VIV+T3tTuRvHb6hRCayfWrq3fi9NOjkPxE0vEZObmrT5al9uYnUBg5afuW
 nMeHH5PkVbQ8Gg8LhPHESmYGjIO8WsBCWAMQx77VsGEwtCRSZmbtp3fp/viI3yhM7o
 l9N//kjNLMvgw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue,  7 Feb 2023 21:48:08 +0800
Message-Id: <20230207134808.1827869-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In do_read_inode(), sanity check for extent cache should be
 called after f2fs_init_read_extent_tree(), fix it. Fixes: 72840cccc0a1 ("f2fs:
 allocate the extent_cache by default") Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- v2: - just relocate sanity check on extent cache. fs/f2fs/extent_cache.c
 | 25 ++++++++++ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPONl-00DgQH-TA
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check on extent cache
 correctly
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

In do_read_inode(), sanity check for extent cache should be called after
f2fs_init_read_extent_tree(), fix it.

Fixes: 72840cccc0a1 ("f2fs: allocate the extent_cache by default")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- just relocate sanity check on extent cache.
 fs/f2fs/extent_cache.c | 25 +++++++++++++++++++++++++
 fs/f2fs/f2fs.h         |  1 +
 fs/f2fs/inode.c        | 22 ++++++----------------
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 1daf8c88c09b..d93fcb082c31 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -19,6 +19,31 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
+bool sanity_check_extent_cache(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct extent_info *ei;
+
+	if (!fi->extent_tree[EX_READ])
+		return true;
+
+	ei = &fi->extent_tree[EX_READ]->largest;
+
+	if (ei->len &&
+		(!f2fs_is_valid_blkaddr(sbi, ei->blk,
+					DATA_GENERIC_ENHANCE) ||
+		!f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
+					DATA_GENERIC_ENHANCE))) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
+			  __func__, inode->i_ino,
+			  ei->blk, ei->fofs, ei->len);
+		return false;
+	}
+	return true;
+}
+
 static void __set_extent_info(struct extent_info *ei,
 				unsigned int fofs, unsigned int len,
 				block_t blk, bool keep_clen,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f3c5f7740c1a..8148aeabab03 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4136,6 +4136,7 @@ void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 /*
  * extent_cache.c
  */
+bool sanity_check_extent_cache(struct inode *inode);
 struct rb_entry *f2fs_lookup_rb_tree(struct rb_root_cached *root,
 				struct rb_entry *cached_re, unsigned int ofs);
 struct rb_node **f2fs_lookup_rb_tree_ext(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 01b9e6f85f6b..164779c561f9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -262,22 +262,6 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
-	if (fi->extent_tree[EX_READ]) {
-		struct extent_info *ei = &fi->extent_tree[EX_READ]->largest;
-
-		if (ei->len &&
-			(!f2fs_is_valid_blkaddr(sbi, ei->blk,
-						DATA_GENERIC_ENHANCE) ||
-			!f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
-						DATA_GENERIC_ENHANCE))) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ei->blk, ei->fofs, ei->len);
-			return false;
-		}
-	}
-
 	if (f2fs_sanity_check_inline_data(inode)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
@@ -482,6 +466,12 @@ static int do_read_inode(struct inode *inode)
 	f2fs_init_read_extent_tree(inode, node_page);
 	f2fs_init_age_extent_tree(inode);
 
+	if (!sanity_check_extent_cache(inode)) {
+		f2fs_put_page(node_page, 1);
+		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
+		return -EFSCORRUPTED;
+	}
+
 	f2fs_put_page(node_page, 1);
 
 	stat_inc_inline_xattr(inode);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
