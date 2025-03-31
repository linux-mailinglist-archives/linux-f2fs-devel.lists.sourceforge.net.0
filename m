Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6375A76E76
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVw-00042I-Ii;
	Mon, 31 Mar 2025 20:13:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVi-0003rR-74
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xUnwHo7viWg50JlBsx8MB91PFehTPQ7IXe6f79mPdfE=; b=I5tHXiuX8xkqXz8yJSNlcJTy9h
 Jrf86aR+MFKJ60LEiAwtDHCTMmNXpowrwlYUBraxa1+pX2P63oP41fsKstMJGKtwfajj2hV8AAAlk
 iMlXvdG7eD6uo9SOw5yOGjlcHqtpqGhgbG+DmAAYBs/TBykG46UsDkARDba4QS46SDJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xUnwHo7viWg50JlBsx8MB91PFehTPQ7IXe6f79mPdfE=; b=jP+LA1AYnElDgeoE+so9C5PRgG
 O1Klp1vt2y4vZvqiGHmhv+1T9Hf4SSM7wgnmBpM1SC0BFYHMmpI8P0ACasji6EVOlKE9tuynRTR6n
 Nu7GO0np1YmNYcs79jbRdiKIpMsfE4BZDIxdZTFUKgQrokZv4KOEfno7mqNoy/KHm304=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVh-0003eJ-58 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xUnwHo7viWg50JlBsx8MB91PFehTPQ7IXe6f79mPdfE=; b=HzfUKX74ldvoZ2HkF4sifFHmNA
 EyR3Cnxxa6GTko3YakthIg833V/OxHeLuWfyyqF2kKlenYFLSybKtHqox8jMb4FFQ4YWZYQAMsW55
 FX55PXvo1Z5bUjt7o1xPBktNacu1EIY6/Ueyo0j8X0k3or5WiFgaePXIAJIBkKtbQ49Vqjf+mUVla
 XLFBCYy/vDkOR7w1o/W21WP+QgPKTMSBmycjQez2H9Faqpajru7Wb3SRQab0QKjhmygCKuE3eU5HF
 hrN+yPqspVuYlZwTcFuCVEjWoPtv0lSv6GFBraLL+/gsIvcO2mIAoREKKjPzOAFaJTPuohY31/VVP
 qcYkXNkw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVa-00000004SWG-38Jr;
 Mon, 31 Mar 2025 20:13:22 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:27 +0100
Message-ID: <20250331201256.1057782-128-willy@infradead.org>
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
 Content preview: Convert all callers to pass in a pointer to a folio instead
 of a page. Also convert f2fs_inode_by_name() to take a folio pointer. Removes
 six calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 21 +++++++-------- fs/f2fs/f2fs.h | 4 +-- fs/f2fs/namei.c
 | 68 ++++++++++++++++++++++++ 3 file [...] 
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
X-Headers-End: 1tzLVh-0003eJ-58
Subject: [f2fs-dev] [PATCH 127/153] f2fs: Pass a folio to f2fs_find_entry()
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

Convert all callers to pass in a pointer to a folio instead of a page.
Also convert f2fs_inode_by_name() to take a folio pointer.  Removes
six calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c   | 21 +++++++--------
 fs/f2fs/f2fs.h  |  4 +--
 fs/f2fs/namei.c | 68 ++++++++++++++++++++++++-------------------------
 3 files changed, 47 insertions(+), 46 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 676a46153247..9f958c379e20 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -384,24 +384,22 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
  * Entry is guaranteed to be valid.
  */
 struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
-			const struct qstr *child, struct page **res_page)
+			const struct qstr *child, struct folio **res_folio)
 {
 	struct f2fs_dir_entry *de = NULL;
 	struct f2fs_filename fname;
-	struct folio *rfolio;
 	int err;
 
 	err = f2fs_setup_filename(dir, child, 1, &fname);
 	if (err) {
 		if (err == -ENOENT)
-			*res_page = NULL;
+			*res_folio = NULL;
 		else
-			*res_page = ERR_PTR(err);
+			*res_folio = ERR_PTR(err);
 		return NULL;
 	}
 
-	de = __f2fs_find_entry(dir, &fname, &rfolio);
-	*res_page = &rfolio->page;
+	de = __f2fs_find_entry(dir, &fname, res_folio);
 
 	f2fs_free_filename(&fname);
 	return de;
@@ -409,19 +407,22 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 
 struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct page **p)
 {
-	return f2fs_find_entry(dir, &dotdot_name, p);
+	struct folio *folio;
+	struct f2fs_dir_entry *r = f2fs_find_entry(dir, &dotdot_name, &folio);
+	*p = &folio->page;
+	return r;
 }
 
 ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr,
