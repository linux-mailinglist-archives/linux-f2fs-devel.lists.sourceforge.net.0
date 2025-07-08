Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04300AFD467
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI0Z4G1bgDa5hF3PhaqceICWr9IwDvusqhurIaLFDyY=; b=NWEnud1SUE5VP7kPDAYvChWWHQ
	2/mPOBEd0dmf+5v6ke4SX2gK1LtSCfKTVnbXxUp+u6/JsGBLMvGmHOJtgTGfxv7KgmW1nQ+S55rBW
	tR5oOsFMkBWW0zOjQ1Of2TdYxspTTnEinn/hwU8RyC8OrAy1Tww4NkVyAvyia0cQT45s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBkx-00036Q-Ny;
	Tue, 08 Jul 2025 17:05:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjz-0002rI-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LRXp6OPK1pnAMlYnYGPcJOztZKcFImibmQW7igXru7E=; b=RmiZD+kcpGqCZZIPriIPfhRvZU
 vnm8QhN3spb7bSbfWqZP94dqr/5pquZMnvD6Aj0FcCRu4WkZhMPPor/pEtX6IofW9oJdR0ExZqVTp
 et0Z/b46ZHB+mGW9Dyc81JbYft9tFA4TQLPDt56iLpdgAyhxmNXKB0vrsueHi8aE7bFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LRXp6OPK1pnAMlYnYGPcJOztZKcFImibmQW7igXru7E=; b=jk5ao8oam41ZOZkHgk7A68z+o8
 IedSNmX8PaQhdhhDN/OiBFMBBqgNr7yP/eoMR/vNQzCD3yPUilniOp3xYY5XD5O0ws9BNeolvw3Fe
 ZeMe6Ag/fz/jmW6LrMNhmvAmhBGJsHZiXVI5sHD6hoCuHqhrQ6dd+lgSr/PMhItMqq+k=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjw-0006H6-Jh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LRXp6OPK1pnAMlYnYGPcJOztZKcFImibmQW7igXru7E=; b=dcCMd/RzDMcwYQZGX58Gs7jv8c
 ve+DXj8uDWUr05uJnA53xVcv0hmSA2qTRyjhJhyAkkd1zbSmsYd0JeIkWLv5q0EandgDqCpcxJxQt
 6Y34h9U29m37BhUAiWLmAhlHytQHx5xjxoymlhKl3/8JgvTGYT0LGUEV9GmU4YrJtaEPQJOSeJoGJ
 cq15CLAzciLwSvOCsWYndPwzd/WVT7xMxi3f7E4l1UrjIePzCdIzGaVjwuFt+K43lQPhOygKgGNVi
 dmiN3n22S+Hiz0qBbQ9Q7q650HV9WlJKv1vLhk2bW48UBIn19m8bPtvoKE0mpCirKKddwbToBT7yH
 UiWeMC3Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjl-00000000T8k-0lFc;
 Tue, 08 Jul 2025 17:04:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:50 +0100
Message-ID: <20250708170359.111653-54-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The only caller already has a folio so pass it in.
 f2fs_cache_compressed_page()
 is not used outside compress.c so make it static. This requires a forward
 declaration (or would require rearranging this [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjw-0006H6-Jh
Subject: [f2fs-dev] [PATCH 53/60] f2fs: Pass a folio to
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

The only caller already has a folio so pass it in.
f2fs_cache_compressed_page() is not used outside compress.c so
make it static.  This requires a forward declaration (or would require
rearranging this file, but I've chosen not to do that for readability of
the diff).

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 11 +++++++----
 fs/f2fs/f2fs.h     |  4 ----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 24c7489b7427..5c1f47e45dab 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -793,6 +793,9 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 	f2fs_decompress_end_io(dic, ret, in_task);
 }
 
+static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
+		struct folio *folio, nid_t ino, block_t blkaddr);
+
 /*
  * This is called when a page of a compressed cluster has been read from disk
  * (or failed to be read from disk).  It checks whether this page was the last
@@ -810,7 +813,7 @@ void f2fs_end_read_compressed_page(struct folio *folio, bool failed,
 	if (failed)
 		WRITE_ONCE(dic->failed, true);
 	else if (blkaddr && in_task)
-		f2fs_cache_compressed_page(sbi, &folio->page,
+		f2fs_cache_compressed_page(sbi, folio,
 					dic->inode->i_ino, blkaddr);
 
 	if (atomic_dec_and_test(&dic->remaining_pages))
@@ -1918,8 +1921,8 @@ void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
 	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr + len - 1);
 }
 
-void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
-						nid_t ino, block_t blkaddr)
+static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
+		struct folio *folio, nid_t ino, block_t blkaddr)
 {
 	struct folio *cfolio;
 	int ret;
@@ -1952,7 +1955,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 
 	folio_set_f2fs_data(cfolio, ino);
 
-	memcpy(folio_address(cfolio), page_address(page), PAGE_SIZE);
+	memcpy(folio_address(cfolio), folio_address(folio), PAGE_SIZE);
 	folio_mark_uptodate(cfolio);
 	f2fs_folio_put(cfolio, true);
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c5a0d70e0a89..1650610556e3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4525,8 +4525,6 @@ void f2fs_destroy_compress_cache(void);
 struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
 void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
 					block_t blkaddr, unsigned int len);
-void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
-						nid_t ino, block_t blkaddr);
 bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi, struct folio *folio,
 								block_t blkaddr);
 void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
@@ -4581,8 +4579,6 @@ static inline int __init f2fs_init_compress_cache(void) { return 0; }
 static inline void f2fs_destroy_compress_cache(void) { }
 static inline void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
 				block_t blkaddr, unsigned int len) { }
-static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
-				struct page *page, nid_t ino, block_t blkaddr) { }
 static inline bool f2fs_load_compressed_folio(struct f2fs_sb_info *sbi,
 		struct folio *folio, block_t blkaddr) { return false; }
 static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
