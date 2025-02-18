Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7ADA39316
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWq-00024L-EP;
	Tue, 18 Feb 2025 05:52:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWm-00023f-9d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFlLLRTVmgKkQKhNmYuJA0ZpitkM3pare4EZQGvBJWA=; b=VhaSqxjgFfaTaBbtwF4rJIMhSr
 PZSg0mYXeRMgHCdm9RRnH6FBlCmqPcXVS1M+dVy0iZG2cmDr5YPC8sBntz/ZH9WbbQVWVXvrUcJO+
 rY93aT+vufg6umUJb4IWL+sgGz9z0+aAP16QMQtjM6LBHj9CbvDhLEGH6s228cCXTveQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LFlLLRTVmgKkQKhNmYuJA0ZpitkM3pare4EZQGvBJWA=; b=SpDvPyYcBe7ZA+xO4L226Q1vc8
 aj6mVyfN9MWKn/v3Hg7rw787VV94yJjIKsN1kwGfPIeQegXihRBdOH8ZGqxLocPJzVVO8tmUPSXh0
 0AWH8klof1znEr8GlDga1RrdO99DB1WIL0ZBjxMQfoJUbjFmVYuBFrZc0b5rdjKOHSok=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWj-0007bW-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LFlLLRTVmgKkQKhNmYuJA0ZpitkM3pare4EZQGvBJWA=; b=d0ZzdIsUMGW7mYPvmZhvMXEdJz
 hXym8/R65DPb0VW0TiH0Np9ZzWBnUi9Wmr3ty3pNgnSC6D8a04PSTG8JqCILC/Jg9PTdfUioRLF5o
 IISY+FZDqTetPIWu/AbxFfVuzCENl2XHPJI1xtPARekdR6pm7u3QpjOSk7Q+PAWSM/thII6cgK/wX
 Eq5FjrpgQ2UYAnyosB35exiPpFC2KAgMh/qpds0qr9NSapvVYs18Eobt7kfzmjrxOrRXX5JkTSxUh
 ibzLFMNzetsJNlXMPrDR4iGaRvIaWFPWjgm3TuBU96ekKSSySK/duVZd9gbJteIp3Zv2K0Ishkwuh
 WQw8ek7A==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWd-00000002TsS-1fdx; Tue, 18 Feb 2025 05:52:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:48 +0000
Message-ID: <20250218055203.591403-15-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Iterate over each folio in the bio instead of each page.
 Follow
 the pattern in ext4 for handling bounce folios. Removes a few calls to
 compound_head()
 and references to page->mapping. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/data.c | 36 +++++++++++++++++++++ 1 file changed, 21 insertions(+),
 15 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWj-0007bW-Nr
Subject: [f2fs-dev] [PATCH 14/27] f2fs: Convert f2fs_write_end_io() to use a
 folio_iter
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

Iterate over each folio in the bio instead of each page.
Follow the pattern in ext4 for handling bounce folios.  Removes
a few calls to compound_head() and references to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 24c5cb1f5ada..5ec4395ef06d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -319,8 +319,7 @@ static void f2fs_read_end_io(struct bio *bio)
 static void f2fs_write_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi;
-	struct bio_vec *bvec;
-	struct bvec_iter_all iter_all;
+	struct folio_iter fi;
 
 	iostat_update_and_unbind_ctx(bio);
 	sbi = bio->bi_private;
@@ -328,34 +327,41 @@ static void f2fs_write_end_io(struct bio *bio)
 	if (time_to_inject(sbi, FAULT_WRITE_IO))
 		bio->bi_status = BLK_STS_IOERR;
 
-	bio_for_each_segment_all(bvec, bio, iter_all) {
-		struct page *page = bvec->bv_page;
-		enum count_type type = WB_DATA_TYPE(page, false);
+	bio_for_each_folio_all(fi, bio) {
+		struct folio *folio = fi.folio;
+		enum count_type type;
 
-		fscrypt_finalize_bounce_page(&page);
+		if (fscrypt_is_bounce_folio(folio)) {
+			struct folio *io_folio = folio;
+
+			folio = fscrypt_pagecache_folio(io_folio);
+			fscrypt_free_bounce_page(&io_folio->page);
+		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		if (f2fs_is_compressed_page(page)) {
-			f2fs_compress_write_end_io(bio, page);
+		if (f2fs_is_compressed_page(&folio->page)) {
+			f2fs_compress_write_end_io(bio, &folio->page);
 			continue;
 		}
 #endif
 
+		type = WB_DATA_TYPE(&folio->page, false);
+
 		if (unlikely(bio->bi_status)) {
-			mapping_set_error(page->mapping, -EIO);
+			mapping_set_error(folio->mapping, -EIO);
 			if (type == F2FS_WB_CP_DATA)
 				f2fs_stop_checkpoint(sbi, true,
 						STOP_CP_REASON_WRITE_FAIL);
 		}
 
-		f2fs_bug_on(sbi, page->mapping == NODE_MAPPING(sbi) &&
-				page_folio(page)->index != nid_of_node(page));
+		f2fs_bug_on(sbi, folio->mapping == NODE_MAPPING(sbi) &&
+				folio->index != nid_of_node(&folio->page));
 
 		dec_page_count(sbi, type);
-		if (f2fs_in_warm_node_list(sbi, page))
-			f2fs_del_fsync_node_entry(sbi, page);
-		clear_page_private_gcing(page);
-		end_page_writeback(page);
+		if (f2fs_in_warm_node_list(sbi, &folio->page))
+			f2fs_del_fsync_node_entry(sbi, &folio->page);
+		clear_page_private_gcing(&folio->page);
+		folio_end_writeback(folio);
 	}
 	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
 				wq_has_sleeper(&sbi->cp_wait))
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
