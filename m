Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC12A76E6D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVv-0005oa-O5;
	Mon, 31 Mar 2025 20:13:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVh-0005dB-HF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tT61lvV8A7eS+BVUKsY6L88N1CCuVvatMiEn4MnQU4s=; b=ZGRUPdYSo07nSdRXQNoc3BfajU
 Pwo7Lv/I/Ct4dUNLSwDxPsLhR5amYVGmz2JQrAqDdVT0jhWBJpDnTDlrZsgaZh1e1iSZPRIweRxAU
 /AstRaoYl2n/TPBzSC36vIToWXNNmgx9TQYoGVaQZ18EsxuEm2NeMF5YZXvWzWf9IsNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tT61lvV8A7eS+BVUKsY6L88N1CCuVvatMiEn4MnQU4s=; b=E9ozW/lOhs2dwEwnwS3MYB7M17
 iT7wEda3ygZxUARWljIJsQJIaGduvGUxXnX4mz7eXnxkcPlbAItE3VZTKIO5O8t4bMTE1WeH4WwVm
 aLbNkxDgO/ltghHPmEmpYoY2xBTDYnm90lOmZfi4SSe9OVpT+udMy2Rvdr8nzK+wuqss=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVg-0003du-AI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tT61lvV8A7eS+BVUKsY6L88N1CCuVvatMiEn4MnQU4s=; b=f9pyryHkjnNqiBUMaAY+4K7gu+
 OzmwHADLSm2o0MXetpf9Uc00cJ2KCdaI4J/4AhC2wO6Jlf6SPzCj9bnoI2myajCNTb+jWvjDQKXM9
 kaCyldpNEmmKrr0x19ZKAx5nC7YLv83ZxrYs66SXn/OAkGaQL9Hk0eUIHk8EGiYMoqEJMw44ySgO5
 08WZmxx9n4QFh16Jona87YPw+cmCKQTurYHirIUPGHRr95Zb/RQPxhzE8O0YpSHCIPbSUZzD2hKo+
 iq+h3BCj+AFkbGKIl1k5LK6bwAupRo2/h/CM1DUENprbJ+7z717eEGhJKO6BwgON4tejTJQNAzxN7
 meQbKjKg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVU-00000004S6Y-32uH;
 Mon, 31 Mar 2025 20:13:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:52 +0100
Message-ID: <20250331201256.1057782-93-willy@infradead.org>
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
 Content preview: Remove seven hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 20
 ++++++++++ 1 file changed, 10 insertions(+), 10 deletions(-) 
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
X-Headers-End: 1tzLVg-0003du-AI
Subject: [f2fs-dev] [PATCH 092/153] f2fs: Pass a folio to
 f2fs_move_rehashed_dirents()
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

Remove seven hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inline.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 9bcea1ea1c95..1bc6a0d61f7e 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -533,7 +533,7 @@ static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
 	return err;
 }
 
-static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
+static int f2fs_move_rehashed_dirents(struct inode *dir, struct folio *ifolio,
 							void *inline_dentry)
 {
 	void *backup_dentry;
@@ -542,20 +542,20 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
 	backup_dentry = f2fs_kmalloc(F2FS_I_SB(dir),
 				MAX_INLINE_DATA(dir), GFP_F2FS_ZERO);
 	if (!backup_dentry) {
-		f2fs_put_page(ipage, 1);
+		f2fs_folio_put(ifolio, true);
 		return -ENOMEM;
 	}
 
 	memcpy(backup_dentry, inline_dentry, MAX_INLINE_DATA(dir));
-	f2fs_truncate_inline_inode(dir, ipage, 0);
+	f2fs_truncate_inline_inode(dir, &ifolio->page, 0);
 
-	unlock_page(ipage);
+	folio_unlock(ifolio);
 
 	err = f2fs_add_inline_entries(dir, backup_dentry);
 	if (err)
 		goto recover;
 
-	lock_page(ipage);
+	folio_lock(ifolio);
 
 	stat_dec_inline_dir(dir);
 	clear_inode_flag(dir, FI_INLINE_DENTRY);
@@ -571,13 +571,13 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
 	kfree(backup_dentry);
 	return 0;
 recover:
-	lock_page(ipage);
-	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+	folio_lock(ifolio);
+	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 	memcpy(inline_dentry, backup_dentry, MAX_INLINE_DATA(dir));
 	f2fs_i_depth_write(dir, 0);
 	f2fs_i_size_write(dir, MAX_INLINE_DATA(dir));
-	set_page_dirty(ipage);
-	f2fs_put_page(ipage, 1);
+	folio_mark_dirty(ifolio);
+	f2fs_folio_put(ifolio, 1);
 
 	kfree(backup_dentry);
 	return err;
@@ -589,7 +589,7 @@ static int do_convert_inline_dir(struct inode *dir, struct folio *ifolio,
 	if (!F2FS_I(dir)->i_dir_level)
 		return f2fs_move_inline_dirents(dir, ifolio, inline_dentry);
 	else
-		return f2fs_move_rehashed_dirents(dir, &ifolio->page, inline_dentry);
+		return f2fs_move_rehashed_dirents(dir, ifolio, inline_dentry);
 }
 
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
