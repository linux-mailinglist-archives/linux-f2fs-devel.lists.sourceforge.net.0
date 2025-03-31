Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC0A76EB4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWR-0001BH-NP;
	Mon, 31 Mar 2025 20:14:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVj-0000lz-8d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TI6309XD1wKO+JtHjCvhICezonTWVCEg/MadCUHBkNY=; b=UIHU/lRrAWPGPhlTKnI9PzNGlY
 kkPi3mlsQtEfrYeJo1vwEg6QeOHAFWaNH7cIyFiXsYgOHLGVl0icU/M0uKw0qscBuMq6j5wZ6KADF
 tmwIBXPZ6CT+hlZO0g2sRhKVGGY6cPhDoIEKmNZj7dkG/HYbPqc3tXHIYpA9er/no31Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TI6309XD1wKO+JtHjCvhICezonTWVCEg/MadCUHBkNY=; b=atej3yDt0Mva9KvqRFSgsYnK2M
 aNc6nj+XJzKZd3ibGG4Cn74s/Q89iSHxSI30eeqltMSwi0VNhaJGSjrhNzSAG+1pSRueUtndKAR+S
 aquv7Plzp2FWGrlvdXYX7WZVqHVCJT5nxUdjD81nthoEEZa2BXmB/S+j+EKNPuauvka4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVj-0003fG-1h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=TI6309XD1wKO+JtHjCvhICezonTWVCEg/MadCUHBkNY=; b=RX7z4tezzPZMY2vj3S3zPUacai
 jP8Bbck0/wR75wsDl0yP5iZx/NiYY0J+vzpNXX6UCWnoeZSb4/ps4T0G2OErluJcnefFKDIcrJCks
 LJpzI/pV+FoDJscM0IjXq7saVIOCjEnPk1ODHNiT6BqM08tneAi7MPdlqBOLcIUvjq5d6YPgDb+0N
 lFOPMsezzCYSQJelFIPfdwJ1HK+2mIZFG+QcPMMXIzJGsQ7mZXDBgfWXc3RRvQYp6m373SJnuch1I
 Dqb+dJQddsBtOerYykMO+yOEcauQAnpd9XadRWrJPzMhEyr2hdAoCMPMB5aOKOu1jRJtFugcq5eTg
 8EdZmiWA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVX-00000004SJr-2YHS;
 Mon, 31 Mar 2025 20:13:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:08 +0100
Message-ID: <20250331201256.1057782-109-willy@infradead.org>
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
 Content preview:  The one caller already has folios, so pass them in,
 and further
 pass them to __f2fs_set_acl() and f2fs_acl_create(). There should be no change
 to the generated code for this commit. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/acl.c | 27 +++++++++++++ fs/f2fs/acl.h
 | 10 +++++----- fs/f2fs/dir.c | 2 +- 3 files changed, 19 insertions(+), 20
 [...] Content analysis details:   (-2.5 points, 6.0 required)
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
X-Headers-End: 1tzLVj-0003fG-1h
Subject: [f2fs-dev] [PATCH 108/153] f2fs: Pass folios to f2fs_init_acl()
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