-							struct page **page)
+							struct folio **folio)
 {
 	ino_t res = 0;
 	struct f2fs_dir_entry *de;
 
-	de = f2fs_find_entry(dir, qstr, page);
+	de = f2fs_find_entry(dir, qstr, folio);
 	if (de) {
 		res = le32_to_cpu(de->ino);
-		f2fs_put_page(*page, 0);
+		f2fs_folio_put(*folio, false);
 	}
 
 	return res;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 43e4f44edcc9..a7a8bae1dabe 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3647,10 +3647,10 @@ void f2fs_drop_nlink(struct inode *dir, struct inode *inode);
 struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 		const struct f2fs_filename *fname, struct folio **res_folio);
 struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
-			const struct qstr *child, struct page **res_page);
+			const struct qstr *child, struct folio **res_folio);
 struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct page **p);
 ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr,
-			struct page **page);
+			struct folio **folio);
 void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 			struct page *page, struct inode *inode);
 bool f2fs_has_enough_room(struct inode *dir, struct folio *ifolio,
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 4a3acb5edfda..1a2f9bde1c11 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -447,12 +447,12 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 
 struct dentry *f2fs_get_parent(struct dentry *child)
 {
-	struct page *page;
-	unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot_name, &page);
+	struct folio *folio;
+	unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot_name, &folio);
 
 	if (!ino) {
-		if (IS_ERR(page))
-			return ERR_CAST(page);
+		if (IS_ERR(folio))
+			return ERR_CAST(folio);
 		return ERR_PTR(-ENOENT);
 	}
 	return d_obtain_alias(f2fs_iget(child->d_sb, ino));
@@ -545,7 +545,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_dir_entry *de;
-	struct page *page;
+	struct folio *folio;
 	int err;
 
 	trace_f2fs_unlink_enter(dir, dentry);
@@ -562,10 +562,10 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	if (err)
 		goto fail;
 
-	de = f2fs_find_entry(dir, &dentry->d_name, &page);
+	de = f2fs_find_entry(dir, &dentry->d_name, &folio);
 	if (!de) {
-		if (IS_ERR(page))
-			err = PTR_ERR(page);
+		if (IS_ERR(folio))
+			err = PTR_ERR(folio);
 		goto fail;
 	}
 
@@ -575,10 +575,10 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 	err = f2fs_acquire_orphan_inode(sbi);
 	if (err) {
 		f2fs_unlock_op(sbi);
-		f2fs_put_page(page, 0);
+		f2fs_folio_put(folio, false);
 		goto fail;
 	}
