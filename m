Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A91558AFC50
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 00:56:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzP3s-0005O3-BJ;
	Tue, 23 Apr 2024 22:56:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzP3i-0005Nc-74
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYDG6ZsjDj+2iBPQ3OajYlgseuthmwTxF2D+L3YSI+w=; b=Nzctu+VSZXehxegIn3TeT97xSg
 WIGu5m0mGAtwP4Bboi7xZWxVoot4VVflqFLu/gFwk7h+FXLvHgBaUs4QhsIuiC0tprM7xkBXh5SIL
 /k5fOlFWRuSKFmNuqvJZjk1IRKgKM+/LvctYQKZMe+KMso8gFLD184RKyk4vDI5zKkPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KYDG6ZsjDj+2iBPQ3OajYlgseuthmwTxF2D+L3YSI+w=; b=iO28dpkEUTd/uhMdzHyCTbHwNZ
 PNc2r29hwJY6NcKVDdcZuaFKlc+J2aRYM/4t39nwPda5TKMt5GFLpof+jO7Z9q272dDKUdShgH1UW
 6EHKr8w8srmHNr2b6Is/obgIXC8BjYEhihf1GQ/KtOV8I3LqyVEs+XOYlIvDyGDwsink=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzP3g-0007E2-1B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=KYDG6ZsjDj+2iBPQ3OajYlgseuthmwTxF2D+L3YSI+w=; b=VPD3YkPlOZgK3F00x6rBjyB/qa
 7iLvl71KcyySOFpXv6VNcIvJ4kLBFTS/SXC3ZzrjOZBGWVSosHva8VS0O89ku2EGoSb9qZG20yWz2
 gsbxrWVoRLITZhb+GHv47Fr7Tcbg/hDcEGYqKicULJLqtr7/WQI/SbIVuXP87EClD4lburQZ8Bn0E
 1sENDUkd5HyuQEQA7bd59fijov3p1eibLXaD65uZE4xl1bPmqZpVd8Bz2kpemDPimf7xp4wYx1Bts
 biZFYcGHus1s7W3aAtQd9JEgMLwAi1M2Q51JgD2jB+d0NH8QBSQz+8Dfe99630W60Xx6+tpx6+3jk
 Cq8mW83A==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzP3K-0000000HG6G-1bIa;
 Tue, 23 Apr 2024 22:55:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Date: Tue, 23 Apr 2024 23:55:33 +0100
Message-ID: <20240423225552.4113447-3-willy@infradead.org>
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
 Content preview: Removes uses of page_mapping() and page_index().
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index 5d641fac02ba..9f74c867d790 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -4100, 11 +4100,
 12 @@ const struct address_space_operations f2fs_dblock [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rzP3g-0007E2-1B
Subject: [f2fs-dev] [PATCH 2/6] f2fs: Convert
 f2fs_clear_page_cache_dirty_tag to use a folio
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

Removes uses of page_mapping() and page_index().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5d641fac02ba..9f74c867d790 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4100,11 +4100,12 @@ const struct address_space_operations f2fs_dblock_aops = {
 
 void f2fs_clear_page_cache_dirty_tag(struct page *page)
 {
-	struct address_space *mapping = page_mapping(page);
+	struct folio *folio = page_folio(page);
+	struct address_space *mapping = folio->mapping;
 	unsigned long flags;
 
 	xa_lock_irqsave(&mapping->i_pages, flags);
-	__xa_clear_mark(&mapping->i_pages, page_index(page),
+	__xa_clear_mark(&mapping->i_pages, folio->index,
 						PAGECACHE_TAG_DIRTY);
 	xa_unlock_irqrestore(&mapping->i_pages, flags);
 }
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
