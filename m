Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B0A39325
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWy-0006aO-1k;
	Tue, 18 Feb 2025 05:52:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWl-0006ZG-TH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hYeLmkCKBphS48/Z/sVHXsQHr69hpdPqzRtRINtafVY=; b=CuVhI5bJyA2F7B6Yy2ukM83EAe
 fb0yKGlc/eUj4TlsbTYFPgUf8D1SDKJKwbNCAwyBi6L3Vn+qzkAy/6NbVNwZvxIb8qxim2lyfWjp9
 X4yfZpo3i058rBPwS15fDxSYiCzaFleJdaiPMt2F7oDJJDditfP0prHznSfkociybobU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hYeLmkCKBphS48/Z/sVHXsQHr69hpdPqzRtRINtafVY=; b=baHYWooRjjYXlrFZreJRBD5r1N
 vp3/eWRWU8vx4bcA2z8kRRFjVb1yoAZwMqHepUJEIZ+z5IC8ujBf6RgshOEq0OPYrRh5EKaaRMcrc
 Vc0zI5R9uVrzUloSAMCstkkSBvNrRn01XvgVy1V7c6jZqFOXl3ZAjo3/9kERb4DRiyQ0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWk-0007bg-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=hYeLmkCKBphS48/Z/sVHXsQHr69hpdPqzRtRINtafVY=; b=XSHGHpVV+Wg1KSwrioFia3K61d
 tNE36QOpT8hkCRUMfAgRk/DH6J00v4OaRpXT+i0OANwRWyY14XIJT/vJ+Iu5X7dTdhPZZeL6paU0B
 3ouakgd9IVc8uq5/E/KaZzXecamLBuxbDKqYCyj2H+vmt6uV/U823xD+a8yzaIZQDQfVk9gz0qmB3
 Sf4GKuazyvrWqCL21cWfiD2J/KjSAz8SFXqJlcILHaaew322CGcncaCeKAp4yHFVQ+t2B98/Xf6cs
 NtM7maXo+5VPo4C27C5Avxz+OKcx1z9LfO7bfbVddoDXDLTOcordGuiXASSPa7prfr4QudrtHUxXn
 bv4CCjmQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWe-00000002TtP-1rim; Tue, 18 Feb 2025 05:52:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:56 +0000
Message-ID: <20250218055203.591403-23-willy@infradead.org>
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
 Content preview: Convert f2fs_get_lock_data_page() to
 f2fs_get_lock_data_folio()
 and add a compatibility wrapper. Removes three hidden calls to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/data.c
 | 18 +++++++++--------- fs/f2fs/f2fs.h | 10 +++++++++- 2 files changed, 18
 insertions(+), 10 deletions(-) 
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
X-Headers-End: 1tkGWk-0007bg-Uf
Subject: [f2fs-dev] [PATCH 22/27] f2fs: Add f2fs_get_lock_data_folio()
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

Convert f2fs_get_lock_data_page() to f2fs_get_lock_data_folio() and
add a compatibility wrapper.  Removes three hidden calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 18 +++++++++---------
 fs/f2fs/f2fs.h | 10 +++++++++-
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f0747c7f669d..e891c95bc525 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1310,23 +1310,23 @@ struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
  * Because, the callers, functions in dir.c and GC, should be able to know
  * whether this page exists or not.
  */
-struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
+struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 							bool for_write)
 {
 	struct address_space *mapping = inode->i_mapping;
-	struct page *page;
+	struct folio *folio;
 
-	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
-	if (IS_ERR(page))
-		return page;
+	folio = f2fs_get_read_data_folio(inode, index, 0, for_write, NULL);
+	if (IS_ERR(folio))
+		return folio;
 
 	/* wait for read completion */
-	lock_page(page);
-	if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
-		f2fs_put_page(page, 1);
+	folio_lock(folio);
+	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
+		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
-	return page;
+	return folio;
 }
 
 /*
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3e02df63499e..c78ba3c7d642 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3899,7 +3899,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
 struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
 							pgoff_t *next_pgofs);
-struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
+struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
 struct page *f2fs_get_new_data_page(struct inode *inode,
 			struct page *ipage, pgoff_t index, bool new_i_size);
@@ -3936,6 +3936,14 @@ static inline struct page *f2fs_get_read_data_page(struct inode *inode,
 	return &folio->page;
 }
 
+static inline struct page *f2fs_get_lock_data_page(struct inode *inode,
+		pgoff_t index, bool for_write)
+{
+	struct folio *folio = f2fs_get_lock_data_folio(inode, index, for_write);
+
+	return &folio->page;
+}
+
 /*
  * gc.c
  */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
