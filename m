Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1253DDF3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw62-0001gO-Bh; Sun, 05 Jun 2022 19:39:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw60-0001gH-PT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4+VTXobun92H06BwkM9sboSswxKOXWma+MeYkEepBgA=; b=bpRTQRgt1bj+yWok8AnwA/my+8
 oThKV6RN+O+M/y8vveTJR7d0e2/RYBxaZ8l8KD3yRe0SUfjyYQxxTQ/0MJWQR3Cw/i9Mccha5TiGC
 wu6VJEkJRhBrBLjQyS6jIlUwWFA77nb6y9bvkGzr3yCfGtHyUqM1LOW30OgJP48F2Q6w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4+VTXobun92H06BwkM9sboSswxKOXWma+MeYkEepBgA=; b=SjX9l6aM9NH6n+smcCa9JYEZf7
 ojR0CGoMkdkOz2SrhhOuFMecgH2a3LrXrRxqLy5pVwFaR1n2Cf//sS8C+cd9hiqETPvR0vDE0EBJ3
 PPctQQ5BinOIwO1/cdkMgXUuTqu9ijnDAyt/5xg2+HiLEKs5Z1FqgvI0whRAkSkWHp4c=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5y-006MFV-VO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4+VTXobun92H06BwkM9sboSswxKOXWma+MeYkEepBgA=; b=RQCVcbFFYG/IwPkZ92IOtlvbMm
 az7RIzZuEXd7sNL2U7G8LPCRngD4SynAZcKmm6Z95io0HrbGL0vnB7fjGo7Cxu4ZBw1ODBrU0UG2e
 HxKcshRvctwxq6I6s6/MK32FsYRAC2G0u/Hip2HcdGDzdI618anISANI/MA2khqP9eLitiytzdMDB
 ct6KPLFs4aDjPFKc8Pkgohr+9RyESHl2CJp7vIumKABXwMvMmL913gy1dYEy+Y+5rn3L6A6SydWN3
 3u72ARdSAix5xot7Gj5q+zC981acWBZoknB7PiY9jRjVbOJiq7giOgLEaPV78mOWST9iLtfFjKdrU
 TBXjCXKw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5Q-009wsX-Tg; Sun, 05 Jun 2022 19:38:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:49 +0100
Message-Id: <20220605193854.2371230-6-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220605193854.2371230-1-willy@infradead.org>
References: <20220605193854.2371230-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert this function to use folios throughout.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/compress.c | 35
 +++++++++++++++ 1 file changed, 15 insertions(+), 20 deletions(-) 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nxw5y-006MFV-VO
Subject: [f2fs-dev] [PATCH 05/10] f2fs: Convert
 f2fs_invalidate_compress_pages() to use filemap_get_folios()
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

Convert this function to use folios throughout.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 24824cd96f36..009e6c519e98 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1832,45 +1832,40 @@ bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	struct address_space *mapping = sbi->compress_inode->i_mapping;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	pgoff_t index = 0;
 	pgoff_t end = MAX_BLKADDR(sbi);
 
 	if (!mapping->nrpages)
 		return;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 	do {
-		unsigned int nr_pages;
-		int i;
+		unsigned int nr, i;
 
-		nr_pages = pagevec_lookup_range(&pvec, mapping,
-						&index, end - 1);
-		if (!nr_pages)
+		nr = filemap_get_folios(mapping, &index, end - 1, &fbatch);
+		if (!nr)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
-
-			if (page->index > end)
-				break;
+		for (i = 0; i < nr; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			lock_page(page);
-			if (page->mapping != mapping) {
-				unlock_page(page);
+			folio_lock(folio);
+			if (folio->mapping != mapping) {
+				folio_unlock(folio);
 				continue;
 			}
 
-			if (ino != get_page_private_data(page)) {
-				unlock_page(page);
+			if (ino != get_page_private_data(&folio->page)) {
+				folio_unlock(folio);
 				continue;
 			}
 
-			generic_error_remove_page(mapping, page);
-			unlock_page(page);
+			generic_error_remove_page(mapping, &folio->page);
+			folio_unlock(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	} while (index < end);
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
