Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49753A76E26
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVZ-0003lg-7R;
	Mon, 31 Mar 2025 20:13:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVS-0003ka-Tv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGH5JqgzgRELLUEiXVTHl7+0Jqxe2s7dyC1bDLnmmuY=; b=dVFybIBo5wYY6WAelZG29sAPDW
 BgzMKnk+TpoifWPlPZYSsHc8Dr8VzHZ+zeo3qchbO8cBDDRd/1qrs8CinLu9J1TIeP1OIP5JPiFrk
 z5E4vDQfLRfLe21VbTHfddpJPdssnf6c75ZCRYn5tKxd+lPLtKbdjw4XUOmLXUcfGn+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tGH5JqgzgRELLUEiXVTHl7+0Jqxe2s7dyC1bDLnmmuY=; b=mP5WAlpMwJ7RraP2hZuQZqgc7Y
 ykKFV64K/EkzBgcJk+TAaT8fPMbmT2kAJ4yOPzdzFWjRisQdc7w5yXDX0CC+4d80nLpvoqa8WnDp3
 S3UFtnrb5HJo+hcMUizpPUvcUEaQAUy2XtoqGsRAedVE4P2rwTwCrVG19c3nZGvD5tFk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVS-0003Ys-7o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tGH5JqgzgRELLUEiXVTHl7+0Jqxe2s7dyC1bDLnmmuY=; b=W4gjuPaKHhSjvM5i1cF/zwqJxN
 weGkJzlJU3Tigg8/il9MS0ql+nFSDzPVY8os9aIa5b4KvvUVokR7DkbzcZvwmZFKaosj9b4vYl1kt
 Y4+QJ1CoOZFlZ1AOYnQeTMFxchy1lUBYA/4pUwybUTNp4VHuIAARSnMAxtFL5IWWTblyHPEgZ+xer
 +parJMCUI7puxWLw4m5fxq9KvNLhPdtT74Zs6IstyXj/TJjZ/wXezQoo0qHwj6WA/yoi5Yx9jIwZa
 uJj9COHLpTzQw9JZzIIKCm+1dHXEGG2Y72RitYJYaTiN0XlfCK2rWJWtcFfGchypWU572uOVEvB8r
 xmq8Lk1g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVG-00000004RWQ-3kJy;
 Mon, 31 Mar 2025 20:13:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:32 +0100
Message-ID: <20250331201256.1057782-13-willy@infradead.org>
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
 Content preview: All callers now have a folio so pass it in. Saves three
 hidden
 calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/checkpoint.c | 13 ++++++------- 1 file changed, 6 insertions(+),
 7 deletions(-) 
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
X-Headers-End: 1tzLVS-0003Ys-7o
Subject: [f2fs-dev] [PATCH 012/153] f2fs: Convert __f2fs_write_meta_page()
 to __f2fs_write_meta_folio()
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

All callers now have a folio so pass it in.  Saves three hidden calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6e25975950fa..fdc310e9f261 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -340,12 +340,11 @@ void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
 		f2fs_ra_meta_pages(sbi, index, ra_blocks, META_POR, true);
 }
 
-static int __f2fs_write_meta_page(struct page *page,
+static int __f2fs_write_meta_folio(struct folio *folio,
 				struct writeback_control *wbc,
 				enum iostat_type io_type)
 {
-	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
-	struct folio *folio = page_folio(page);
+	struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 
 	trace_f2fs_writepage(folio, META);
 
@@ -367,7 +366,7 @@ static int __f2fs_write_meta_page(struct page *page,
 	dec_page_count(sbi, F2FS_DIRTY_META);
 
 	if (wbc->for_reclaim)
-		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, META);
+		f2fs_submit_merged_write_cond(sbi, NULL, &folio->page, 0, META);
 
 	folio_unlock(folio);
 
@@ -377,7 +376,7 @@ static int __f2fs_write_meta_page(struct page *page,
 	return 0;
 
 redirty_out:
-	redirty_page_for_writepage(wbc, page);
+	folio_redirty_for_writepage(wbc, folio);
 	return AOP_WRITEPAGE_ACTIVATE;
 }
 
@@ -463,7 +462,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__f2fs_write_meta_page(&folio->page, &wbc,
+			if (__f2fs_write_meta_folio(folio, &wbc,
 						io_type)) {
 				folio_unlock(folio);
 				break;
@@ -1421,7 +1420,7 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 		f2fs_bug_on(sbi, 1);
 
 	/* writeout cp pack 2 page */
-	err = __f2fs_write_meta_page(&folio->page, &wbc, FS_CP_META_IO);
+	err = __f2fs_write_meta_folio(folio, &wbc, FS_CP_META_IO);
 	if (unlikely(err && f2fs_cp_error(sbi))) {
 		f2fs_folio_put(folio, true);
 		return;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
