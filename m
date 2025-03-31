Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB677A76E80
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVy-00045f-Ni;
	Mon, 31 Mar 2025 20:13:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVn-0003vW-3t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iqsRq1d75a8DJORFMQOGMVvIwP9M9m49kyYgGmoSI24=; b=Apr5wR0r34c7lDp4fcbapxhG/a
 WiAKLYsXAXcEjEw/haHLGOrsWdeOQdsK/VWajOwt7YUNFYO4wVDMymoM6cFxnNXMtvkkvvBuUAtCy
 bd2o+F1MRddULR+06jAaiwiAF518459822KqVOSk7SxGI0m+ao9wNBmwH9zgbnDVzGb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iqsRq1d75a8DJORFMQOGMVvIwP9M9m49kyYgGmoSI24=; b=kaupCIXLlkbX1LJfbPh6Yj3SGB
 V7HcMS8IlfBQ4yJQYBqx++jc/eXJBdfRwUvI0f3Kcc1A0GAtfp5O5tmuhQEJkpzJ4hgA7S0PC91ZH
 qKtnZeY4Cd2azDQuYDAbeYXkLZmZwzZLgTB2AaO0O9jty3R3/GN/ZHLmYZkBi7DuuyV8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVm-0003gl-0E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iqsRq1d75a8DJORFMQOGMVvIwP9M9m49kyYgGmoSI24=; b=RfaOkr/beiWbEDGfDBDzjIQmMN
 QAo+b/UcEpKpFdwOJUUVDNXVwpYSyRsuLlDhQSqmG+Z6XxzsfzFVHP/IpCsC0zmEYxI5b8bS9y/3A
 L+gHBRAWgoTuJfhl7ywuWnoGw0Hu2mIbxI5S1iVpHaR93dSWGiCtwuqkVbk8W4gaZLYMO1eKTknw7
 acFJ6XMJ1R5Ab71lvjhlzP9me16sZEwE8o7sYnnBGwlFknjG6MTP/OYKrAeg9WD7xeXa9AV7E43UC
 7ohYQDi6n9DcAjo4850yLsJp5Uve0BT/3ESAzTOBoNT4PofV91T+o/UFianEPLpJPzxDZa9jACMZY
 UR45GhoQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVa-00000004SVx-2fXl;
 Mon, 31 Mar 2025 20:13:22 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:26 +0100
Message-ID: <20250331201256.1057782-127-willy@infradead.org>
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
 Content preview: Also pass a folio to f2fs_find_in_inline_dir() and
 find_in_level().
 Remove three calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/dir.c | 32 +++++++++++++++++ fs/f2fs/f2fs.h
 | 8 +++----- fs/f2fs/inline.c | 8 ++++---- fs/f2fs/namei.c | 10 ++++ [...]
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
X-Headers-End: 1tzLVm-0003gl-0E
Subject: [f2fs-dev] [PATCH 126/153] f2fs: Pass a folio to __f2fs_find_entry()
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

Also pass a folio to f2fs_find_in_inline_dir() and find_in_level().
Remove three calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c      | 32 +++++++++++++++++---------------
 fs/f2fs/f2fs.h     |  8 +++-----
 fs/f2fs/inline.c   |  8 ++++----
 fs/f2fs/namei.c    | 10 +++++-----
 fs/f2fs/recovery.c | 12 ++++++------
 5 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index aa3c18a39cd7..676a46153247 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -260,7 +260,7 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
 static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 					unsigned int level,
 					const struct f2fs_filename *fname,
-					struct page **res_page,
+					struct folio **res_folio,
 					bool use_hash)
 {
 	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
@@ -291,18 +291,18 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 				bidx = next_pgofs;
 				continue;
 			} else {
-				*res_page = &dentry_folio->page;
+				*res_folio = dentry_folio;
 				break;
 			}
 		}
 
 		de = find_in_block(dir, dentry_folio, fname, &max_slots, use_hash);
 		if (IS_ERR(de)) {
-			*res_page = ERR_CAST(de);
+			*res_folio = ERR_CAST(de);
 			de = NULL;
 			break;
 		} else if (de) {
-			*res_page = &dentry_folio->page;
+			*res_folio = dentry_folio;
 			break;
 		}
 
@@ -329,7 +329,7 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 
 struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 					 const struct f2fs_filename *fname,
-					 struct page **res_page)
+					 struct folio **res_folio)
 {
 	unsigned long npages = dir_blocks(dir);
 	struct f2fs_dir_entry *de = NULL;
@@ -337,13 +337,13 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 	unsigned int level;
 	bool use_hash = true;
 
-	*res_page = NULL;
+	*res_folio = NULL;
 
 #if IS_ENABLED(CONFIG_UNICODE)
 start_find_entry:
 #endif
 	if (f2fs_has_inline_dentry(dir)) {
-		de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
+		de = f2fs_find_in_inline_dir(dir, fname, res_folio, use_hash);
 		goto out;
 	}
 
@@ -359,8 +359,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 	}
 
 	for (level = 0; level < max_depth; level++) {
-		de = find_in_level(dir, level, fname, res_page, use_hash);
-		if (de || IS_ERR(*res_page))
+		de = find_in_level(dir, level, fname, res_folio, use_hash);
+		if (de || IS_ERR(*res_folio))
 			break;
 	}
 
@@ -388,6 +388,7 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 {
 	struct f2fs_dir_entry *de = NULL;
 	struct f2fs_filename fname;
+	struct folio *rfolio;
 	int err;
 
 	err = f2fs_setup_filename(dir, child, 1, &fname);
@@ -399,7 +400,8 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 		return NULL;
 	}
 
