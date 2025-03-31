Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E39A76E30
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVd-0003oY-JB;
	Mon, 31 Mar 2025 20:13:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVY-0003lO-IJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BL6d39KEqNaR7GFjA8lEAcB82f2XL3/fRWQ445547NA=; b=Si8Er4QuZSEc1PahSocbTZjJxc
 V4Vi6p19W8FfFLaVuyCl/eFxVbxuXSeA786EBV/A9RM/oKArAbkjtKE3fbCNZgu0zzRjaTfU8vx2a
 l7JcbZadRfEByW24sVI93rz+op+xq9K/ZsVt5dbQUQjADJ0gRrwyt7COf6+4juE7KzdA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BL6d39KEqNaR7GFjA8lEAcB82f2XL3/fRWQ445547NA=; b=QWyGudl80FrGjxx/x3zt/ykAPA
 T0FJ4VY2la0nsC78YfCFmP2NJSf9Epmq01BQ//T25b1nEqdNVtvkphDwTqN2xMDNZl2V7eod0D6G4
 ZzcrxxVfEinPsDC2u5tyaoY4+qDHGOd3mUQ0Fy/NAd/KkaJl57VokXMPO0Ft2TD0eATw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVS-0003ZF-V8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=BL6d39KEqNaR7GFjA8lEAcB82f2XL3/fRWQ445547NA=; b=YmSOTgjC21pSw15x0O1g9PGF40
 /wJR34ZC8KN7Q9TfGOKyyiT3VJmrUVW/OPh4nxjuN40pEELZ1G1jfWAlb4ljmUDsol7w4avEe2lFY
 luW7hx5Bk1iN7DvPI4SUUxxcTCG0pTb2a0HTCbWi/fv60uEHphx58u2TaLUMMMJ0Rv8A1BkOdjSXY
 udjN0//4mLBbs+6ZkdbJ46MQTdvxsQXPAOdxfXj7yYfVr8Ke/cMk9cIgQqcJLnLTRngeFe6fUfMMD
 kl/EMSVWGiDZtIPU/E2cecJS2wvZt57kTssIGtbRHLQ9DR64yoBtcIaLGkfb7FJ2Y1xTOE+HPkqwl
 KEA4OLxg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RXm-2kJK;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:38 +0100
Message-ID: <20250331201256.1057782-19-willy@infradead.org>
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
 Content preview: Remove three hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/checkpoint.c |
 14 +++++++------- 1 file changed, 7 insertions(+), 7 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
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
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVS-0003ZF-V8
Subject: [f2fs-dev] [PATCH 018/153] f2fs: Use a folio in f2fs_ra_meta_pages()
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

Remove three hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 75aad6ccd9d0..1a5fbecd9356 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -252,7 +252,6 @@ bool f2fs_is_valid_blkaddr_raw(struct f2fs_sb_info *sbi,
 int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 							int type, bool sync)
 {
-	struct page *page;
 	block_t blkno = start;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
@@ -271,6 +270,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 
 	blk_start_plug(&plug);
 	for (; nrpages-- > 0; blkno++) {
+		struct folio *folio;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkno, type))
 			goto out;
@@ -300,18 +300,18 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 			BUG();
 		}
 
-		page = f2fs_grab_cache_page(META_MAPPING(sbi),
+		folio = f2fs_grab_cache_folio(META_MAPPING(sbi),
 						fio.new_blkaddr, false);
-		if (!page)
+		if (IS_ERR(folio))
 			continue;
-		if (PageUptodate(page)) {
-			f2fs_put_page(page, 1);
+		if (folio_test_uptodate(folio)) {
+			f2fs_folio_put(folio, true);
 			continue;
 		}
 
-		fio.page = page;
+		fio.page = &folio->page;
 		err = f2fs_submit_page_bio(&fio);
-		f2fs_put_page(page, err ? 1 : 0);
+		f2fs_folio_put(folio, err ? true : false);
 
 		if (!err)
 			f2fs_update_iostat(sbi, NULL, FS_META_READ_IO,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
