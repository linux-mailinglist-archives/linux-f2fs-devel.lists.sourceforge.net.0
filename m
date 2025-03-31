Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4550A76E4A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVj-0000mV-Vr;
	Mon, 31 Mar 2025 20:13:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVT-0000je-4U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mDjDz0lyOVyANpPEqAol637+FBLPaCZpo4lUmEkxo2M=; b=MBEGneXUoJTSZpSoWAzVht7pI1
 Ah8/8ZlpyKs4t9pFkz474LtHes+Z1BOnNXI+abXkhWlQJtvczdktn1cHseyPcHcA9El0q3S4x3i4H
 dWvzkfccnwV4LiKQwToZuyRw3J0CB5v1djYSieFxvpfOV7CG1mieIXyoAlHxRenyZO4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mDjDz0lyOVyANpPEqAol637+FBLPaCZpo4lUmEkxo2M=; b=JZaBUeL9B/2ZztlIEHRsCvOR7Q
 2SVi2IuS7pF0pm4sDnkRonngUdcNEvoUxV0+aMAokhypJcQLE5b+RQhwm/1GKGjCC9TPNljmZg8Bd
 0+mve4TuImSZVQ6KMpj5SRB4Vf5KbwXg8IwimnS5Ehx0FtPWSRtZd3rBjkZ47W1HqGNU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVS-0003ZE-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mDjDz0lyOVyANpPEqAol637+FBLPaCZpo4lUmEkxo2M=; b=cmbr2h2c1fTPF1kwzYE1IH6I7u
 Pw8gJ1CFJZhoZDiwsdUmNsxxlv3+b7hjrOJsl18uMkYHJhfkDS+HlS4yIY77VmDD5Xl7SXrWrCD2Y
 Av119tbU1Glxke2BYZM984XXOI4Lci38WYhaIYkrpCVXH1wowSoclepaY/Jg9dJ9Gd6LEOYJwnSRO
 YBsVFWj9nfMYd4QTpubm4BPXcEEowiCBjuA3Lta6sMgKU/8XU1p3rMsjDaOF4Pisn6lcc3UXHJU0p
 ki2a2VpsjeeZlyjhnzVG7h2gHiMLSXbT7u5xS8oOJUk+i1bF5Pb3WgQIKv7zZDNSrBpfo9qv+Zez6
 luriWKWw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVM-00000004RkK-2PFH;
 Mon, 31 Mar 2025 20:13:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:10 +0100
Message-ID: <20250331201256.1057782-51-willy@infradead.org>
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
 Content preview: Convert f2fs_get_new_data_page() into
 f2fs_get_new_data_folio()
 and add a f2fs_get_new_data_page() wrapper. Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 6 +++--- fs/f2fs/f2fs.h
 | 9 ++++++++- 2 files changed, 11 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1tzLVS-0003ZE-Ub
Subject: [f2fs-dev] [PATCH 050/153] f2fs: Add f2fs_get_new_data_folio()
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

Convert f2fs_get_new_data_page() into f2fs_get_new_data_folio() and
add a f2fs_get_new_data_page() wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 6 +++---
 fs/f2fs/f2fs.h | 9 ++++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2301daf57e56..52ca44b3c687 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1342,7 +1342,7 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
  * Note that, ipage is set only by make_empty_dir, and if any error occur,
  * ipage should be released by this function.
  */
-struct page *f2fs_get_new_data_page(struct inode *inode,
+struct folio *f2fs_get_new_data_folio(struct inode *inode,
 		struct page *ipage, pgoff_t index, bool new_i_size)
 {
 	struct address_space *mapping = inode->i_mapping;
@@ -1383,13 +1383,13 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
 		f2fs_bug_on(F2FS_I_SB(inode), ipage);
 		folio = f2fs_get_lock_data_folio(inode, index, true);
 		if (IS_ERR(folio))
-			return &folio->page;
+			return folio;
 	}
 got_it:
 	if (new_i_size && i_size_read(inode) <
 				((loff_t)(index + 1) << PAGE_SHIFT))
 		f2fs_i_size_write(inode, ((loff_t)(index + 1) << PAGE_SHIFT));
-	return &folio->page;
+	return folio;
 }
 
 static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 788a8cd55603..2dcc3b48221b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3958,7 +3958,7 @@ struct folio *f2fs_find_data_folio(struct inode *inode, pgoff_t index,
 		pgoff_t *next_pgofs);
 struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 			bool for_write);
-struct page *f2fs_get_new_data_page(struct inode *inode,
+struct folio *f2fs_get_new_data_folio(struct inode *inode,
 			struct page *ipage, pgoff_t index, bool new_i_size);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
@@ -3983,6 +3983,13 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 extern const struct iomap_ops f2fs_iomap_ops;
 
+static inline
+struct page *f2fs_get_new_data_page(struct inode *inode,
+			struct page *ipage, pgoff_t index, bool new_i_size)
+{
+	return &f2fs_get_new_data_folio(inode, ipage, index, new_i_size)->page;
+}
+
 static inline struct page *f2fs_get_lock_data_page(struct inode *inode,
 		pgoff_t index, bool for_write)
 {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
