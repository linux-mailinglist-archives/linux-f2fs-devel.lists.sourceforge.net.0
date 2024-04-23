Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0728D8AFC48
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 00:56:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzP3d-00006C-JD;
	Tue, 23 Apr 2024 22:56:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzP3b-000065-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HkiZG9m0iZUn7YHN2uAFIsSMCWAiQIiQFvg2/jh9MHY=; b=XoDOXXVqQM1vXD5RAd3peYtvIB
 peRWap7S1CnXv9e1k6qmV46dddiwcmYVb/u87vevurE2ChQHUbb+isO1AEjmDo6vXWU0dZgkvjDqz
 GQzDkhXMoYqjqmjrEUg2SNXofpbxDXFK9sgOYxmxAq9uqWqTnm/Y9kd7v4XV4K/Y88hk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HkiZG9m0iZUn7YHN2uAFIsSMCWAiQIiQFvg2/jh9MHY=; b=I1ZuyYiWzY33x9HZF06JEcpDJQ
 okTeiiqo45ufjVsh1BJ3O8BWYBicT6YM18S0Etg2/E5eqgCV2v/Cdmkva9crmx3TADynKb7OtoAD1
 a3Dhrv0HOEjNGJZtVK4mDJySjXRdiZ9LobKcvytZkpP90vo2XH6PQoRbleqTJpjvtN78=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzP3X-0007Dh-1R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HkiZG9m0iZUn7YHN2uAFIsSMCWAiQIiQFvg2/jh9MHY=; b=fWz1hx0jDqtp05rXrTDwSTlW1l
 oZeuyvzFJHEc/0+YW3p1DyW3UWM9dRaBZjHbmz1C2E2jOB081Aye+WIX7P/XqgdmV3Q8eP/iI/ryH
 IBIzcVOSH1sK7V8oDiocBKo6gv42nFvkExjp6vRYblqvxaazX6cDDC4vZtSxOcaBVbPeheHmXvL2Y
 k/WZKL/TVFnczAEaKfgpo7QUMvQsNxDyf8R9tZI3BePQ/lc9p6Ng0uqXMg0uvh1mlm/8c0PzoZq/D
 JiJEX09m8u2IIH8YhGn/N7Fv7wzw5XCysAFi3vVgjr8VPfs3ZvqeDOJCkoh8FHu8h1YQzPomRTlhV
 f6LivFTw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzP3K-0000000HG6K-2IMq;
 Tue, 23 Apr 2024 22:55:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Date: Tue, 23 Apr 2024 23:55:35 +0100
Message-ID: <20240423225552.4113447-5-willy@infradead.org>
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
 Content preview: Removes a few calls to compound_head() and a call to
 page_mapping().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 mm/migrate_device.c
 | 13 +++++-------- 1 file changed, 5 insertions(+), 8 deletions(-) 
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
X-Headers-End: 1rzP3X-0007Dh-1R
Subject: [f2fs-dev] [PATCH 4/6] migrate: Expand the use of folio in
 __migrate_device_pages()
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

Removes a few calls to compound_head() and a call to page_mapping().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/migrate_device.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a68616c1965f..aecc71972a87 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -692,6 +692,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
+		struct folio *folio;
 		int r;
 
 		if (!newpage) {
@@ -726,15 +727,12 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			continue;
 		}
 
-		mapping = page_mapping(page);
+		folio = page_folio(page);
+		mapping = folio_mapping(folio);
 
 		if (is_device_private_page(newpage) ||
 		    is_device_coherent_page(newpage)) {
 			if (mapping) {
-				struct folio *folio;
-
-				folio = page_folio(page);
-
 				/*
 				 * For now only support anonymous memory migrating to
 				 * device private or coherent memory.
@@ -757,11 +755,10 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 
 		if (migrate && migrate->fault_page == page)
 			r = migrate_folio_extra(mapping, page_folio(newpage),
-						page_folio(page),
-						MIGRATE_SYNC_NO_COPY, 1);
+						folio, MIGRATE_SYNC_NO_COPY, 1);
 		else
 			r = migrate_folio(mapping, page_folio(newpage),
-					page_folio(page), MIGRATE_SYNC_NO_COPY);
+					folio, MIGRATE_SYNC_NO_COPY);
 		if (r != MIGRATEPAGE_SUCCESS)
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
