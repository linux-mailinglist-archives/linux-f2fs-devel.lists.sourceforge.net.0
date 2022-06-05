Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA04553DDE9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5u-0001au-3r; Sun, 05 Jun 2022 19:39:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5n-0001a0-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7zHJFf7s+ZSx87nHg6Bs72jjNt/zTHbg4PZc0KhFNBI=; b=DihCWc5mzVHQ7O/ew+WCwFX9N9
 1NwEdlXhuMvWj9BwkVkqluz2tx+tK97MdTsE1+nNkXN5hmNxK7/YPiC2emcYpIxHITOwDTBwxDqJ3
 e8jL13P7EGIPB8KvFd3sms5i1jnsga+sLLolaKoukv6QqQGo0s6E8rebtiKMUdfzX6MQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7zHJFf7s+ZSx87nHg6Bs72jjNt/zTHbg4PZc0KhFNBI=; b=NYzv9XOumbCVjsiP0NwIwS8Oin
 UOtlVVsx/q2+JWmjQP4Pk1KZzOvsacI61btGK1n0sxtRrIayv8D2fJCzjYuTSek3UJaN68Fephk8V
 z4eYRarw0lDKMZJl8UN8q8aqYCVvtHNgk/btpEzTZngw0hM2jbkyaNmTvAmbFtqx6kZs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5i-00054v-Oh
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7zHJFf7s+ZSx87nHg6Bs72jjNt/zTHbg4PZc0KhFNBI=; b=EYXV63i9/CEOzD0nHMe1OQHYDc
 mVCuEz0iq05DzWOTfwUUXon7lLclyJcGJZDFVFf36KaefdWNV0pHzAWE/juTBOh3LmOa6/GHAbwsA
 j9SKPw7wOEy++DynzZkxdw6cKJT5aOgxtQMtWaAQNIKZNtcW6JUvraw6AebVxfjYl0uWLN4Tnkrf1
 g5r1qFvxh5lUydZ/EqFXJtmm4X6GU4Pvr6z+zZzlpoy3rKdSu3dVWHKmxHNTzyLs4u7zgx7YRImNZ
 s12tQFfwrO2lznSTczeoD//K1wj12QguV4NYS7DRw7Y1XFPPUFJTnVvqq+s0OPozePCioZdM8Nwv2
 JJEs8DoA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5Q-009wsT-OG; Sun, 05 Jun 2022 19:38:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:47 +0100
Message-Id: <20220605193854.2371230-4-willy@infradead.org>
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
 Content preview:  If the folio is large, it may overlap the beginning or end
 of the unused range. If it does,
 we need to avoid invalidating it. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/ext4/inode.c | 21
 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-) 
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
X-Headers-End: 1nxw5i-00054v-Oh
Subject: [f2fs-dev] [PATCH 03/10] ext4: Convert mpage_release_unused_pages()
 to use filemap_get_folios()
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

If the folio is large, it may overlap the beginning or end of the
unused range.  If it does, we need to avoid invalidating it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ext4/inode.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 3dce7d058985..32a7f5e024d6 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1554,9 +1554,9 @@ struct mpage_da_data {
 static void mpage_release_unused_pages(struct mpage_da_data *mpd,
 				       bool invalidate)
 {
-	int nr_pages, i;
+	unsigned nr, i;
 	pgoff_t index, end;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct inode *inode = mpd->inode;
 	struct address_space *mapping = inode->i_mapping;
 
@@ -1574,15 +1574,18 @@ static void mpage_release_unused_pages(struct mpage_da_data *mpd,
 		ext4_es_remove_extent(inode, start, last - start + 1);
 	}
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	while (index <= end) {
-		nr_pages = pagevec_lookup_range(&pvec, mapping, &index, end);
-		if (nr_pages == 0)
+		nr = filemap_get_folios(mapping, &index, end, &fbatch);
+		if (nr == 0)
 			break;
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
-			struct folio *folio = page_folio(page);
+		for (i = 0; i < nr; i++) {
+			struct folio *folio = fbatch.folios[i];
 
+			if (folio->index < mpd->first_page)
+				continue;
+			if (folio->index + folio_nr_pages(folio) - 1 > end)
+				continue;
 			BUG_ON(!folio_test_locked(folio));
 			BUG_ON(folio_test_writeback(folio));
 			if (invalidate) {
@@ -1594,7 +1597,7 @@ static void mpage_release_unused_pages(struct mpage_da_data *mpd,
 			}
 			folio_unlock(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 	}
 }
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
