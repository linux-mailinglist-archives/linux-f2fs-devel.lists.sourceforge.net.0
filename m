Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A053F01F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyJXG-0004q5-9C; Mon, 06 Jun 2022 20:41:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyJXE-0004pk-3n; Mon, 06 Jun 2022 20:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zqEa9EzjfvcCB/R36xszZ4AMZtdcV59XiMVDc9jTyM=; b=eKPwSYlrUng+QAdrzG1oxL/6FJ
 xuD03HOSinX4B8dQ9TZvmnOcdkFeHYqJ74pZHoG7ieIiYKWBWHdBLYmt+lSvPFst1SxCzrn3yPsGy
 VDq9x5x2bGmlP2bhXophrceWrsDS8p0kFYi8nJbrQTdzfKkE8Mb7MWKbldpnh14i8mCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zqEa9EzjfvcCB/R36xszZ4AMZtdcV59XiMVDc9jTyM=; b=X8slfKcXnRLjIIaYBGBvAJ5SYv
 q22YZbrA574C5FMEbtDyBrThyeFI6UTb4SXIrbEvKIZRFFTADFBtN67g94f/7XT30JiILWrlLToK5
 FXbquroKWqbcQ6WDvsudOdSuwANvEpJA+2c6NuBYIq2G0QYqgXzUUFZdmZpibzvd4x+c=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyJXB-0004EP-8u; Mon, 06 Jun 2022 20:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2zqEa9EzjfvcCB/R36xszZ4AMZtdcV59XiMVDc9jTyM=; b=U+BqaoSQWdsShi/y8CPTtTig63
 HCMa7+gIZx7Yyb6cusLNuXKWsG06WN8xz/erKBPWuYizRThCX0iiljqhNcZd2weflUVCtiqE770D/
 Vb15aA5PxUQlAGcLo3M0XEH41Q/fMFbQWUysBrY6PEG35YJKOueNndbkU/J8qu3X5pGzhsOP7ol4W
 F3RaDu2I/zP67juMsLCzxygZBIwXjKCl86d9jfX6rvdn+U142VP0hON97WCqvsixaBkAVbsODa0Rm
 STrW9jc4kjH9X53B35Fdz629pIYD4+nkkWKOdWUlig7kbghCKRcjBc7pf8npYNE/LtOnrV8sVT0Vs
 SEGqa5Hg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19i-Jy; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:43 +0100
Message-Id: <20220606204050.2625949-14-willy@infradead.org>
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
 Content preview: Use a folio throughout this function. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/aio.c | 36 ++++++++++++++++++
 1 file changed, 18 insertions(+), 18 deletions(-) 
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
X-Headers-End: 1nyJXB-0004EP-8u
Subject: [f2fs-dev] [PATCH 13/20] aio: Convert to migrate_folio
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

Use a folio throughout this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/aio.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index 3c249b938632..a1911e86859c 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -400,8 +400,8 @@ static const struct file_operations aio_ring_fops = {
 };
 
 #if IS_ENABLED(CONFIG_MIGRATION)
-static int aio_migratepage(struct address_space *mapping, struct page *new,
-			struct page *old, enum migrate_mode mode)
+static int aio_migrate_folio(struct address_space *mapping, struct folio *dst,
+			struct folio *src, enum migrate_mode mode)
 {
 	struct kioctx *ctx;
 	unsigned long flags;
@@ -435,10 +435,10 @@ static int aio_migratepage(struct address_space *mapping, struct page *new,
 		goto out;
 	}
 
-	idx = old->index;
+	idx = src->index;
 	if (idx < (pgoff_t)ctx->nr_pages) {
-		/* Make sure the old page hasn't already been changed */
-		if (ctx->ring_pages[idx] != old)
+		/* Make sure the old folio hasn't already been changed */
+		if (ctx->ring_pages[idx] != &src->page)
 			rc = -EAGAIN;
 	} else
 		rc = -EINVAL;
@@ -447,27 +447,27 @@ static int aio_migratepage(struct address_space *mapping, struct page *new,
 		goto out_unlock;
 
 	/* Writeback must be complete */
-	BUG_ON(PageWriteback(old));
-	get_page(new);
+	BUG_ON(folio_test_writeback(src));
+	folio_get(dst);
 
-	rc = migrate_page_move_mapping(mapping, new, old, 1);
+	rc = folio_migrate_mapping(mapping, dst, src, 1);
 	if (rc != MIGRATEPAGE_SUCCESS) {
-		put_page(new);
+		folio_put(dst);
 		goto out_unlock;
 	}
 
 	/* Take completion_lock to prevent other writes to the ring buffer
-	 * while the old page is copied to the new.  This prevents new
+	 * while the old folio is copied to the new.  This prevents new
 	 * events from being lost.
 	 */
 	spin_lock_irqsave(&ctx->completion_lock, flags);
-	migrate_page_copy(new, old);
-	BUG_ON(ctx->ring_pages[idx] != old);
-	ctx->ring_pages[idx] = new;
+	folio_migrate_copy(dst, src);
+	BUG_ON(ctx->ring_pages[idx] != &src->page);
+	ctx->ring_pages[idx] = &dst->page;
 	spin_unlock_irqrestore(&ctx->completion_lock, flags);
 
-	/* The old page is no longer accessible. */
-	put_page(old);
+	/* The old folio is no longer accessible. */
+	folio_put(src);
 
 out_unlock:
 	mutex_unlock(&ctx->ring_lock);
@@ -475,13 +475,13 @@ static int aio_migratepage(struct address_space *mapping, struct page *new,
 	spin_unlock(&mapping->private_lock);
 	return rc;
 }
+#else
+#define aio_migrate_folio NULL
 #endif
 
 static const struct address_space_operations aio_ctx_aops = {
 	.dirty_folio	= noop_dirty_folio,
-#if IS_ENABLED(CONFIG_MIGRATION)
-	.migratepage	= aio_migratepage,
-#endif
+	.migrate_folio	= aio_migrate_folio,
 };
 
 static int aio_setup_ring(struct kioctx *ctx, unsigned int nr_events)
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
