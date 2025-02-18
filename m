Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F892A39311
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWn-0000Iu-3j;
	Tue, 18 Feb 2025 05:52:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWl-0000IK-0H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e/scrlPF9Nuommu0AaLdjJYTM9nSFLlyoatgBo1kEyk=; b=LTkwRO1x3teOmmGW7BQPDsI6zX
 iHu28jT4b4ws9VmctpRuqpSrEh45qxTZZSau0n9a9WM7DSr4SO3E//s7EQfskiGwXwLUQvzSPQCvl
 pOzf/TUuyZ9WPma5TLUX+hl2NdFov/mrpmdE3dlRn8Aog58hZlQnTaTZDg7sQGtl1vs0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e/scrlPF9Nuommu0AaLdjJYTM9nSFLlyoatgBo1kEyk=; b=b0IuwEp2EYHiOUftsoOix0BnUG
 OIxWMWfmoejGUDL59LGMfWaYQ+Sl8ojpt8+jroBKBXizCQnf90y22r/usKJynt36RzDbQd4ZPawi2
 Xux9H5j6RYtFpPMH+SWuti6HzQwJZcpkc5Fm3DgIWIEKlsMSNbExxaxcz7FJbyfR4iMk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWk-0007bb-8L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=e/scrlPF9Nuommu0AaLdjJYTM9nSFLlyoatgBo1kEyk=; b=TYZC6ZtvhUAGk4adZthzzV3cqA
 908B3Js9iNm9pVV3EqQdbKM1uo7cd2AOCDl9zAK4M36zd75QB1PVmZi02zP3l95tsZaGpaOvC9esb
 7kyD7f+VH5SX060P7gr5zwZ/oDSGCMQNm2h4FLI5Oprk0l9fptdCXwqms2oybocHRN6o7WH6p5RGL
 D07vUeiiygerUtG9VRYIa4CR+hO3u1+8vF+ss1QeEQ3jgass6pMsSF3QM8VZ40cuwUHD4pEfJ/tdY
 z9BEx/xMt8O1BySP5zxOYKCcfrR2xyvlwimmC014QSXvlZPVJXNBADHILwOXFx+NUDr+lyKTbc5PH
 JPwbmdQQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWd-00000002Tsu-3s4X; Tue, 18 Feb 2025 05:52:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:52 +0000
Message-ID: <20250218055203.591403-19-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use f2fs_get_node_folio() to get a folio and use it
 throughout.
 Remove a few calls to compound_head() and a reference to page->mapping.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 32
 ++++++++++++++++
 1 file changed, 16 insertions(+), 16 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWk-0007bb-8L
Subject: [f2fs-dev] [PATCH 18/27] f2fs: Use a folio throughout
 f2fs_truncate_inode_blocks()
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

Use f2fs_get_node_folio() to get a folio and use it throughout.  Remove a
few calls to compound_head() and a reference to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2d161ddda9c3..e1ed7ccfb690 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1130,7 +1130,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 	unsigned int nofs = 0;
 	struct f2fs_inode *ri;
 	struct dnode_of_data dn;
-	struct page *page;
+	struct folio *folio;
 
 	trace_f2fs_truncate_inode_blocks_enter(inode, from);
 
@@ -1140,16 +1140,16 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		return level;
 	}
 
-	page = f2fs_get_node_page(sbi, inode->i_ino);
-	if (IS_ERR(page)) {
-		trace_f2fs_truncate_inode_blocks_exit(inode, PTR_ERR(page));
-		return PTR_ERR(page);
+	folio = f2fs_get_node_folio(sbi, inode->i_ino);
+	if (IS_ERR(folio)) {
+		trace_f2fs_truncate_inode_blocks_exit(inode, PTR_ERR(folio));
+		return PTR_ERR(folio);
 	}
 
-	set_new_dnode(&dn, inode, page, NULL, 0);
-	unlock_page(page);
+	set_new_dnode(&dn, inode, &folio->page, NULL, 0);
+	folio_unlock(folio);
 
-	ri = F2FS_INODE(page);
+	ri = F2FS_INODE(&folio->page);
 	switch (level) {
 	case 0:
 	case 1:
@@ -1178,7 +1178,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 
 skip_partial:
 	while (cont) {
-		dn.nid = get_nid(page, offset[0], true);
+		dn.nid = get_nid(&folio->page, offset[0], true);
 		switch (offset[0]) {
 		case NODE_DIR1_BLOCK:
 		case NODE_DIR2_BLOCK:
@@ -1199,7 +1199,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 			BUG();
 		}
 		if (err == -ENOENT) {
-			set_sbi_flag(F2FS_P_SB(page), SBI_NEED_FSCK);
+			set_sbi_flag(F2FS_F_SB(folio), SBI_NEED_FSCK);
 			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			f2fs_err_ratelimited(sbi,
 				"truncate node fail, ino:%lu, nid:%u, "
@@ -1210,18 +1210,18 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		}
 		if (err < 0)
 			goto fail;
-		if (offset[1] == 0 && get_nid(page, offset[0], true)) {
-			lock_page(page);
-			BUG_ON(page->mapping != NODE_MAPPING(sbi));
-			set_nid(page, offset[0], 0, true);
-			unlock_page(page);
+		if (offset[1] == 0 && get_nid(&folio->page, offset[0], true)) {
+			folio_lock(folio);
+			BUG_ON(folio->mapping != NODE_MAPPING(sbi));
+			set_nid(&folio->page, offset[0], 0, true);
+			folio_unlock(folio);
 		}
 		offset[1] = 0;
 		offset[0]++;
 		nofs += err;
 	}
 fail:
-	f2fs_put_page(page, 0);
+	f2fs_folio_put(folio, false);
 	trace_f2fs_truncate_inode_blocks_exit(inode, err);
 	return err > 0 ? 0 : err;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
