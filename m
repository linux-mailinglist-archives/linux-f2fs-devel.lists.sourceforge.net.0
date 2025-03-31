Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A58A76E7E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVy-00044w-88;
	Mon, 31 Mar 2025 20:13:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVm-0003vI-MQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ezCDslznMwsHbDVz6LbwURStq4oc2Y7Ps/rc4+B7D8=; b=R4Ta1BQ5lgxSGK8wlONXorhVBj
 JJAZ5HZR2bR3QXQGqHiyIb5S8Gm48RI1KwKfm42mjUIv2VEnmYgo8cbE4yrECfW1jkqILWOsuyuMD
 gcYL8Nyju8TWZ7m9ENwX8AhiAWq7lPvzQJkMI8jsptCHqxqjAa+Da0IFzlH44LV520wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ezCDslznMwsHbDVz6LbwURStq4oc2Y7Ps/rc4+B7D8=; b=dfqvbXVjKN0GvpKmSD91LRfPq/
 jdY7S3bvglcBRd79QCXXPi0bZQsSXOlErc4sWzUlUFOAZnGLdWufagvbI0E3gxIyzqlHEpwB9rm0W
 GxtNp3VFRW/PPkh7uww6ivTEqjpNeNmIevJUrC/dqNZz85uVahGYF8fG6jld/E22eSGY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVc-0003c8-0s for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5ezCDslznMwsHbDVz6LbwURStq4oc2Y7Ps/rc4+B7D8=; b=JBYARB/4MLXw5MOn0jbj+FmFM9
 WUjW+COmfAfyI2GRGKYz5F61IlfHmNK+rZOMkYy7xojOoMbmwSjHz9SF4ej3GwgL18CkeFJVzevv7
 81c34B3XC0EmtTtPO3et8iG1c6HWlH1DyH5c5ryACHywTiA2BJ3sik3suPt+k728tc+kGFf2M1Z7W
 mFTH25jWpCPBo/eXSwENIZ/ltjM+ZsjuIKIctNG/yaf+tzPtXF6z7C94otUJTyZBKFkGrxengU+4g
 AZXHn7+iunXt6LWV7JxMId+Eyay8egRrIi/jirkPalR9FFpxKQD5w/5xotM9/xCzibtFHhmAzi8iK
 EwQbH9VQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVV-00000004S9z-2oUf;
 Mon, 31 Mar 2025 20:13:17 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:56 +0100
Message-ID: <20250331201256.1057782-97-willy@infradead.org>
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
 Content preview:  Both callers have a folio, so pass it in. Removes seven calls
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 4 ++-- fs/f2fs/inline.c | 18
 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions( [...] 
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
X-Headers-End: 1tzLVc-0003c8-0s
Subject: [f2fs-dev] [PATCH 096/153] f2fs: Convert f2fs_convert_inline_page()
 to f2fs_convert_inline_folio()
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

Both callers have a folio, so pass it in.  Removes seven calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c   |  2 +-
 fs/f2fs/f2fs.h   |  4 ++--
 fs/f2fs/inline.c | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b728c5dbf180..a6c7dc56a0e1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3395,7 +3395,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 				set_page_private_inline(&ifolio->page);
 			goto out;
 		}
-		err = f2fs_convert_inline_page(&dn, folio_page(folio, 0));
+		err = f2fs_convert_inline_folio(&dn, folio);
 		if (err || dn.data_blkaddr != NULL_ADDR)
 			goto out;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c2d384a7aab3..9257ea0f2ecf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3351,7 +3351,7 @@ static inline int inline_xattr_size(struct inode *inode)
 
 /*
  * Notice: check inline_data flag without inode page lock is unsafe.
- * It could change at any time by f2fs_convert_inline_page().
+ * It could change at any time by f2fs_convert_inline_folio().
  */
 static inline int f2fs_has_inline_data(struct inode *inode)
 {
@@ -4279,7 +4279,7 @@ void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage);
 void f2fs_truncate_inline_inode(struct inode *inode,
 						struct page *ipage, u64 from);
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
-int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
+int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio);
 int f2fs_convert_inline_inode(struct inode *inode);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
 int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 7638854bc7d9..508004f4df4f 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -142,7 +142,7 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 	return 0;
 }
 
-int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
+int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 {
 	struct f2fs_io_info fio = {
 		.sbi = F2FS_I_SB(dn->inode),
@@ -150,7 +150,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 		.type = DATA,
 		.op = REQ_OP_WRITE,
 		.op_flags = REQ_SYNC | REQ_PRIO,
-		.page = page,
+		.page = &folio->page,
 		.encrypted_page = NULL,
 		.io_type = FS_DATA_IO,
 	};
@@ -182,20 +182,20 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 		return -EFSCORRUPTED;
 	}
 
-	f2fs_bug_on(F2FS_P_SB(page), folio_test_writeback(page_folio(page)));
+	f2fs_bug_on(F2FS_F_SB(folio), folio_test_writeback(folio));
 
-	f2fs_do_read_inline_data(page_folio(page), dn->inode_page);
-	set_page_dirty(page);
+	f2fs_do_read_inline_data(folio, dn->inode_page);
+	folio_mark_dirty(folio);
 
 	/* clear dirty state */
-	dirty = clear_page_dirty_for_io(page);
+	dirty = folio_clear_dirty_for_io(folio);
 
 	/* write data page to try to make data consistent */
-	set_page_writeback(page);
+	folio_start_writeback(folio);
 	fio.old_blkaddr = dn->data_blkaddr;
 	set_inode_flag(dn->inode, FI_HOT_DATA);
 	f2fs_outplace_write_data(dn, &fio);
-	f2fs_wait_on_page_writeback(page, DATA, true, true);
+	f2fs_folio_wait_writeback(folio, DATA, true, true);
 	if (dirty) {
 		inode_dec_dirty_pages(dn->inode);
 		f2fs_remove_dirty_inode(dn->inode);
@@ -246,7 +246,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (f2fs_has_inline_data(inode))
-		err = f2fs_convert_inline_page(&dn, &folio->page);
+		err = f2fs_convert_inline_folio(&dn, folio);
 
 	f2fs_put_dnode(&dn);
 out:
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
