Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE7053DDED
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5w-00061t-Fl; Sun, 05 Jun 2022 19:39:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5p-00061Y-W7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0H1cUQxatSgPZ6f11mLW4N05/pdthUaWOiji2r395Q=; b=f5yt6UiXpsbgpPIf5Mwr5O83q7
 oo8fFtY2oMocY60sHvcnEsKDTnytsurriwutmQvS1rD4BHvg6QVlMVT8uOqy5Ic5wnWhaiIbx3cms
 HeDkMRSClm1wCAIAXmYm/5B2JHcP4Xv6jscKj8UDYl7/wvM3uHK+e+itfdEeVJtdsKHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W0H1cUQxatSgPZ6f11mLW4N05/pdthUaWOiji2r395Q=; b=GzGFg+Wd5axZNR5mm6p2yZKtkv
 M6BAFk6qA2/nOJulwHjZPKBrl5+KplEXjXg4d4ET8LKIBbsVbUPCYkMJnBcjD2ajWXSuE+Ivavn7C
 RtHlIHUH7FfG0c1GkVSVAgjKZEp+e7dPRZk9+6pv8WQU5j2J/Wts7mG4HjUTMXTWG/VU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5p-006MEr-NQ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=W0H1cUQxatSgPZ6f11mLW4N05/pdthUaWOiji2r395Q=; b=vuZO7CSb7H6HQ4un97k5YqfJpv
 WRg4mesPevoGA4XIOIVE2ut/fbhfu85CTaveBcVULnFub7Mfq5oIGpDukf0GFFOtdms/yjo0srNbQ
 qAmlTagDosQ/iwYURVheI7Qn+0e+JiM35saYHuorbgNvOmwFZTGBSMX9gPqyPwtmqTCUpQrgxt08L
 zl+fZroMOE3CbrwEnxjVw9xWa9I9OBtn3/LlANUrlXOhUPAwmGVpiC8vKuDk0hB0q5d8Esreir30M
 qp+56a/8G270ZD18zh3VnRwQbfUZOj9Qy+FiUOVDgrzK9OgPFG3nJ+7PP+FJ4hse3IB4PQ0w6ecGA
 OfEX515Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5Q-009wsV-Qh; Sun, 05 Jun 2022 19:38:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:48 +0100
Message-Id: <20220605193854.2371230-5-willy@infradead.org>
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
 Content preview:  The called functions all use pages, so just convert back to
 a page. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/ext4/inode.c | 19 +++++++++ 1 file changed, 9 insertions(+), 10 deletions(-)
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
X-Headers-End: 1nxw5p-006MEr-NQ
Subject: [f2fs-dev] [PATCH 04/10] ext4: Convert
 mpage_map_and_submit_buffers() to use filemap_get_folios()
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

The called functions all use pages, so just convert back to a page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ext4/inode.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 32a7f5e024d6..1aaea53e67b5 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2314,8 +2314,8 @@ static int mpage_process_page(struct mpage_da_data *mpd, struct page *page,
  */
 static int mpage_map_and_submit_buffers(struct mpage_da_data *mpd)
 {
-	struct pagevec pvec;
-	int nr_pages, i;
+	struct folio_batch fbatch;
+	unsigned nr, i;
 	struct inode *inode = mpd->inode;
 	int bpp_bits = PAGE_SHIFT - inode->i_blkbits;
 	pgoff_t start, end;
@@ -2329,14 +2329,13 @@ static int mpage_map_and_submit_buffers(struct mpage_da_data *mpd)
 	lblk = start << bpp_bits;
 	pblock = mpd->map.m_pblk;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	while (start <= end) {
-		nr_pages = pagevec_lookup_range(&pvec, inode->i_mapping,
-						&start, end);
-		if (nr_pages == 0)
+		nr = filemap_get_folios(inode->i_mapping, &start, end, &fbatch);
+		if (nr == 0)
 			break;
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 
 			err = mpage_process_page(mpd, page, &lblk, &pblock,
 						 &map_bh);
@@ -2352,14 +2351,14 @@ static int mpage_map_and_submit_buffers(struct mpage_da_data *mpd)
 			if (err < 0)
 				goto out;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 	}
 	/* Extent fully mapped and matches with page boundary. We are done. */
 	mpd->map.m_len = 0;
 	mpd->map.m_flags = 0;
 	return 0;
 out:
-	pagevec_release(&pvec);
+	folio_batch_release(&fbatch);
 	return err;
 }
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
