Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E557EA76E67
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVu-0005nH-9D;
	Mon, 31 Mar 2025 20:13:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-0005cT-QA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9T2N+BcLpB/YGj5dre8KW3ZYzF/CgLlDBbPsRMY5iI=; b=Rf0vmq7ptX5v0lvcuvcS7xSE4o
 P0zIiAEQjTxXGSejVcGY8wAizmflTS1JBOPQpIScT0JKQ++BauZU25lSbkJnyadWqV167IRd7+4V0
 YgGJGLOtTApZokfgOUpDNU2vSP613+rDlNd4U9+kll49gTbm21bmhfJrykUwNtdIGQO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t9T2N+BcLpB/YGj5dre8KW3ZYzF/CgLlDBbPsRMY5iI=; b=i4IDHZ/vQIYkipPBUZzPxPvsyM
 wFo+AhHCztqzsTMfeEUsqL+Li3yy3kNta6IOq/RCPUb8ipKbAym4s9fTidqB2Sf86NAFugIXKF36B
 9w24OFxHHHgwAhRBppEUAO9i6n2a0xc8zO4/zmUifD6KyGi+336pUMRv+sQbHOyzsOEU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVa-0003bZ-JK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=t9T2N+BcLpB/YGj5dre8KW3ZYzF/CgLlDBbPsRMY5iI=; b=CrMHtm7k4iqQYW1C/PWd4FCAlo
 XHOZjuIwD+xpNVcTBDdFhBk4rGmMXl3N9iysL28NaOE85tvO5+hfbuVN9nqKIninZLwn3FYJc/M/d
 4UuCYn3pevFGhIvDvf3fYb5ARKXivoeivjne6QyeH2VS0baPh9+oB1mFl6ygiLKuyudxMPvJoJNu8
 7fp6gQtt+GcLDBYiXi4ILmos2cbtc37bRlI8QZujTQ9LqdiFh5Jib9S8+5mT79AphsEKqwnY95pzE
 BUaxfFdcNsEVWRSi4Slr5iwwLtFHF0Ell7JOEIN/buqYm+cR80Cyp38noAlUV+6XfPaTXufTNpywL
 7kct80NA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVU-00000004S2z-0Yem;
 Mon, 31 Mar 2025 20:13:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:49 +0100
Message-ID: <20250331201256.1057782-90-willy@infradead.org>
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
 Content preview:  Remove two hidden calls to compound_head() Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 18
 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-) diff --git a/fs/f2fs/inline.c
 b/fs/f2fs/inline.c index 9bac2c4e8937..4684ecc0cb5a 100644 ---
 a/fs/f2fs/inline.c +++ b/fs/f2fs/inline.c @@ -595, 7 +595,
 7 @@ static int do_convert_inline_dir(struct inode [...] 
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
X-Headers-End: 1tzLVa-0003bZ-JK
Subject: [f2fs-dev] [PATCH 089/153] f2fs: Use a folio in
 f2fs_try_convert_inline_dir()
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

Remove two hidden calls to compound_head()

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inline.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 9bac2c4e8937..4684ecc0cb5a 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -595,7 +595,7 @@ static int do_convert_inline_dir(struct inode *dir, struct page *ipage,
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
-	struct page *ipage;
+	struct folio *ifolio;
 	struct f2fs_filename fname;
 	void *inline_dentry = NULL;
 	int err = 0;
@@ -609,22 +609,22 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 	if (err)
 		goto out;
 
-	ipage = f2fs_get_inode_page(sbi, dir->i_ino);
-	if (IS_ERR(ipage)) {
-		err = PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(sbi, dir->i_ino);
+	if (IS_ERR(ifolio)) {
+		err = PTR_ERR(ifolio);
 		goto out_fname;
 	}
 
-	if (f2fs_has_enough_room(dir, ipage, &fname)) {
-		f2fs_put_page(ipage, 1);
+	if (f2fs_has_enough_room(dir, &ifolio->page, &fname)) {
+		f2fs_folio_put(ifolio, true);
 		goto out_fname;
 	}
 
-	inline_dentry = inline_data_addr(dir, ipage);
+	inline_dentry = inline_data_addr(dir, &ifolio->page);
 
-	err = do_convert_inline_dir(dir, ipage, inline_dentry);
+	err = do_convert_inline_dir(dir, &ifolio->page, inline_dentry);
 	if (!err)
-		f2fs_put_page(ipage, 1);
+		f2fs_folio_put(ifolio, true);
 out_fname:
 	f2fs_free_filename(&fname);
 out:
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
