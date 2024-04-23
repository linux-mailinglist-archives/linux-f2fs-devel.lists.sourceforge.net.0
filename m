Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D18AFC4A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 00:56:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzP3h-0003gj-FT;
	Tue, 23 Apr 2024 22:56:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzP3e-0003gZ-FI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6BdbrjGMJLxdb5ZMK/G6foThAN9UndlEGGEDv4wlWRI=; b=TcptJ+JAShwYJEvN3B+0277yvF
 5xldo9qrKsVBVNWgALz61uOUdIjd3761nX6ZVgmuzOfn4bjNaBDiyvPEvvRlIiDobzY6qU/wwwLAg
 4pOZUMr3ICUwEMG4zjAzbnPMTuesDLi9MHFAV3mFT+Y6/lcjGMUxXkX4nHnokfqFVcYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6BdbrjGMJLxdb5ZMK/G6foThAN9UndlEGGEDv4wlWRI=; b=UUKhDn5n16RBbUii5ml7FbTcw5
 Iu1a3Xmtg3IqJc4agyUdMuXGwSq+/AhZ3FMHieuyzK7wFYi0rfA0kvE6cWLqX/ZgtXVCs2DmaPIhL
 JelPbaJvWLrXirBDIbkfB+j9RsJ9NypTzZPB5Fzfcb4wLXL+FUhBVIT/rYyqPVmgHj5o=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzP3d-0007Dx-69 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6BdbrjGMJLxdb5ZMK/G6foThAN9UndlEGGEDv4wlWRI=; b=GXqibsIW/9Se+tRhLO20+7a/v9
 wsmcZhSZd4aKV02wYbXtdOm7xh9lbELNh6lQxP5GxA27iIrRPW1rK/Ymdtqpu/+/nGFyAzNy9lxxP
 vy6pUdo+sbheXOrI4jhKUlZ6Ipc8ez5vku8zL1C7HWAh5Bri1s4bZXyjWL8pl+8/66uAUJKoXWRUz
 3l94tyRtywEBnqZANW5qHke2GMUTLpyMRSsIt3MczQUwOdg6NTMK+fBrHg0SKG1L5aBKO9/X9mPsn
 +iuTcNxlzraFoaUd4AYsaG73ZFUkHXpkDEIEYj9kpBzwsfM/1YOZAAJd1F/v7zGZqC0EVto1KhuBu
 8OzRZSlQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzP3K-0000000HG6O-308H;
 Tue, 23 Apr 2024 22:55:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Date: Tue, 23 Apr 2024 23:55:37 +0100
Message-ID: <20240423225552.4113447-7-willy@infradead.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423225552.4113447-1-willy@infradead.org>
References: <20240423225552.4113447-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers are now converted,
 delete this compatibility wrapper.
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 include/linux/pagemap.h
 | 1 - mm/folio-compat.c | 6 ------ 2 files changed, 7 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
X-Headers-End: 1rzP3d-0007Dx-69
Subject: [f2fs-dev] [PATCH 6/6] mm: Remove page_mapping()
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

All callers are now converted, delete this compatibility wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 1 -
 mm/folio-compat.c       | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index b6f14e9a2d98..941f7ed714b9 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -399,7 +399,6 @@ static inline void filemap_nr_thps_dec(struct address_space *mapping)
 #endif
 }
 
-struct address_space *page_mapping(struct page *);
 struct address_space *folio_mapping(struct folio *);
 struct address_space *swapcache_mapping(struct folio *);
 
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index f31e0ce65b11..f05906006b3c 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -10,12 +10,6 @@
 #include <linux/swap.h>
 #include "internal.h"
 
-struct address_space *page_mapping(struct page *page)
-{
-	return folio_mapping(page_folio(page));
-}
-EXPORT_SYMBOL(page_mapping);
-
 void unlock_page(struct page *page)
 {
 	return folio_unlock(page_folio(page));
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
