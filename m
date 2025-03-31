Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B06CA76E53
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVn-0000pW-85;
	Mon, 31 Mar 2025 20:13:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVZ-0000kQ-N2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j9tT5uMv0oBy9ddhKAHRRadsuxLcsdFB4c0xiA8cOoQ=; b=JWAeupYykT/lInYwSNliDex+jB
 4aouSnJIBKhfcT6uUkUk6VbtKsMwiK9R8wAwNdRwuVXFCFe2rgsYaKENJSNtAwuPrj8zp2f9gF2fP
 k8lYyrZ1vtBpGk2oeFLRe0lCzlfCew1eC0sulODcKEJAGFImro0A+G3e/xOUkx0LIEfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j9tT5uMv0oBy9ddhKAHRRadsuxLcsdFB4c0xiA8cOoQ=; b=BAEJUl8/ZbOiSH6B3i/IgUh3RZ
 wmQiGxfL9msMjhptXn3o56LDNMgLdS0reqsg4+DTrTxYsbHGUgbOZdA46X5zdeyu1jwdupjKUZmEN
 WgXTn7o61jeKQe2vCT3B1UxyjWwoRUk1gv7gkCjjaqJ69ESZp2ptVJg34InEXnL8b/Gk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVZ-0003bB-IM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=j9tT5uMv0oBy9ddhKAHRRadsuxLcsdFB4c0xiA8cOoQ=; b=u+3dAts0GZU9J/2cBA7PtKr1DY
 3laVgVH0pY1WWfSut14FldWFFP/IuzGvqZFu/g7kSF2d5tU/0rKiP90IJrxGSgda6ajkDGbVb03iF
 UJMwrGuGq9q5kC5oYhMkgS9gSz3pAqUY0Ay0n7lw3zyNc69NoXSmKg2/ljdZ+nbw10pKwPW9NRWPa
 GUOWloYrCz7sTXxdduXO0deF6fwiCv3mInj8KLClkTjaYnOD0LJ4sGEyE1exTOVbzXcJkGFwZDlNW
 kMv/34QQ+mGO0OPFFQm5G5XBC3vLfO9JWlD30b6PXi4oe93ICWgSu1HNt8Gm5Fpbr0xk/TpKpdMpJ
 dWPScp8g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVO-00000004Rou-0Wgt;
 Mon, 31 Mar 2025 20:13:10 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:21 +0100
Message-ID: <20250331201256.1057782-62-willy@infradead.org>
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
 Content preview:  Remove 11 hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/gc.c | 17
 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-) diff --git a/fs/f2fs/gc.c
 b/fs/f2fs/gc.c index bdc1d079c7b3..45b1ffa5ea93 100644 --- a/fs/f2fs/gc.c
 +++ b/fs/f2fs/gc.c @@ -1307,8 +1307,7 @@ static int move_data_block(struct
 inode *inode, block_t bid [...] 
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
X-Headers-End: 1tzLVZ-0003bB-IM
Subject: [f2fs-dev] [PATCH 061/153] f2fs: Use a folio in move_data_block()
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

Remove 11 hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/gc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index bdc1d079c7b3..45b1ffa5ea93 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1307,8 +1307,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	struct dnode_of_data dn;
 	struct f2fs_summary sum;
 	struct node_info ni;
-	struct page *page;
-	struct folio *mfolio;
+	struct folio *folio, *mfolio;
 	block_t newaddr;
 	int err = 0;
 	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
@@ -1317,9 +1316,9 @@ static int move_data_block(struct inode *inode, block_t bidx,
 				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
 
 	/* do not read out */
-	page = f2fs_grab_cache_page(mapping, bidx, false);
-	if (!page)
-		return -ENOMEM;
+	folio = f2fs_grab_cache_folio(mapping, bidx, false);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
 
 	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
 		err = -ENOENT;
@@ -1336,7 +1335,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		goto out;
 
 	if (unlikely(dn.data_blkaddr == NULL_ADDR)) {
-		ClearPageUptodate(page);
+		folio_clear_uptodate(folio);
 		err = -ENOENT;
 		goto put_out;
 	}
@@ -1345,7 +1344,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	 * don't cache encrypted data into meta inode until previous dirty
 	 * data were writebacked to avoid racing between GC and flush.
 	 */
-	f2fs_wait_on_page_writeback(page, DATA, true, true);
+	f2fs_folio_wait_writeback(folio, DATA, true, true);
 
 	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
 
@@ -1354,7 +1353,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		goto put_out;
 
 	/* read page */
-	fio.page = page;
+	fio.page = &folio->page;
 	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
 
 	if (lfs_mode)
@@ -1445,7 +1444,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 put_out:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_put_page(page, 1);
+	f2fs_folio_put(folio, true);
 	return err;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
