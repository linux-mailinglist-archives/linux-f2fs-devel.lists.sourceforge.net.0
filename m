Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59466950745
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHb-0002Q5-91;
	Tue, 13 Aug 2024 14:13:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHY-0002Pr-92
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wfvz5qTTiWunLLAk2zw1fdxIKf4Wx0FuQF9mRRY1TNg=; b=UkOz0YlYKbqZu4+bz/jKyUp7mU
 oKGvLFd+Vy7DTpUYxCTYqwRk5FQdF8ZsrXIQJa6yuFbaU2A5B6g2LrcnQhnXe+qXClgPn5YcdRTMa
 JhMXdoVrxqyAL0S8vU/JBznydMlICGtlr27++nCZZfs8EH9GRy5B4jbd949hkT1PjwHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Wfvz5qTTiWunLLAk2zw1fdxIKf4Wx0FuQF9mRRY1TNg=; b=U
 ma91Pxpotzfxm2EvEAHp6v1NQx5J0uKM67n9skSD4JAmykvjvMMXSEkHHhVtumwNreN6CWsPXOoW/
 WT3O8yrUkNb5W1giQI4LhqfSeqA1UnJHkl4vriSh+SAJe4XK+0Ev6rNdU5zhmEFADyfxI7lmvTDyp
 7mMsclwdLyiBuzxI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHX-0001CE-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4B343CE0159;
 Tue, 13 Aug 2024 14:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAC5C4AF09;
 Tue, 13 Aug 2024 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558424;
 bh=jeYWkLahC30q53zidZWoDYe1mT2rCQxgLl7pKbyzKME=;
 h=From:To:Cc:Subject:Date:From;
 b=NIEL4rarQPF1QG53mUNGMO2jwW4INcHFzUNCt5FbTPQp8KEi872+saZe00PI7+uBC
 8WRmt+aA8qsT9tRUntGU5Sn2FOuDb/gyFWNQhQ0y6WQhpVjriOSOT8ydOfiAnCiXOp
 z7RhRhDxZTjonxzOwGn4hq9+ySnFI5NIa5XA0sOIlB5JmyWu4zwfuYRdy7XK1oF1Jk
 M9KULFWYRbYeNPR6bPd9nB+rdVWvX1r8Bfe2EJLBswo3TVjPdsx6aOq3RvBn5zxviI
 DTFsFg6BTMBaaBCm9LlpAYik4TjrNIA6HoiiSpCU26nFtrQR9/KhpAJ+8wVDeAkRpw
 yH+eChcSlm4Ow==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:23 +0800
Message-Id: <20240813141331.417067-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  onvert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/compress.c | 14 +++++++------- fs/f2fs/data.c | 4 ++--
 fs/f2fs/f2fs.h | 2 +- 3 files changed, 10 insertion [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdsHX-0001CE-Vd
Subject: [f2fs-dev] [PATCH 1/9] f2fs: convert f2fs_compress_ctx_add_page()
 to use folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

onvert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 14 +++++++-------
 fs/f2fs/data.c     |  4 ++--
 fs/f2fs/f2fs.h     |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 990b93689b46..eb5cd1457ffc 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -160,17 +160,17 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
 		cc->cluster_idx = NULL_CLUSTER;
 }
 
-void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
+void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio)
 {
 	unsigned int cluster_ofs;
 
-	if (!f2fs_cluster_can_merge_page(cc, page->index))
+	if (!f2fs_cluster_can_merge_page(cc, folio->index))
 		f2fs_bug_on(F2FS_I_SB(cc->inode), 1);
 
-	cluster_ofs = offset_in_cluster(cc, page->index);
-	cc->rpages[cluster_ofs] = page;
+	cluster_ofs = offset_in_cluster(cc, folio->index);
+	cc->rpages[cluster_ofs] = folio_page(folio, 0);
 	cc->nr_rpages++;
-	cc->cluster_idx = cluster_idx(cc, page->index);
+	cc->cluster_idx = cluster_idx(cc, folio->index);
 }
 
 #ifdef CONFIG_F2FS_FS_LZO
@@ -1093,7 +1093,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		if (PageUptodate(page))
 			f2fs_put_page(page, 1);
 		else
-			f2fs_compress_ctx_add_page(cc, page);
+			f2fs_compress_ctx_add_page(cc, page_folio(page));
 	}
 
 	if (!f2fs_cluster_is_empty(cc)) {
@@ -1123,7 +1123,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		}
 
 		f2fs_wait_on_page_writeback(page, DATA, true, true);
-		f2fs_compress_ctx_add_page(cc, page);
+		f2fs_compress_ctx_add_page(cc, page_folio(page));
 
 		if (!PageUptodate(page)) {
 release_and_retry:
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e9570f4e0f21..100b6526717f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2429,7 +2429,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		if (ret)
 			goto set_error_page;
 
-		f2fs_compress_ctx_add_page(&cc, &folio->page);
+		f2fs_compress_ctx_add_page(&cc, folio);
 
 		goto next_page;
 read_single_page:
@@ -3161,7 +3161,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 			if (f2fs_compressed_file(inode)) {
 				folio_get(folio);
-				f2fs_compress_ctx_add_page(&cc, &folio->page);
+				f2fs_compress_ctx_add_page(&cc, folio);
 				continue;
 			}
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 51fd5063a69c..df436dd3aac1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4322,7 +4322,7 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
 bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages, bool uptodate);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
-void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
+void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
 						int *submitted,
 						struct writeback_control *wbc,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
