Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF7A76E20
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVZ-0003lt-Ii;
	Mon, 31 Mar 2025 20:13:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVU-0003kj-9J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmaktZtuhGTGtJ6DY21W4O1XBRHAzUus7Z4Fsu48/ac=; b=bDh9EUztM/M9Av4/hWrj/vhrO9
 4W+g+FqmjyIis69ULBLkvfm2fwoluB1FZLZ3xxT04qs4KrITL7EbD6bQL+xMzua1NQptdf2KbRlri
 /9145j87EFND6i5hGxKa2icxCGPpPOtW6dcRPjBpVQ+KkLMmz8KuCSs5uPApGdqldOqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lmaktZtuhGTGtJ6DY21W4O1XBRHAzUus7Z4Fsu48/ac=; b=mli8BnI7ZCrTOqO1Lr4dzv/6O5
 jprN7kFxgcXFPWKK6ypTQjXsK1tT4caiqGSfOpIjpssQijpg0Ugwe8Gk1dlSbcy/BDEFWShIt9g0R
 0xkjAro5gdWSteUYZBMUpDUpqxXotb0+aE1tVLdrO2uNetr3UfUSvkimIr//BulQF12E=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVT-0003ZL-GF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lmaktZtuhGTGtJ6DY21W4O1XBRHAzUus7Z4Fsu48/ac=; b=tgg6FSJVygeHbN/z2HNlATPznv
 UYEzDo/Q+ubH+iXpnV8J2X8JM/zimkggUFtapJ7G+gpqmWDcyE0eZnEosWjnUfJ/wt9x/WMOHvSx7
 p1Tx4BjxH9Wz6ERv06RpqV5xoBr6FYQ83m+CuiGHkkSWtr9nIuTilhA676HgzW7Y5rQ8Q+jVZ6Ije
 SpYARLRZnCkB1KVtHo9fNAbdDUN7ZHPCdfHxer4BXd42YrmI+UVmt6C7EAvXZUGAo3mircqxcnUi3
 pVMZ7aD9DrAYbRwQfUKN0eko668r/LTf6nBMppdED14CXXIfpzW/uWslUZg02fkxAm0fgOk/Pb8Jc
 4i/0ES3Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVI-00000004RYv-0pBB;
 Mon, 31 Mar 2025 20:13:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:42 +0100
Message-ID: <20250331201256.1057782-23-willy@infradead.org>
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
 Content preview: Grab a folio instead of a page. Also convert
 seg_info_to_sit_page()
 to seg_info_to_sit_folio() and use a folio in f2fs_flush_sit_entries(). Saves
 a couple of calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/segment.c | 20 ++++++++++ fs/f2fs/segment.h
 | 6 +++--- 2 files changed, 13 insertions(+), 13 deletions(-) 
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
X-Headers-End: 1tzLVT-0003ZL-GF
Subject: [f2fs-dev] [PATCH 022/153] f2fs: Convert get_next_sit_page() to
 get_next_sit_folio()
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

Grab a folio instead of a page.  Also convert seg_info_to_sit_page() to
seg_info_to_sit_folio() and use a folio in f2fs_flush_sit_entries().
Saves a couple of calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 20 ++++++++++----------
 fs/f2fs/segment.h |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8476419db9e4..272490a50a04 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4497,23 +4497,23 @@ static struct page *get_current_sit_page(struct f2fs_sb_info *sbi,
 	return f2fs_get_meta_page(sbi, current_sit_addr(sbi, segno));
 }
 
-static struct page *get_next_sit_page(struct f2fs_sb_info *sbi,
+static struct folio *get_next_sit_folio(struct f2fs_sb_info *sbi,
 					unsigned int start)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	struct page *page;
+	struct folio *folio;
 	pgoff_t src_off, dst_off;
 
 	src_off = current_sit_addr(sbi, start);
 	dst_off = next_sit_addr(sbi, src_off);
 
-	page = f2fs_grab_meta_page(sbi, dst_off);
-	seg_info_to_sit_page(sbi, page, start);
+	folio = f2fs_grab_meta_folio(sbi, dst_off);
+	seg_info_to_sit_folio(sbi, folio, start);
 
-	set_page_dirty(page);
+	folio_mark_dirty(folio);
 	set_to_next_sit(sit_i, start);
 
-	return page;
+	return folio;
 }
 
 static struct sit_entry_set *grab_sit_entry_set(void)
@@ -4643,7 +4643,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * #2, flush sit entries to sit page.
 	 */
 	list_for_each_entry_safe(ses, tmp, head, set_list) {
-		struct page *page = NULL;
+		struct folio *folio = NULL;
 		struct f2fs_sit_block *raw_sit = NULL;
 		unsigned int start_segno = ses->start_segno;
 		unsigned int end = min(start_segno + SIT_ENTRY_PER_BLOCK,
@@ -4657,8 +4657,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		if (to_journal) {
 			down_write(&curseg->journal_rwsem);
 		} else {
-			page = get_next_sit_page(sbi, start_segno);
-			raw_sit = page_address(page);
+			folio = get_next_sit_folio(sbi, start_segno);
+			raw_sit = folio_address(folio);
 		}
 
 		/* flush dirty sit entries in region of current sit set */
@@ -4704,7 +4704,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		if (to_journal)
 			up_write(&curseg->journal_rwsem);
 		else
-			f2fs_put_page(page, 1);
+			f2fs_folio_put(folio, true);
 
 		f2fs_bug_on(sbi, ses->entry_cnt);
 		release_sit_entry_set(ses);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..913f002668b4 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -385,8 +385,8 @@ static inline void __seg_info_to_raw_sit(struct seg_entry *se,
 	rs->mtime = cpu_to_le64(se->mtime);
 }
 
-static inline void seg_info_to_sit_page(struct f2fs_sb_info *sbi,
-				struct page *page, unsigned int start)
+static inline void seg_info_to_sit_folio(struct f2fs_sb_info *sbi,
+				struct folio *folio, unsigned int start)
 {
 	struct f2fs_sit_block *raw_sit;
 	struct seg_entry *se;
@@ -395,7 +395,7 @@ static inline void seg_info_to_sit_page(struct f2fs_sb_info *sbi,
 					(unsigned long)MAIN_SEGS(sbi));
 	int i;
 
-	raw_sit = (struct f2fs_sit_block *)page_address(page);
+	raw_sit = folio_address(folio);
 	memset(raw_sit, 0, PAGE_SIZE);
 	for (i = 0; i < end - start; i++) {
 		rs = &raw_sit->entries[i];
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
