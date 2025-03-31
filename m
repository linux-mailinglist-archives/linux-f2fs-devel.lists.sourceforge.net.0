Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D404CA76E85
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW0-00048L-KG;
	Mon, 31 Mar 2025 20:13:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVo-0003wU-Kh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qmcYWf1BvKdC4XSE+iBAiK/9wU/iqKmhNQrZvBQXrpU=; b=fJXTy+s2PgxYt69b75TGcDivth
 XgpFCS36wKQ9T6ZhqSFnTUMUmlmdn8tZslsSfk3pkiazN3mstdGeO9y4YW7/5oOth+i1WvSOVyjWx
 ZxnN2n1xMjtZxSQ/C4Zt9Jn9u8C/+HiymQXGCkPbCaLkjuzjs8/rFGt5N/zR9gFkaYiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qmcYWf1BvKdC4XSE+iBAiK/9wU/iqKmhNQrZvBQXrpU=; b=FAelAlMEUQNFPigmfQ6gBU07C7
 8nBQuJSTjfPPM3VDu01aquThiK8ZZdqwhdiZADB5AcP+c8nB7q2Z3bZvGAC8mQnmu1Kt/YyuV0CQ2
 U9jkIgWO4eL4mX3B6Uly9cvRi+QEVCH4iFhPC9EVumnpTi6Fh/2UTdzuI6ne1OnA6m5A=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVi-0003fE-Vr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qmcYWf1BvKdC4XSE+iBAiK/9wU/iqKmhNQrZvBQXrpU=; b=jmAUJT9VBEXJyEvfDBXpJ3mC42
 gwaWnVpYXXlxbE7MEhmtdRZKEc0/hhy+MzYAQhvzYYdre/8SMNOSe3lvxdsXdmKp9sd4ALNhMxMjo
 rGzB6K3mbrUTLfykeJ1sizx2oTR3XiBGWeI3t2iMqDmi+HsOqSADOp1HLDz+Hw15WKj0i66pMIqXr
 gzEa9VhvYM2HA2dSOLajHgL1Q8OPcjahSpH9L0kMBg7vP1Xt/AmTKZIejGhRzTiUDbLjLSw3OlOAE
 z/hliIZaJMYPr32SNoJuDv1JTFgkANCuH3PyMcwluKZ0e/VQykOT182yU+0pvc7QGk8DKCiLo/TMD
 SjLCh9jA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVc-00000004Saq-2UQk;
 Mon, 31 Mar 2025 20:13:24 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:37 +0100
Message-ID: <20250331201256.1057782-138-willy@infradead.org>
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
 Content preview: Fetch a folio from the pagecache instead of a page. Removes
 two calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/f2fs.h | 10 +++++----- 1 file changed, 5 insertions(+),
 5 deletions(-)
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
X-Headers-End: 1tzLVi-0003fE-Vr
Subject: [f2fs-dev] [PATCH 137/153] f2fs: Use a folio in
 f2fs_truncate_meta_inode_pages()
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

Fetch a folio from the pagecache instead of a page.  Removes two calls
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 014ef580c0e4..3603523f0c25 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4804,13 +4804,13 @@ static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *sbi,
 	int i = 0;
 
 	do {
-		struct page *page;
+		struct folio *folio;
 
-		page = find_get_page(META_MAPPING(sbi), blkaddr + i);
-		if (page) {
-			if (folio_test_writeback(page_folio(page)))
+		folio = filemap_get_folio(META_MAPPING(sbi), blkaddr + i);
+		if (!IS_ERR(folio)) {
+			if (folio_test_writeback(folio))
 				need_submit = true;
-			f2fs_put_page(page, 0);
+			f2fs_folio_put(folio, false);
 		}
 	} while (++i < cnt && !need_submit);
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
