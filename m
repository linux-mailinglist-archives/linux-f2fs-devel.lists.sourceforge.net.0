Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE98A76E6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVu-0003zL-AW;
	Mon, 31 Mar 2025 20:13:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVe-0003pR-T2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XlQNiNBXVPlwib8pRIk6yh1tnNlbyq53hnsdNrm4eQI=; b=feNHcTkDiV8qI2VuM3nuq+4P21
 +hdJeBSsTCIUrmonwruKiOCjrWao311lKGPB9u5VL21aoN0yFPWJaBP7i1nQ1UEFuCz3auN1X7RK4
 1mN7QEQgDFFbPIKpbgl8OIKtfAXCVVJCbVRnqYmZ4XkmRRpRoiWpy8tcnsYflupZeWiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XlQNiNBXVPlwib8pRIk6yh1tnNlbyq53hnsdNrm4eQI=; b=J2Dx+oPKmu8cj7NWDndmmC7ZxR
 jhsyIG0ZJSRDpA0FRVwNLforIa0QC0Z17CN88F2Q1K/GMz6o0gfbO6WCcP9eLQE7IgP7ZiZ0rXR48
 4xq4LJVV1W0xZkWIJ1F+nzWVsxm43geOHDGrAqG+JWhlzSzKvXZwVgvIHkzaRKwiCvnQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVZ-0003b5-AQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XlQNiNBXVPlwib8pRIk6yh1tnNlbyq53hnsdNrm4eQI=; b=WR+40NKzLM8LfmtV/6Rs9RRAR1
 f4o7KPJ5h5ITIsY+HfoDzF3baLLS6eD2unmSesv+GPzLTgctuNxrGQT10l6uJizOux4l83cTDkxSK
 4mOBgcLSuLMw4rthrBDEB+vfRL/jIf29BDLBZGu2PDsB8Gtj9PaCkEf51ONf/7pVXWahH7QgVddNr
 G+RizxeinLgnDsAIYtJoMsbLFB8fGBpTVyVnpFcJ4eYEK2uiKgCGtvXi7Zo4XurFegnBDCO+jrx2a
 2uyXzXRxs/F3MtJLtZ4BCNMFeObNNpfKr4y5rDU2g0F503upg5/TyepZ3FMe3A2oG+ZCy63qStoBk
 l1/Nqung==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVN-00000004RoT-4Bff;
 Mon, 31 Mar 2025 20:13:10 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:20 +0100
Message-ID: <20250331201256.1057782-61-willy@infradead.org>
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
 Content preview: Remove three hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/gc.c | 30
 +++++++++++++++
 1 file changed, 15 insertions(+), 15 deletions(-) 
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
X-Headers-End: 1tzLVZ-0003b5-AQ
Subject: [f2fs-dev] [PATCH 060/153] f2fs: Use a folio in ra_data_block()
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
 fs/f2fs/gc.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 1f3c275099e5..bdc1d079c7b3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1205,7 +1205,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	struct address_space *mapping = f2fs_is_cow_file(inode) ?
 				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
 	struct dnode_of_data dn;
-	struct page *page;
+	struct folio *folio;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
 		.ino = inode->i_ino,
@@ -1218,16 +1218,16 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	};
 	int err;
 
-	page = f2fs_grab_cache_page(mapping, index, true);
-	if (!page)
-		return -ENOMEM;
+	folio = f2fs_grab_cache_folio(mapping, index, true);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
 
 	if (f2fs_lookup_read_extent_cache_block(inode, index,
 						&dn.data_blkaddr)) {
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ))) {
 			err = -EFSCORRUPTED;
-			goto put_page;
+			goto put_folio;
 		}
 		goto got_it;
 	}
@@ -1235,28 +1235,28 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 	if (err)
-		goto put_page;
+		goto put_folio;
 	f2fs_put_dnode(&dn);
 
 	if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
 		err = -ENOENT;
-		goto put_page;
+		goto put_folio;
 	}
 	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE))) {
 		err = -EFSCORRUPTED;
-		goto put_page;
+		goto put_folio;
 	}
 got_it:
-	/* read page */
-	fio.page = page;
+	/* read folio */
+	fio.page = &folio->page;
 	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
 
 	/*
 	 * don't cache encrypted data into meta inode until previous dirty
 	 * data were writebacked to avoid racing between GC and flush.
 	 */
-	f2fs_wait_on_page_writeback(page, DATA, true, true);
+	f2fs_folio_wait_writeback(folio, DATA, true, true);
 
 	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
 
@@ -1265,14 +1265,14 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 					FGP_LOCK | FGP_CREAT, GFP_NOFS);
 	if (!fio.encrypted_page) {
 		err = -ENOMEM;
-		goto put_page;
+		goto put_folio;
 	}
 
 	err = f2fs_submit_page_bio(&fio);
 	if (err)
 		goto put_encrypted_page;
 	f2fs_put_page(fio.encrypted_page, 0);
-	f2fs_put_page(page, 1);
+	f2fs_folio_put(folio, true);
 
 	f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
 	f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
@@ -1280,8 +1280,8 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	return 0;
 put_encrypted_page:
 	f2fs_put_page(fio.encrypted_page, 1);
-put_page:
-	f2fs_put_page(page, 1);
+put_folio:
+	f2fs_folio_put(folio, true);
 	return err;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
