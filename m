Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C363A53F01E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyJXL-0004N4-VH; Mon, 06 Jun 2022 20:41:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyJXG-0004Mj-2A; Mon, 06 Jun 2022 20:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jShwzeL+5O6p6+KB8AXJd8QTjTM3rLlLO0YNnyhkzoU=; b=LCbOz3YVTJnbhhO6vQp5+Ur3dL
 shV0Otm8O0WZ8Ihn3xMis88JDZKspEOibE1cc8eD7ErR59zCGTPr/JKykN/gA7Qdg3fHIj1DfQJXR
 Zb6UrmEitAY0BYck1X3qOeIdwPbtZI/7ruKEHHdGwjdE7ixTSq3HxpfAEz+47xKFaoqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jShwzeL+5O6p6+KB8AXJd8QTjTM3rLlLO0YNnyhkzoU=; b=RoALCjqV1ZTqhISy1YAGFAwMeM
 hzajN5Iu1G4V8jTei7+aIs9NA4lkmRI+KIoVetBpSYebnwYKPnA3eE7P9YggSUGntUf9Gbqo/be+v
 6BGD5Fo6P3ilCxEBGAWduqm5hfd+Dnz2bOln+oly8b1pW98rwxl9YDLwOmAlzvcOqm10=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyJXB-0004EG-A0; Mon, 06 Jun 2022 20:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jShwzeL+5O6p6+KB8AXJd8QTjTM3rLlLO0YNnyhkzoU=; b=j8WB6rbesWftHu8QIJhuNjLLRv
 8UGF1DKSTdZLPDZ0Kov24duPgp8KMpi6m8VEsqm5e1sZdIO0hAb54JNjAbS00XQgXdsCx8+PvicwO
 rYdGhK7Gy6I6AX03/exLoIxL+gMZQDduaqInpnkGl13x/6LHcmOMXo+u8SO/crNY4L5fIgFOEe3TY
 clMZRMy11m0K44+Yi9a6EjLXZgw7NLEoTTdV/oEJbaeKVMorPM13Ba1mk7M/T/X6/bkJL+qWpRRnS
 1wANzqWwYhqp/CK739JNy4OmGeFkTAhy3sEt9IXLj+oIA+NjHnNm9hNBqc/doCVMUizMtdR2GOaOc
 gaaqEAJA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWy-00B19u-3f; Mon, 06 Jun 2022 20:40:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:49 +0100
Message-Id: <20220606204050.2625949-20-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With all users converted to migrate_folio(),
 remove this operation.
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 include/linux/fs.h
 | 2 -- mm/compaction.c | 5 ++--- mm/migrate.c | 10 +--------- 3 files changed, 
 3 insertions(+), 14 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nyJXB-0004EG-A0
Subject: [f2fs-dev] [PATCH 19/20] fs: Remove aops->migratepage()
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

With all users converted to migrate_folio(), remove this operation.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/fs.h |  2 --
 mm/compaction.c    |  5 ++---
 mm/migrate.c       | 10 +---------
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 5737c92ed286..95347cc035ae 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -367,8 +367,6 @@ struct address_space_operations {
 	 */
 	int (*migrate_folio)(struct address_space *, struct folio *dst,
 			struct folio *src, enum migrate_mode);
-	int (*migratepage) (struct address_space *,
-			struct page *, struct page *, enum migrate_mode);
 	bool (*isolate_page)(struct page *, isolate_mode_t);
 	void (*putback_page)(struct page *);
 	int (*launder_folio)(struct folio *);
diff --git a/mm/compaction.c b/mm/compaction.c
index db34b459e5d9..f0dc62159c0e 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1034,7 +1034,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 			/*
 			 * Only pages without mappings or that have a
-			 * ->migratepage callback are possible to migrate
+			 * ->migrate_folio callback are possible to migrate
 			 * without blocking. However, we can be racing with
 			 * truncation so it's necessary to lock the page
 			 * to stabilise the mapping as truncation holds
@@ -1046,8 +1046,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 			mapping = page_mapping(page);
 			migrate_dirty = !mapping ||
-					mapping->a_ops->migrate_folio ||
-					mapping->a_ops->migratepage;
+					mapping->a_ops->migrate_folio;
 			unlock_page(page);
 			if (!migrate_dirty)
 				goto isolate_fail_put;
diff --git a/mm/migrate.c b/mm/migrate.c
index a8edd226c72d..c5560430dce4 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -911,9 +911,6 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			 */
 			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
 								mode);
-		else if (mapping->a_ops->migratepage)
-			rc = mapping->a_ops->migratepage(mapping, &dst->page,
-							&src->page, mode);
 		else
 			rc = fallback_migrate_folio(mapping, dst, src, mode);
 	} else {
@@ -928,12 +925,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			goto out;
 		}
 
-		if (mapping->a_ops->migrate_folio)
-			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
-								mode);
-		else
-			rc = mapping->a_ops->migratepage(mapping, &dst->page,
-							&src->page, mode);
+		rc = mapping->a_ops->migrate_folio(mapping, dst, src, mode);
 		WARN_ON_ONCE(rc == MIGRATEPAGE_SUCCESS &&
 				!folio_test_isolated(src));
 	}
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
