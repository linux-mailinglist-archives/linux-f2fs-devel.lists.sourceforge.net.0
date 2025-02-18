Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF5A39327
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWy-0006az-RD;
	Tue, 18 Feb 2025 05:52:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWo-0006ZT-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YLhaJqMFtJssujjlGsqYJzBlDzSSPVjntuvommLyzm4=; b=i3CBcXqgJbwjroAPntjj3//Tm/
 wn1/e80+2tELUtPXvcr5u6dz/ivpAGOcYAO3gKZWhp0so6V/ql6jPqBmbA2iUNRPhpPN1FvkaG0jA
 zJvKPd3BBuapaZIFM0twNAG71pPru4XldrDC0tiynyJoL/tiIIIfUFV5Pr0eQGW3QxpU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YLhaJqMFtJssujjlGsqYJzBlDzSSPVjntuvommLyzm4=; b=Jy9nGd3LcBYruVtyIh6GNElWQs
 tTx8FGClrHwUoMWjvMONsSc2cGhEBbchMoeiel/Io0pBg3d5K7xCWJULwF1p5v+uTFtZiMQzJMfea
 uHYQGPj84MRnHDmDlz8UfBye4RrPkCrRGsjhhYl0fKGODhvjWClrkol/nGx5mISLljpo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWn-0007c7-LQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YLhaJqMFtJssujjlGsqYJzBlDzSSPVjntuvommLyzm4=; b=Ro41HNEt4KXKyLQfksiukOOls+
 Y7p6AepqIaMsBeQ4/cbftPxr8QURdlytyph0GxW/JRpNBmQbVTFSV479ldDi3HhwIWHn7n1FywvO5
 Qb14o3Qr9Py6kHNlTxkFFkBRzdnoHBAQk01bOdTRVfL82zwrZ6Ysov0QD5OBfApSoY4SOMpOg7Vkv
 X7aUPqkYE5BIKoPk7AJ0w300O0wDhTQD1GcTbOAOUA/luEUDW6S8RHckBzpEvJuoZqEcFgsENwmOK
 fI7E6AD+V2F0IeBhgFhJHuYRVleS9Y58QjAeZUPfpB8igSTVbTeHjn+G96At86F/NFF44xp+lVkn+
 dkkcb4Ew==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWc-00000002Trk-1SGJ; Tue, 18 Feb 2025 05:52:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:42 +0000
Message-ID: <20250218055203.591403-9-willy@infradead.org>
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
 Content preview:  Use the folio APIs where they exist. Saves several hidden
 calls to compound_head(). Also removes a reference to page->mapping.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 32
 ++++++++++++++++
 1 file changed, 16 insertions(+), 16 deletions(-) 
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
X-Headers-End: 1tkGWn-0007c7-LQ
Subject: [f2fs-dev] [PATCH 08/27] f2fs: Convert last_fsync_dnode() to use a
 folio
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

Use the folio APIs where they exist.  Saves several hidden calls to
compound_head().  Also removes a reference to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 415bda9acd0e..66260fae3cc8 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1565,7 +1565,7 @@ static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	pgoff_t index;
 	struct folio_batch fbatch;
-	struct page *last_page = NULL;
+	struct folio *last_folio = NULL;
 	int nr_folios;
 
 	folio_batch_init(&fbatch);
@@ -1577,45 +1577,45 @@ static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 		int i;
 
 		for (i = 0; i < nr_folios; i++) {
-			struct page *page = &fbatch.folios[i]->page;
+			struct folio *folio = fbatch.folios[i];
 
 			if (unlikely(f2fs_cp_error(sbi))) {
-				f2fs_put_page(last_page, 0);
+				f2fs_folio_put(last_folio, false);
 				folio_batch_release(&fbatch);
 				return ERR_PTR(-EIO);
 			}
 
-			if (!IS_DNODE(page) || !is_cold_node(page))
+			if (!IS_DNODE(&folio->page) || !is_cold_node(&folio->page))
 				continue;
-			if (ino_of_node(page) != ino)
+			if (ino_of_node(&folio->page) != ino)
 				continue;
 
-			lock_page(page);
+			folio_lock(folio);
 
-			if (unlikely(page->mapping != NODE_MAPPING(sbi))) {
+			if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
 continue_unlock:
-				unlock_page(page);
+				folio_unlock(folio);
 				continue;
 			}
-			if (ino_of_node(page) != ino)
+			if (ino_of_node(&folio->page) != ino)
 				goto continue_unlock;
 
-			if (!PageDirty(page)) {
+			if (!folio_test_dirty(folio)) {
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
 
-			if (last_page)
-				f2fs_put_page(last_page, 0);
+			if (last_folio)
+				f2fs_folio_put(last_folio, false);
 
-			get_page(page);
-			last_page = page;
-			unlock_page(page);
+			folio_get(folio);
+			last_folio = folio;
+			folio_unlock(folio);
 		}
 		folio_batch_release(&fbatch);
 		cond_resched();
 	}
-	return last_page;
+	return &last_folio->page;
 }
 
 static int __write_node_page(struct page *page, bool atomic, bool *submitted,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
