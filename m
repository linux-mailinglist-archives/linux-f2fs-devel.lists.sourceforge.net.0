Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E960053F047
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyJXf-000098-Jl; Mon, 06 Jun 2022 20:41:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyJXd-00008N-HZ; Mon, 06 Jun 2022 20:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pP2rySBonQba80aJJurpf3Ufu7YzAk6PE/UfFF5JjqU=; b=EOgVgGqF8/HCOrLk6UC+pL1hib
 ZFFT7nSm/XUcAvDpSVVftd9AHRBCOWpgScudC2OsIYHeQgq6AhpPs/JcVz6BrPSbb/E82MAjieBlu
 XTtBSL+8B3x+H+pDS7BOBOWX6BJ1l+0IJDqMJhEIxOChTKcTCoOan5c+GndB7McHxFi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pP2rySBonQba80aJJurpf3Ufu7YzAk6PE/UfFF5JjqU=; b=gJK7NFLaSobBRHHfFP7Fv3UkuN
 MFeOMkfhgjOLPGBXis6/zt/x19sPy7e1YDpJNuzJ2q6TgYxCYo+KnSL/Z8PnvRusASDuO6D0z0PA4
 jwCLhZ5YD7j4BbBSKwIZBqHyhgZsTEMyBHHOi9HayDtQ4lpazw2GEZA/i0FNgs10MjZI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyJXc-007Q3N-GH; Mon, 06 Jun 2022 20:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=pP2rySBonQba80aJJurpf3Ufu7YzAk6PE/UfFF5JjqU=; b=CVvFIaE3DO4F579aJn2Gv8sjJ1
 3s4aun59FYY8/cIm392ktBNn3Yfrt/zZI2FAKlmO4E3xMwJb3V8p0zjyiYNlXYHugx4ESqJjlHfb1
 QG1qZiDzGvDgU/60lg9IfnGfI2mfaTj+stxEAcrFL6CEOIqb5GzPU9vw1qrk6uFLJAOZ3IkEmbCQE
 LzelMikinFLOzolvWeyxZFad1TDhzqH1x/JkOTw+Xol4LnPrnKqEGccXqc7eFHbh9ziaHCXeJ+DmM
 rrw8vPHosmQOe6zaJs4TsqpU+ayfdzgl+HFiB3jtxCoXtL62mYflqoIljhWxTii99IWQIy6G281e+
 VVfyP2fw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19W-2b; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:37 +0100
Message-Id: <20220606204050.2625949-8-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use a folio throughout this function. migrate_page() will
 be converted later. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/nfs/file.c | 4 +--- fs/nfs/internal.h | 6 ++++-- fs/nfs/write.c |
 16 ++++++++-------- 3 files changed, 13 insertions(+), 13 deletion [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyJXc-007Q3N-GH
Subject: [f2fs-dev] [PATCH 07/20] nfs: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use a folio throughout this function.  migrate_page() will be converted
later.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/nfs/file.c     |  4 +---
 fs/nfs/internal.h |  6 ++++--
 fs/nfs/write.c    | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 2d72b1b7ed74..549baed76351 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -533,9 +533,7 @@ const struct address_space_operations nfs_file_aops = {
 	.write_end = nfs_write_end,
 	.invalidate_folio = nfs_invalidate_folio,
 	.release_folio = nfs_release_folio,
-#ifdef CONFIG_MIGRATION
-	.migratepage = nfs_migrate_page,
-#endif
+	.migrate_folio = nfs_migrate_folio,
 	.launder_folio = nfs_launder_folio,
 	.is_dirty_writeback = nfs_check_dirty_writeback,
 	.error_remove_page = generic_error_remove_page,
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 8f8cd6e2d4db..437ebe544aaf 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -578,8 +578,10 @@ void nfs_clear_pnfs_ds_commit_verifiers(struct pnfs_ds_commit_info *cinfo)
 #endif
 
 #ifdef CONFIG_MIGRATION
-extern int nfs_migrate_page(struct address_space *,
-		struct page *, struct page *, enum migrate_mode);
+int nfs_migrate_folio(struct address_space *, struct folio *dst,
+		struct folio *src, enum migrate_mode);
+#else
+#define nfs_migrate_folio NULL
 #endif
 
 static inline int
diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index 1c706465d090..649b9e633459 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -2119,27 +2119,27 @@ int nfs_wb_page(struct inode *inode, struct page *page)
 }
 
 #ifdef CONFIG_MIGRATION
-int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
-		struct page *page, enum migrate_mode mode)
+int nfs_migrate_folio(struct address_space *mapping, struct folio *dst,
+		struct folio *src, enum migrate_mode mode)
 {
 	/*
-	 * If PagePrivate is set, then the page is currently associated with
+	 * If the private flag is set, the folio is currently associated with
 	 * an in-progress read or write request. Don't try to migrate it.
 	 *
 	 * FIXME: we could do this in principle, but we'll need a way to ensure
 	 *        that we can safely release the inode reference while holding
-	 *        the page lock.
+	 *        the folio lock.
 	 */
-	if (PagePrivate(page))
+	if (folio_test_private(src))
 		return -EBUSY;
 
-	if (PageFsCache(page)) {
+	if (folio_test_fscache(src)) {
 		if (mode == MIGRATE_ASYNC)
 			return -EBUSY;
-		wait_on_page_fscache(page);
+		folio_wait_fscache(src);
 	}
 
-	return migrate_page(mapping, newpage, page, mode);
+	return migrate_page(mapping, &dst->page, &src->page, mode);
 }
 #endif
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
