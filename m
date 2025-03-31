Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F9EA76E97
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW7-0001Gx-TG;
	Mon, 31 Mar 2025 20:13:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVj-000134-7Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HeshmT2HL+sQnhdM3PU5n+aeUEW7pDa3BajeS+yHBoE=; b=FTiaK3wHyC0qIfD8WmxULajJ2I
 KoFPE594Pnjzxf4RU3/72xjpOkq9varwAtWWf9Mf1hhws+5kF5rp37flqs2+6A3CrQm+RYFtr1Wgc
 SXrOqiMGgtenm6fGUTaFbEPFNJ0KB5Eyr2e2Q6dFQw8dgXJzgjxXHjDk2wWkcAVfbWrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HeshmT2HL+sQnhdM3PU5n+aeUEW7pDa3BajeS+yHBoE=; b=CC1x4yaOWwRIECcqPhWrcbIEy0
 gdAR2K3pOdRKQ78EgEiPFl8hAvzGefE3UH5EfOQ+qySi8QbDhhIwtBlbRj3GvRPZUz/rA+u1obsq7
 2mDUWX0t1SqMIGi5ysWimOrhcjN/Bocbh/qKtQ3p9tv3RvQGmv8eg0B5GI4+83fwxVVA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVj-0003fP-A4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HeshmT2HL+sQnhdM3PU5n+aeUEW7pDa3BajeS+yHBoE=; b=VshjbMr2qDyTuVUFYSpcbL8ctJ
 sNE6xYJ7kk7BXdwQQRc9O6Oz+Sl8V+1i77IMFClHQ6bro4iCv8WaTsYjBIxbtBKy0n5GEuC9/JU1p
 KqLQCSdnR6UcMm+PdtnTITGPL2Qk+DdziXH+rSA1Yq4zslWXcj6emd0O9bjn16GgbvSV9ar16dTzq
 t3MkHc9oFJHdGIHOplzu7or6TdlK/qdDnFYnsVel20AtaU1JgdR2Eai1w6h4OM+Pnvjlt8OYCfnZy
 IWkFAPwu9DIRTqyM0zVsFQ6RY0iwjAufmj5w0zUFmThmEwquZG550DLxfMehu8SrAKGQ/Vd0Hui4G
 xIoVmOsg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVc-00000004Sbe-3wCO;
 Mon, 31 Mar 2025 20:13:24 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:39 +0100
Message-ID: <20250331201256.1057782-140-willy@infradead.org>
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
 Content preview: Add f2fs_filemap_get_folio() as a wrapper around
 __filemap_get_folio()
 which can inject an error. Removes seven calls to compound_head().
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/compress.c | 32
 ++++++++++++++++ fs/f2fs/f2fs.h | 10 ++++++++++ 2 files changed,
 26 insertions(+), 16 deletions [...] 
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
X-Headers-End: 1tzLVj-0003fP-A4
Subject: [f2fs-dev] [PATCH 139/153] f2fs: Use a folio in
 prepare_compress_overwrite()
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

Add f2fs_filemap_get_folio() as a wrapper around __filemap_get_folio()
which can inject an error.  Removes seven calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 32 ++++++++++++++++----------------
 fs/f2fs/f2fs.h     | 10 ++++++++++
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4c91038b3f6f..2f9c35d0abda 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1095,7 +1095,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
 	struct address_space *mapping = cc->inode->i_mapping;
-	struct page *page;
+	struct folio *folio;
 	sector_t last_block_in_bio;
 	fgf_t fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
@@ -1110,19 +1110,19 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	if (ret)
 		return ret;
 
-	/* keep page reference to avoid page reclaim */
+	/* keep folio reference to avoid page reclaim */
 	for (i = 0; i < cc->cluster_size; i++) {
-		page = f2fs_pagecache_get_page(mapping, start_idx + i,
-							fgp_flag, GFP_NOFS);
-		if (!page) {
-			ret = -ENOMEM;
+		folio = f2fs_filemap_get_folio(mapping, start_idx + i,
+				fgp_flag, GFP_NOFS);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
 			goto unlock_pages;
 		}
 
-		if (PageUptodate(page))
-			f2fs_put_page(page, 1);
+		if (folio_test_uptodate(folio))
+			f2fs_folio_put(folio, true);
 		else
-			f2fs_compress_ctx_add_page(cc, page_folio(page));
+			f2fs_compress_ctx_add_page(cc, folio);
 	}
 
 	if (!f2fs_cluster_is_empty(cc)) {
@@ -1145,17 +1145,17 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	for (i = 0; i < cc->cluster_size; i++) {
 		f2fs_bug_on(sbi, cc->rpages[i]);
 
-		page = find_lock_page(mapping, start_idx + i);
-		if (!page) {
-			/* page can be truncated */
+		folio = filemap_lock_folio(mapping, start_idx + i);
+		if (IS_ERR(folio)) {
+			/* folio could be truncated */
 			goto release_and_retry;
 		}
 
-		f2fs_wait_on_page_writeback(page, DATA, true, true);
-		f2fs_compress_ctx_add_page(cc, page_folio(page));
+		f2fs_folio_wait_writeback(folio, DATA, true, true);
+		f2fs_compress_ctx_add_page(cc, folio);
 
-		if (!PageUptodate(page)) {
-			f2fs_handle_page_eio(sbi, page_folio(page), DATA);
+		if (!folio_test_uptodate(folio)) {
+			f2fs_handle_page_eio(sbi, folio, DATA);
 release_and_retry:
 			f2fs_put_rpages(cc);
 			f2fs_unlock_rpages(cc, i + 1);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3603523f0c25..af0420f76e98 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2849,6 +2849,16 @@ static inline struct folio *f2fs_grab_cache_folio(struct address_space *mapping,
 	return folio;
 }
 
+static inline struct folio *f2fs_filemap_get_folio(
+				struct address_space *mapping, pgoff_t index,
+				fgf_t fgp_flags, gfp_t gfp_mask)
+{
+	if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_GET))
+		return ERR_PTR(-ENOMEM);
+
+	return __filemap_get_folio(mapping, index, fgp_flags, gfp_mask);
+}
+
 static inline struct page *f2fs_pagecache_get_page(
 				struct address_space *mapping, pgoff_t index,
 				fgf_t fgp_flags, gfp_t gfp_mask)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
