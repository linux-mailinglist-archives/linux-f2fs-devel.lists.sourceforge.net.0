Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80DA76EAE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWL-0001Ul-OE;
	Mon, 31 Mar 2025 20:14:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVq-00016s-G7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wg+itZtrVbbDbu3kA8mZioVh1TqWjkpPtbtgH2DHiU8=; b=bTycFpS0GQFIYK8OFkcFoe5xU9
 OMm0Mc64L69BNyoxeMdB+leUvGnY6wH91HGlMW3/GnPgLG7exlxRj86mFgswE5WIMvwpVJ0+QGH3M
 h/oxzUJIxKM+CQfUqjVs3EGkoMJDu3423pg3MNLKH1+XU5sq0rgNrjU5x+V+RMZVHkQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wg+itZtrVbbDbu3kA8mZioVh1TqWjkpPtbtgH2DHiU8=; b=S9xZC4SL88sfy+e3IIf/sRt22z
 Vx373sti3tgzre1tX2d/Mr8ryFBf0fY38wq2MeOe+N87zC6+3IdiYuZ7nXQGIaez60BY/ygjR6Odd
 /pyrcnVCI89v/Z3vmq0u04Hkg/ADNVowlkY/geFg9/eTfkF8/DTpX2pS/eqGTZlDcQMg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVg-0003dr-85 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=wg+itZtrVbbDbu3kA8mZioVh1TqWjkpPtbtgH2DHiU8=; b=AYZ8734hjMml9h7btF/WbEO7Nr
 y0A/UUvEVJ+JwT5tlEaPuZbCV8X93XdqKdHngdZ7M0b1tNIrbS7ch0OCz+s1p74wWmCGp3Sw4TWDq
 NocrkpSZ8dcjJEPdx+QpG7OOqo4onnlGTtrV112tbBTBnePlFEpqn9fqyFkmZGHC4gzJMDbBXMgUf
 bAdqVMZnIO39cQdjDWNZcglhQi9hVNCxxQTa7LaekOlxSfdMsq8grammdgsDpGCBjlM8XGK3LmJGt
 LyRtY3gLAzThaV5lKKug/Gsr+1nsnBNYcH4OkIZWQTP6xSviLQal3xOgdy9GznoO4L35MEE9PW4GE
 P5ZVkpeQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVZ-00000004ST9-3LeS;
 Mon, 31 Mar 2025 20:13:21 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:21 +0100
Message-ID: <20250331201256.1057782-122-willy@infradead.org>
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
 Content preview:  The only caller already has a folio, so pass it in. Removes
 a hidden call to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/inline.c
 | 6 +++--- 3 files changed, 5 insertions(+), 5 deletions(-) 
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
X-Headers-End: 1tzLVg-0003dr-85
Subject: [f2fs-dev] [PATCH 121/153] f2fs: Pass a folio to
 f2fs_make_empty_inline_dir()
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

The only caller already has a folio, so pass it in.  Removes a
hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c    | 2 +-
 fs/f2fs/f2fs.h   | 2 +-
 fs/f2fs/inline.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 85e42df34c99..5c02d55563e3 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -498,7 +498,7 @@ static int make_empty_dir(struct inode *inode,
 	struct f2fs_dentry_ptr d;
 
 	if (f2fs_has_inline_dentry(inode))
-		return f2fs_make_empty_inline_dir(inode, parent, &folio->page);
+		return f2fs_make_empty_inline_dir(inode, parent, folio);
 
 	dentry_folio = f2fs_get_new_data_folio(inode, folio, 0, true);
 	if (IS_ERR(dentry_folio))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 60381c3c3d9b..2fc95b671b10 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4287,7 +4287,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 					struct page **res_page,
 					bool use_hash);
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
-			struct page *ipage);
+			struct folio *ifolio);
 int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
 void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 81a6ab05363e..d27205a789af 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -385,17 +385,17 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 }
 
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
-							struct page *ipage)
+							struct folio *ifolio)
 {
 	struct f2fs_dentry_ptr d;
 	void *inline_dentry;
 
-	inline_dentry = inline_data_addr(inode, ipage);
+	inline_dentry = inline_data_addr(inode, &ifolio->page);
 
 	make_dentry_ptr_inline(inode, &d, inline_dentry);
 	f2fs_do_make_empty_dir(inode, parent, &d);
 
-	set_page_dirty(ipage);
+	folio_mark_dirty(ifolio);
 
 	/* update i_size to MAX_INLINE_DATA */
 	if (i_size_read(inode) < MAX_INLINE_DATA(inode))
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
