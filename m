Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5065A76E8C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW1-0001D5-Kd;
	Mon, 31 Mar 2025 20:13:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-00011K-A7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bB/o3QsMnN6KQ1n41E+oRz59nbXNgTEA3H50L0m4UyU=; b=HP6GGU3z1OSfAMxZ6qQCYGnrbh
 BT9mr+sMYB0K34nI3qVDxMcagFHyQySGA1wToJlIwZaOtRG4jnYsnsISo/sL0XmZS8Um31ifhLFHl
 8g9llwE9gni4UcAefJA3jMkwR82k5Hoj80+Wg6vpO+DSKG/ah0vo0kJSijxq41x/RAoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bB/o3QsMnN6KQ1n41E+oRz59nbXNgTEA3H50L0m4UyU=; b=kFOVmMMiJ3xYwRYfA1jWHtBTrX
 aJnSHpdyNmljwj2dgiRnKyT2eHJaby06l3AdonD9+ZZq+c1OGwHyd+Bh7jWzoYkDKv70eoqeQWgel
 p4kPtph+147tGOT0GM44pt1LVDxJRTY3vVje4R3Xbt/kT40CuPudl+6XLZPG1jtyvBic=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVf-0003dh-RO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bB/o3QsMnN6KQ1n41E+oRz59nbXNgTEA3H50L0m4UyU=; b=epNm+fsXpTs/vum7e9993ft6wf
 qsnGkrzzuKwmtbzizEjp+fxKGieUXA3JVRRttolTEGwZyN8dpeincR7dkk0SYjIp0HcIroWLXfPwf
 VHfryRx8mb8+ams3GgU7qpLLHQyaCJp1p/0G/cY28FhNtiGdSbml9gKxPlYfM0C09G3QrMj/i2xCL
 uAuRJQsOBpPDRB7hDjbHMaGgTDeCLNLFNN2tslDGigYMh7Ea03mHz8zn64V2wLPv12aGOecCfVJeg
 8QUgykZbA4LLr0R9lDTgNHcTSRi8Gq3RB4YwCMJkr9uabpxx3+ODeoZt2TdZ/UbDVy05AdtXhM966
 X6wQtF+A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVU-00000004S40-1PSl;
 Mon, 31 Mar 2025 20:13:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:50 +0100
Message-ID: <20250331201256.1057782-91-willy@infradead.org>
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
 Content preview: Also convert f2fs_init_inode_metadata() to take a folio.
 Remove
 Remove three calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/dir.c | 4 ++-- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/inline.c
 | 20 ++++++++++ 3 files changed, 13 insertions(+), 13 deletions [...] 
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
X-Headers-End: 1tzLVf-0003dh-RO
Subject: [f2fs-dev] [PATCH 090/153] f2fs: Use a folio in
 f2fs_add_inline_entry()
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

Also convert f2fs_init_inode_metadata() to take a folio.  Remove
Remove three calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c    |  4 ++--
 fs/f2fs/f2fs.h   |  2 +-
 fs/f2fs/inline.c | 20 ++++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 25969d0ae76e..d31cd86305eb 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -515,7 +515,7 @@ static int make_empty_dir(struct inode *inode,
 }
 
 struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
-			const struct f2fs_filename *fname, struct page *dpage)
+		const struct f2fs_filename *fname, struct folio *dfolio)
 {
 	struct folio *folio;
 	int err;
@@ -536,7 +536,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			folio_put(folio);
 		}
 
-		err = f2fs_init_acl(inode, dir, &folio->page, dpage);
+		err = f2fs_init_acl(inode, dir, &folio->page, &dfolio->page);
 		if (err)
 			goto put_error;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 75194caaf317..33a6584615bc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3639,7 +3639,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
 			struct f2fs_dentry_ptr *d);
 struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
-			const struct f2fs_filename *fname, struct page *dpage);
+		const struct f2fs_filename *fname, struct folio *dfolio);
 void f2fs_update_parent_metadata(struct inode *dir, struct inode *inode,
 			unsigned int current_depth);
 int f2fs_room_for_filename(const void *bitmap, int slots, int max_slots);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 4684ecc0cb5a..15d14353f2aa 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -636,7 +636,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 			  struct inode *inode, nid_t ino, umode_t mode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
-	struct page *ipage;
+	struct folio *ifolio;
 	unsigned int bit_pos;
 	void *inline_dentry = NULL;
 	struct f2fs_dentry_ptr d;
@@ -644,16 +644,16 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	struct page *page = NULL;
 	int err = 0;
 
-	ipage = f2fs_get_inode_page(sbi, dir->i_ino);
-	if (IS_ERR(ipage))
-		return PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(sbi, dir->i_ino);
+	if (IS_ERR(ifolio))
+		return PTR_ERR(ifolio);
 
-	inline_dentry = inline_data_addr(dir, ipage);
+	inline_dentry = inline_data_addr(dir, &ifolio->page);
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 
 	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
 	if (bit_pos >= d.max) {
-		err = do_convert_inline_dir(dir, ipage, inline_dentry);
+		err = do_convert_inline_dir(dir, &ifolio->page, inline_dentry);
 		if (err)
 			return err;
 		err = -EAGAIN;
@@ -663,19 +663,19 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	if (inode) {
 		f2fs_down_write_nested(&F2FS_I(inode)->i_sem,
 						SINGLE_DEPTH_NESTING);
-		page = f2fs_init_inode_metadata(inode, dir, fname, ipage);
+		page = f2fs_init_inode_metadata(inode, dir, fname, ifolio);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
 			goto fail;
 		}
 	}
 
-	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 
 	f2fs_update_dentry(ino, mode, &d, &fname->disk_name, fname->hash,
 			   bit_pos);
 
-	set_page_dirty(ipage);
+	folio_mark_dirty(ifolio);
 
 	/* we don't need to mark_inode_dirty now */
 	if (inode) {
@@ -693,7 +693,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 	if (inode)
 		f2fs_up_write(&F2FS_I(inode)->i_sem);
 out:
-	f2fs_put_page(ipage, 1);
+	f2fs_folio_put(ifolio, true);
 	return err;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
