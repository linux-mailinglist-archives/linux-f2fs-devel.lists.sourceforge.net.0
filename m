Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC5A76E3C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVh-0005dE-Kh;
	Mon, 31 Mar 2025 20:13:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVX-0005Zj-H6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G47SGLCtoVM6r+58ciOIRuLoTqlI7vH4s0Lme90qFz8=; b=Hf6p51WV6MAJv7lvVSwxM0ZGr9
 Rgs/0f2d1CDtM+LOXzKMTi2Rtz3wSAJrAKuQ1c3Sq/TrVFO0B5CgBgpgEPgtvMZFKS/pG2TbwwDj6
 gnFp6ohZpO3RboDphRhwCvhXvCf63Xp0hoiD/D950CNJADLFvUo29Kz5sTLU9FbXXBjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G47SGLCtoVM6r+58ciOIRuLoTqlI7vH4s0Lme90qFz8=; b=cuDz6o4Uox1xzaUugV4oQtI+V7
 iSzmNvYeENOpMuRLC+riRO4hvkFVbKcWWHcnEdabljQ5WX3ZYT5QZZj1TJBUhg/jJbOhQhMEx4YGb
 Wjcg4Ym19puteXGn6yoLx7e5n19cNM6Ug7xcOEixh1t6EEXYOzbm9i+8dBHB3C1Oskpk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVR-0003Yi-67 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=G47SGLCtoVM6r+58ciOIRuLoTqlI7vH4s0Lme90qFz8=; b=k7JZwE5vPbzupxQYsR17QrGbpF
 yReFXipYYKi2VhSRGQJImQcNdMvvfYB8AsrztNnM9NVZSoz7IAJvm1JPgRyvPQSrFd/04bOR2Twgo
 4bu2KkHN8UJo1GcqAqC/wXooXsRyxImKVLcyHMBi5dHGtzJDWiDy6T+xrC751yDU8eCoDMEA9Th5F
 5ODMSEl2jbE+RPgOycgVz1D9kc8ERMz2elVk/SMffv6JfdRxO0EVT05vdC58AVaByYYNPN0frtUPK
 Q1p18sQIs1rBGUMBtnYncqxP817K0TrqchIGKpAUoEvb4a40knDdZ7esphh4gNNp49/UNJfnYQw03
 K0HmNJ/w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVF-00000004RUh-3Xxu;
 Mon, 31 Mar 2025 20:13:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:25 +0100
Message-ID: <20250331201256.1057782-6-willy@infradead.org>
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
 Content preview: Iterate over each folio rather than each page. Convert
 f2fs_compress_control_page()
 to f2fs_compress_control_folio() since this is the only caller. Removes a
 reference to page->mapping which is going [...] 
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
X-Headers-End: 1tzLVR-0003Yi-67
Subject: [f2fs-dev] [PATCH 005/153] f2fs: Use bio_for_each_folio_all() in
 __has_merged_page()
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

Iterate over each folio rather than each page.  Convert
f2fs_compress_control_page() to f2fs_compress_control_folio() since
this is the only caller.  Removes a reference to page->mapping which
is going away soon as well as calls to fscrypt_is_bounce_page() and
fscrypt_pagecache_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c |  6 ++++--
 fs/f2fs/data.c     | 19 +++++++++----------
 fs/f2fs/f2fs.h     |  4 ++--
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index a01567bbcd33..a4cd957f6ade 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -137,9 +137,11 @@ static void f2fs_put_rpages_wbc(struct compress_ctx *cc,
 	}
 }
 
-struct page *f2fs_compress_control_page(struct page *page)
+struct folio *f2fs_compress_control_folio(struct folio *folio)
 {
-	return ((struct compress_io_ctx *)page_private(page))->rpages[0];
+	struct compress_io_ctx *ctx = folio->private;
+
+	return page_folio(ctx->rpages[0]);
 }
 
 int f2fs_init_compress_ctx(struct compress_ctx *cc)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 597d1e82cb55..70dab1b6fdf4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -548,8 +548,7 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 static bool __has_merged_page(struct bio *bio, struct inode *inode,
 						struct page *page, nid_t ino)
 {
-	struct bio_vec *bvec;
-	struct bvec_iter_all iter_all;
+	struct folio_iter fi;
 
 	if (!bio)
 		return false;
@@ -557,25 +556,25 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 	if (!inode && !page && !ino)
 		return true;
 
-	bio_for_each_segment_all(bvec, bio, iter_all) {
-		struct page *target = bvec->bv_page;
+	bio_for_each_folio_all(fi, bio) {
+		struct folio *target = fi.folio;
 
-		if (fscrypt_is_bounce_page(target)) {
-			target = fscrypt_pagecache_page(target);
+		if (fscrypt_is_bounce_folio(target)) {
+			target = fscrypt_pagecache_folio(target);
 			if (IS_ERR(target))
 				continue;
 		}
-		if (f2fs_is_compressed_page(target)) {
-			target = f2fs_compress_control_page(target);
+		if (f2fs_is_compressed_page(&target->page)) {
+			target = f2fs_compress_control_folio(target);
 			if (IS_ERR(target))
 				continue;
 		}
 
 		if (inode && inode == target->mapping->host)
 			return true;
-		if (page && page == target)
+		if (page && page == &target->page)
 			return true;
-		if (ino && ino == ino_of_node(target))
+		if (ino && ino == ino_of_node(&target->page))
 			return true;
 	}
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c37092e82354..443c9d27e5b6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4428,7 +4428,7 @@ enum cluster_check_type {
 	CLUSTER_RAW_BLKS    /* return # of raw blocks in a cluster */
 };
 bool f2fs_is_compressed_page(struct page *page);
-struct page *f2fs_compress_control_page(struct page *page);
+struct folio *f2fs_compress_control_folio(struct folio *folio);
 int f2fs_prepare_compress_overwrite(struct inode *inode,
 			struct page **pagep, pgoff_t index, void **fsdata);
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
@@ -4505,7 +4505,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return false;
 }
 static inline bool f2fs_is_compress_level_valid(int alg, int lvl) { return false; }
-static inline struct page *f2fs_compress_control_page(struct page *page)
+static inline struct folio *f2fs_compress_control_folio(struct folio *folio)
 {
 	WARN_ON_ONCE(1);
 	return ERR_PTR(-EINVAL);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
