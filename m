Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46896A76E24
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVV-0000sR-B1;
	Mon, 31 Mar 2025 20:13:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVO-0000rj-9F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FjOppThpLmYB/HtBc3gYJ90YO4RBGnLgSmU7TtJFrJo=; b=lokJRQ0Kp0BsC16E9NPwOGQA1J
 on8Bxnpl7Ce0m4GadsTlCKCsAYhXLQTEr8/IEBBK614c/nqiF8laAbbXguycFawol973Cmv9ae443
 XdfG9DD85mku9oGjjEP3CREsMHJY9zIUTmcToNOlXppsNmg9/jnPefh7/f3gP+ZoK9E0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FjOppThpLmYB/HtBc3gYJ90YO4RBGnLgSmU7TtJFrJo=; b=NUeg8wdiOuy1j55Ti5yQzFDgNl
 OIrrfYK92eQf0g9qI0JtDwUPJE9fw88bffPvyEmW4jL0tjbZvxciOOy50cfvf0WTq/yNYHC0SLPwX
 31HLybNR3LBj/cW63Vx70hXWnMToMAwOPnL8tTRvqw6ssBZJsS9711ajBFeLnTBbsRNo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVO-0003YR-5o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FjOppThpLmYB/HtBc3gYJ90YO4RBGnLgSmU7TtJFrJo=; b=K0F+wpMroYexti8/FDOPE6McZN
 CImT5NOy1kuDmNBIRDuNgq7+utuhDhWFWvgIjr0IV0pZnvf1Cq5HqBBjArhB5v+obWqrQBnzBpnWJ
 YIIxOnpxP3emhd32JDTO6wlCUQl2CUUgxRHhTu9a7ZWuE8DI9xZeByRApcnaNbZ9TQ24Tq4gTIsLa
 Jy5keLf5FaQKyEegvmM05AEi50Rq8THqBEYEkCbfty3s2aqbvMjtS5pDLua2UNppe0qst2TMcfodN
 GnYkBEDcqHjjRWSZSIlzNXDX8XALrj7RVdwrAMwkM+3T2Y59YOMGR8E86ViJMlCMpQLQjgJ5LRuK1
 O+3kjgYw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RXs-3EiA;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:39 +0100
Message-ID: <20250331201256.1057782-20-willy@infradead.org>
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
 Content preview: Remove a call to find_get_page(). Saves two hidden calls to
 compound_head(). Change f2fs_folio_put() to check for IS_ERR_OR_NULL to handle
 the case where we got an error pointer back from filemap_get_ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
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
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVO-0003YR-5o
Subject: [f2fs-dev] [PATCH 019/153] f2fs: Use a folio in
 f2fs_ra_meta_pages_cond()
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

Remove a call to find_get_page().  Saves two hidden calls to
compound_head().  Change f2fs_folio_put() to check for IS_ERR_OR_NULL
to handle the case where we got an error pointer back from
filemap_get_folio().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 8 ++++----
 fs/f2fs/f2fs.h       | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1a5fbecd9356..30e68de82f73 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -325,16 +325,16 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
 							unsigned int ra_blocks)
 {
-	struct page *page;
+	struct folio *folio;
 	bool readahead = false;
 
 	if (ra_blocks == RECOVERY_MIN_RA_BLOCKS)
 		return;
 
-	page = find_get_page(META_MAPPING(sbi), index);
-	if (!page || !PageUptodate(page))
+	folio = filemap_get_folio(META_MAPPING(sbi), index);
+	if (IS_ERR(folio) || !folio_test_uptodate(folio))
 		readahead = true;
-	f2fs_put_page(page, 0);
+	f2fs_folio_put(folio, 0);
 
 	if (readahead)
 		f2fs_ra_meta_pages(sbi, index, ra_blocks, META_POR, true);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3d2be01f9363..f05185ed1c75 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2871,7 +2871,7 @@ static inline struct page *f2fs_pagecache_get_page(
 
 static inline void f2fs_folio_put(struct folio *folio, bool unlock)
 {
-	if (!folio)
+	if (IS_ERR_OR_NULL(folio))
 		return;
 
 	if (unlock) {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
