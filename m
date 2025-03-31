Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6CEA76E79
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVx-0005rL-Rl;
	Mon, 31 Mar 2025 20:13:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVl-0005hE-UJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4vm/RRiVOmqwsgLmj0nrRGTvZJU0+lYUEuz/uWHmMx4=; b=RfNWbmjwSwcfRa1F0LUV40qEM0
 IZUSUZKgGMEY0OfOtsWkJXXEfJdy7tTDie6Zc3+F8H0lNInV4asj4rUdcnKHGd3uzZwBvQlyR2OEw
 lO4PiggI4/du8XBeAQmCbfpH+uBQonVgZJJBlt9aqezcN7hOu5Ux6LLsIKCs9fQ9MaUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4vm/RRiVOmqwsgLmj0nrRGTvZJU0+lYUEuz/uWHmMx4=; b=Py8oZAFi2Ucc4V3VzYIXd+lL2A
 GqvuJNDp8zvV7lOKwhoUliMQm4z30svd07G/Rlan6lmWj/8C3w6yQojquFwTH6iEklh9d8Q4pSE3F
 b3/CAYO4A7nQ+BysXefxG45rvneZ07cSNKWHDy23o2oHNm6yVk8bKfdUhXYpsl3EhRcQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVf-0003dg-ON for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4vm/RRiVOmqwsgLmj0nrRGTvZJU0+lYUEuz/uWHmMx4=; b=XcrFwK3+LJt7IUbZ0DigMn6FWf
 /ZJsAayUV6KTA9y4kQlOLI2Ac8Equvz5Xr/q3ZXTNLA2xE/N2XneMwpdxYM5RCHzBYMKCnlzoPKJK
 IIKcLGd3PRocG4MmVGJSu8SzeAbsSbGhatsM4xx2Qxl8nfTswDbVTTzIcdNqAOeR2Qf2bSaA0+fKW
 FD6vaV7VINjn5/RibrPhecAK4A+IJFpc7G9h1ee/bJSPHtbjLzgultW6MSL+8+5HkUiyxpDDpt4+G
 2fovcEW6ew0r6Bo4d9T3K5aKCKJfwlUqM7CjfptCFIjjTRDjfi2VOQpHJRik65gStHEjR7NygRsL/
 cu1Sx6tA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVI-00000004RZS-1JRT;
 Mon, 31 Mar 2025 20:13:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:43 +0100
Message-ID: <20250331201256.1057782-24-willy@infradead.org>
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
 Content preview:  Grab a folio instead of a page. Saves two hidden calls to
 compound_head(). Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/segment.c | 8 ++++---- 1 file changed, 4 insertions(+),
 4 deletions(-)
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
X-Headers-End: 1tzLVf-0003dg-ON
Subject: [f2fs-dev] [PATCH 023/153] f2fs: Use a folio in
 f2fs_update_meta_page()
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

Grab a folio instead of a page.  Saves two hidden calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 272490a50a04..41b9a69c995c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2687,11 +2687,11 @@ struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno)
 void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
 					void *src, block_t blk_addr)
 {
-	struct page *page = f2fs_grab_meta_page(sbi, blk_addr);
+	struct folio *folio = f2fs_grab_meta_folio(sbi, blk_addr);
 
-	memcpy(page_address(page), src, PAGE_SIZE);
-	set_page_dirty(page);
-	f2fs_put_page(page, 1);
+	memcpy(folio_address(folio), src, PAGE_SIZE);
+	folio_mark_dirty(folio);
+	f2fs_folio_put(folio, true);
 }
 
 static void write_sum_page(struct f2fs_sb_info *sbi,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
