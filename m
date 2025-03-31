Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28967A76E1B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVY-0005Zp-FO;
	Mon, 31 Mar 2025 20:13:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVP-0005Z5-Q7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6645UOwopQKFLyUGn4bFSTDDjWDiPWnvZvwBcC3GP/g=; b=f5mJ+DwcHlsGTsjwQ3CiyAltz3
 H2Qns+Bb8SQpe8ztqa1ZfGHz+04v/jLoM57dchPZMSyp9dQoWR1UY1tCmRwmMTH1MYe6S+7k0cps7
 +o2IQ2wQk99lZ5OHqeCd0DH6EGa4PSztjrZ3rZiYxubsIgmT+BQi6ih2F9EIwZag+u+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6645UOwopQKFLyUGn4bFSTDDjWDiPWnvZvwBcC3GP/g=; b=ixjCtnXFKmy1BNM0Jd4ThFn/P5
 VEFVfrFrSNDzm4TABGxgF21/dPgoeJeCA+XfDiTX8nikEUXTHPZIb//Pt41ljfjiBGxiI14UZJmR5
 jDGVKmM7vrHa5/Za6+kM+CKD0+JM5jL6WwPPCNLkqANV73jdGf3Z7K/k3IAyzrZ4xeIE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVO-0003YV-KO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6645UOwopQKFLyUGn4bFSTDDjWDiPWnvZvwBcC3GP/g=; b=i9/8tsdi+nzI15tx2t9n3Ykgue
 +tUFKIRZONzo/KdiEcSURnkVtZbqDNXBfw5nxvl1QD5e0+S0hE1wJ9Tq3swGhjPunTF+kOGMnionV
 7uS2Ynafwaj8xzIo7635sRUJWONYIF2b+wozSArZqCYfew6UoZd3NstvG5xcsRE+RIHM68lDE8k+Y
 koLG8YqZkjDr7l3ANCY1JuQoLXQ2TA4g6vDgKKHxbgaJbfQz8VxzhBetCh3XMTcN6wjOx3NARoH4O
 mJi/bsDz46+LMgj6CRL+4JVHDmVO422fdLuERE+cz20EvYCXi7UMtxzeU6HbDoBXg+Z/0IyQnPWna
 xpmFliNg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVF-00000004RTn-193k;
 Mon, 31 Mar 2025 20:13:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:21 +0100
Message-ID: <20250331201256.1057782-2-willy@infradead.org>
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
 Content preview: Convert the incoming page to a folio and operate on it.
 Removes
 a reference to page->mapping which is going away soon. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/compress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-) 
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
X-Headers-End: 1tzLVO-0003YV-KO
Subject: [f2fs-dev] [PATCH 001/153] f2fs: Use a folio in
 f2fs_compress_free_page()
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

Convert the incoming page to a folio and operate on it.  Removes a
reference to page->mapping which is going away soon.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9b94810675c1..9eecc167b1fc 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -593,11 +593,14 @@ static struct page *f2fs_compress_alloc_page(void)
 
 static void f2fs_compress_free_page(struct page *page)
 {
+	struct folio *folio;
+
 	if (!page)
 		return;
-	detach_page_private(page);
-	page->mapping = NULL;
-	unlock_page(page);
+	folio = page_folio(page);
+	folio_detach_private(folio);
+	folio->mapping = NULL;
+	folio_unlock(folio);
 	mempool_free(page, compress_page_pool);
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
