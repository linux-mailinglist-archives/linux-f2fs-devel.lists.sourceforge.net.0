Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21761A39329
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWz-0006bt-T4;
	Tue, 18 Feb 2025 05:52:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWq-0006Zi-PE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TUMziK/MN+dJA5u/Tm7OSGZei6DtomV0hyNLe55qLvc=; b=ANd2knkA+mV4i5Ly8T3egiIcCB
 dRLsNLl0S41odz6l5KPRmCsLhpjPb4/9pZIiE0lV+CJnKE4GiYckm/U1bm8s+sg3MzniUo0VEG04d
 qi35R1adYY38g9mYz88+MqeYfA3Txt8OcZ8m7IanXT1AZJhUQzwGoRzRf9ocWFkK4y90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TUMziK/MN+dJA5u/Tm7OSGZei6DtomV0hyNLe55qLvc=; b=AKq6Vg1RAUe92PClczwievUSmS
 Tyjr7z7iUOZIrv9Mfp7OxtW4zufQLbkIjFlJ+hNcOQY4vqjhzJAsR4tszaaKWH9yx2VeRwTS6imwn
 xkdRDtL8OzG1H9L06UTaoMlz9FvdankreiCv6RHKictFmCdh8r3lkfYaCUck+OcMQqeo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWq-0007cQ-2o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=TUMziK/MN+dJA5u/Tm7OSGZei6DtomV0hyNLe55qLvc=; b=kZPYOAogxaHpYsVmBqKtxQxMwk
 JCrVeQ4rs64fC0AJmONgXcVDjUYkjXp6b6B13MdUac0xNc5pMFcfDgBaTFwT7h1Wn7LV119mB8Lf8
 LgzyEellQxuR5ZnhzRY/bypo1654dPPWsrJ6859Deu7JhQGM1rh/ouDJ/2rU22Z0t/e94lyDu5S8Q
 +KH5Uwof0vdA4aXE2wlWW6EhXJybyFg7KRJe4OQTvMG+S1XTvx9NWeLszmDHmmssIDu04/m2LT3kP
 9xSGqZ00uvuovIJgIidh2ZCtDXxNiAEn6UVqWCj0mFWaUWFVcpzTnRuF2mDr6GDXTizFxAoxTqLIF
 w5Qih4rQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWe-00000002TtX-3ER8; Tue, 18 Feb 2025 05:52:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:57 +0000
Message-ID: <20250218055203.591403-24-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fetch a folio from the page cache and use it throughout,
 saving
 eight hidden calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/gc.c | 34 +++++++++++++++++ 1 file changed, 
 17 insertions(+), 17 deletions(-) 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWq-0007cQ-2o
Subject: [f2fs-dev] [PATCH 23/27] f2fs: Convert move_data_page() to use a
 folio
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fetch a folio from the page cache and use it throughout, saving
eight hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/gc.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index faf9fa1c804d..d0fffa2bd9f0 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1449,14 +1449,14 @@ static int move_data_block(struct inode *inode, block_t bidx,
 }
 
 static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
-							unsigned int segno, int off)
+						unsigned int segno, int off)
 {
-	struct page *page;
+	struct folio *folio;
 	int err = 0;
 
-	page = f2fs_get_lock_data_page(inode, bidx, true);
-	if (IS_ERR(page))
-		return PTR_ERR(page);
+	folio = f2fs_get_lock_data_folio(inode, bidx, true);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
 
 	if (!check_valid_map(F2FS_I_SB(inode), segno, off)) {
 		err = -ENOENT;
@@ -1468,12 +1468,12 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		goto out;
 
 	if (gc_type == BG_GC) {
-		if (folio_test_writeback(page_folio(page))) {
+		if (folio_test_writeback(folio)) {
 			err = -EAGAIN;
 			goto out;
 		}
-		set_page_dirty(page);
-		set_page_private_gcing(page);
+		folio_mark_dirty(folio);
+		set_page_private_gcing(&folio->page);
 	} else {
 		struct f2fs_io_info fio = {
 			.sbi = F2FS_I_SB(inode),
@@ -1483,37 +1483,37 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.op = REQ_OP_WRITE,
 			.op_flags = REQ_SYNC,
 			.old_blkaddr = NULL_ADDR,
-			.page = page,
+			.page = &folio->page,
 			.encrypted_page = NULL,
 			.need_lock = LOCK_REQ,
 			.io_type = FS_GC_DATA_IO,
 		};
-		bool is_dirty = PageDirty(page);
+		bool is_dirty = folio_test_dirty(folio);
 
 retry:
-		f2fs_wait_on_page_writeback(page, DATA, true, true);
+		f2fs_folio_wait_writeback(folio, DATA, true, true);
 
-		set_page_dirty(page);
-		if (clear_page_dirty_for_io(page)) {
+		folio_mark_dirty(folio);
+		if (folio_clear_dirty_for_io(folio)) {
 			inode_dec_dirty_pages(inode);
 			f2fs_remove_dirty_inode(inode);
 		}
 
-		set_page_private_gcing(page);
+		set_page_private_gcing(&folio->page);
 
 		err = f2fs_do_write_data_page(&fio);
 		if (err) {
-			clear_page_private_gcing(page);
+			clear_page_private_gcing(&folio->page);
 			if (err == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
 				goto retry;
 			}
 			if (is_dirty)
-				set_page_dirty(page);
+				folio_mark_dirty(folio);
 		}
 	}
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
