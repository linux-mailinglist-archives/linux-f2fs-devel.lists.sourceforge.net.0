Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DACA76EBD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWW-0006Ct-4k;
	Mon, 31 Mar 2025 20:14:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVq-0005kJ-H4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nd6mqO3iaopFfPH6hFd1zkfklBKpf/Gv/cHROgQZ0Y0=; b=FVbQgUSGAh+4HpUeh3YwpslHBx
 ShaYE3mAIm6jA2YE4AlTKCgbPcbWQE6C0S0TZlsHHcIGRi1b87biS6erwrcuh4waOsM3YkSo0Z6Ch
 UPmvZZl8AGJoFPwrv4OUea3JA/pReDwyt/ER3j5I6/LZC4EfNrNe1x5if0ooARkXQb4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nd6mqO3iaopFfPH6hFd1zkfklBKpf/Gv/cHROgQZ0Y0=; b=IC5sVxQAynQleubAhLe5WgT2im
 pLbOrCbsRzxsBWFPes80tlhwrqDeVYolAchDRGL18M2kP0Cs0Jh2XIzFiZUR9XvuiyIzf91YWBuVU
 y5SGV+WjrAwWrEc9agQ/FsZvM7WsFJFLHN01EnEuCQXhrGxDw7Ihr+UydGOMNSyqlAog=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVo-0003hy-MU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Nd6mqO3iaopFfPH6hFd1zkfklBKpf/Gv/cHROgQZ0Y0=; b=AZtIMVcTxrR3/GUVhV29GtaPyB
 6H4F62EAvul+znZSLSDUDGhIBlW1Wpx2C+/nbHyg112/Aa0pPfzwaXm2LoLZFik2LwBSfFlTxu2O/
 urARPSK/rAewRrkqVped+ykL2Ep2d1mH4DEDOT5s0CEpmhOQFreVDRSB9ghOVs2vcG/dTGbKZUA0L
 ue7znIRRjKJwPZXVpJoJjVKCMoZvOiL14GmLT7x3kVLYOahaFk7XN3Rm+D2OHihCpme3NjR5HQTFA
 ha+Vdh1rkgxGZKkBYpuRcrqbtL41ViD9YZz+e6k9XkKVH+PoHplHOGGf7jPMDwmXqUyu5gWLZ85mh
 YaqSBtLA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVd-00000004Sc8-1Prp;
 Mon, 31 Mar 2025 20:13:25 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:42 +0100
Message-ID: <20250331201256.1057782-143-willy@infradead.org>
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
 Content preview: Support large folios & simplify the loops in
 redirty_blocks().
 Use the folio APIs and remove four calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/file.c | 38
 ++++++++++++++++++++
 1 file changed, 20 insertions(+), 18 deletions(-) 
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
X-Headers-End: 1tzLVo-0003hy-MU
Subject: [f2fs-dev] [PATCH 142/153] f2fs: Use a folio in redirty_blocks()
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

Support large folios & simplify the loops in redirty_blocks().
Use the folio APIs and remove four calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/file.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 382ab04a75c3..004dc7903c1c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4344,34 +4344,36 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 {
 	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
 	struct address_space *mapping = inode->i_mapping;
-	struct page *page;
+	struct folio *folio;
 	pgoff_t redirty_idx = page_idx;
-	int i, page_len = 0, ret = 0;
+	int page_len = 0, ret = 0;
 
 	page_cache_ra_unbounded(&ractl, len, 0);
 
-	for (i = 0; i < len; i++, page_idx++) {
-		page = read_cache_page(mapping, page_idx, NULL, NULL);
-		if (IS_ERR(page)) {
-			ret = PTR_ERR(page);
+	do {
+		folio = read_cache_folio(mapping, page_idx, NULL, NULL);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
 			break;
 		}
-		page_len++;
-	}
+		page_len += folio_nr_pages(folio) - (page_idx - folio->index);
+		page_idx = folio_next_index(folio);
+	} while (page_len < len);
 
-	for (i = 0; i < page_len; i++, redirty_idx++) {
-		page = find_lock_page(mapping, redirty_idx);
+	do {
+		folio = filemap_lock_folio(mapping, redirty_idx);
 
-		/* It will never fail, when page has pinned above */
-		f2fs_bug_on(F2FS_I_SB(inode), !page);
+		/* It will never fail, when folio has pinned above */
+		f2fs_bug_on(F2FS_I_SB(inode), IS_ERR(folio));
 
-		f2fs_wait_on_page_writeback(page, DATA, true, true);
+		f2fs_folio_wait_writeback(folio, DATA, true, true);
 
-		set_page_dirty(page);
-		set_page_private_gcing(page);
-		f2fs_put_page(page, 1);
-		f2fs_put_page(page, 0);
-	}
+		folio_mark_dirty(folio);
+		set_page_private_gcing(&folio->page);
+		redirty_idx = folio_next_index(folio);
+		folio_unlock(folio);
+		folio_put_refs(folio, 2);
+	} while (redirty_idx < page_idx);
 
 	return ret;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
