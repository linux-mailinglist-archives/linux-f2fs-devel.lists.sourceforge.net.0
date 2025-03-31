Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690BA76E48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVj-0003sr-Oj;
	Mon, 31 Mar 2025 20:13:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVd-0003oC-Az
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MHwIW9QCemxvBdkE0bsQOACzwKCC3CW1RBMop6Wtv4E=; b=lPhWKvI8mgvKnS1qOKKadoYqz0
 lfwSBsWf39NAhBlhFafubWhzGqPP/ZzTF4Hu1n3/NK3H6ZC6avvuIPduCjz8tk/9QRcDVrU04HNDk
 txlFAFX13KVplLiakS0N888senvSckM+hVCi5IKsmbGknv+fc/kv6FABq2xGjN4lGtEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MHwIW9QCemxvBdkE0bsQOACzwKCC3CW1RBMop6Wtv4E=; b=K/kf+Xxq4cpvsFrMxtfs0rvaM6
 d+5QzsAP7m/Pf+F81BwsqgIIQ62gJiVpAwRe+2fxqZlZJnTfOnSAvEc6d3Kw4sEaZyB/pfYttSM9e
 zcQOOTjTwLRSAyqgPRY+w0KrwcGalMK3K+oRkNjkazldK+cn0CFI6qs5xu17tal777AM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVS-0003Z3-L9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MHwIW9QCemxvBdkE0bsQOACzwKCC3CW1RBMop6Wtv4E=; b=m2G0EHXeR20OqI8P7RszKLG/77
 HsCT6o2UOmPAQXPZB+WfVspY5W0Ezp9EU2SGbC+5P5elhl8Qc3bvM+oVSpNb+1ljYxUWqR/5HXUx9
 SH5Tyr3E5Ceifrn8mm0ARMU3SM4OqF4qnQOPZlaGbofHIk+yVmN3MhmUitZ/mKaq6q//AtznCu+ig
 Fzyn2fYVztrG/VIpUG26pVECSCKZZC599zEhbc9FHWXDaRFGFCz0m+RMy5v9CWgCfUN5PKbiDUu1q
 ovVzyZmWy61TtAWjkS0y466qKjb26QpRzX+GHe0FTVNIyF8j9RFjA8USTC7X7D3tLhwD946gtKE5M
 u8LP9zwg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVM-00000004RjO-191e;
 Mon, 31 Mar 2025 20:13:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:08 +0100
Message-ID: <20250331201256.1057782-49-willy@infradead.org>
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
 Content preview: Get folios from the pagecache instead of pages. Remove five
 calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/data.c | 26 +++++++++++++ 1 file changed, 13 insertions(+), 13
 deletions(-) 
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
X-Headers-End: 1tzLVS-0003Z3-L9
Subject: [f2fs-dev] [PATCH 048/153] f2fs: Use a folio in
 f2fs_get_new_data_page()
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

Get folios from the pagecache instead of pages.  Remove five calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 23e37207ed90..9c79ceed1c6d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1346,12 +1346,12 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
 		struct page *ipage, pgoff_t index, bool new_i_size)
 {
 	struct address_space *mapping = inode->i_mapping;
-	struct page *page;
+	struct folio *folio;
 	struct dnode_of_data dn;
 	int err;
 
-	page = f2fs_grab_cache_page(mapping, index, true);
-	if (!page) {
+	folio = f2fs_grab_cache_folio(mapping, index, true);
+	if (IS_ERR(folio)) {
 		/*
 		 * before exiting, we should make sure ipage will be released
 		 * if any error occur.
@@ -1363,33 +1363,33 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
 	set_new_dnode(&dn, inode, ipage, NULL, 0);
 	err = f2fs_reserve_block(&dn, index);
 	if (err) {
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 		return ERR_PTR(err);
 	}
 	if (!ipage)
 		f2fs_put_dnode(&dn);
 
-	if (PageUptodate(page))
+	if (folio_test_uptodate(folio))
 		goto got_it;
 
 	if (dn.data_blkaddr == NEW_ADDR) {
-		zero_user_segment(page, 0, PAGE_SIZE);
-		if (!PageUptodate(page))
-			SetPageUptodate(page);
+		folio_zero_segment(folio, 0, folio_size(folio));
+		if (!folio_test_uptodate(folio))
+			folio_mark_uptodate(folio);
 	} else {
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 
 		/* if ipage exists, blkaddr should be NEW_ADDR */
 		f2fs_bug_on(F2FS_I_SB(inode), ipage);
-		page = f2fs_get_lock_data_page(inode, index, true);
-		if (IS_ERR(page))
-			return page;
+		folio = f2fs_get_lock_data_folio(inode, index, true);
+		if (IS_ERR(folio))
+			return &folio->page;
 	}
 got_it:
 	if (new_i_size && i_size_read(inode) <
 				((loff_t)(index + 1) << PAGE_SHIFT))
 		f2fs_i_size_write(inode, ((loff_t)(index + 1) << PAGE_SHIFT));
-	return page;
+	return &folio->page;
 }
 
 static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