-	de = __f2fs_find_entry(dir, &fname, res_page);
+	de = __f2fs_find_entry(dir, &fname, &rfolio);
+	*res_page = &rfolio->page;
 
 	f2fs_free_filename(&fname);
 	return de;
@@ -781,7 +783,7 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 				struct inode *inode, nid_t ino, umode_t mode)
 {
 	struct f2fs_filename fname;
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 	struct f2fs_dir_entry *de = NULL;
 	int err;
 
@@ -797,14 +799,14 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
 	 * consistency more.
 	 */
 	if (current != F2FS_I(dir)->task) {
-		de = __f2fs_find_entry(dir, &fname, &page);
+		de = __f2fs_find_entry(dir, &fname, &folio);
 		F2FS_I(dir)->task = NULL;
 	}
 	if (de) {
-		f2fs_put_page(page, 0);
+		f2fs_folio_put(folio, false);
 		err = -EEXIST;
-	} else if (IS_ERR(page)) {
-		err = PTR_ERR(page);
+	} else if (IS_ERR(folio)) {
+		err = PTR_ERR(folio);
 	} else {
 		err = f2fs_add_dentry(dir, &fname, inode, ino, mode);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a6910b7d58a..43e4f44edcc9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3645,8 +3645,7 @@ void f2fs_update_parent_metadata(struct inode *dir, struct inode *inode,
 int f2fs_room_for_filename(const void *bitmap, int slots, int max_slots);
 void f2fs_drop_nlink(struct inode *dir, struct inode *inode);
 struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
-					 const struct f2fs_filename *fname,
-					 struct page **res_page);
+		const struct f2fs_filename *fname, struct folio **res_folio);
 struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 			const struct qstr *child, struct page **res_page);
 struct f2fs_dir_entry *f2fs_parent_dir(struct inode *dir, struct page **p);
@@ -4283,9 +4282,8 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
 int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
-					const struct f2fs_filename *fname,
-					struct page **res_page,
-					bool use_hash);
+		const struct f2fs_filename *fname, struct folio **res_folio,
+		bool use_hash);
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 			struct folio *ifolio);
 int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index bce99af7f4ef..c2e97e230cd1 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -352,7 +352,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 					const struct f2fs_filename *fname,
-					struct page **res_page,
+					struct folio **res_folio,
 					bool use_hash)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
@@ -363,7 +363,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 
 	ifolio = f2fs_get_inode_folio(sbi, dir->i_ino);
 	if (IS_ERR(ifolio)) {
-		*res_page = &ifolio->page;
+		*res_folio = ifolio;
 		return NULL;
 	}
 
@@ -373,11 +373,11 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 	de = f2fs_find_target_dentry(&d, fname, NULL, use_hash);
 	folio_unlock(ifolio);
 	if (IS_ERR(de)) {
-		*res_page = ERR_CAST(de);
+		*res_folio = ERR_CAST(de);
 		de = NULL;
 	}
 	if (de)
-		*res_page = &ifolio->page;
+		*res_folio = ifolio;
 	else
 		f2fs_folio_put(ifolio, false);
 
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 8f8b9b843bdf..4a3acb5edfda 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -463,7 +463,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 {
 	struct inode *inode = NULL;
 	struct f2fs_dir_entry *de;
-	struct page *page;
+	struct folio *folio;
 	struct dentry *new;
 	nid_t ino = -1;
 	int err = 0;
@@ -481,12 +481,12 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 		goto out_splice;
 	if (err)
 		goto out;
-	de = __f2fs_find_entry(dir, &fname, &page);
+	de = __f2fs_find_entry(dir, &fname, &folio);
 	f2fs_free_filename(&fname);
 
 	if (!de) {
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			goto out;
 		}
 		err = -ENOENT;
@@ -494,7 +494,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	ino = le32_to_cpu(de->ino);
-	f2fs_put_page(page, 0);
+	f2fs_folio_put(folio, false);
 
 	inode = f2fs_iget(dir->i_sb, ino);
 	if (IS_ERR(inode)) {
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 69d8eaaf9013..849d014023d4 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -165,7 +165,7 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 	struct f2fs_dir_entry *de;
 	struct f2fs_filename fname;
 	struct qstr usr_fname;
-	struct page *page;
+	struct folio *folio;
 	struct inode *dir, *einode;
 	struct fsync_inode_entry *entry;
 	int err = 0;
@@ -187,7 +187,7 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 	if (err)
 		goto out;
 retry:
-	de = __f2fs_find_entry(dir, &fname, &page);
+	de = __f2fs_find_entry(dir, &fname, &folio);
 	if (de && inode->i_ino == le32_to_cpu(de->ino))
 		goto out_put;
 
@@ -212,11 +212,11 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 			iput(einode);
 			goto out_put;
 		}
-		f2fs_delete_entry(de, page, dir, einode);
+		f2fs_delete_entry(de, &folio->page, dir, einode);
 		iput(einode);
 		goto retry;
-	} else if (IS_ERR(page)) {
-		err = PTR_ERR(page);
+	} else if (IS_ERR(folio)) {
+		err = PTR_ERR(folio);
 	} else {
 		err = f2fs_add_dentry(dir, &fname, inode,
 					inode->i_ino, inode->i_mode);
@@ -226,7 +226,7 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 	goto out;
 
 out_put:
-	f2fs_put_page(page, 0);
+	f2fs_folio_put(folio, false);
 out:
 	if (file_enc_name(inode))
 		name = "<encrypted>";
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
