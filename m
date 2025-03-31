Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DEA76EC3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWV-0001Ge-Ud;
	Mon, 31 Mar 2025 20:14:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVp-0000s3-LF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0KMW5u7RQFuQg9pTf9bg4uW8mOx3NlfSriXtDRc11gg=; b=jU3wKFEKnb/ozFUQKoZJUmzVY4
 YoA+d6BEyOEirsU1OYal9Xwew6GirUnTkhF8ZTPR57SORTy/FawfsM07cyIZWOsY8xoI8FuML8peW
 qRNQxrRaq1XdVwUchFGZCH9DywRFksVzyTxYXHcws3JLQjhPa6uzv8WbmRYIRhdZOer0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0KMW5u7RQFuQg9pTf9bg4uW8mOx3NlfSriXtDRc11gg=; b=AZM9hHh5EkpKGvdYxIp1JZ8L0A
 eeOK9b9m8ryJOJUIo/KFZmr16KRiBPz2mJjfr5JTWiWsaSdyFXaNfIOGztUgcgDVVQbcrHw4R68D+
 wU5JQdUqh8zIwYnN9zU3HwaD52H/cBv0jxnLYHLaXlAbJ6q9XnGqlCRvnvHId7Cz7oZE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVp-0003i7-8D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=0KMW5u7RQFuQg9pTf9bg4uW8mOx3NlfSriXtDRc11gg=; b=WugbRn5k62b7VHU3Pe7mTbgndc
 41tkjuBzs/Y4ENtDySmX/vT/HDJf0T4xmwi6DmuKxT1iaN/eWIK5l6OXmrUEjrO8fBLWiPN1ZAFmM
 SuIEkCoRuvQGcw6EI5Ka2CTAc1A/JvCf24wkFYeILXE/jji7WVVwYfbhqC7BlKI4t9B48pSkA2OMs
 0KCtfSh9mF7lnuveXi0/NAuaFr8hd+tQFGXWzJNzkoHALqVl2gQS8r8OyBFAwLgM0MXj5V2jlBGX8
 m/NF62Zfil5rzlmeUMUXceEY+MMTgW7To+5Ka3FSUHWneWlqQ7XvMW4ngIIbHqpRGNrOnnj50ccpJ
 UX2fISsw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVd-00000004Sci-3Uvs;
 Mon, 31 Mar 2025 20:13:25 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:45 +0100
Message-ID: <20250331201256.1057782-146-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert all three callers to handle a folio return. Remove
 three calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 30 +++++++++++++++ fs/f2fs/f2fs.h | 2 +- fs/f2fs/inline.c
 | 12 ++++++------ 3 files changed, 22 insertio [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVp-0003i7-8D
Subject: [f2fs-dev] [PATCH 145/153] f2fs: Return a folio from
 f2fs_init_inode_metadata()
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

Convert all three callers to handle a folio return.  Remove three
calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c    | 30 +++++++++++++++---------------
 fs/f2fs/f2fs.h   |  2 +-
 fs/f2fs/inline.c | 12 ++++++------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 4eafdb1d1bc0..7e35192de2d9 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -514,7 +514,7 @@ static int make_empty_dir(struct inode *inode,
 	return 0;
 }
 
-struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
+struct folio *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		const struct f2fs_filename *fname, struct folio *dfolio)
 {
 	struct folio *folio;
@@ -523,7 +523,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 	if (is_inode_flag_set(inode, FI_NEW_INODE)) {
 		folio = f2fs_new_inode_folio(inode);
 		if (IS_ERR(folio))
-			return &folio->page;
+			return folio;
 
 		if (S_ISDIR(inode->i_mode)) {
 			/* in order to handle error case */
@@ -554,7 +554,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 	} else {
 		folio = f2fs_get_inode_folio(F2FS_I_SB(dir), inode->i_ino);
 		if (IS_ERR(folio))
-			return &folio->page;
+			return folio;
 	}
 
 	init_dent_inode(dir, inode, fname, folio);
@@ -574,7 +574,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			f2fs_remove_orphan_inode(F2FS_I_SB(dir), inode->i_ino);
 		f2fs_i_links_write(inode, true);
 	}
-	return &folio->page;
+	return folio;
 
 put_error:
 	clear_nlink(inode);
@@ -668,7 +668,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	struct folio *dentry_folio = NULL;
 	struct f2fs_dentry_block *dentry_blk = NULL;
 	struct f2fs_dentry_ptr d;
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int slots, err = 0;
 
 	level = 0;
@@ -719,9 +719,9 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 
 	if (inode) {
 		f2fs_down_write(&F2FS_I(inode)->i_sem);
-		page = f2fs_init_inode_metadata(inode, dir, fname, NULL);
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
+		folio = f2fs_init_inode_metadata(inode, dir, fname, NULL);
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			goto fail;
 		}
 	}
@@ -737,9 +737,9 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 
 		/* synchronize inode page's data from inode cache */
 		if (is_inode_flag_set(inode, FI_NEW_INODE))
-			f2fs_update_inode(inode, page);
+			f2fs_update_inode(inode, &folio->page);
 
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 	}
 
 	f2fs_update_parent_metadata(dir, inode, current_depth);
@@ -815,16 +815,16 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 int f2fs_do_tmpfile(struct inode *inode, struct inode *dir,
 					struct f2fs_filename *fname)
 {
-	struct page *page;
+	struct folio *folio;
 	int err = 0;
 
 	f2fs_down_write(&F2FS_I(inode)->i_sem);
-	page = f2fs_init_inode_metadata(inode, dir, fname, NULL);
-	if (IS_ERR(page)) {
-		err = PTR_ERR(page);
+	folio = f2fs_init_inode_metadata(inode, dir, fname, NULL);
+	if (IS_ERR(folio)) {
+		err = PTR_ERR(folio);
 		goto fail;
 	}
-	f2fs_put_page(page, 1);
+	f2fs_folio_put(folio, true);
 
 	clear_inode_flag(inode, FI_NEW_INODE);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ff0b1d57e103..5d7d51c97bbf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3648,7 +3648,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			unsigned int start_pos, struct fscrypt_str *fstr);
 void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
 			struct f2fs_dentry_ptr *d);
-struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
+struct folio *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		const struct f2fs_filename *fname, struct folio *dfolio);
 void f2fs_update_parent_metadata(struct inode *dir, struct inode *inode,
 			unsigned int current_depth);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index b7d160736630..3b65adb4d1b0 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -641,7 +641,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	void *inline_dentry = NULL;
 	struct f2fs_dentry_ptr d;
 	int slots = GET_DENTRY_SLOTS(fname->disk_name.len);
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int err = 0;
 
 	ifolio = f2fs_get_inode_folio(sbi, dir->i_ino);
@@ -663,9 +663,9 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	if (inode) {
 		f2fs_down_write_nested(&F2FS_I(inode)->i_sem,
 						SINGLE_DEPTH_NESTING);
-		page = f2fs_init_inode_metadata(inode, dir, fname, ifolio);
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
+		folio = f2fs_init_inode_metadata(inode, dir, fname, ifolio);
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			goto fail;
 		}
 	}
@@ -683,9 +683,9 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 
 		/* synchronize inode page's data from inode cache */
 		if (is_inode_flag_set(inode, FI_NEW_INODE))
-			f2fs_update_inode(inode, page);
+			f2fs_update_inode(inode, &folio->page);
 
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 	}
 
 	f2fs_update_parent_metadata(dir, inode, 0);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
