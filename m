Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A89B8AFC4F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 00:56:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzP3q-0001Ch-KO;
	Tue, 23 Apr 2024 22:56:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzP3o-0001CU-Ia
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NEsYsbU8qr0emUe6mxit/OuVTFvxbBfZCV5/pFcVA2w=; b=kpnUW6EndaPyJm7z/m1aKkagbz
 cvR44X/XapQYEVwf+Q3vtuaeXck1Svmhz5cMvKUfjuZT0wrA6fBNjMBnQgqA67m4TEbhdH9AZwXS/
 tuyXTSVxXaGanJPNiw4POsyxoaYJ/GRvbI/1LDgikp7vcCv+Pn19VpO4fwCBIqRGLIjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NEsYsbU8qr0emUe6mxit/OuVTFvxbBfZCV5/pFcVA2w=; b=QM5MMqd/Nn0XwDzqnNX6fGlxL/
 G/cjVDm9fEhx0dOqfQuxscOTnRzLcQE7zRta6Tr08w5AIKYu2GYcCaJMZoK6i2cSy45ng1wU1btgy
 VJAmCChMdp0GODcuJnCViiuamCjUQxD7Lc40F86ii7PfyFdgWtVz0nVw6tiLVpr+xdBs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzP3o-0007Eg-6q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=NEsYsbU8qr0emUe6mxit/OuVTFvxbBfZCV5/pFcVA2w=; b=p/a8joILHo6OFpo2LhD6CykxRP
 WENvmFqHj0Ms3f2UKDAOSFJIen96AOJiItabSIxbfg/vMqH4dve5AA62QmtoQ748wuOlzizNjlL4v
 e/zDOTLlGiOzyDSauvcqu33bjQxTK2ZeUyy6PqvLrabr328y521cnxeM6BDh9iZ+s9TtErkhXew+z
 OlE6R3FkJueq/zlMKzBgdWdABtXTXqu/xN0aOtUuyE3D6tkefH6hr2EXw8kA4xvYiF6HC2uyxj/aj
 ukM0aTq63eh25mHnTS/tu5nyZN7C3c9ERJpH7Wgy6T/aPdNNYtvAGR8cnfSlANAxPuxsZxHnO/yht
 A2/G5ZJQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzP3K-0000000HG6M-2eAw;
 Tue, 23 Apr 2024 22:55:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Date: Tue, 23 Apr 2024 23:55:36 +0100
Message-ID: <20240423225552.4113447-6-willy@infradead.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423225552.4113447-1-willy@infradead.org>
References: <20240423225552.4113447-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Call page_folio() a little earlier so we can use
 folio_mapping()
 instead of page_mapping(), saving a call to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- mm/userfaultfd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rzP3o-0007Eg-6q
Subject: [f2fs-dev] [PATCH 5/6] userfault;
 Expand folio use in mfill_atomic_install_pte()
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Call page_folio() a little earlier so we can use folio_mapping()
instead of page_mapping(), saving a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/userfaultfd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index d9dcc7d71a39..e6486923263c 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -180,9 +180,9 @@ int mfill_atomic_install_pte(pmd_t *dst_pmd,
 	pte_t _dst_pte, *dst_pte;
 	bool writable = dst_vma->vm_flags & VM_WRITE;
 	bool vm_shared = dst_vma->vm_flags & VM_SHARED;
-	bool page_in_cache = page_mapping(page);
 	spinlock_t *ptl;
-	struct folio *folio;
+	struct folio *folio = page_folio(page);
+	bool page_in_cache = folio_mapping(folio);
 
 	_dst_pte = mk_pte(page, dst_vma->vm_page_prot);
 	_dst_pte = pte_mkdirty(_dst_pte);
@@ -212,7 +212,6 @@ int mfill_atomic_install_pte(pmd_t *dst_pmd,
 	if (!pte_none_mostly(ptep_get(dst_pte)))
 		goto out_unlock;
 
-	folio = page_folio(page);
 	if (page_in_cache) {
 		/* Usually, cache pages are already added to LRU */
 		if (newly_allocated)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
