Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D5A76E1C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVW-0000sw-Es;
	Mon, 31 Mar 2025 20:13:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVT-0000s5-6J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zVZlU4oYK6/4/ylSLgAKiJEj8/JB1PH/S6M8uK3QNvw=; b=lFi272EsqLJyWEbup6EFfmL9qe
 JtE++6+Q/uxiwVRezhQ89/TbfK3HAa+5i8a6SnffVvPuJ9TVNLH9obsa1Jc+kZLBQPK1utaEpTRFu
 7C1ItOr54GsHv88KfHtzy8RQRjyfbhLOW7IMD3fh6R9lzegFnTBHrHQrwatTcVHrz9TE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zVZlU4oYK6/4/ylSLgAKiJEj8/JB1PH/S6M8uK3QNvw=; b=AAuLxK/2oJDur4PTuPL7iVruCx
 yLS/oUQCc1mgRkOwpx2Ynaf+tLujXcDGPy1Ia9WVpHCwu/zMxBS7dfITRdwIRSSeweDqTx86vp9wE
 NW7Qp8QtUjFPtsBzeqXFQ4YR86EvksqDOtY5+kU8JP+gXEDaq0ekt02ZbBwRr0ggWW5U=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVT-0003ZJ-AI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zVZlU4oYK6/4/ylSLgAKiJEj8/JB1PH/S6M8uK3QNvw=; b=nukIisYaaVTYwPZMst2uQ9lvdZ
 U9O3sPR1CL9msobhMGvJS0iUhQS8sdpDtEKc38grHlzKpGOYqhGPN+p7DZRvBxe0G29fVzdnp2WTg
 1mK92dJnGOQb465B9muccZ3gdN3wt0icL3MEvSti/iztL08FY2pEPQmema3UfcBTvhsczk0hGsMez
 Y+jyL2fY6LHOUiDke9pbxnBskgDdc01MYxsgEp4waSmTW11XF4ayYKSb8JloMAYDbNkAPzd73fwRx
 cSfX0mvHxtC1rCvjWpnmaGHQ5iZEAQWcBrK0oBw3n4Ss3D4bQISUIB5dENk0FRTHksoKJ/NkEPhFM
 XoUBwteQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RYE-3oks;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:40 +0100
Message-ID: <20250331201256.1057782-21-willy@infradead.org>
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
 Content preview: Call f2fs_grab_meta_folio() instead of f2fs_grab_meta_page().
 Removes four hidden calls to compound_head(). Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/checkpoint.c | 21 ++++++++++ 1
 file changed, 10 insertions(+), 11 deletions(-) 
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
X-Headers-End: 1tzLVT-0003ZJ-AI
Subject: [f2fs-dev] [PATCH 020/153] f2fs: Use a folio in
 write_orphan_inodes()
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

Call f2fs_grab_meta_folio() instead of f2fs_grab_meta_page().
Removes four hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 30e68de82f73..0b3dfe7397d0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -784,7 +784,7 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 	unsigned int nentries = 0;
 	unsigned short index = 1;
 	unsigned short orphan_blocks;
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 	struct ino_entry *orphan = NULL;
 	struct inode_management *im = &sbi->im[ORPHAN_INO];
 
@@ -799,10 +799,9 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 
 	/* loop for each orphan inode entry and write them in journal block */
 	list_for_each_entry(orphan, head, list) {
-		if (!page) {
-			page = f2fs_grab_meta_page(sbi, start_blk++);
-			orphan_blk =
-				(struct f2fs_orphan_block *)page_address(page);
+		if (!folio) {
+			folio = f2fs_grab_meta_folio(sbi, start_blk++);
+			orphan_blk = folio_address(folio);
 			memset(orphan_blk, 0, sizeof(*orphan_blk));
 		}
 
@@ -817,20 +816,20 @@ static void write_orphan_inodes(struct f2fs_sb_info *sbi, block_t start_blk)
 			orphan_blk->blk_addr = cpu_to_le16(index);
 			orphan_blk->blk_count = cpu_to_le16(orphan_blocks);
 			orphan_blk->entry_count = cpu_to_le32(nentries);
-			set_page_dirty(page);
-			f2fs_put_page(page, 1);
+			folio_mark_dirty(folio);
+			f2fs_folio_put(folio, true);
 			index++;
 			nentries = 0;
-			page = NULL;
+			folio = NULL;
 		}
 	}
 
-	if (page) {
+	if (folio) {
 		orphan_blk->blk_addr = cpu_to_le16(index);
 		orphan_blk->blk_count = cpu_to_le16(orphan_blocks);
 		orphan_blk->entry_count = cpu_to_le32(nentries);
-		set_page_dirty(page);
-		f2fs_put_page(page, 1);
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
