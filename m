Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDCCA76E87
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW1-000498-8b;
	Mon, 31 Mar 2025 20:13:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVp-0003wq-FR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1kcxZ8LWDIGIZ8b+3YOJhO7UJV+aylqxiUNt5kQ5p0M=; b=kNfjHMMCktbzKQW3TE8w+xLAai
 U1FsEi23+ryH/a6PohKKjOHftxssQMgmcHsQXU3BWFmDIPDeSQV0Wwd5z22vbqzCPwhj8/Jfz6wP2
 R+VtG+InFKEXupU6zGso29j2eUisAy83gNZrF4nUE0eG5Af6RfnvrJ+kgS7PZgVVKBeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1kcxZ8LWDIGIZ8b+3YOJhO7UJV+aylqxiUNt5kQ5p0M=; b=QAzvOd14MhYeZEEc7E6JoMfng9
 A/HRcrbNRq+2a+P0gpPfhFumUK+veYtN59aOowsAlhmsMK+/7ldwWZeWMuy6hEe3l67g9FZMpjne7
 68CBeqHQ/wCRvh9pJslEtPtvy1J9dI2233WvDXRDCnkBRUwlmgnP40umAAIvj8Rub0nw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVo-0003hp-5F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1kcxZ8LWDIGIZ8b+3YOJhO7UJV+aylqxiUNt5kQ5p0M=; b=fR2Lpeg5CQA1iDV9Az/+bg10P7
 ozlnD0Y4aK3X0zEoU7dbKXyHpVqd1eHQ7P6yKxyMVC39Oif2l/ZqY5gPtHO9rpNc42fW741PAQpHR
 vOaIqHhkBWsYzqdGISKE1qZa3Sk9j7YnzPB8qpbhW9E25eVuRimnG8n+/0Km/3QF1fyYCIn6vCglS
 FU53/YkfgzBrQYUYaEhJP0AQhtai+b6wQAbEWEGb5654haHQgGZEkS0Pu/AyC2GDPcDsp47ObgdBe
 uSeOgJt65JO4Lp8FII19iK09ShAPqNju9kETiBtixha+YkXck53R98EuXc+5ogYqWgFXpxIjTWDtz
 u78uP3Sg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVc-00000004SbE-3CnH;
 Mon, 31 Mar 2025 20:13:24 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:38 +0100
Message-ID: <20250331201256.1057782-139-willy@infradead.org>
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
 Content preview:  Look up a folio instead of a page, and if that fails,
 allocate
 a folio. Removes five calls to compound_head(), one of the last few references
 to add_to_page_cache_lru() and honours the cpuset_do_page_ [...] 
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
X-Headers-End: 1tzLVo-0003hp-5F
Subject: [f2fs-dev] [PATCH 138/153] f2fs: Use a folio in
 f2fs_cache_compressed_page()
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

Look up a folio instead of a page, and if that fails, allocate a folio.
Removes five calls to compound_head(), one of the last few references to
add_to_page_cache_lru() and honours the cpuset_do_page_mem_spread()
setting.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ed889ed4fd5c..4c91038b3f6f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1928,7 +1928,7 @@ void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
 void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 						nid_t ino, block_t blkaddr)
 {
-	struct page *cpage;
+	struct folio *cfolio;
 	int ret;
 
 	if (!test_opt(sbi, COMPRESS_CACHE))
@@ -1940,28 +1940,28 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 	if (!f2fs_available_free_memory(sbi, COMPRESS_PAGE))
 		return;
 
-	cpage = find_get_page(COMPRESS_MAPPING(sbi), blkaddr);
-	if (cpage) {
-		f2fs_put_page(cpage, 0);
+	cfolio = filemap_get_folio(COMPRESS_MAPPING(sbi), blkaddr);
+	if (!IS_ERR(cfolio)) {
+		f2fs_folio_put(cfolio, false);
 		return;
 	}
 
-	cpage = alloc_page(__GFP_NOWARN | __GFP_IO);
-	if (!cpage)
+	cfolio = filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0);
+	if (!cfolio)
 		return;
 
-	ret = add_to_page_cache_lru(cpage, COMPRESS_MAPPING(sbi),
+	ret = filemap_add_folio(COMPRESS_MAPPING(sbi), cfolio,
 						blkaddr, GFP_NOFS);
 	if (ret) {
-		f2fs_put_page(cpage, 0);
+		f2fs_folio_put(cfolio, false);
 		return;
 	}
 
-	set_page_private_data(cpage, ino);
+	set_page_private_data(&cfolio->page, ino);
 
-	memcpy(page_address(cpage), page_address(page), PAGE_SIZE);
-	SetPageUptodate(cpage);
-	f2fs_put_page(cpage, 1);
+	memcpy(folio_address(cfolio), page_address(page), PAGE_SIZE);
+	folio_mark_uptodate(cfolio);
+	f2fs_folio_put(cfolio, true);
 }
 
 bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
