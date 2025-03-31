Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FEA76E65
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVt-0005mh-T3;
	Mon, 31 Mar 2025 20:13:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVf-0005bq-RU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2C3eONFPZc/Y8OpL9BV2oKCqt/QRbB7qXoZskabYyg8=; b=fFcNmJZ+v8f0CXsIfoKXg6rj8H
 IiyxfpR3vu9hUG3kK4UWHU7fWWShnZqZpURuLstDkPJaxLlwXqfzb0V8MlX7157WBJEGFiIl/mFNx
 Z/p+ji82fQeey9+HCbJWe/fhEeA9hnQfS79Xf4LVWnG97mwIH0Jfl5PqBYJEoM+MSo+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2C3eONFPZc/Y8OpL9BV2oKCqt/QRbB7qXoZskabYyg8=; b=ZAvUCMbsBGgOUvwYydWA4LCJHi
 d9JoG2CBCysev3pTyf7jBbQeV45Hupd72jmFdlN5USrHCMunS8DpTu2JzecGS83rKgAfo1yJeIJAV
 RvytH+FSrskse9rPqfXD7rBsUReacl9xCq9LN0D7VDTB4fVJcNN7/D6yIqW2T7Cq1tLY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVe-0003dK-LE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2C3eONFPZc/Y8OpL9BV2oKCqt/QRbB7qXoZskabYyg8=; b=E/d2PmjiG5fn4Q6BA5/NkhWoQE
 YJkKZ/8lZoNy9GsanqKORITwDPxGOjIf5gEqrOboGqf/I7bacrO59+ueh3L+YF0eyQXzVpbX2I7Lc
 uUEg/QmHRxOOWC+pSkUBVbvlfzDzG5A7+o5KYmdJjqVunFj2h/gpAN7jcpaaXYILJzmcLsNa6CPct
 ZgxcFiaWShsd9A3H1ikhBxxtuOiu3mKcS/rtNmwy+dN4FJ+oLSbEuRx/kxKXSA+Q7vjDVdearm6jh
 ELP1SIZ+ThHBIIN0zQBafoul5jXYIhetBsUEKaTGJlRGf/HoEf5vEQO6349ho3lwYNxnVieaer0JQ
 DjXr/BVw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVT-00000004S1g-17Cm;
 Mon, 31 Mar 2025 20:13:15 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:45 +0100
Message-ID: <20250331201256.1057782-86-willy@infradead.org>
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
 Content preview: Remove a call to f2fs_get_inode_page(). Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index af0106e4f184..5904a40fbf51 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -3354, 7 +3354,
 7 @@ static int prepare_write_begin(struct f2fs_sb_info [...] 
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
X-Headers-End: 1tzLVe-0003dK-LE
Subject: [f2fs-dev] [PATCH 085/153] f2fs: Use a folio in prepare_write_begin
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

Remove a call to f2fs_get_inode_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index af0106e4f184..5904a40fbf51 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3354,7 +3354,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	struct inode *inode = folio->mapping->host;
 	pgoff_t index = folio->index;
 	struct dnode_of_data dn;
-	struct page *ipage;
+	struct folio *ifolio;
 	bool locked = false;
 	int flag = F2FS_GET_BLOCK_PRE_AIO;
 	int err = 0;
@@ -3379,20 +3379,20 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 restart:
 	/* check inline_data */
-	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
-	if (IS_ERR(ipage)) {
-		err = PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+	if (IS_ERR(ifolio)) {
+		err = PTR_ERR(ifolio);
 		goto unlock_out;
 	}
 
-	set_new_dnode(&dn, inode, ipage, ipage, 0);
+	set_new_dnode(&dn, inode, &ifolio->page, &ifolio->page, 0);
 
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(folio, ipage);
+			f2fs_do_read_inline_data(folio, &ifolio->page);
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
-				set_page_private_inline(ipage);
+				set_page_private_inline(&ifolio->page);
 			goto out;
 		}
 		err = f2fs_convert_inline_page(&dn, folio_page(folio, 0));
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
