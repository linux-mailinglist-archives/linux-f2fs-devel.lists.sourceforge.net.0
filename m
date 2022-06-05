Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4100D53DDF0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5w-0006PR-TC; Sun, 05 Jun 2022 19:39:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5p-0006Ow-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7vrbND8cI4Dlq/u8PQe/DoQG1zXQAC8bnQq3oGQZlCM=; b=FO/VoIZrJzZmcjr1MfnzOf0Tef
 Fu8Knzu/qYP0SBIXSBOWfW8m/mHyOc8DMZOzWltmW7R8q2DjoDzUX1WyAyL9WlMlwtiUfP7ZfG1b6
 +5/2AgOqzQrH73J6xMhTY99WHZXyHPAupQpRJeFwybbGynWlrjQC78a8kvpJgiMtFNxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7vrbND8cI4Dlq/u8PQe/DoQG1zXQAC8bnQq3oGQZlCM=; b=aFGmYNR0qDdycFeB7YS7xQfxkY
 BwfxTRxZKgPeG+dNJVlKJw10P5mK/+/Go0s3k2BmOSRCnVl/bL9mFTUF1YuU8O/SsTbtQWmi+k5xg
 +tthSwpUHRVwp+fMr4k/+j9u8lGioW5e+bAFVEaoqoAMPbI+R2dPAWYsXSMXBO97DC6Q=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5p-006MEw-NE
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7vrbND8cI4Dlq/u8PQe/DoQG1zXQAC8bnQq3oGQZlCM=; b=nyyxz3de/IeOoMboCtVOVL6Bfa
 VfKn+9Zxs/tns4f9iK0uXrzCv3nCmGwggtuSAUAtlPGnuq7icdE5HNPJH04XGNi7c1z8uo9aOBl13
 kJWUC0wwP6r24Wz1QxsuEIRQfaOEnZ3Dg+XUj8w0YlohN8gP7zUJj2pOjg7y43Pr//LpiWEXb5yqJ
 K6B5rwHIPhpnhCcdLsO2JTI3svxYEAP6mohHhTayjo4MzQ4RVRW6FirahM6gza6gHsplOlL7+7AeH
 NGJiKKqHk6YUBLdFV8TQaFaygjaxQdpQwBZOim9CpkDAEyupcW8eJHdlsziy2Jx6OO5JpEWzDeF8Q
 O5jHuBxg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5R-009wsZ-07; Sun, 05 Jun 2022 19:38:57 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:50 +0100
Message-Id: <20220605193854.2371230-7-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220605193854.2371230-1-willy@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use folios throughout this function. That removes the last
 caller of huge_pagevec_release(), so delete that too. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/hugetlbfs/inode.c | 44
 ++++++++++++++
 1 file changed, 14 insertions(+), 30 deletions(-) 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nxw5p-006MEw-NE
Subject: [f2fs-dev] [PATCH 06/10] hugetlbfs: Convert
 remove_inode_hugepages() to use filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use folios throughout this function.  That removes the last caller of
huge_pagevec_release(), so delete that too.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/hugetlbfs/inode.c | 44 ++++++++++++++------------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index ae2524480f23..14d33f725e05 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -108,16 +108,6 @@ static inline void hugetlb_drop_vma_policy(struct vm_area_struct *vma)
 }
 #endif
 
-static void huge_pagevec_release(struct pagevec *pvec)
-{
-	int i;
-
-	for (i = 0; i < pagevec_count(pvec); ++i)
-		put_page(pvec->pages[i]);
-
-	pagevec_reinit(pvec);
-}
-
 /*
  * Mask used when checking the page offset value passed in via system
  * calls.  This value will be converted to a loff_t which is signed.
@@ -480,25 +470,19 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
 	struct address_space *mapping = &inode->i_data;
 	const pgoff_t start = lstart >> huge_page_shift(h);
 	const pgoff_t end = lend >> huge_page_shift(h);
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	pgoff_t next, index;
 	int i, freed = 0;
 	bool truncate_op = (lend == LLONG_MAX);
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	next = start;
-	while (next < end) {
-		/*
-		 * When no more pages are found, we are done.
-		 */
-		if (!pagevec_lookup_range(&pvec, mapping, &next, end - 1))
-			break;
-
-		for (i = 0; i < pagevec_count(&pvec); ++i) {
-			struct page *page = pvec.pages[i];
+	while (filemap_get_folios(mapping, &next, end - 1, &fbatch)) {
+		for (i = 0; i < folio_batch_count(&fbatch); ++i) {
+			struct folio *folio = fbatch.folios[i];
 			u32 hash = 0;
 
-			index = page->index;
+			index = folio->index;
 			if (!truncate_op) {
 				/*
 				 * Only need to hold the fault mutex in the
@@ -511,15 +495,15 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
 			}
 
 			/*
-			 * If page is mapped, it was faulted in after being
+			 * If folio is mapped, it was faulted in after being
 			 * unmapped in caller.  Unmap (again) now after taking
 			 * the fault mutex.  The mutex will prevent faults
-			 * until we finish removing the page.
+			 * until we finish removing the folio.
 			 *
 			 * This race can only happen in the hole punch case.
 			 * Getting here in a truncate operation is a bug.
 			 */
-			if (unlikely(page_mapped(page))) {
+			if (unlikely(folio_mapped(folio))) {
 				BUG_ON(truncate_op);
 
 				mutex_unlock(&hugetlb_fault_mutex_table[hash]);
@@ -532,7 +516,7 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
 				i_mmap_unlock_write(mapping);
 			}
 
-			lock_page(page);
+			folio_lock(folio);
 			/*
 			 * We must free the huge page and remove from page
 			 * cache (remove_huge_page) BEFORE removing the
@@ -542,8 +526,8 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
 			 * the subpool and global reserve usage count can need
 			 * to be adjusted.
 			 */
-			VM_BUG_ON(HPageRestoreReserve(page));
-			remove_huge_page(page);
+			VM_BUG_ON(HPageRestoreReserve(&folio->page));
+			remove_huge_page(&folio->page);
 			freed++;
 			if (!truncate_op) {
 				if (unlikely(hugetlb_unreserve_pages(inode,
@@ -551,11 +535,11 @@ static void remove_inode_hugepages(struct inode *inode, loff_t lstart,
 					hugetlb_fix_reserve_counts(inode);
 			}
 
-			unlock_page(page);
+			folio_unlock(folio);
 			if (!truncate_op)
 				mutex_unlock(&hugetlb_fault_mutex_table[hash]);
 		}
-		huge_pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
