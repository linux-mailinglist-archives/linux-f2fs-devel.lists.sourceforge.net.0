Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9FA76E46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVj-0003sS-AR;
	Mon, 31 Mar 2025 20:13:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVc-0003ng-Lb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GY4Ylwb/SoP7hwBdExLkR5H3hM0+QBx4XV60qP8M6pI=; b=Se4pRWKlQQBdiByeTUi/xiEhrK
 qSINUvVUIgE86jiBg03liQA/ddHWEZ/i9xn4U1FBWKeG1gFN4iboKcWVNrmaaqH8m5jLt7gRu2aQn
 HwxUJ/om7hkmjYCX+vh0eIDJU2hen2ajnc14aWjNC/nCW0vwDPdqEXhBjFk6p6JNwS98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GY4Ylwb/SoP7hwBdExLkR5H3hM0+QBx4XV60qP8M6pI=; b=ZhLaeNLKhGTn2kT2fxoBpWt0++
 xvhhZVoQ27/XY/RhuPNx+6C+NIo/m7rNRqBdpvTDGc58sM3Mhv4z73C7PGA/OX4fZ5+KqZZhBao1A
 UB9JLY99hgI3rQhcxZzz7HJglyquAGiELWy1fVH95UL2EqXoUc3hC2xHUjmv4WBDWeKA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVW-0003a7-MZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GY4Ylwb/SoP7hwBdExLkR5H3hM0+QBx4XV60qP8M6pI=; b=pazOhBjtnzDxTlgh/K89oelS2c
 UylPnRqBmvq8mc6G4ToMyhMMpcSoECbUemA1IF2swO6ZpxluBFmZ51QZxM3j8KDLdZWO7rYpmrZ9k
 fFP/atN2s7S8hYHClkRan5OHPqwoPgiLKvkcNvXsy3/DhhAKFcw8w7uypVdG2vdLpMAI/rLo6rfsL
 eUWtJT8xCN2iHLsQCQ4Mbq9JUkvrfsC/cBMmU4dWLl0F7YHRW0gsRr4lkOyp4n5Q8onDsaXgH1kcd
 89FAlHZ7Dw9ngUb6c7TyTNArEmGMr2u8Euv3tT6ou1dlP/GonM+H2hGvUQqdDVHTm+bHD5gMmiBVF
 QLfbymmw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVL-00000004Ret-0TCm;
 Mon, 31 Mar 2025 20:13:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:02 +0100
Message-ID: <20250331201256.1057782-43-willy@infradead.org>
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
 Content preview: Get a folio and use it. Saves a call to compound_head().
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/segment.c | 12
 ++++++------ 1 file changed, 6 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1tzLVW-0003a7-MZ
Subject: [f2fs-dev] [PATCH 042/153] f2fs: Use a folio in change_curseg()
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

Get a folio and use it.  Saves a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a3d4903cfb0b..88890755a394 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2997,7 +2997,7 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int new_segno = curseg->next_segno;
 	struct f2fs_summary_block *sum_node;
-	struct page *sum_page;
+	struct folio *sum_folio;
 
 	if (curseg->inited)
 		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, curseg->segno));
@@ -3013,15 +3013,15 @@ static int change_curseg(struct f2fs_sb_info *sbi, int type)
 	curseg->alloc_type = SSR;
 	curseg->next_blkoff = __next_free_blkoff(sbi, curseg->segno, 0);
 
-	sum_page = f2fs_get_sum_page(sbi, new_segno);
-	if (IS_ERR(sum_page)) {
+	sum_folio = f2fs_get_sum_folio(sbi, new_segno);
+	if (IS_ERR(sum_folio)) {
 		/* GC won't be able to use stale summary pages by cp_error */
 		memset(curseg->sum_blk, 0, SUM_ENTRY_SIZE);
-		return PTR_ERR(sum_page);
+		return PTR_ERR(sum_folio);
 	}
-	sum_node = (struct f2fs_summary_block *)page_address(sum_page);
+	sum_node = folio_address(sum_folio);
 	memcpy(curseg->sum_blk, sum_node, SUM_ENTRY_SIZE);
-	f2fs_put_page(sum_page, 1);
+	f2fs_folio_put(sum_folio, true);
 	return 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
