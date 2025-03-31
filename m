Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB0A76E90
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW6-0004Fj-HF;
	Mon, 31 Mar 2025 20:13:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVs-0003y0-2U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JJ0o2cpggi7otxVLpTzYDcG3FbZG39U2hawVxpsoGGI=; b=BBlrcq7zO+4EFphgxJ0IxtFds3
 kuQPAMuYePyaRSZFdieROUB3Rlb0g51qPlnFOuJbE6JeAcIu97ZdxJTDYfr5ILGNuwKoL/vRrW/4P
 0hc0SwHy+HiMQt4+atSk+uZkuxcP6YMpxzOzLjbs5gmvRHBQi4KZMvYy2bEm0ZEqNCgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JJ0o2cpggi7otxVLpTzYDcG3FbZG39U2hawVxpsoGGI=; b=V6FZFAXpWmAjrEOBERZmE2J4uY
 rB20e2c4rsJpW4M5BIrOgIW2+Qew0b2kHrQ/sSo0slc+ZMVyhv2502vnIFSUuHI0Etca9FVvhkpza
 a5O2XwonnLm1WXS+89lLJU6AqZnu90qgsphM25eqgxA7EZ1cCAh8xj/Rcu+XcrdOPvWA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVm-0003gt-B8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=JJ0o2cpggi7otxVLpTzYDcG3FbZG39U2hawVxpsoGGI=; b=QpNLakzOUGPS/siHVV3raIuCbZ
 LkZokBGKoABzT/Oj7rYh3rXCRBjmRrqfrzpz/0bn0N0bnwSYp7BLLomlrf50MB7vDkoRC+ogSOAAB
 ib7JtDvN9Z0pE2QBboZxcTzyCMKNXP91tlo+QnBTeZdsXjWJmk/arjw8F+H77ZCfTLMwYZR7oq2Qy
 SHRgtOmqj+6O/iKg5qUZDaRPLfCm2iP1SsgUzpjH0v6tOAQV9YXEuLEqF6C5SWxOCukgdt6HZbDuR
 K3vfONVVe/Zc2L1GOJdNThRfYw05t62eQsjOmyuxvSp4TBFRhzYoSwPug4UKLOlV5FStS3JOIxypQ
 ERUsPgcg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVa-00000004SWh-3nf4;
 Mon, 31 Mar 2025 20:13:22 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:28 +0100
Message-ID: <20250331201256.1057782-129-willy@infradead.org>
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
 Content preview: Convert all the callers to pass a folio. Removes three calls
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 7 ++----- fs/f2fs/f2fs.h | 2 +- fs/f2fs/namei.c | 34
 +++++++++++++++++ 3 files changed, 20 insertions( [...] 
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
X-Headers-End: 1tzLVm-0003gt-B8
Subject: [f2fs-dev] [PATCH 128/153] f2fs: Pass a folio to f2fs_parent_dir()
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

Convert all the callers to pass a folio.  Removes three calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c   |  7 ++-----
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/namei.c | 34 +++++++++++++++++-----------------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 9f958c379e20..987b3a00d29d 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -405,12 +405,9 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 	return de;
 }
 
-struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct page **p)
+struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct folio **f)
 {
-	struct folio *folio;
-	struct f2fs_dir_entry *r = f2fs_find_entry(dir, &dotdot_name, &folio);
-	*p = &folio->page;
-	return r;
+	return f2fs_find_entry(dir, &dotdot_name, f);
 }
 
 ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a7a8bae1dabe..66b363dd40ba 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3648,7 +3648,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 		const struct f2fs_filename *fname, struct folio **res_folio);
 struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 			const struct qstr *child, struct folio **res_folio);
-struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct page **p);
+struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct folio **f);
 ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr,
 			struct folio **folio);
 void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 1a2f9bde1c11..689fd9419afd 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -899,7 +899,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	struct inode *old_inode = d_inode(old_dentry);
 	struct inode *new_inode = d_inode(new_dentry);
 	struct inode *whiteout = NULL;
