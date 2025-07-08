Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A2FAFD451
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92nzZDLIcbWNSLlcyBRNHFxoIS1icIJhsPIRk47JyVc=; b=atWMPVl8fkygcHBLmA4RbRWKNj
	vrkUbIEVr5EJkZR2LNBl43aJC19iyT6lcK1Ws/BIl05Z6dPAnDkEiOcD5o9OjQuB0fHdjXL4hxQHG
	yEnxkKVQut89d4Laqf8dvaWnsssdmqyWHICrMhzPRUG/wZQ+X/e+defGYr0C6wqtZBeQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk2-0007Rk-ET;
	Tue, 08 Jul 2025 17:04:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjw-0007Ly-8h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y/CMLcKJc9eybsov7+ZmftzSHfNTmsBLlIKTMARIvRc=; b=Pbs5+dLR8HMMx1wfaW53JRT5on
 kgWF8U5vu214ww382JS1xRw3I/DZce4vYs7E0UuAAaw/BCQkV3Ek/P0dWl+WPNhwFGnIXQMihutfK
 oEaA40ug23qXICTzRv9ZedBuAbn7p/5O3O/jxsdPpxeLf/U04VeifofXBaku9VgipDMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y/CMLcKJc9eybsov7+ZmftzSHfNTmsBLlIKTMARIvRc=; b=K3/AaiZ4qUnKHvwjcgXCoHK7fN
 ZboflE1uRotqWB1MBvXCCffqc1xGfqz3v2MzhGeivdy4hwon11NGoO+B9IhLyJ7kiq7yxeXKafvr2
 esHLS6YtJ8luhZimM1cLhOgo/ONOBLZ2YMa5WP3WDtyfD00v9l+1JWEL+qSSGdxefnaw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjv-0006GX-Nk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=y/CMLcKJc9eybsov7+ZmftzSHfNTmsBLlIKTMARIvRc=; b=g/xuveHkQcSUAtiRd4nCNDQpM6
 uP5B6xZPGcsDbSsDZmFh6YJPH3r9ZfMqtjp3/AwfkhoYDE4bmJ4emDVBS47cWRUSl/3IGL34sqfL5
 Lqsr+0F/+5JhKvLVsUIZRZM/9+wKzbDBcUtcEnslFGCCuJcjNTJlOwDaN0qbrlxH+3JCItZZuIMuK
 2D7FE+SmSKhhTBd1q+GD62z3he4CJK8JEjBTIhiS4UyF+S7QwVn6y37hEL8L44hsdaJjB3GxzC+NP
 WmIREXjUYzg7b/9D6p9ReSnECLpmESI2v1/A69Y7BZ9QVozTiXeg/1wtF5/l8toOxdOS94AfYKB3n
 idFSROHg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjk-00000000T86-126V;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:44 +0100
Message-ID: <20250708170359.111653-48-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Both callers now have a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/compress.c | 7
 +++---- fs/f2fs/data.c | 4 ++-- fs/f2fs/f2fs.h | 4 ++-- 3 files changed, 7
 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjv-0006GX-Nk
Subject: [f2fs-dev] [PATCH 47/60] f2fs: Pass a folio to
 f2fs_end_read_compressed_page()
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

Both callers now have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 7 +++----
 fs/f2fs/data.c     | 4 ++--
 fs/f2fs/f2fs.h     | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 10b4230607de..5847d22a5833 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -801,11 +801,10 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
  * page being waited on in the cluster, and if so, it decompresses the cluster
  * (or in the case of a failure, cleans up without actually decompressing).
  */
-void f2fs_end_read_compressed_page(struct page *page, bool failed,
+void f2fs_end_read_compressed_page(struct folio *folio, bool failed,
 		block_t blkaddr, bool in_task)
 {
-	struct decompress_io_ctx *dic =
-			(struct decompress_io_ctx *)page_private(page);
+	struct decompress_io_ctx *dic = folio->private;
 	struct f2fs_sb_info *sbi = dic->sbi;
 
 	dec_page_count(sbi, F2FS_RD_DATA);
@@ -813,7 +812,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 	if (failed)
 		WRITE_ONCE(dic->failed, true);
 	else if (blkaddr && in_task)
-		f2fs_cache_compressed_page(sbi, page,
+		f2fs_cache_compressed_page(sbi, &folio->page,
 					dic->inode->i_ino, blkaddr);
 
 	if (atomic_dec_and_test(&dic->remaining_pages))
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a3f231d47bdd..ccf410ef9b70 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -144,7 +144,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 
 		if (f2fs_is_compressed_page(&folio->page)) {
 			if (ctx && !ctx->decompression_attempted)
-				f2fs_end_read_compressed_page(&folio->page, true, 0,
+				f2fs_end_read_compressed_page(folio, true, 0,
 							in_task);
 			f2fs_put_folio_dic(folio, in_task);
 			continue;
@@ -241,7 +241,7 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
 		struct folio *folio = fi.folio;
 
 		if (f2fs_is_compressed_page(&folio->page))
-			f2fs_end_read_compressed_page(&folio->page, false, blkaddr,
+			f2fs_end_read_compressed_page(folio, false, blkaddr,
 						      in_task);
 		else
 			all_compressed = false;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5c1c21808489..68535b917a3a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4487,7 +4487,7 @@ bool f2fs_is_compress_level_valid(int alg, int lvl);
 int __init f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
-void f2fs_end_read_compressed_page(struct page *page, bool failed,
+void f2fs_end_read_compressed_page(struct folio *folio, bool failed,
 				block_t blkaddr, bool in_task);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
@@ -4561,7 +4561,7 @@ static inline int __init f2fs_init_compress_mempool(void) { return 0; }
 static inline void f2fs_destroy_compress_mempool(void) { }
 static inline void f2fs_decompress_cluster(struct decompress_io_ctx *dic,
 				bool in_task) { }
-static inline void f2fs_end_read_compressed_page(struct page *page,
+static inline void f2fs_end_read_compressed_page(struct folio *folio,
 				bool failed, block_t blkaddr, bool in_task)
 {
 	WARN_ON_ONCE(1);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
