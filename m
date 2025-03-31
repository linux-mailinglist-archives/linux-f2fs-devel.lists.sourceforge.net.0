Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BCDA76E2B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVb-0000vm-Qc;
	Mon, 31 Mar 2025 20:13:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVX-0000tq-HA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LJiSmt7LeqhyMyaZnkvAvZYW4xiltIWWZhN+XZJfgyc=; b=FJ6YUe3Cp+j5qmE8xA5XXLrs+p
 kRyjHvDmaJ3UyJAY11ooND9CrINR0Iy+35STOMIsFwm+pRe6km+M2JWCgthk7b9+hEOTfcA/1wvni
 2gPjg2SFuwGUhvhkGJvkYUu2iDtlohkkk0pvYBQj5uerUx6pKoEa/qG5bxEdJttP54FQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LJiSmt7LeqhyMyaZnkvAvZYW4xiltIWWZhN+XZJfgyc=; b=P/dhokTbySt06nQBPExIn9KDj3
 1T6IKKUwqexfqSnbc/DSjWqI8Xe91PqfVJU4M2YQqkrLCoTiIkMAl8d6FE/F2aOVLSMsAGMF9r3Oe
 JymgAxXTzHeCYL1Hus+bAXYI+Tlm0U4y+XwjZoRrq5Gj2uH5G2uQhhy6hJORpXd7eGWc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVN-0003YK-Jz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LJiSmt7LeqhyMyaZnkvAvZYW4xiltIWWZhN+XZJfgyc=; b=VWsulJSWdusQCixH5hzi8DqCBz
 Zs634AESznYrjLJBmEh8Q/nQm/1HESDqJHtlq/uIEDtg1rOZJ15dwEwj1rQz5nCDPxiqbnl6i7Whq
 rjtscKqrwo68d+STtPfvgq3ju/xLPlUDRc9y9/fR6qkTvT6OG93lFpmnqeWMaUMNyWQO+anBId01X
 vRjXMciTSs5PWebI2r9UcHPe7lEB1hBlxNbkjGWZBt5aQ4ce0CaSmZUB43iYriR596/CMAi5aG1SC
 bg+xqRKX2VYp/eVrQ36NZQWKRxz5qUeCng6wPmWRbpHMRJdoZOBTZvhyPK0Kmi9A58cC/Sn8Gy/gH
 /tMjXWYw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RWz-1866;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:35 +0100
Message-ID: <20250331201256.1057782-16-willy@infradead.org>
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
 Content preview: Push the conversion to a page into the callers.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/checkpoint.c |
 18 +++++++++--------- 1 file changed, 9 insertions(+), 9 deletions(-) 
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
X-Headers-End: 1tzLVN-0003YK-Jz
Subject: [f2fs-dev] [PATCH 015/153] f2fs: Convert __get_meta_page() to
 __get_meta_folio()
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

Push the conversion to a page into the callers.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 55fcb9869531..1274b66ab5fc 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -54,7 +54,7 @@ struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index)
 	return folio;
 }
 
-static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
+static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index,
 							bool is_meta)
 {
 	struct address_space *mapping = META_MAPPING(sbi);
@@ -104,34 +104,34 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 		return ERR_PTR(-EIO);
 	}
 out:
-	return &folio->page;
+	return folio;
 }
 
 struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
 {
-	return __get_meta_page(sbi, index, true);
+	return &__get_meta_folio(sbi, index, true)->page;
 }
 
 struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
 {
-	struct page *page;
+	struct folio *folio;
 	int count = 0;
 
 retry:
-	page = __get_meta_page(sbi, index, true);
-	if (IS_ERR(page)) {
-		if (PTR_ERR(page) == -EIO &&
+	folio = __get_meta_folio(sbi, index, true);
+	if (IS_ERR(folio)) {
+		if (PTR_ERR(folio) == -EIO &&
 				++count <= DEFAULT_RETRY_IO_COUNT)
 			goto retry;
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_META_PAGE);
 	}
-	return page;
+	return &folio->page;
 }
 
 /* for POR only */
 struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index)
 {
-	return __get_meta_page(sbi, index, false);
+	return &__get_meta_folio(sbi, index, false)->page;
 }
 
 static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