-	struct page *old_dir_page = NULL;
+	struct folio *old_dir_folio = NULL;
 	struct folio *old_folio, *new_folio = NULL;
 	struct f2fs_dir_entry *old_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry;
@@ -967,10 +967,10 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	}
 
 	if (old_is_dir && old_dir != new_dir) {
-		old_dir_entry = f2fs_parent_dir(old_inode, &old_dir_page);
+		old_dir_entry = f2fs_parent_dir(old_inode, &old_dir_folio);
 		if (!old_dir_entry) {
-			if (IS_ERR(old_dir_page))
-				err = PTR_ERR(old_dir_page);
+			if (IS_ERR(old_dir_folio))
+				err = PTR_ERR(old_dir_folio);
 			goto out_old;
 		}
 	}
@@ -1055,7 +1055,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	}
 
 	if (old_dir_entry)
-		f2fs_set_link(old_inode, old_dir_entry, old_dir_page, new_dir);
+		f2fs_set_link(old_inode, old_dir_entry, &old_dir_folio->page, new_dir);
 	if (old_is_dir)
 		f2fs_i_links_write(old_dir, false);
 
@@ -1079,7 +1079,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	f2fs_folio_put(new_folio, false);
 out_dir:
 	if (old_dir_entry)
-		f2fs_put_page(old_dir_page, 0);
+		f2fs_folio_put(old_dir_folio, false);
 out_old:
 	f2fs_folio_put(old_folio, false);
 out:
@@ -1093,7 +1093,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(old_dir);
 	struct inode *old_inode = d_inode(old_dentry);
 	struct inode *new_inode = d_inode(new_dentry);
-	struct page *old_dir_page, *new_dir_page;
+	struct folio *old_dir_folio, *new_dir_folio;
 	struct folio *old_folio, *new_folio;
 	struct f2fs_dir_entry *old_dir_entry = NULL, *new_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry, *new_entry;
@@ -1140,20 +1140,20 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (old_dir != new_dir) {
 		if (S_ISDIR(old_inode->i_mode)) {
 			old_dir_entry = f2fs_parent_dir(old_inode,
-							&old_dir_page);
+							&old_dir_folio);
 			if (!old_dir_entry) {
-				if (IS_ERR(old_dir_page))
-					err = PTR_ERR(old_dir_page);
+				if (IS_ERR(old_dir_folio))
+					err = PTR_ERR(old_dir_folio);
 				goto out_new;
 			}
 		}
 
 		if (S_ISDIR(new_inode->i_mode)) {
 			new_dir_entry = f2fs_parent_dir(new_inode,
-							&new_dir_page);
+							&new_dir_folio);
 			if (!new_dir_entry) {
-				if (IS_ERR(new_dir_page))
-					err = PTR_ERR(new_dir_page);
+				if (IS_ERR(new_dir_folio))
+					err = PTR_ERR(new_dir_folio);
 				goto out_old_dir;
 			}
 		}
@@ -1180,11 +1180,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	/* update ".." directory entry info of old dentry */
 	if (old_dir_entry)
-		f2fs_set_link(old_inode, old_dir_entry, old_dir_page, new_dir);
+		f2fs_set_link(old_inode, old_dir_entry, &old_dir_folio->page, new_dir);
 
 	/* update ".." directory entry info of new dentry */
 	if (new_dir_entry)
-		f2fs_set_link(new_inode, new_dir_entry, new_dir_page, old_dir);
+		f2fs_set_link(new_inode, new_dir_entry, &new_dir_folio->page, old_dir);
 
 	/* update directory entry info of old dir inode */
 	f2fs_set_link(old_dir, old_entry, &old_folio->page, new_inode);
@@ -1238,11 +1238,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	return 0;
 out_new_dir:
 	if (new_dir_entry) {
-		f2fs_put_page(new_dir_page, 0);
+		f2fs_folio_put(new_dir_folio, 0);
 	}
 out_old_dir:
 	if (old_dir_entry) {
-		f2fs_put_page(old_dir_page, 0);
+		f2fs_folio_put(old_dir_folio, 0);
 	}
 out_new:
 	f2fs_folio_put(new_folio, false);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
