Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED70A3931A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWq-0000Ka-JC;
	Tue, 18 Feb 2025 05:52:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWp-0000Jt-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rWNu7qNlUy9eZpc8cnoo4lLYHZu+JSVNKjH/qLD5qHg=; b=i4LHNTu6B8EyW1lMg8hBAR64Lr
 A0u/TXXhC/m8N04FRTZ4bk6wuW8s+qVx08nWZf5z2SC0O/xve22NhK53iX1Lz2LI41/1uu5vZIomp
 mZXJeufeIKtFdBCzDFOJ6o/5T6gJnUHeK0LpyzIsdKC3GINCYv4Ejet5M/fHnSZfkBWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rWNu7qNlUy9eZpc8cnoo4lLYHZu+JSVNKjH/qLD5qHg=; b=Nsz8/3UhO8rYYF5o4SYKM7w2Hk
 ddScVnVycBTNEgH6koBRZcEJ5jJisI94y6UeoAL9fXe3PgLAQd8grQli2lnrckE7Nd/ZzYx6Rg0xD
 s9IahjQ8Hzrex3qPfRSSiAazzj5yGQskAgS4IQExe2hGHUj6+pL1JHg8zb6TVDqqDBlo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWp-0007cL-Bb for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rWNu7qNlUy9eZpc8cnoo4lLYHZu+JSVNKjH/qLD5qHg=; b=ZKxBPk0C5i9y6fJB6p1xOoTcux
 CDpKSdoQD/3ZdIR86vKSGfMwCIA/R81dH4J3nqemUZLO/Z4XEolqXwVI4knG3b9RcIoY4D/RGb5Z3
 X2vlOhuVS7vtNWwJSCLWHjbntPkPW+vClxD2CrP01QVsdhU9V8ZpSJaFyTkkG/ZBHsPV9hHy21gLp
 OIoSNtN/9Hqm2bEYp6CIyJfUmAZWDjJTdR0aKCSW7RRSIuoVy136Mvt0y/urWjY83skxnnMLkuXFN
 d8tFwIniWHIqxj3K7ZRGeKA0AXswCjt9wNzqbCGtn1PyQbNPRGXIiCthNFV8styd7FSZjps7qZ5AS
 ZW3ZTd5A==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWe-00000002Tt1-0EvV; Tue, 18 Feb 2025 05:52:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:53 +0000
Message-ID: <20250218055203.591403-20-willy@infradead.org>
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
 Content preview: Use f2fs_grab_cache_folio() to get a folio and use it
 throughout, 
 removing seven calls to compound_head() and a reference to page->mapping.
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/checkpoint.c
 | 26 +++++++++++++ 1 file changed, 13 insertions(+), 13 deletions(-) 
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
X-Headers-End: 1tkGWp-0007cL-Bb
Subject: [f2fs-dev] [PATCH 19/27] f2fs: Use a folio throughout
 __get_meta_page()
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

Use f2fs_grab_cache_folio() to get a folio and use it throughout,
removing seven calls to compound_head() and a reference to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bd890738b94d..75b7196d2c81 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -58,7 +58,7 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 							bool is_meta)
 {
 	struct address_space *mapping = META_MAPPING(sbi);
-	struct page *page;
+	struct folio *folio;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
 		.type = META,
@@ -74,37 +74,37 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 	if (unlikely(!is_meta))
 		fio.op_flags &= ~REQ_META;
 repeat:
-	page = f2fs_grab_cache_page(mapping, index, false);
-	if (!page) {
+	folio = f2fs_grab_cache_folio(mapping, index, false);
+	if (IS_ERR(folio)) {
 		cond_resched();
 		goto repeat;
 	}
-	if (PageUptodate(page))
+	if (folio_test_uptodate(folio))
 		goto out;
 
-	fio.page = page;
+	fio.page = &folio->page;
 
 	err = f2fs_submit_page_bio(&fio);
 	if (err) {
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 		return ERR_PTR(err);
 	}
 
 	f2fs_update_iostat(sbi, NULL, FS_META_READ_IO, F2FS_BLKSIZE);
 
-	lock_page(page);
-	if (unlikely(page->mapping != mapping)) {
-		f2fs_put_page(page, 1);
+	folio_lock(folio);
+	if (unlikely(folio->mapping != mapping)) {
+		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
 
-	if (unlikely(!PageUptodate(page))) {
-		f2fs_handle_page_eio(sbi, page_folio(page), META);
-		f2fs_put_page(page, 1);
+	if (unlikely(!folio_test_uptodate(folio))) {
+		f2fs_handle_page_eio(sbi, folio, META);
+		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
 out:
-	return page;
+	return &folio->page;
 }
 
 struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
