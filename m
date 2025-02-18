Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A54AA3932A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWz-0000N6-Fc;
	Tue, 18 Feb 2025 05:52:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWq-0000KQ-9e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jiRrKyO8yENyMontqvs0dcauGFA0fTCVfBBYRPRE/z4=; b=S9DDKnjv2bCGAdHbZHQDJE+hQS
 Y+fl3UVmuxx1whnbGerOf1MUt1Lh2sQvExvM8OM5ghdCzfCkikRm0dmpMFXGPU5Xqx4+npquWKaYr
 guRwubsRUU50JOZE9dHXiBgC5xr9txjh5G3ugGzPGZVHhdGIYKhiL+I3KSShtApI8sUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jiRrKyO8yENyMontqvs0dcauGFA0fTCVfBBYRPRE/z4=; b=C3Av3K7dh9/tDL5+jERUS/N8MX
 VPIYhwtXtde/5v+P+GKzFWtotIjiTDjDL63WWzBmxiScSHccmwZoCnoAHNm1w8XMobujnpPzKYgtp
 D7jrj4nf/NyciST/PniHTENE1JxmgNDFxrr4x3t7maoTSBnel71f1b3VUtYcmrMiVglo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWq-0007cU-Eh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jiRrKyO8yENyMontqvs0dcauGFA0fTCVfBBYRPRE/z4=; b=tSAtJlIKX4Xt/HiKZ00aLLy9Lt
 pRfq7RPniB/TA3IDao3m1/2LxduNNgNFuyq34oRXsOF995Q5SvHWATqNZq+/HyRumhueLRKFyaMzE
 xhW0RXjCC8LhCi7vMXaCqtXW6Rea5qMUOFl9RU/zgQP+7V13uknevtPOPt2RPg1Ly6NiK7JSm+0zA
 GlQDPdlsVN9vHwsohTSh4+AUbPPhxAjZrlj69PRq3pVuqDK3zX3i5tyduJTWSc7ZtQjWM22uRUptl
 sZrE3PpaZNJOjoSTbgDvDF5pjutjlrMJXLVmdUCj0/iMAqUvJkFTe6+9d6RKdjMfCneIodJ0WA16w
 5zehYxSA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWf-00000002Tts-0dXy; Tue, 18 Feb 2025 05:52:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:52:00 +0000
Message-ID: <20250218055203.591403-27-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs_find_data_page() to f2fs_find_data_folio() and
 add a compatibility wrapper. Saves six hidden calls to compound_head(). This
 was the last caller of f2fs_get_read_data_page(), so remove the [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWq-0007cU-Eh
Subject: [f2fs-dev] [PATCH 26/27] f2fs: Add f2fs_find_data_folio()
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert f2fs_find_data_page() to f2fs_find_data_folio() and add a
compatibility wrapper.  Saves six hidden calls to compound_head().
This was the last caller of f2fs_get_read_data_page(), so remove
the compatibility wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 33 ++++++++++++++++++---------------
 fs/f2fs/f2fs.h | 12 +++++-------
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e891c95bc525..f1554a5a3d7a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1279,30 +1279,33 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	return ERR_PTR(err);
 }
 
-struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
+struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 					pgoff_t *next_pgofs)
 {
 	struct address_space *mapping = inode->i_mapping;
-	struct page *page;
+	struct folio *folio;
 
-	page = find_get_page_flags(mapping, index, FGP_ACCESSED);
-	if (page && PageUptodate(page))
-		return page;
-	f2fs_put_page(page, 0);
+	folio = __filemap_get_folio(mapping, index, FGP_ACCESSED, 0);
+	if (IS_ERR(folio))
+		goto read;
+	if (folio_test_uptodate(folio))
+		return folio;
+	f2fs_folio_put(folio, false);
 
-	page = f2fs_get_read_data_page(inode, index, 0, false, next_pgofs);
-	if (IS_ERR(page))
-		return page;
+read:
+	folio = f2fs_get_read_data_folio(inode, index, 0, false, next_pgofs);
+	if (IS_ERR(folio))
+		return folio;
 
-	if (PageUptodate(page))
-		return page;
+	if (folio_test_uptodate(folio))
+		return folio;
 
-	wait_on_page_locked(page);
-	if (unlikely(!PageUptodate(page))) {
-		f2fs_put_page(page, 0);
+	folio_wait_locked(folio);
+	if (unlikely(!folio_test_uptodate(folio))) {
+		f2fs_folio_put(folio, false);
 		return ERR_PTR(-EIO);
 	}
-	return page;
+	return folio;
 }
 
 /*
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c78ba3c7d642..a2298eca2576 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3897,8 +3897,8 @@ int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
 struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
-struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
-							pgoff_t *next_pgofs);
+struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
+		pgoff_t *next_pgofs);
 struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct page *f2fs_get_new_data_page(struct inode *inode,
@@ -3926,12 +3926,10 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 extern const struct iomap_ops f2fs_iomap_ops;
 
-static inline struct page *f2fs_get_read_data_page(struct inode *inode,
-		pgoff_t index, blk_opf_t op_flags, bool for_write,
-		pgoff_t *next_pgofs)
+static inline struct page *f2fs_find_data_page(struct inode *inode,
+		pgoff_t index, pgoff_t *next_pgofs)
 {
-	struct folio *folio = f2fs_get_read_data_folio(inode, index, op_flags,
-			for_write, next_pgofs);
+	struct folio *folio = f2fs_find_data_folio(inode, index, next_pgofs);
 
 	return &folio->page;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
