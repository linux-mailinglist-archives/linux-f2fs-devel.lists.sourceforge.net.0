Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D1A76E88
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW1-0000z5-83;
	Mon, 31 Mar 2025 20:13:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVe-0000l8-2d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EjUokj9eJAJP89y4kcrjqwOqpwneFb1gJvtILyZfuO0=; b=GO60aTLeYpZpdxr45qh29djmry
 vwx9uwFiz/L6oQ7hvyWGr+aL+F3x+LgePrzMWdJtTpl4nbxKfkMT0M4gSzwwDIcgdMEHjZB0kaXZd
 jqF20F3gaMbLEHAyNtEayeO1R64Z279Q46pIFIMOdT9Eu1xUfd9x/1z5ovtn8ucGNjJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EjUokj9eJAJP89y4kcrjqwOqpwneFb1gJvtILyZfuO0=; b=b6PmMIg4Hq+wKAnhuIDZj/Rh2O
 nRpsPTIeEwmPIaf6p78NrYJqUa47/Z5d9efClsibnm8yKcaCUsrUPWHi5zJFi6sTtxGY+L3xas+RS
 Jet0jXB2c9DAV53osZ2Xa2Zz+dEJfZnLhQVt6+i5eC+GKe3HNyjzTJ1HL7Kvg/IeCZ80=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVY-0003b0-Va for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=EjUokj9eJAJP89y4kcrjqwOqpwneFb1gJvtILyZfuO0=; b=fy7DxpGiX1QHHXMG3Jen4XPjej
 9r5CxNgR92b8y1AfTxq6nAqYeGLCw+cEUkXVx5+wUCawRkAKnfZqOpE3l+cGCBWO2vIpXWgp3bIPU
 j5M007JdaRyHxU4/vL3DWLE29/QDd1j6C76RQkQe7txCg0/soPd2lnJUPQv3Tn6vT4UyV3wDqwoto
 4JDui9Hd2KalyE65rWR18GciWZjrNxhIBOeqwenjo6zQp8fvZtej/+YYS1xm69oBEsLC9QPHjrcmr
 HHO8Lovc/CLYkWm8yu+1NkFJX2wy3uvTtz9A31o/PdkLOpKmg02iU+S55pRWfzK0gae9eeiPphSbq
 A0KtAK9g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVN-00000004RnT-2NqK;
 Mon, 31 Mar 2025 20:13:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:17 +0100
Message-ID: <20250331201256.1057782-58-willy@infradead.org>
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
 Content preview:  Remove two hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/dir.c | 14
 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-) diff --git a/fs/f2fs/dir.c
 b/fs/f2fs/dir.c index 1e939c251752..2cc4ad636290 100644 --- a/fs/f2fs/dir.c
 +++ b/fs/f2fs/dir.c @@ -493,24 +493,24 @@ void f2fs_do_make_empty_dir(struct
 inode *inode, struct [...] 
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
X-Headers-End: 1tzLVY-0003b0-Va
Subject: [f2fs-dev] [PATCH 057/153] f2fs: Use a folio in make_empty_dir()
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

Remove two hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 1e939c251752..2cc4ad636290 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -493,24 +493,24 @@ void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
 static int make_empty_dir(struct inode *inode,
 		struct inode *parent, struct page *page)
 {
-	struct page *dentry_page;
+	struct folio *dentry_folio;
 	struct f2fs_dentry_block *dentry_blk;
 	struct f2fs_dentry_ptr d;
 
 	if (f2fs_has_inline_dentry(inode))
 		return f2fs_make_empty_inline_dir(inode, parent, page);
 
-	dentry_page = f2fs_get_new_data_page(inode, page, 0, true);
-	if (IS_ERR(dentry_page))
-		return PTR_ERR(dentry_page);
+	dentry_folio = f2fs_get_new_data_folio(inode, page, 0, true);
+	if (IS_ERR(dentry_folio))
+		return PTR_ERR(dentry_folio);
 
-	dentry_blk = page_address(dentry_page);
+	dentry_blk = folio_address(dentry_folio);
 
 	make_dentry_ptr_block(NULL, &d, dentry_blk);
 	f2fs_do_make_empty_dir(inode, parent, &d);
 
-	set_page_dirty(dentry_page);
-	f2fs_put_page(dentry_page, 1);
+	folio_mark_dirty(dentry_folio);
+	f2fs_folio_put(dentry_folio, true);
 	return 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
