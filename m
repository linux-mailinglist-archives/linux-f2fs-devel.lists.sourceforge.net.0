Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98BA76EBA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWU-0001EC-0v;
	Mon, 31 Mar 2025 20:14:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVn-0000pU-0D
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QQRoOYjUsR6MH11JnOX2eaI1Bi5I5K1aXsgWYBe5AWA=; b=fzg12Px8xXt9qCrj66S41KY47L
 56ZiE4O0FENwWkBdRu9Sr7khPX6zrDYvWC0fw/sCVL2KjsWZPqEkWvkahmpslk32OR926fWnD24oO
 q5ZL/LihO1lfOGjPm9qJyQLFCY868gvcS4dh89VjMh2HSScqEAeOCdAssBi6cbF/1Mz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QQRoOYjUsR6MH11JnOX2eaI1Bi5I5K1aXsgWYBe5AWA=; b=bzj19f/Kt6YyELJATgnQsv9qjM
 ULD15/ogxjC8m9qBnwrE9LN164mv5b07bRsAnlatbULg87oRE6W/ZlfLhwkC32sVFOrpLtBxueTNy
 NN/1+bUPL+CxhBeNVmBtRUvHN4OH34dJJ77/U8rIs/EHmyoflnBaKX+b7MdDhBuNDuvk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVh-0003ee-QO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QQRoOYjUsR6MH11JnOX2eaI1Bi5I5K1aXsgWYBe5AWA=; b=qoDPOH/IIZAwQIKkzj63xVmDum
 xo9W6TRqfADHTe1Cs8IzvyWyPcBoJoJ70cxH3PxA9KKO03LkVuUNUEfUCBB1BLOI7I3qIqL5pi2wT
 ACYbW0wb2/AWXHBAUonLDsXuIF6WZbpEmbPAO1Hnj+RBCDL7FgbTYMlg7j05vQXYbekDHmqwnPCEG
 6mCHsEegsnO9sh0rv37/GnWyB9BTMpixAr3uFyWHpqp19SRPBaONUBD/wGWxDQDGT/5Zx3P+GnGeY
 kH8aYnHoMAUB5koAUAR2gNHGa1MP5W1AhkOfoeWcKwE31Osq3duXTgqKBy0pUE6dlW+5QC2FQVUW2
 sAu1AWyA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVW-00000004SCf-144C;
 Mon, 31 Mar 2025 20:13:18 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:00 +0100
Message-ID: <20250331201256.1057782-101-willy@infradead.org>
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
 Content preview: Remove two calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-) diff --git a/fs/f2fs/inline.c
 b/fs/f2fs/inline.c index 55c0b82d43d5..245cbff2ca2c 100644 ---
 a/fs/f2fs/inline.c +++ b/fs/f2fs/inline.c @@ -117, 27 +117,
 27 @@ void f2fs_truncate_inline_inode(struct inod [...] 
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
X-Headers-End: 1tzLVh-0003ee-QO
Subject: [f2fs-dev] [PATCH 100/153] f2fs: Use a folio in
 f2fs_read_inline_data()
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

Remove two calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inline.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 55c0b82d43d5..245cbff2ca2c 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -117,27 +117,27 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 {
-	struct page *ipage;
+	struct folio *ifolio;
 
-	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
-	if (IS_ERR(ipage)) {
+	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ifolio)) {
 		folio_unlock(folio);
-		return PTR_ERR(ipage);
+		return PTR_ERR(ifolio);
 	}
 
 	if (!f2fs_has_inline_data(inode)) {
-		f2fs_put_page(ipage, 1);
+		f2fs_folio_put(ifolio, true);
 		return -EAGAIN;
 	}
 
 	if (folio_index(folio))
 		folio_zero_segment(folio, 0, folio_size(folio));
 	else
-		f2fs_do_read_inline_data(folio, ipage);
+		f2fs_do_read_inline_data(folio, &ifolio->page);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
-	f2fs_put_page(ipage, 1);
+	f2fs_folio_put(ifolio, true);
 	folio_unlock(folio);
 	return 0;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
