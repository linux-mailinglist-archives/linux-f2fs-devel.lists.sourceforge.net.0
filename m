Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D265BA76E33
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVd-0000y4-Qt;
	Mon, 31 Mar 2025 20:13:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVb-0000vG-34
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eg3wK6ssPTDMrtf42rh1XebuZQxoWRUQrOL0HmkNSrQ=; b=PD3/79yJqSKr9xA7wWsPsyqfH0
 9QPkSqTGlL6l5pcAv/TNvjYMaQirybhmc4LvrklgUxk5WHnqvWLaWEsWtV8o6fMWHHsSa1cCJUlcf
 r8JhiPQdlF8dUgbaw6EzFNS8WLUXYmf+KJ+3K3CTB/aavxzsZHpvITGAuP52Ei0JDcLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eg3wK6ssPTDMrtf42rh1XebuZQxoWRUQrOL0HmkNSrQ=; b=MWxlkSz0bHNJMocnh+bhMfdbBi
 0afeHN9NF+m+AAShvmKi/Sgsr4tDHRlv+u+Dqe0qqQnwixudKDhpZGNFhzxqOqD/iGZASwDpEvtbw
 Ad5jP3GuNI/nLtabJUN+eB8g1A3LY30zmj3oLqa/DlOKk01TZHd9CJmNY8zriRUYkhOE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVW-0003Zz-4q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Eg3wK6ssPTDMrtf42rh1XebuZQxoWRUQrOL0HmkNSrQ=; b=joCeeNJPfhQty1N66LdA46gzJw
 YAfcnkKu8Aat1TK2fBpFsNblV+Vxu7LWHLnl9teNALQzYq9tt3BZYJrFCC+Wokq8C1rrWdi/teA6n
 oGHbBp+85eDOpTwECgP5Qn9O7NYKL2i1bUIV8CUb392eA9dJeZcBdOJh9cGVkElUHHgn0KhOF9yCA
 yLND32u8auQo8zFDRM08hHSDNb8cbR2PSx1GCRMycY5UyOvSVOuaaKFPnb6BOQIYbcfOjfFerRtw+
 HBmFCn07LqUjTkWT5M3UYGWc2txykV/zc/kNKac+OY8pCfF9UvXcwLxLvUx3hCk3MIfemjMP+qgya
 548RhcnA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVK-00000004Rdz-3KAG;
 Mon, 31 Mar 2025 20:13:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:00 +0100
Message-ID: <20250331201256.1057782-41-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Get a folio instead of a page and operate on folios
 throughout.
 Remove six calls to compound_head() and use folio_put_refs() to put both
 references we hold at the same time, reducing the number of ato [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVW-0003Zz-4q
Subject: [f2fs-dev] [PATCH 040/153] f2fs: Use folios in do_garbage_collect()
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

Get a folio instead of a page and operate on folios throughout.
Remove six calls to compound_head() and use folio_put_refs() to put
both references we hold at the same time, reducing the number of atomic
operations we do.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/gc.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index fa51b871290d..1f3c275099e5 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1719,8 +1719,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				struct gc_inode_list *gc_list, int gc_type,
 				bool force_migrate, bool one_time)
 {
-	struct page *sum_page;
-	struct f2fs_summary_block *sum;
 	struct blk_plug plug;
 	unsigned int segno = start_segno;
 	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
@@ -1770,40 +1768,40 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 	/* reference all summary page */
 	while (segno < end_segno) {
-		sum_page = f2fs_get_sum_page(sbi, segno++);
-		if (IS_ERR(sum_page)) {
-			int err = PTR_ERR(sum_page);
+		struct folio *sum_folio = f2fs_get_sum_folio(sbi, segno++);
+		if (IS_ERR(sum_folio)) {
+			int err = PTR_ERR(sum_folio);
 
 			end_segno = segno - 1;
 			for (segno = start_segno; segno < end_segno; segno++) {
-				sum_page = find_get_page(META_MAPPING(sbi),
+				sum_folio = filemap_get_folio(META_MAPPING(sbi),
 						GET_SUM_BLOCK(sbi, segno));
-				f2fs_put_page(sum_page, 0);
-				f2fs_put_page(sum_page, 0);
+				folio_put_refs(sum_folio, 2);
 			}
 			return err;
 		}
-		unlock_page(sum_page);
+		folio_unlock(sum_folio);
 	}
 
 	blk_start_plug(&plug);
 
 	for (segno = start_segno; segno < end_segno; segno++) {
+		struct f2fs_summary_block *sum;
 
 		/* find segment summary of victim */
-		sum_page = find_get_page(META_MAPPING(sbi),
+		struct folio *sum_folio = filemap_get_folio(META_MAPPING(sbi),
 					GET_SUM_BLOCK(sbi, segno));
-		f2fs_put_page(sum_page, 0);
 
 		if (get_valid_blocks(sbi, segno, false) == 0)
 			goto freed;
 		if (gc_type == BG_GC && __is_large_section(sbi) &&
 				migrated >= sbi->migration_granularity)
 			goto skip;
-		if (!PageUptodate(sum_page) || unlikely(f2fs_cp_error(sbi)))
+		if (!folio_test_uptodate(sum_folio) ||
+		    unlikely(f2fs_cp_error(sbi)))
 			goto skip;
 
-		sum = page_address(sum_page);
+		sum = folio_address(sum_folio);
 		if (type != GET_SUM_TYPE((&sum->footer))) {
 			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
 				 segno, type, GET_SUM_TYPE((&sum->footer)));
@@ -1841,7 +1839,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				(segno + 1 < sec_end_segno) ?
 					segno + 1 : NULL_SEGNO;
 skip:
-		f2fs_put_page(sum_page, 0);
+		folio_put_refs(sum_folio, 2);
 	}
 
 	if (submitted)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
