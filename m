Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06004A76EB2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWR-0001Ap-AW;
	Mon, 31 Mar 2025 20:14:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-0000lZ-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1gbY2g7Zyvn0DuuHqbrMUFfQojFKdgfK8gGO2cQa2IE=; b=YZfRFD2Ibmj3FvGvLWMQWL1Adx
 0tdaUsXAKdN/d7zwSzWHx1ulxj8iaCcKIyuaXmVa5GI+31Ra5pKN5e3YZAdVzbPVE4XksHIBzhUsg
 SWl5bblmoc0TNyTtcVhwcY4i384gMwnJHDpIOtnTfNSPsSPTpdka6+FiEpybFDBwu9DA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1gbY2g7Zyvn0DuuHqbrMUFfQojFKdgfK8gGO2cQa2IE=; b=SN8u9lxqDGWWCNsmI8P+p1w1LZ
 1ZKb5g0/uOxIzIQ42IF2EvwnCht8mYKuRt8OhuHINQAJ8jaJ3J3aWTI3qBy+jBxSfuyYyD90PBdo3
 zzr5afac6baKfC2ZXSH+crLsa8ztGbsyrPr7wvtPrhc93PllnVuDVUtToj5hWI7hVFR0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVa-0003bk-Vn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1gbY2g7Zyvn0DuuHqbrMUFfQojFKdgfK8gGO2cQa2IE=; b=hySNXbRDLXhfL2nlkpmnO7R0W8
 fqp/w1XuU4tbs87YOjOCF1FvtXZKxn1nstaalGpsGv9Yd532ZhCPqo1Hi7g/YttD40a0MNRnwpFq9
 E6kZ2YDMucZRjJXj6BidZyhKgRUcmCvLJCKEeA3eitQfi1kJMS2UxIYVFVyJVciWXD2+xeJTh0k2+
 PU9WcmRLTpelL+78ri88DlEFWR+VMu6grGGwVUITQ52eODzWo0azHyoBldlW6xuvAo7EzSq4e5DA+
 Et694vNlRCzAFRxILp/8pXfI3osFRpguqWmJzkE1TWpBGSUHtuQIaU6cothVQ0xQd5CAJR2UG2wKM
 xeC3UjGw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVU-00000004S5J-27yf;
 Mon, 31 Mar 2025 20:13:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:51 +0100
Message-ID: <20250331201256.1057782-92-willy@infradead.org>
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
 Content preview: Pass the folio through do_convert_inline_dir() to
 f2fs_move_inline_dirents().
 Remove a call to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/inline.c | 18 +++++++++--------- 1 file
 changed, 9 insertions(+), 9 deletions(-) 
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
X-Headers-End: 1tzLVa-0003bk-Vn
Subject: [f2fs-dev] [PATCH 091/153] f2fs: Pass a folio to
 f2fs_move_inline_dirents()
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

Pass the folio through do_convert_inline_dir() to
f2fs_move_inline_dirents().  Remove a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inline.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 15d14353f2aa..9bcea1ea1c95 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -407,7 +407,7 @@ int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
  * NOTE: ipage is grabbed by caller, but if any error occurs, we should
  * release ipage in this function.
  */
-static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
+static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
 							void *inline_dentry)
 {
 	struct folio *folio;
@@ -418,11 +418,11 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
 
 	folio = f2fs_grab_cache_folio(dir->i_mapping, 0, true);
 	if (IS_ERR(folio)) {
-		f2fs_put_page(ipage, 1);
+		f2fs_folio_put(ifolio, true);
 		return PTR_ERR(folio);
 	}
 
-	set_new_dnode(&dn, dir, ipage, NULL, 0);
+	set_new_dnode(&dn, dir, &ifolio->page, NULL, 0);
 	err = f2fs_reserve_block(&dn, 0);
 	if (err)
 		goto out;
@@ -460,7 +460,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
 	folio_mark_dirty(folio);
 
 	/* clear inline dir and flag after data writeback */
-	f2fs_truncate_inline_inode(dir, ipage, 0);
+	f2fs_truncate_inline_inode(dir, &ifolio->page, 0);
 
 	stat_dec_inline_dir(dir);
 	clear_inode_flag(dir, FI_INLINE_DENTRY);
@@ -583,13 +583,13 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
 	return err;
 }
 
-static int do_convert_inline_dir(struct inode *dir, struct page *ipage,
+static int do_convert_inline_dir(struct inode *dir, struct folio *ifolio,
 							void *inline_dentry)
 {
 	if (!F2FS_I(dir)->i_dir_level)
-		return f2fs_move_inline_dirents(dir, ipage, inline_dentry);
+		return f2fs_move_inline_dirents(dir, ifolio, inline_dentry);
 	else
-		return f2fs_move_rehashed_dirents(dir, ipage, inline_dentry);
+		return f2fs_move_rehashed_dirents(dir, &ifolio->page, inline_dentry);
 }
 
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
@@ -622,7 +622,7 @@ int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
 
 	inline_dentry = inline_data_addr(dir, &ifolio->page);
 
-	err = do_convert_inline_dir(dir, &ifolio->page, inline_dentry);
+	err = do_convert_inline_dir(dir, ifolio, inline_dentry);
 	if (!err)
 		f2fs_folio_put(ifolio, true);
 out_fname:
@@ -653,7 +653,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 
 	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
 	if (bit_pos >= d.max) {
-		err = do_convert_inline_dir(dir, &ifolio->page, inline_dentry);
+		err = do_convert_inline_dir(dir, ifolio, inline_dentry);
 		if (err)
 			return err;
 		err = -EAGAIN;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
