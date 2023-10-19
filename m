Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 364057D0509
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Oct 2023 00:53:24 +0200 (CEST)
Received: from localhost.localdomain ([127.0.0.1] helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qtbtI-0007Fi-Ac;
	Thu, 19 Oct 2023 22:53:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qtbtG-0007Fc-J3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Oct 2023 22:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4//1+Uku9L+1zjRnQAQkz1oR+40rnzzYRRrMVtCQR7c=; b=jviIzbu22iBPakve505icaVOjG
 F1RWEuivj0bQ5++XU5z8SgtJwjtwxFdbCqyri+BHwKiSPtfNM/Mwi7pqWSPKiqubmOqzo3Ew1XTVz
 k5MBVN4VuRczNBXZe2BFgkFUu0fODEPTCdhX/bCTN0roT0ugJb+bJvSqo8LPv9MhEzVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4//1+Uku9L+1zjRnQAQkz1oR+40rnzzYRRrMVtCQR7c=; b=V
 oy6fCZyjlPEq3d2cTR/7dTGHohH6UNZoLUE9+JkjJuY0uWrhIZLnTA5rnefdxqMGsgEN1EYFOf7YR
 ns22tghNAr/jlHGO4lx9MTiK77FBFTkXXwMnpQrqMXFVfnGoaqtdld9l2HnGusDS7Ru0+hkLkatkN
 BIu0BfbvAk0/zo1s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qtbt9-003m4C-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Oct 2023 22:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE542619EC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Oct 2023 22:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2BAC433C8;
 Thu, 19 Oct 2023 22:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697755983;
 bh=4QWPJAIM+Q/aCyrT5OkgDDJq9iMWdUi9V0YvpsfpZ88=;
 h=From:To:Cc:Subject:Date:From;
 b=aVduFb5pNRpQcQMJiDrYPHiDS0fntkHHzp9NxGuevyHM93LUoA0kRcOpYlxWFSnAj
 Ag4/ybpQRGHtmBx2JTAJrMWPe5Dy33FiPkmVqJy7aAtwWVo8E89ng1poSJGMhYO3cY
 2jYHMM4+YvQ4AT4KVVdqH8yArboj7T3w3Fij5A4ucvAEgoMAVLKsPJw64J4ZQqfO3Q
 M1wAodPDnYW6xBPvZx50gzd6k3JSSf44scmp0B4Vw45fn16Urrq+qCHS+xJj6h1X4t
 aeJyXyrTTU9MFgGZKCkPXrzCkjtr+uuUxXyhbEX0y3AfyoyaMfxcAr7n+RIT8AYbwP
 WOCyxpG3HETWw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 Oct 2023 15:53:00 -0700
Message-ID: <20231019225300.1846362-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If we return the error, there's no way to recover the status
 as of now,
 since fsck does not fix the xattr boundary issue. Cc: stable@vger.kernel.org
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/node.c | 4 +++-
 fs/f2fs/xattr.c | 20 +++++++++++++------- 2 files changed, 16 insertions(+),
 8 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qtbt9-003m4C-P3
Subject: [f2fs-dev] [PATCH] f2fs: do not return EFSCORRUPTED,
 but try to run online repair
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If we return the error, there's no way to recover the status as of now, since
fsck does not fix the xattr boundary issue.

Cc: stable@vger.kernel.org
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c  |  4 +++-
 fs/f2fs/xattr.c | 20 +++++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1c8bf56c834c..256270d6a065 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2750,7 +2750,9 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 	f2fs_update_inode_page(inode);
 
 	/* 3: update and set xattr node page dirty */
-	memcpy(F2FS_NODE(xpage), F2FS_NODE(page), VALID_XATTR_BLOCK_SIZE);
+	if (page)
+		memcpy(F2FS_NODE(xpage), F2FS_NODE(page),
+				VALID_XATTR_BLOCK_SIZE);
 
 	set_page_dirty(xpage);
 	f2fs_put_page(xpage, 1);
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index a657284faee3..465d145360de 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -364,10 +364,10 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 
 	*xe = __find_xattr(cur_addr, last_txattr_addr, NULL, index, len, name);
 	if (!*xe) {
-		f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
+		f2fs_err(F2FS_I_SB(inode), "lookup inode (%lu) has corrupted xattr",
 								inode->i_ino);
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-		err = -EFSCORRUPTED;
+		err = -ENODATA;
 		f2fs_handle_error(F2FS_I_SB(inode),
 					ERROR_CORRUPTED_XATTR);
 		goto out;
@@ -584,13 +584,12 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 
 		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
 			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
-			f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
+			f2fs_err(F2FS_I_SB(inode), "list inode (%lu) has corrupted xattr",
 						inode->i_ino);
 			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
-			error = -EFSCORRUPTED;
 			f2fs_handle_error(F2FS_I_SB(inode),
 						ERROR_CORRUPTED_XATTR);
-			goto cleanup;
+			break;
 		}
 
 		if (!prefix)
@@ -650,7 +649,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 
 	if (size > MAX_VALUE_LEN(inode))
 		return -E2BIG;
-
+retry:
 	error = read_all_xattrs(inode, ipage, &base_addr);
 	if (error)
 		return error;
@@ -660,7 +659,14 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	/* find entry with wanted name. */
 	here = __find_xattr(base_addr, last_base_addr, NULL, index, len, name);
 	if (!here) {
-		f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
+		if (!F2FS_I(inode)->i_xattr_nid) {
+			f2fs_notice(F2FS_I_SB(inode),
+				"recover xattr in inode (%lu)", inode->i_ino);
+			f2fs_recover_xattr_data(inode, NULL);
+			kfree(base_addr);
+			goto retry;
+		}
+		f2fs_err(F2FS_I_SB(inode), "set inode (%lu) has corrupted xattr",
 								inode->i_ino);
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 		error = -EFSCORRUPTED;
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
