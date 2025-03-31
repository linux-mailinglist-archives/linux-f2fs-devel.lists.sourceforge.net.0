Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5711FA76E2F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVc-0000wE-As;
	Mon, 31 Mar 2025 20:13:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVY-0000u7-C6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PXGt9C/EfkopOrlCRmOuHBQ2hJLaZEI8mifqS/VerXU=; b=X3OGOb0ky2k7gFN5sZYAlO3eLx
 emGPh7kMY9l8hp0JeIPKB5ilPJRNpaouMfsRmjgEMrvAIZfSnXAgZaehDaICKCHu3wOxbnc+eF4Nu
 29Iphb0GWhatuoGBqHz3FDIHSVSDGmk42SIUBupBKOdiJCSPt9bTYZa84Q0WdOHyNHbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PXGt9C/EfkopOrlCRmOuHBQ2hJLaZEI8mifqS/VerXU=; b=GBi5K6ZguLI9X/376c6thbumgI
 uOlWTdPDkKXD1jycQzfjeft03yvI24fx2TgjwNxUBHCtZlZzuC27Gpoff46TJw7jVesGwX/nDGpEw
 0wRuSvlo/hgO+Iin38M7srOzZrT1rHG199/9/MTekHfoQmbGvS9jA5SQKBWVEigGQbx4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVY-0003ag-6Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=PXGt9C/EfkopOrlCRmOuHBQ2hJLaZEI8mifqS/VerXU=; b=Q9EhGZRKEjqsjR3KdBA4/jMXi2
 rFCGlmGt/F2g5brqj5iqJrq0ZE7sa37CFMBeR2UKaCKpZPhd/M6MaxZ6q7WSqtepWdgGOy6XuyXkH
 mBmHSquQXQtyW3oLoZh647QCjIMTAdSC+WDtHQJzx2Fk1fUluNJEWHX720AmqLyoWFFcUy+iSKskS
 Q63izhIAEXYF7v9ZpMpLZGwNBdOye6NOwdFDpeCWUsi+nwZvdTCbk4d0JeMZu7xRWzpVlQTk3Vf5e
 MiankG0cExE+XQXpwvpni6NqCaLzC7Jol9BG0XbryCxGQeMnT7VPNBTnqP6wxJHzmNE2m/4nJQPvC
 6YtQ3jZQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVR-00000004RyW-1fQG;
 Mon, 31 Mar 2025 20:13:13 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:40 +0100
Message-ID: <20250331201256.1057782-81-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Pass the folio in from the one caller and use it throughout.
 Removes eight hidden calls to compound_head(). Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/gc.c | 2
 +- fs/f2fs/node.c | 20 ++++++++++ 3 files changed, 12 insertions(+),
 12 deletions(-)
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
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVY-0003ag-6Y
Subject: [f2fs-dev] [PATCH 080/153] f2fs: Convert f2fs_move_node_page() to
 f2fs_move_node_folio()
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

Pass the folio in from the one caller and use it throughout.
Removes eight hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h |  2 +-
 fs/f2fs/gc.c   |  2 +-
 fs/f2fs/node.c | 20 ++++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0d32541993a0..92b5878dc5d3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3735,7 +3735,7 @@ struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
 struct page *f2fs_get_xnode_page(struct f2fs_sb_info *sbi, pgoff_t xnid);
-int f2fs_move_node_page(struct page *node_page, int gc_type);
+int f2fs_move_node_folio(struct folio *node_folio, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
 int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			struct writeback_control *wbc, bool atomic,
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 56c0ca609fc1..5c58e6a306f4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1088,7 +1088,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 			continue;
 		}
 
-		err = f2fs_move_node_page(&node_folio->page, gc_type);
+		err = f2fs_move_node_folio(node_folio, gc_type);
 		if (!err && gc_type == FG_GC)
 			submitted++;
 		stat_inc_node_blk_count(sbi, 1, gc_type);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 5df3065c18ea..20d62994cf46 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1789,7 +1789,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	return AOP_WRITEPAGE_ACTIVATE;
 }
 
-int f2fs_move_node_page(struct page *node_page, int gc_type)
+int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
 {
 	int err = 0;
 
@@ -1800,30 +1800,30 @@ int f2fs_move_node_page(struct page *node_page, int gc_type)
 			.for_reclaim = 0,
 		};
 
-		f2fs_wait_on_page_writeback(node_page, NODE, true, true);
+		f2fs_folio_wait_writeback(node_folio, NODE, true, true);
 
-		set_page_dirty(node_page);
+		folio_mark_dirty(node_folio);
 
-		if (!clear_page_dirty_for_io(node_page)) {
+		if (!folio_clear_dirty_for_io(node_folio)) {
 			err = -EAGAIN;
 			goto out_page;
 		}
 
-		if (__write_node_page(node_page, false, NULL,
+		if (__write_node_page(&node_folio->page, false, NULL,
 					&wbc, false, FS_GC_NODE_IO, NULL)) {
 			err = -EAGAIN;
-			unlock_page(node_page);
+			folio_unlock(node_folio);
 		}
 		goto release_page;
 	} else {
 		/* set page dirty and write it */
-		if (!folio_test_writeback(page_folio(node_page)))
-			set_page_dirty(node_page);
+		if (!folio_test_writeback(node_folio))
+			folio_mark_dirty(node_folio);
 	}
 out_page:
-	unlock_page(node_page);
+	folio_unlock(node_folio);
 release_page:
-	f2fs_put_page(node_page, 0);
+	f2fs_folio_put(node_folio, false);
 	return err;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
