Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E74DEAFD453
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z183tJoWJ0vSqzXq8nyeqmpNpz78Di7cyZyeItA8pFg=; b=H0IxU8g/SufV80j/BH6Jtp34QP
	/CU5U1bA5qQXhbxbgLhvmozWmHcqZgobMvASAsl0uIDzq9AgOeM9HvBVjZ2+619dZWBcLQznlLCOF
	0aAsMF/I9tIYMSVWdvXLwPt1H2giQJ5ctjHlPSWnAE75RQhymkMBfrrYxpLBFBvjVj48=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk2-0007S6-Ph;
	Tue, 08 Jul 2025 17:04:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjx-0007NM-D7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+bfgx8obloiQcVeLRFA/tRevWcXdOZdxRxnBN2+JiwE=; b=QT2U8kZ4/LsmYnniPTkiwHT4Ml
 iyr24K6ARIiJfYK3gwfMxEtt5cb6o8SZE+B9m6kTv76S6oz6Wdho2Xj4G2oopJDVeZMhiR15y98ch
 IRx+1MIVG3AZv+aegTG6LNR4q3+kADdLm6gLXWtiergOJ0KKZ/wOymb7AfYrNfnUm4mQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+bfgx8obloiQcVeLRFA/tRevWcXdOZdxRxnBN2+JiwE=; b=WqgP2Mt+9bCbkYj1xxmcuPJ5sc
 A6UyVXhbhZJzb4upDPyj/J/GFdTSIJ9ffdTvU8IK591AhydbLKQ31watp6+pryDB5oJCz1/fWm8YY
 H/6nHZGs4R7IC9TG6QLEnSwyg5Ycv026NPhqwuRf2Xuy4xsU0H4JaUY6sHgm5/Ux55To=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjv-0006Fu-0x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+bfgx8obloiQcVeLRFA/tRevWcXdOZdxRxnBN2+JiwE=; b=tp/UXLML+8AfGRLgod68wX8AeY
 FxR6sXByc9d+jLwf2UckrSS1B2BrgSwx1RMjMlnJxTjyzkSMeIPP9QTA2NbkkzW0o1x66fFlDcMW5
 ufYkcil34XMwGEevKfK5wdFRPdXhnpC8nZUV6u1BsqhXGHSxpfjwg2uBPm43KLUvexqdBCaTP8i15
 1APaU0wpFEHoQrpBv2OHRa4Uox6LPLKNaUBeDD3I8syIm5bz4sRzqtUnK2Pdm7j25I+1kWCd9Jtxg
 NG/CUvmrcuNLZJrzG4AbJdesAKjwk3rlCfDphe4AZH9PN39IGpEhfBFGVN7IHPXPFyoUHJuEo4yXJ
 IdpaxZrg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjj-00000000T7Q-1qJL;
 Tue, 08 Jul 2025 17:04:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:38 +0100
Message-ID: <20250708170359.111653-42-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The only caller already has a folio so convert this function
 to be folio based. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/compress.c | 2 +- fs/f2fs/f2fs.h | 4 ++-- 2 files changed, 3
 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjv-0006Fu-0x
Subject: [f2fs-dev] [PATCH 41/60] f2fs: Convert get_page_private_data() to
 folio_get_f2fs_data()
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

The only caller already has a folio so convert this function to be folio
based.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 2 +-
 fs/f2fs/f2fs.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d7346c1fcd62..4e432df2431f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -2012,7 +2012,7 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
 				continue;
 			}
 
-			if (ino != get_page_private_data(&folio->page)) {
+			if (ino != folio_get_f2fs_data(folio)) {
 				folio_unlock(folio);
 				continue;
 			}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 142cbf8bc8f3..1cf3063d2170 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2528,9 +2528,9 @@ PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 
-static inline unsigned long get_page_private_data(struct page *page)
+static inline unsigned long folio_get_f2fs_data(struct folio *folio)
 {
-	unsigned long data = page_private(page);
+	unsigned long data = (unsigned long)folio->private;
 
 	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
 		return 0;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
