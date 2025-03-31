Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C50A76E1F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVW-0000tD-Rq;
	Mon, 31 Mar 2025 20:13:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVU-0000sD-7u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VpaksLGrV3sXn7n1bVNE1BON35WUgHqGViMr8sU6k0A=; b=U4O+vIj2z8AJXtLuM/cZq6/mWE
 9EglgXsYlZHAfGGH9wWqDXEd5SD3vD2NTmagpR/yPcHy/SWvaw64gNJH/3LNSxFgkD4rdhJ0IGLFE
 p+XBFTxVosxWjx1KJ1JcR/twdZG04P7TCkwgrwM9YTYSkF+b57p5fP3OHBtWVfyXSzgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VpaksLGrV3sXn7n1bVNE1BON35WUgHqGViMr8sU6k0A=; b=goI/Ouxf2bNTP++LrYeWD7Renb
 uJ1+2eTDLR3XgBL268CKgCJIe+hCDQYsPeztjTyZW60a/FydbooVkVA4zjJAzQLoHItQU/9lDfiPE
 GzmYM+Yq8bCE42xIagZcCkd4n2VaFtkhwWEmz/yORzsRoalIKISfpBb5yDhuPvT6pOHk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVT-0003ZS-VU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=VpaksLGrV3sXn7n1bVNE1BON35WUgHqGViMr8sU6k0A=; b=H0d9261bt6Z7B6yMrFfH7l2h8N
 HY6ez6t7m5g3Nb/GqqEi44ePZJMsVBEEeOKwy234iwHYQVRFK2wefp/d9tIcAqdKTuN01C+0Iw6ZB
 IYz7fbfSRHrWCUIVmShKLTbP0SFWyjWQE+tKmQx91/YQKxvO4s422bFeRBowyUYwZkPy1SfFSy8rI
 4q4f9Nb8kDHtIdu69jWthmmGZNmyT4Cel/saGilA1f0D77eM53VA4Qjug9AiHyItLBvsFgGm5WyTk
 FOwhYx/qJQygow2SR/HB8P5C9JMn8zvKVKYtILoTvDjhowNFR895dL88IkDruAenZCrCtSC2Rmgc2
 xsISBDqA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVI-00000004RaQ-2JLY;
 Mon, 31 Mar 2025 20:13:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:45 +0100
Message-ID: <20250331201256.1057782-26-willy@infradead.org>
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
 Content preview:  Grab a folio instead of a page. Saves four hidden calls to
 compound_head(). Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/segment.c | 24 ++++++++++++ 1 file changed, 12 insertions(+),
 12 deletions(-) 
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
X-Headers-End: 1tzLVT-0003ZS-VU
Subject: [f2fs-dev] [PATCH 025/153] f2fs: Use a folio in
 write_compacted_summaries()
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

Grab a folio instead of a page.  Saves four hidden calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 3e6acb9ab610..baf24d29ed44 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4392,15 +4392,15 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
 
 static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
 {
-	struct page *page;
+	struct folio *folio;
 	unsigned char *kaddr;
 	struct f2fs_summary *summary;
 	struct curseg_info *seg_i;
 	int written_size = 0;
 	int i, j;
 
-	page = f2fs_grab_meta_page(sbi, blkaddr++);
-	kaddr = (unsigned char *)page_address(page);
+	folio = f2fs_grab_meta_folio(sbi, blkaddr++);
+	kaddr = folio_address(folio);
 	memset(kaddr, 0, PAGE_SIZE);
 
 	/* Step 1: write nat cache */
@@ -4417,9 +4417,9 @@ static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
 		seg_i = CURSEG_I(sbi, i);
 		for (j = 0; j < f2fs_curseg_valid_blocks(sbi, i); j++) {
-			if (!page) {
-				page = f2fs_grab_meta_page(sbi, blkaddr++);
-				kaddr = (unsigned char *)page_address(page);
+			if (!folio) {
+				folio = f2fs_grab_meta_folio(sbi, blkaddr++);
+				kaddr = folio_address(folio);
 				memset(kaddr, 0, PAGE_SIZE);
 				written_size = 0;
 			}
@@ -4431,14 +4431,14 @@ static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
 							SUM_FOOTER_SIZE)
 				continue;
 
-			set_page_dirty(page);
-			f2fs_put_page(page, 1);
-			page = NULL;
+			folio_mark_dirty(folio);
+			f2fs_folio_put(folio, true);
+			folio = NULL;
 		}
 	}
-	if (page) {
-		set_page_dirty(page);
-		f2fs_put_page(page, 1);
+	if (folio) {
+		folio_mark_dirty(folio);
+		f2fs_folio_put(folio, true);
 	}
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
