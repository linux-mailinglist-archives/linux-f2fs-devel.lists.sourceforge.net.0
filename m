Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFDAFD448
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWiIZw/Ji6OUaroy6dw5V1rsI1MLnqPPcN6EFMhH7k8=; b=j/5XK/WUsFJ6cpbqxu+uOIS9Tm
	IKsaEcpkagfiBGQBWFLfC8XgjDce/TOCeiB54cj3KuB51210YhEPNohPefU+APGC8vb7b0+9/zSgC
	k3Mz+rmuxIhafafkpRyR1GA8+uEx5ou9R6Vto6k9jgj7OHRKzeW/0hCXr25GTDB/6fAM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk0-0005KO-Nb;
	Tue, 08 Jul 2025 17:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjw-0005H7-NP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aVnWk+ROyZIY2e3Z8xtum92JmN2Dp5pWHAXMnsqOrBs=; b=M5OLr3mGyUnTNV/xuyM/fd0epw
 8FhVJQNPejGJYI6NKRC2atM+GCHiKQyUEOoZDs100JCOgxPZi+nYQIrRZM7PF9QsfEszQCkDalN/X
 exTO/iqzYbhpOIudZB4QybrF0rF3QkuU5UbnOHOvK+WQsZF+u1tzMw9VbcCdQLXo3+tk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aVnWk+ROyZIY2e3Z8xtum92JmN2Dp5pWHAXMnsqOrBs=; b=a8vBerprpaU+91SwBJPxS3+5ax
 GPLCV0jBOR4+T6zl+s5lWKhFHS6lXFfsBIe9jfkkjMrM+hTlNIXO2G/8Ht837gakUqNoMa+Ymqs1S
 THQG7WrC2uVmM3TWVh3OWW9muAlF3gAa9HQM0sNNpr3h7D3giud8Ba8CII7qNTQVe15A=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjw-0006Gs-4F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aVnWk+ROyZIY2e3Z8xtum92JmN2Dp5pWHAXMnsqOrBs=; b=mN2zK51eGO72IoJOxqcNXNcvxw
 DKpR4XagoMaLAwgpzGhKUhfPp8Ow8Jt7CiE0Swza6Wn30ayxrI9rYUjrpUC6yRDnseMafAMGJGeze
 lw7LkVZldNOvs68j9zMEwbYeIwtIL6hqoWg7rbX8X0jXyc2sC0eR8OWUvYjZJBrIZ32MhqBiK17jO
 u1lZ5FLlIvissV8iaK8KCgc6T2T4F3lcw0n8W9e3JMxNsPge7D9q9fFrFHsGsaOHtL3J6xFlXTwjq
 Uux3chpID51UCBjlTkr7qR90vpy5wBRGkuGZO6CALjUn//6VVnWJOV5iQCVPNSY74uD+BgpPt5szc
 MLR0WQFg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjk-00000000T8Q-2jET;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:47 +0100
Message-ID: <20250708170359.111653-51-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Return a folio from this function and convert its one caller.
 Removes a call to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/node.c | 20 ++++++++++ 1 file changed,
 10 insertions(+), 10 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjw-0006Gs-4F
Subject: [f2fs-dev] [PATCH 50/60] f2fs: Convert get_next_nat_page() to
 get_next_nat_folio()
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

Return a folio from this function and convert its one caller.
Removes a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ab534557a80e..7c01206bd3d6 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -135,7 +135,7 @@ static struct folio *get_current_nat_folio(struct f2fs_sb_info *sbi, nid_t nid)
 	return f2fs_get_meta_folio_retry(sbi, current_nat_addr(sbi, nid));
 }
 
-static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
+static struct folio *get_next_nat_folio(struct f2fs_sb_info *sbi, nid_t nid)
 {
 	struct folio *src_folio;
 	struct folio *dst_folio;
@@ -149,7 +149,7 @@ static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 	/* get current nat block page with lock */
 	src_folio = get_current_nat_folio(sbi, nid);
 	if (IS_ERR(src_folio))
-		return &src_folio->page;
+		return src_folio;
 	dst_folio = f2fs_grab_meta_folio(sbi, dst_off);
 	f2fs_bug_on(sbi, folio_test_dirty(src_folio));
 
@@ -161,7 +161,7 @@ static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 
 	set_to_next_nat(nm_i, nid);
 
-	return &dst_folio->page;
+	return dst_folio;
 }
 
 static struct nat_entry *__alloc_nat_entry(struct f2fs_sb_info *sbi,
@@ -3010,7 +3010,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	bool to_journal = true;
 	struct f2fs_nat_block *nat_blk;
 	struct nat_entry *ne, *cur;
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 
 	/*
 	 * there are two steps to flush nat entries:
@@ -3024,11 +3024,11 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	if (to_journal) {
 		down_write(&curseg->journal_rwsem);
 	} else {
-		page = get_next_nat_page(sbi, start_nid);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = get_next_nat_folio(sbi, start_nid);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		nat_blk = page_address(page);
+		nat_blk = folio_address(folio);
 		f2fs_bug_on(sbi, !nat_blk);
 	}
 
@@ -3064,8 +3064,8 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	if (to_journal) {
 		up_write(&curseg->journal_rwsem);
 	} else {
-		__update_nat_bits(sbi, start_nid, page);
-		f2fs_put_page(page, 1);
+		__update_nat_bits(sbi, start_nid, &folio->page);
+		f2fs_folio_put(folio, true);
 	}
 
 	/* Allow dirty nats by node block allocation in write_begin */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
