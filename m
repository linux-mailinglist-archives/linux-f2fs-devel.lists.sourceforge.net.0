Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B3A76EC5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWW-0001I1-M8;
	Mon, 31 Mar 2025 20:14:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVr-0000tj-Qt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+Hr3Razhl4fdLv/1P4AlCqacZHOpRP+1zSUj9tnPyA=; b=lrrkk3bvj739viE2Lr6o0PcRiJ
 75OfdIQZCMOYPmCfSuncyurf87Tecf7PUlnwXx3ToGppS5lv5rzuAk8MdoQMmQ3YZ7idS+BMJxgAm
 LRzU/nuPH+55Oec3m27lF4Hr7UG42rWg14RBQAwaN54Rfd2RGsguU1WTbzSHLfV/DPNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h+Hr3Razhl4fdLv/1P4AlCqacZHOpRP+1zSUj9tnPyA=; b=CwCIxD2GMsfxRPnYUuyb5ZtPqL
 pUbQcQRndG1UBG9DvDenEP/bgbI6mvn3nhg43fInMZDqFqiVIX3KnmdjDNN2yLFS1rERErM41kAo5
 m+tFr+oQ7EkXrl7ryaTFvBLnvwPDeL08oVnMh5x1mthLEjcq2Z8dFKtpzwef23OpHI+0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVm-0003h2-K6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=h+Hr3Razhl4fdLv/1P4AlCqacZHOpRP+1zSUj9tnPyA=; b=PpBFVhXh/dcvBoVaMpR4dKiE9g
 XHlDrkuQlZ1ObKVhpqfaAJtfz6kPw2Y5wusOENNlCSdRWM8kinpRAOrWxFM7ACdRSO6HHNHk9uY8i
 TNOHfs6BD8PAL/Ta6fVQ37ASDSmwjAkDybcaGYRLrFPMeF7m4kiaX6WX9nFP64bulMuUaqIqiX86l
 zt/2b9a7XaomActzgyYSvp+q0Obw8nc8xm9By19f/y2uoIDPvpIqdkkT6Ml4u8niDL/kxtJNiY2zR
 rZLqnykWXtYPRJEpczvj5v26F74jaXzsxFzZnceLwQqwDvevvGJ26S0+NshAPsmxKMOOFz/W5PrN8
 KlXTIECA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVb-00000004SXe-0uiV;
 Mon, 31 Mar 2025 20:13:23 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:30 +0100
Message-ID: <20250331201256.1057782-131-willy@infradead.org>
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
 Content preview: The caller now has a folio so pass it in. Removes four calls
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h | 3 +-- fs/f2fs/inline.c | 14
 +++++++-------
 3 files changed, 9 insertions(+), 10 deletions(-) 
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
X-Headers-End: 1tzLVm-0003h2-K6
Subject: [f2fs-dev] [PATCH 130/153] f2fs: Pass a folio to
 f2fs_delete_inline_entry()
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

The caller now has a folio so pass it in.  Removes four calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c    |  2 +-
 fs/f2fs/f2fs.h   |  3 +--
 fs/f2fs/inline.c | 14 +++++++-------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 610091345ac3..6dfe7f859265 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -875,7 +875,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct folio *folio,
 		f2fs_add_ino_entry(F2FS_I_SB(dir), dir->i_ino, TRANS_DIR_INO);
 
 	if (f2fs_has_inline_dentry(dir))
-		return f2fs_delete_inline_entry(dentry, &folio->page, dir, inode);
+		return f2fs_delete_inline_entry(dentry, folio, dir, inode);
 
 	folio_lock(folio);
 	f2fs_folio_wait_writeback(folio, DATA, true, true);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6b0f572e1602..dc7463004c75 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4289,8 +4289,7 @@ int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
 void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
-				struct page *page, struct inode *dir,
-				struct inode *inode);
+		struct folio *folio, struct inode *dir, struct inode *inode);
 bool f2fs_empty_inline_dir(struct inode *dir);
 int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 			struct fscrypt_str *fstr);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index c2e97e230cd1..1c6dc9731f2a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -697,8 +697,8 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	return err;
 }
 
-void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry, struct page *page,
-					struct inode *dir, struct inode *inode)
+void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
+		struct folio *folio, struct inode *dir, struct inode *inode)
 {
 	struct f2fs_dentry_ptr d;
 	void *inline_dentry;
@@ -706,18 +706,18 @@ void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry, struct page *page,
 	unsigned int bit_pos;
 	int i;
 
-	lock_page(page);
-	f2fs_wait_on_page_writeback(page, NODE, true, true);
+	folio_lock(folio);
+	f2fs_folio_wait_writeback(folio, NODE, true, true);
 
-	inline_dentry = inline_data_addr(dir, page);
+	inline_dentry = inline_data_addr(dir, &folio->page);
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 
 	bit_pos = dentry - d.dentry;
 	for (i = 0; i < slots; i++)
 		__clear_bit_le(bit_pos + i, d.bitmap);
 
-	set_page_dirty(page);
-	f2fs_put_page(page, 1);
+	folio_mark_dirty(folio);
+	f2fs_folio_put(folio, true);
 
 	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	f2fs_mark_inode_dirty_sync(dir, false);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
