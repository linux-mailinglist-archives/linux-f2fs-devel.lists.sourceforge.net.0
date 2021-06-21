Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAEC3AE1B5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jun 2021 04:40:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lv9rs-0004hL-I7; Mon, 21 Jun 2021 02:40:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lv9rb-0004fa-AR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JgjIeekDbanTO+e1c9pWtywPrBcSZp7nltvbQa4+mmQ=; b=nDBZLo7u+cqnrmw8zj+J/feR6m
 nv/NUg9fQj1x2vbR7P7ijpNMadjYodoFOw4vtTmQoyCr5RtuUBDq1wb6LrLgoJH3Eot3SydfElDgs
 bBG/DAhoL0XZCwzmDGyj4z3uQoghrQfufd72gL4BCaIfCZZ8fHaAK7rHIb8FTjHmCyVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JgjIeekDbanTO+e1c9pWtywPrBcSZp7nltvbQa4+mmQ=; b=X
 DZjli4HJ3Zlk7LIn0zzyWhNj39I77Qz+3Fq7Dke5KDboVw7rXxjfGwDXNydNCWHKBlv4B52wCKBfu
 1bq7YEyS8Fc+At1DtJGxhooFA19JHQnLmQNtd1bKGz6xYE0v2OebC2lfBEoFHj+TXYce5vFSkfGlz
 /RzFG4oS8XFOcfvs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lv9rV-0005Ed-90
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:40:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A9506117A;
 Mon, 21 Jun 2021 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624243229;
 bh=kvA/863X51D5uuCExsqTAZJw9OimySqMMSVIU2Op2YE=;
 h=From:To:Cc:Subject:Date:From;
 b=CZv9pbMWPrzni0vevDUjAs3JnoDYWodl76e62ay6jo0FyyVcun5R/YRxyneOIAngX
 zKRoNdMairPxKeihcsJa7McHeMdVuEHPzjQ/Wywt/afdKsyZg9HglfxXvDnY04oHUm
 OHyqeWq3uG1P4GXh9djNKNsOYYD2FXdxYlPoYviW6utjMIoxWvQ2EaTGe+zRGCuHHV
 KZXGnYw4FfgD3tCq/vd4pXmV1KIL3vjEAcwRXZzjLOX9CjwSBzazEIJMgh8CGhgj1q
 sHLoTnmChbrJrROcL8OmY/XEHSMnkeENN+h90537IrgNw7XognJLWTGCmH2QMhUyca
 aBk07OdNgHKyA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Jun 2021 19:40:27 -0700
Message-Id: <20210621024027.1511092-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [198.145.29.99 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lv9rV-0005Ed-90
Subject: [f2fs-dev] [PATCH] f2fs: enable extent cache for compression files
 in read-only
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Let's allow extent cache for RO partition.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d84e78dabdbe..16ce1ade9fa6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3148,25 +3148,6 @@ static inline bool is_dot_dotdot(const u8 *name, size_t len)
 	return false;
 }
 
-static inline bool f2fs_may_extent_tree(struct inode *inode)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-
-	if (!test_opt(sbi, EXTENT_CACHE) ||
-			is_inode_flag_set(inode, FI_NO_EXTENT) ||
-			is_inode_flag_set(inode, FI_COMPRESSED_FILE))
-		return false;
-
-	/*
-	 * for recovered files during mount do not create extents
-	 * if shrinker is not registered.
-	 */
-	if (list_empty(&sbi->s_list))
-		return false;
-
-	return S_ISREG(inode->i_mode);
-}
-
 static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
@@ -4201,6 +4182,26 @@ F2FS_FEATURE_FUNCS(casefold, CASEFOLD);
 F2FS_FEATURE_FUNCS(compression, COMPRESSION);
 F2FS_FEATURE_FUNCS(readonly, RO);
 
+static inline bool f2fs_may_extent_tree(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+	if (!test_opt(sbi, EXTENT_CACHE) ||
+			is_inode_flag_set(inode, FI_NO_EXTENT) ||
+			(is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
+			 !f2fs_sb_has_readonly(sbi)))
+		return false;
+
+	/*
+	 * for recovered files during mount do not create extents
+	 * if shrinker is not registered.
+	 */
+	if (list_empty(&sbi->s_list))
+		return false;
+
+	return S_ISREG(inode->i_mode);
+}
+
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_blkz_is_seq(struct f2fs_sb_info *sbi, int devi,
 				    block_t blkaddr)
-- 
2.32.0.288.g62a8d224e6-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
