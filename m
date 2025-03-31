Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5EA76E9A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW9-0001I2-Ez;
	Mon, 31 Mar 2025 20:13:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVl-000148-DO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qqJgHY6T4XT4JCbFXonzoCc6lLxhHv61KFaTLvITsRs=; b=BumZR5ZA77p7Ld5nA9GvGPGYVL
 Sf4QXM89v8b1030F/a9RPgjyjZmgdJfDTAy+GOfZr8Q6OJlt58LpfpXfhAe+ra/n//VpVjdmKMsCS
 QGsv4s2Y9sQmCgqKaQyJeyh4BsDWTtnDZQvCqRBwOevl3Bf6KOcbpE2x4tKLc/oFg9bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qqJgHY6T4XT4JCbFXonzoCc6lLxhHv61KFaTLvITsRs=; b=RsYm3V7fg4dE+rIf2+mjbH8lQ6
 ATyoTjiNx3hgCPmVG9l5L4TnsVTcDvLlRXUPvB63nYvCoxnEcTFQQ8TDzlb1pzfABdEn99Dv0lzOg
 zLXIwFCcMs2C2HrROy3Mux2HTuDVd67qpwCRFik1tDiRwhLkzJ+kUSoLUaQ41wZF3k5s=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVb-0003by-JG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qqJgHY6T4XT4JCbFXonzoCc6lLxhHv61KFaTLvITsRs=; b=cxu50RO+AcCI5bN6ns0wpJuZbA
 sdlk98W90SZ9CPEnpr1vTC9Osz1Si0kJjNtgLD5t8XJRUmzJr74FMuW2Xzx66ZyzDLK7pwoawVowa
 s8rdKfCkMlh1VQtLiW5hJgrhZL/REcm3hAUX/fDVukX5/mUyl5KJGxH8uUQjZGQdJqNCb0NJiz/iS
 w7wFyFy+Znwg/UoC03Yf7T0QBED+NFf/oVg9CpW2XANv0eRQjHhEC9luNYb06BqK+uSZr09pf5Y/o
 15UCdJ7PFVf8cSPUGPeFMFWyHvWuX7ibbLFaizn321OzCQZ0ITG+prFISvJVTqGIkN6xncuhkpMf1
 43/1V+BA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVU-00000004S7B-3q7Q;
 Mon, 31 Mar 2025 20:13:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:53 +0100
Message-ID: <20250331201256.1057782-94-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Removes two calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/file.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-) diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c index 90e71b54e1d0..f6835c0d1ce8 100644 --- a/fs/f2fs/file.c
 +++ b/fs/f2fs/file.c @@ -743,7 +743,7 @@ int f2fs_do_truncate_blocks(struct
 inode *inode, u64 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVb-0003by-JG
Subject: [f2fs-dev] [PATCH 093/153] f2fs: Use a folio in
 f2fs_do_truncate_blocks()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Removes two calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/file.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 90e71b54e1d0..f6835c0d1ce8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -743,7 +743,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	struct dnode_of_data dn;
 	pgoff_t free_from;
 	int count = 0, err = 0;
-	struct page *ipage;
+	struct folio *ifolio;
 	bool truncate_page = false;
 
 	trace_f2fs_truncate_blocks_enter(inode, from);
@@ -761,9 +761,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	if (lock)
 		f2fs_lock_op(sbi);
 
-	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
-	if (IS_ERR(ipage)) {
-		err = PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+	if (IS_ERR(ifolio)) {
+		err = PTR_ERR(ifolio);
 		goto out;
 	}
 
@@ -776,18 +776,18 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		dec_valid_block_count(sbi, inode, ei.len);
 		f2fs_update_time(sbi, REQ_TIME);
 
-		f2fs_put_page(ipage, 1);
+		f2fs_folio_put(ifolio, true);
 		goto out;
 	}
 
 	if (f2fs_has_inline_data(inode)) {
-		f2fs_truncate_inline_inode(inode, ipage, from);
-		f2fs_put_page(ipage, 1);
+		f2fs_truncate_inline_inode(inode, &ifolio->page, from);
+		f2fs_folio_put(ifolio, true);
 		truncate_page = true;
 		goto out;
 	}
 
-	set_new_dnode(&dn, inode, ipage, NULL, 0);
+	set_new_dnode(&dn, inode, &ifolio->page, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
 		if (err == -ENOENT)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
