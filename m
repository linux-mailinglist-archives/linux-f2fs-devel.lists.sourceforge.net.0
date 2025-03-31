Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8367A76E93
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW7-0001GQ-Gd;
	Mon, 31 Mar 2025 20:13:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVi-00012O-6g
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mL2599sN5U4LOy8iPyCW/5878Uw4nGc6zWkbWZNsGtA=; b=fYKG30D2hUP5K0VJUqUSJAO/+y
 P5FY1vGw6EKnB4SewjrCoGKWgpcIbiWhRjCH4z7K9/FuOVFld+JGFBcd2dqBcFJbSS7K1tcFMx3UL
 AA/NIO8Xy25K8itiuSHo8lFIV3hR26uxdgRJhLivCkL5juFKZyU8li806KN4nkZEGmcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mL2599sN5U4LOy8iPyCW/5878Uw4nGc6zWkbWZNsGtA=; b=ge+Li9VpMPhoI0PSRsPgBEytLj
 GSB3PRiG22nFrdz0ztU0iE2vMVqfll2kmn9ol6iVNF0S4+Wn8uY1YfwZi6txE1jr606sQz2Y6zStT
 YyK94ofj62K7fP4ffu+Ujdnez3s4fxUnBMWF8ejB8XolbysSSMXFVG9mzd8KrOHqA234=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVi-0003eq-AX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mL2599sN5U4LOy8iPyCW/5878Uw4nGc6zWkbWZNsGtA=; b=Ii+TMyT8evBcS4tEqt7U4kdcRB
 GZUkjt1jzTN6xzOyZxixlNQ8u92hdMc6naUQgSte+JRJNr1lkd5YsRC1YEewv4z74zbiPrA3BhwvI
 JcFWqlWRqKZnbybMLxoboftKWfmyXPzRGuBn3Fd6Sq0ZneUjmwZsZA0SCrCk6ud312DWosdvr0TOH
 hNGoT35j9zuBuvUqEWY9hMPa5z7UDj5RCjYh2VgViEylTitJK+/7nlDvUoZvOkEZpMroOlBLLCUCi
 FiiFY67nFxrdwqbmHUMSAeWEblStTKM3a0DH1Rm3Azp8l6ksoF3YchSrv09Z4Y5dzJlM3JCuc2AYm
 1uQOO+/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVb-00000004SZL-42XB;
 Mon, 31 Mar 2025 20:13:24 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:34 +0100
Message-ID: <20250331201256.1057782-135-willy@infradead.org>
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
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/compress.c | 9
 ++++----- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 4 ++-- 3 files changed, 7
 insertions(+), 8 deletions(-) 
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
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVi-0003eq-AX
Subject: [f2fs-dev] [PATCH 134/153] f2fs: Convert f2fs_put_page_dic() to
 f2fs_put_folio_dic()
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

The only caller has a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 9 ++++-----
 fs/f2fs/data.c     | 2 +-
 fs/f2fs/f2fs.h     | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index a4cd957f6ade..ed889ed4fd5c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1869,14 +1869,13 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 }
 
 /*
- * Put a reference to a compressed page's decompress_io_ctx.
+ * Put a reference to a compressed folio's decompress_io_ctx.
  *
- * This is called when the page is no longer needed and can be freed.
+ * This is called when the folio is no longer needed and can be freed.
  */
-void f2fs_put_page_dic(struct page *page, bool in_task)
+void f2fs_put_folio_dic(struct folio *folio, bool in_task)
 {
-	struct decompress_io_ctx *dic =
-			(struct decompress_io_ctx *)page_private(page);
+	struct decompress_io_ctx *dic = folio->private;
 
 	f2fs_put_dic(dic, in_task);
 }
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 952b3885a092..d899341a04f8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -146,7 +146,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			if (ctx && !ctx->decompression_attempted)
 				f2fs_end_read_compressed_page(&folio->page, true, 0,
 							in_task);
-			f2fs_put_page_dic(&folio->page, in_task);
+			f2fs_put_folio_dic(folio, in_task);
 			continue;
 		}
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 55fcdd334ea4..b8ddc2df0571 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4438,7 +4438,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
 void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
 				bool in_task);
-void f2fs_put_page_dic(struct page *page, bool in_task);
+void f2fs_put_folio_dic(struct folio *folio, bool in_task);
 unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn,
 						unsigned int ofs_in_node);
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
@@ -4494,7 +4494,7 @@ static inline void f2fs_end_read_compressed_page(struct page *page,
 {
 	WARN_ON_ONCE(1);
 }
-static inline void f2fs_put_page_dic(struct page *page, bool in_task)
+static inline void f2fs_put_folio_dic(struct folio *folio, bool in_task)
 {
 	WARN_ON_ONCE(1);
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
