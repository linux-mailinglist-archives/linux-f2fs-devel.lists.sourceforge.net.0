Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC18A53DDEB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5u-0001az-6N; Sun, 05 Jun 2022 19:39:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5r-0001ae-J9
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qbG5jYA5/B/9NK52X0Zwpy+RVhS8Khdm3bEIuVIcSSs=; b=i0lwDA4KHZBDCu5r/dSMpI4bEF
 haB0YBB6luwOP6+CpGAMBoxXA2ZPz/SoO6p4BVcWfRYRspo2oZeZZJUvHE4J9tuRr4gOaoJVJ8Iba
 O6cWkMjN3dElvFMfMYQ5B0+tSCFpgLM5QgFiBhuQcHvhMIzP3yNX7CY/Kd3obQNgKU6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qbG5jYA5/B/9NK52X0Zwpy+RVhS8Khdm3bEIuVIcSSs=; b=DwaFNOuTeuICuXBBtBmxsbobw9
 h+Twc1w47v8LdYnVbpSUV4Bs7I5ahZeyiJrfSGidJtDqMArXJawthpRZGVK/xMXn2g8+aSwUqyXrA
 /wx0Qi7cChzAT8UPvGmV/6TuUEdKlwYmNHnQ0B4YkL7maEBjTlc4wPG7lOxMufgLBuaE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5p-006MEp-Og
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qbG5jYA5/B/9NK52X0Zwpy+RVhS8Khdm3bEIuVIcSSs=; b=dOOkwE/qwu6ai6SUG6KU2Tcj1b
 tYf86pT1eVKho3dRG7hvwfX/ICj+XRb4tRZDY8EXwKCl7ilsNUd9anX0RT70ecMt1/vbB4uTsJa03
 6G9046ewtZLLSDSY86dJSRTdn3qjPyrzchTDI7Vi8EL0DNHGZ/8j/SWIP6c9Huez/h5GoE/7d8YU3
 sKyP6kBMp9MY/fjj7QQgCy9/z7ux3TGP37ac4Purw7SgOVkW3wBetmcl1SZADajRYm/kr0rUaF6vt
 VdvVDgkAGQvgMjThr4db/KHBEvWcsMQrBgqzAprcRIAtIkegr3AoYkWgpMhBM6RcwtgML5fjs8gL0
 j/U8tA5A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5Q-009wsR-MI; Sun, 05 Jun 2022 19:38:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:46 +0100
Message-Id: <20220605193854.2371230-3-willy@infradead.org>
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
 Content preview: Use a folio throughout this function. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/buffer.c | 26 +++++++++++++
 1 file changed, 13 insertions(+), 13 deletions(-) diff --git a/fs/buffer.c
 b/fs/buffer.c index 898c7f301b1b..276769d3715a 100644 --- a/fs/buffer.c +++
 b/fs/buffer.c @@ -1604, 7 +1604,
 7 @@ void clean_bdev_aliases(struct block_device
 *bdev, sector_t blo [...] 
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
X-Headers-End: 1nxw5p-006MEp-Og
Subject: [f2fs-dev] [PATCH 02/10] buffer: Convert clean_bdev_aliases() to
 use filemap_get_folios()
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

Use a folio throughout this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 898c7f301b1b..276769d3715a 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1604,7 +1604,7 @@ void clean_bdev_aliases(struct block_device *bdev, sector_t block, sector_t len)
 {
 	struct inode *bd_inode = bdev->bd_inode;
 	struct address_space *bd_mapping = bd_inode->i_mapping;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	pgoff_t index = block >> (PAGE_SHIFT - bd_inode->i_blkbits);
 	pgoff_t end;
 	int i, count;
@@ -1612,24 +1612,24 @@ void clean_bdev_aliases(struct block_device *bdev, sector_t block, sector_t len)
 	struct buffer_head *head;
 
 	end = (block + len - 1) >> (PAGE_SHIFT - bd_inode->i_blkbits);
-	pagevec_init(&pvec);
-	while (pagevec_lookup_range(&pvec, bd_mapping, &index, end)) {
-		count = pagevec_count(&pvec);
+	folio_batch_init(&fbatch);
+	while (filemap_get_folios(bd_mapping, &index, end, &fbatch)) {
+		count = folio_batch_count(&fbatch);
 		for (i = 0; i < count; i++) {
-			struct page *page = pvec.pages[i];
+			struct folio *folio = fbatch.folios[i];
 
-			if (!page_has_buffers(page))
+			if (!folio_buffers(folio))
 				continue;
 			/*
-			 * We use page lock instead of bd_mapping->private_lock
+			 * We use folio lock instead of bd_mapping->private_lock
 			 * to pin buffers here since we can afford to sleep and
 			 * it scales better than a global spinlock lock.
 			 */
-			lock_page(page);
-			/* Recheck when the page is locked which pins bhs */
-			if (!page_has_buffers(page))
+			folio_lock(folio);
+			/* Recheck when the folio is locked which pins bhs */
+			head = folio_buffers(folio);
+			if (!head)
 				goto unlock_page;
-			head = page_buffers(page);
 			bh = head;
 			do {
 				if (!buffer_mapped(bh) || (bh->b_blocknr < block))
@@ -1643,9 +1643,9 @@ void clean_bdev_aliases(struct block_device *bdev, sector_t block, sector_t len)
 				bh = bh->b_this_page;
 			} while (bh != head);
 unlock_page:
-			unlock_page(page);
+			folio_unlock(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 		/* End of range already reached? */
 		if (index > end || !index)
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
