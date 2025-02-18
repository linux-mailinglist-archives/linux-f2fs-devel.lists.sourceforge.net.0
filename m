Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAFEA39319
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWn-0000JM-SW;
	Tue, 18 Feb 2025 05:52:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWm-0000In-QF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OilBiweMkMqZCoG/raqSrzctqggQhymMRjnJ0jCfGlo=; b=PSjubp+rJ5iFmlThzGpC+iXrMH
 IOZewWyH56/vQ1MIXu9hdFEIoLdoUWQi+0LZ0mQh8wTdLUMN7KrODi9EkWryiWs5yp+nPHPfa6Seg
 QvfEhzCAf8b7scsho/nD0wvD2rYTi+OFPygDZA2LdKI3M08tcTWCLTAG4NROKsXgoE9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OilBiweMkMqZCoG/raqSrzctqggQhymMRjnJ0jCfGlo=; b=CiYUhArzqIHhC7IMVNLigoxxbU
 EMJ0S/xnpVwqkabyDxR7c7E3vJfYc48x7cbZrkKpT2wA13IgvRGRnzzprRhmZ1Xk0V9q7lNSLzYXQ
 xBCLZpp40celDXbp7eCaD2vLIWkVxKIsjTYs6tDBvt7ZVHJ39sHggruoi9BXP/aP/Bdo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWm-0007c4-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OilBiweMkMqZCoG/raqSrzctqggQhymMRjnJ0jCfGlo=; b=JNgieV2Kpn2C52ubSYAes7KG/k
 OtMoaHRiQ6X4T6Dm6d+g431niqQ5VwOvEOq15tuThPoAQS4ZeeF1hTtedLo3LBzQybPs4tHdEkqhY
 v5xGGrTRlvbrjjvHX+BOeTpYV9ktQa2iqb6y+xI9ObsdMcR/vTYjdLsxj0QhNi/gdHR23sEzSVUIM
 4T/5ZUUCxJg/lqiRe7hOvpVFxugRTx/mn8s/LH6X2ZY7oLGI3enAubDtFHr1zaPBkMbUQ3Vq1LBoJ
 eqZOQ8KdfC8shsJcxozsCGaN2hd/UQn+C316abVqXU6QtxsXm/4FX02vJYwowymA2HDlXmadxImhv
 fcecopyQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWb-00000002TrB-2R3b; Tue, 18 Feb 2025 05:52:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:37 +0000
Message-ID: <20250218055203.591403-4-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs_put_page() to f2fs_folio_put() and add a
 wrapper.
 Replaces three calls to compound_head() with one. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWm-0007c4-W3
Subject: [f2fs-dev] [PATCH 03/27] f2fs: Add f2fs_folio_put()
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert f2fs_put_page() to f2fs_folio_put() and add a wrapper.
Replaces three calls to compound_head() with one.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b05653f196dd..5e01a08afbd7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2806,16 +2806,21 @@ static inline struct page *f2fs_pagecache_get_page(
 	return pagecache_get_page(mapping, index, fgp_flags, gfp_mask);
 }
 
-static inline void f2fs_put_page(struct page *page, int unlock)
+static inline void f2fs_folio_put(struct folio *folio, bool unlock)
 {
-	if (!page)
+	if (!folio)
 		return;
 
 	if (unlock) {
-		f2fs_bug_on(F2FS_P_SB(page), !PageLocked(page));
-		unlock_page(page);
+		f2fs_bug_on(F2FS_F_SB(folio), !folio_test_locked(folio));
+		folio_unlock(folio);
 	}
-	put_page(page);
+	folio_put(folio);
+}
+
+static inline void f2fs_put_page(struct page *page, int unlock)
+{
+	f2fs_folio_put(page_folio(page), unlock);
 }
 
 static inline void f2fs_put_dnode(struct dnode_of_data *dn)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