The one caller already has folios, so pass them in, and further pass
them to __f2fs_set_acl() and f2fs_acl_create().  There should be
no change to the generated code for this commit.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/acl.c | 27 +++++++++++++--------------
 fs/f2fs/acl.h | 10 +++++-----
 fs/f2fs/dir.c |  2 +-
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index 1fbc0607363b..1ec6125cadc5 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -227,7 +227,7 @@ static int f2fs_acl_update_mode(struct mnt_idmap *idmap,
 
 static int __f2fs_set_acl(struct mnt_idmap *idmap,
 			struct inode *inode, int type,
-			struct posix_acl *acl, struct page *ipage)
+			struct posix_acl *acl, struct folio *ifolio)
 {
 	int name_index;
 	void *value = NULL;
@@ -238,9 +238,8 @@ static int __f2fs_set_acl(struct mnt_idmap *idmap,
 	switch (type) {
 	case ACL_TYPE_ACCESS:
 		name_index = F2FS_XATTR_INDEX_POSIX_ACL_ACCESS;
-		if (acl && !ipage) {
-			error = f2fs_acl_update_mode(idmap, inode,
-								&mode, &acl);
+		if (acl && !ifolio) {
+			error = f2fs_acl_update_mode(idmap, inode, &mode, &acl);
 			if (error)
 				return error;
 			set_acl_inode(inode, mode);
@@ -265,7 +264,7 @@ static int __f2fs_set_acl(struct mnt_idmap *idmap,
 		}
 	}
 
-	error = f2fs_setxattr(inode, name_index, "", value, size, ipage, 0);
+	error = f2fs_setxattr(inode, name_index, "", value, size, &ifolio->page, 0);
 
 	kfree(value);
 	if (!error)
@@ -360,7 +359,7 @@ static int f2fs_acl_create_masq(struct posix_acl *acl, umode_t *mode_p)
 
 static int f2fs_acl_create(struct inode *dir, umode_t *mode,
 		struct posix_acl **default_acl, struct posix_acl **acl,
-		struct page *dpage)
+		struct folio *dfolio)
 {
 	struct posix_acl *p;
 	struct posix_acl *clone;
@@ -372,7 +371,7 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
 	if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
 		return 0;
 
-	p = __f2fs_get_acl(dir, ACL_TYPE_DEFAULT, dpage);
+	p = __f2fs_get_acl(dir, ACL_TYPE_DEFAULT, &dfolio->page);
 	if (!p || p == ERR_PTR(-EOPNOTSUPP)) {
 		*mode &= ~current_umask();
 		return 0;
@@ -409,29 +408,29 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
 	return ret;
 }
 
-int f2fs_init_acl(struct inode *inode, struct inode *dir, struct page *ipage,
-							struct page *dpage)
+int f2fs_init_acl(struct inode *inode, struct inode *dir, struct folio *ifolio,
+							struct folio *dfolio)
 {
 	struct posix_acl *default_acl = NULL, *acl = NULL;
 	int error;
 
-	error = f2fs_acl_create(dir, &inode->i_mode, &default_acl, &acl, dpage);
+	error = f2fs_acl_create(dir, &inode->i_mode, &default_acl, &acl, dfolio);
 	if (error)
 		return error;
 
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (default_acl) {
-		error = __f2fs_set_acl(NULL, inode, ACL_TYPE_DEFAULT, default_acl,
-				       ipage);
+		error = __f2fs_set_acl(NULL, inode, ACL_TYPE_DEFAULT,
+				default_acl, ifolio);
 		posix_acl_release(default_acl);
 	} else {
 		inode->i_default_acl = NULL;
 	}
 	if (acl) {
 		if (!error)
-			error = __f2fs_set_acl(NULL, inode, ACL_TYPE_ACCESS, acl,
-					       ipage);
+			error = __f2fs_set_acl(NULL, inode, ACL_TYPE_ACCESS,
+					acl, ifolio);
 		posix_acl_release(acl);
 	} else {
 		inode->i_acl = NULL;
diff --git a/fs/f2fs/acl.h b/fs/f2fs/acl.h
index 94ebfbfbdc6f..20e87e63c089 100644
--- a/fs/f2fs/acl.h
+++ b/fs/f2fs/acl.h
@@ -33,17 +33,17 @@ struct f2fs_acl_header {
 
 #ifdef CONFIG_F2FS_FS_POSIX_ACL
 
-extern struct posix_acl *f2fs_get_acl(struct inode *, int, bool);
-extern int f2fs_set_acl(struct mnt_idmap *, struct dentry *,
+struct posix_acl *f2fs_get_acl(struct inode *, int, bool);
+int f2fs_set_acl(struct mnt_idmap *, struct dentry *,
 			struct posix_acl *, int);
-extern int f2fs_init_acl(struct inode *, struct inode *, struct page *,
-							struct page *);
+int f2fs_init_acl(struct inode *, struct inode *, struct folio *ifolio,
+		struct folio *dfolio);
 #else
 #define f2fs_get_acl	NULL
 #define f2fs_set_acl	NULL
 
 static inline int f2fs_init_acl(struct inode *inode, struct inode *dir,
-				struct page *ipage, struct page *dpage)
+				struct folio *ifolio, struct folio *dfolio)
 {
 	return 0;
 }
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d31cd86305eb..bd404a5de4a1 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -536,7 +536,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			folio_put(folio);
 		}
 
-		err = f2fs_init_acl(inode, dir, &folio->page, &dfolio->page);
+		err = f2fs_init_acl(inode, dir, folio, dfolio);
 		if (err)
 			goto put_error;
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