-	f2fs_delete_entry(de, page, dir, inode);
+	f2fs_delete_entry(de, &folio->page, dir, inode);
 	f2fs_unlock_op(sbi);
 
 	/* VFS negative dentries are incompatible with Encoding and
@@ -900,7 +900,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	struct inode *new_inode = d_inode(new_dentry);
 	struct inode *whiteout = NULL;
 	struct page *old_dir_page = NULL;
-	struct page *old_page, *new_page = NULL;
+	struct folio *old_folio, *new_folio = NULL;
 	struct f2fs_dir_entry *old_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry;
 	struct f2fs_dir_entry *new_entry;
@@ -959,10 +959,10 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	}
 
 	err = -ENOENT;
-	old_entry = f2fs_find_entry(old_dir, &old_dentry->d_name, &old_page);
+	old_entry = f2fs_find_entry(old_dir, &old_dentry->d_name, &old_folio);
 	if (!old_entry) {
-		if (IS_ERR(old_page))
-			err = PTR_ERR(old_page);
+		if (IS_ERR(old_folio))
+			err = PTR_ERR(old_folio);
 		goto out;
 	}
 
@@ -983,10 +983,10 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 
 		err = -ENOENT;
 		new_entry = f2fs_find_entry(new_dir, &new_dentry->d_name,
-						&new_page);
+						&new_folio);
 		if (!new_entry) {
-			if (IS_ERR(new_page))
-				err = PTR_ERR(new_page);
+			if (IS_ERR(new_folio))
+				err = PTR_ERR(new_folio);
 			goto out_dir;
 		}
 
@@ -998,8 +998,8 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		if (err)
 			goto put_out_dir;
 
-		f2fs_set_link(new_dir, new_entry, new_page, old_inode);
-		new_page = NULL;
+		f2fs_set_link(new_dir, new_entry, &new_folio->page, old_inode);
+		new_folio = NULL;
 
 		inode_set_ctime_current(new_inode);
 		f2fs_down_write(&F2FS_I(new_inode)->i_sem);
@@ -1038,8 +1038,8 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	inode_set_ctime_current(old_inode);
 	f2fs_mark_inode_dirty_sync(old_inode, false);
 
-	f2fs_delete_entry(old_entry, old_page, old_dir, NULL);
-	old_page = NULL;
+	f2fs_delete_entry(old_entry, &old_folio->page, old_dir, NULL);
+	old_folio = NULL;
 
 	if (whiteout) {
 		set_inode_flag(whiteout, FI_INC_LINK);
@@ -1076,12 +1076,12 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 
 put_out_dir:
 	f2fs_unlock_op(sbi);
-	f2fs_put_page(new_page, 0);
+	f2fs_folio_put(new_folio, false);
 out_dir:
 	if (old_dir_entry)
 		f2fs_put_page(old_dir_page, 0);
 out_old:
-	f2fs_put_page(old_page, 0);
+	f2fs_folio_put(old_folio, false);
 out:
 	iput(whiteout);
 	return err;
@@ -1094,7 +1094,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct inode *old_inode = d_inode(old_dentry);
 	struct inode *new_inode = d_inode(new_dentry);
 	struct page *old_dir_page, *new_dir_page;
-	struct page *old_page, *new_page;
+	struct folio *old_folio, *new_folio;
 	struct f2fs_dir_entry *old_dir_entry = NULL, *new_dir_entry = NULL;
 	struct f2fs_dir_entry *old_entry, *new_entry;
 	int old_nlink = 0, new_nlink = 0;
@@ -1122,17 +1122,17 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		goto out;
 
 	err = -ENOENT;
-	old_entry = f2fs_find_entry(old_dir, &old_dentry->d_name, &old_page);
+	old_entry = f2fs_find_entry(old_dir, &old_dentry->d_name, &old_folio);
 	if (!old_entry) {
-		if (IS_ERR(old_page))
-			err = PTR_ERR(old_page);
+		if (IS_ERR(old_folio))
+			err = PTR_ERR(old_folio);
 		goto out;
 	}
 
-	new_entry = f2fs_find_entry(new_dir, &new_dentry->d_name, &new_page);
+	new_entry = f2fs_find_entry(new_dir, &new_dentry->d_name, &new_folio);
 	if (!new_entry) {
-		if (IS_ERR(new_page))
-			err = PTR_ERR(new_page);
+		if (IS_ERR(new_folio))
+			err = PTR_ERR(new_folio);
 		goto out_old;
 	}
 
@@ -1187,7 +1187,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		f2fs_set_link(new_inode, new_dir_entry, new_dir_page, old_dir);
 
 	/* update directory entry info of old dir inode */
-	f2fs_set_link(old_dir, old_entry, old_page, new_inode);
+	f2fs_set_link(old_dir, old_entry, &old_folio->page, new_inode);
 
 	f2fs_down_write(&F2FS_I(old_inode)->i_sem);
 	if (!old_dir_entry)
@@ -1206,7 +1206,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 	f2fs_mark_inode_dirty_sync(old_dir, false);
 
 	/* update directory entry info of new dir inode */
-	f2fs_set_link(new_dir, new_entry, new_page, old_inode);
+	f2fs_set_link(new_dir, new_entry, &new_folio->page, old_inode);
 
 	f2fs_down_write(&F2FS_I(new_inode)->i_sem);
 	if (!new_dir_entry)
@@ -1245,9 +1245,9 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		f2fs_put_page(old_dir_page, 0);
 	}
 out_new:
-	f2fs_put_page(new_page, 0);
+	f2fs_folio_put(new_folio, false);
 out_old:
-	f2fs_put_page(old_page, 0);
+	f2fs_folio_put(old_folio, false);
 out:
 	return err;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
