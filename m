Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC53A76E4C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVk-0000nG-VZ;
	Mon, 31 Mar 2025 20:13:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVV-0000js-1D
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMdY0qXzo5KbTb7WvO3gkq1R1uWhCE2o0mn0dC+zxc4=; b=K60H2VzqbGHjkHBr5hGhZwIPC8
 mb5h8KhQoMu7+sYtRPoTugI/hQWKW7h62mYf6uVBaEM2jnYP7WBW7B+JSLqEzfnGhi7rH6j306LOj
 V528DYP87qB1ooWlRCyl0O8W+AmTBNtuV4SxIaL2y6ZH/yPH4oGddvo83OBHl8zv3D3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lMdY0qXzo5KbTb7WvO3gkq1R1uWhCE2o0mn0dC+zxc4=; b=Jwrjlmm1OVsrWiacVrDwLIXodq
 55czWR7g/S/CvRpEGraNzchCsswY95hhpbFosIQlXMDz623r7CHkiyEOGu+C4QkNiJjbcsoE9w3xx
 LSejnqImZ1Q9GzYmv3Oy0xSk8AkdUMGzoTx1nXj5giGdGs6DYrefLrUv8Zy/7rE/JMg8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVU-0003Za-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lMdY0qXzo5KbTb7WvO3gkq1R1uWhCE2o0mn0dC+zxc4=; b=VcslomKX/w++3E/EIgs9PGGCig
 mmAyDRb4jh6jLI+Xumcr2Y9+aLcl2n6udTTWi/WWYh81YDFrc1DRgw7MB8nINWdCasbA59KrDMzQU
 otKQMwFA98c1T+4Tb0qB4Wlx1wnBNiA982sk+n6KiaRERVRE01wmPmpSVBmwc0HGEjRA/i3ynE+66
 Mp7tboeNFioMBsjEJW1vw1lKRZrC90ZCwS0kCq3a6m0omtxNgSyNeWdliAsemRVeyJX0hKxFS2byz
 1t56kC9ixc8bRoiZr7vONXNeEGCGsuEYP9Vn0PswN8CWcL6dYr8fAQy4A4oVkoDNOCJYydehH/AK5
 Mue1fNxw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVJ-00000004RbY-1XDA;
 Mon, 31 Mar 2025 20:13:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:51 +0100
Message-ID: <20250331201256.1057782-32-willy@infradead.org>
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
 Content preview:  Convert validate_checkpoint() to return a folio and use it
 throughout f2fs_get_valid_checkpoint(). Saves five hidden calls to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/checkpoint.c
 | 38 +++++++++++++++++++ 1 file changed, 19 insertions(+), 19 deletions(-)
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
X-Headers-End: 1tzLVU-0003Za-NQ
Subject: [f2fs-dev] [PATCH 031/153] f2fs: Use a folio in
 f2fs_get_valid_checkpoint()
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

Convert validate_checkpoint() to return a folio and use it throughout
f2fs_get_valid_checkpoint().  Saves five hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 8ae015b304db..c34add47ea8d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -880,7 +880,7 @@ static int get_checkpoint_version(struct f2fs_sb_info *sbi, block_t cp_addr,
 	return 0;
 }
 
-static struct page *validate_checkpoint(struct f2fs_sb_info *sbi,
+static struct folio *validate_checkpoint(struct f2fs_sb_info *sbi,
 				block_t cp_addr, unsigned long long *version)
 {
 	struct folio *cp_folio_1 = NULL, *cp_folio_2 = NULL;
@@ -913,7 +913,7 @@ static struct page *validate_checkpoint(struct f2fs_sb_info *sbi,
 	if (cur_version == pre_version) {
 		*version = cur_version;
 		f2fs_folio_put(cp_folio_2, true);
-		return &cp_folio_1->page;
+		return cp_folio_1;
 	}
 	f2fs_folio_put(cp_folio_2, true);
 invalid_cp:
@@ -925,7 +925,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_checkpoint *cp_block;
 	struct f2fs_super_block *fsb = sbi->raw_super;
-	struct page *cp1, *cp2, *cur_page;
+	struct folio *cp1, *cp2, *cur_folio;
 	unsigned long blk_size = sbi->blocksize;
 	unsigned long long cp1_version = 0, cp2_version = 0;
 	unsigned long long cp_start_blk_no;
@@ -952,22 +952,22 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 
 	if (cp1 && cp2) {
 		if (ver_after(cp2_version, cp1_version))
-			cur_page = cp2;
+			cur_folio = cp2;
 		else
-			cur_page = cp1;
+			cur_folio = cp1;
 	} else if (cp1) {
-		cur_page = cp1;
+		cur_folio = cp1;
 	} else if (cp2) {
-		cur_page = cp2;
+		cur_folio = cp2;
 	} else {
 		err = -EFSCORRUPTED;
 		goto fail_no_cp;
 	}
 
-	cp_block = (struct f2fs_checkpoint *)page_address(cur_page);
+	cp_block = folio_address(cur_folio);
 	memcpy(sbi->ckpt, cp_block, blk_size);
 
-	if (cur_page == cp1)
+	if (cur_folio == cp1)
 		sbi->cur_cp_pack = 1;
 	else
 		sbi->cur_cp_pack = 2;
@@ -982,30 +982,30 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 		goto done;
 
 	cp_blk_no = le32_to_cpu(fsb->cp_blkaddr);
-	if (cur_page == cp2)
+	if (cur_folio == cp2)
 		cp_blk_no += BIT(le32_to_cpu(fsb->log_blocks_per_seg));
 
 	for (i = 1; i < cp_blks; i++) {
 		void *sit_bitmap_ptr;
 		unsigned char *ckpt = (unsigned char *)sbi->ckpt;
 
-		cur_page = f2fs_get_meta_page(sbi, cp_blk_no + i);
-		if (IS_ERR(cur_page)) {
-			err = PTR_ERR(cur_page);
+		cur_folio = f2fs_get_meta_folio(sbi, cp_blk_no + i);
+		if (IS_ERR(cur_folio)) {
+			err = PTR_ERR(cur_folio);
 			goto free_fail_no_cp;
 		}
-		sit_bitmap_ptr = page_address(cur_page);
+		sit_bitmap_ptr = folio_address(cur_folio);
 		memcpy(ckpt + i * blk_size, sit_bitmap_ptr, blk_size);
-		f2fs_put_page(cur_page, 1);
+		f2fs_folio_put(cur_folio, 1);
 	}
 done:
-	f2fs_put_page(cp1, 1);
-	f2fs_put_page(cp2, 1);
+	f2fs_folio_put(cp1, 1);
+	f2fs_folio_put(cp2, 1);
 	return 0;
 
 free_fail_no_cp:
-	f2fs_put_page(cp1, 1);
-	f2fs_put_page(cp2, 1);
+	f2fs_folio_put(cp1, 1);
+	f2fs_folio_put(cp2, 1);
 fail_no_cp:
 	kvfree(sbi->ckpt);
 	return err;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
