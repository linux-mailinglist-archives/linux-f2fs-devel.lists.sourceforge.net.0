Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2DA76EB5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWS-0001Bc-4N;
	Mon, 31 Mar 2025 20:14:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVk-0000mn-EP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w4lhgjhHYkPNOdbu7ogJsOReZf18eoON05sxdko5zCM=; b=JATl2DbLo5vin2njMxY3jQ22h/
 PgWja91RdVYmsDl3XBAoxuljc9j5QtJjb6QxlyUX7fWZrMjDKpb+VWxEj045xUSkAFb154YKTbysc
 unVJuNvtqX9RGYRdREcZfs60IcrKywAipciHiLodlTpMurZ+6JMgRj3Te1HXcJmE+bmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w4lhgjhHYkPNOdbu7ogJsOReZf18eoON05sxdko5zCM=; b=YbKmh/IbhGHZ7k3eEfj6wzDRbz
 OXP+/9dLy1/iFF86AUrhYzvaY2o9gXsrgxyb8zbkurH840AsdBa5FCYOvsPsfVBO/nMDEz5xVn4A7
 XTjPO4gC3ZKEUPVjdx1hrpn6wEO4CswMXmj4nPuzto3maXw9eRk6UT9BoAtk8ulaN4pg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVf-0003dT-5t for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=w4lhgjhHYkPNOdbu7ogJsOReZf18eoON05sxdko5zCM=; b=AzArfyfA7qiWsyZici9dafewIo
 KSQ2XjjR85EORadisgHDLHTBIr97nNnnTn3ssHmocaUAkuVd6NfwsPHF87iZkkvQdsefiLfuq1rjN
 55K0QnN82O7wxEEY/vKFsKDN39ei9ivwB+WSF01gYZ7RFRxQZVqHMgL5S2CHs/7cV2fwbpb0CNGN1
 o1nTpbtd6RefYEup6jl7WyRwJIDFF6eBUHgxsku/FCmlx/9yUNJq6FMgfi9Rpidi4xlbNoqGAaXMC
 1CODL+z3wzdLjoyldHKbm5motxsGo2Ar6Ch8LZillGN4pcEK4BpwNkh/+d1lb3bA4fGMquS6g5FiT
 I1VmUwIw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVT-00000004S27-2Id4;
 Mon, 31 Mar 2025 20:13:15 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:47 +0100
Message-ID: <20250331201256.1057782-88-willy@infradead.org>
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
 Content preview:  Since this is the only caller of f2fs_new_inode_page(),
 convert
 that to return a folio at the same time. Removes four calls to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/dir.c
 | 37 +++++++++++++++++++ fs/f2fs/f2fs.h | 2 +- fs/f2fs/node.c | 8 ++++----
 3 files changed, 24 insertio [...] 
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
X-Headers-End: 1tzLVf-0003dT-5t
Subject: [f2fs-dev] [PATCH 087/153] f2fs: Use a folio in
 f2fs_init_inode_metadata()
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

Since this is the only caller of f2fs_new_inode_page(), convert that
to return a folio at the same time.  Removes four calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c  | 37 +++++++++++++++++++------------------
 fs/f2fs/f2fs.h |  2 +-
 fs/f2fs/node.c |  8 ++++----
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 2cc4ad636290..aa8aafb6e332 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -517,46 +517,47 @@ static int make_empty_dir(struct inode *inode,
 struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			const struct f2fs_filename *fname, struct page *dpage)
 {
-	struct page *page;
+	struct folio *folio;
 	int err;
 
 	if (is_inode_flag_set(inode, FI_NEW_INODE)) {
-		page = f2fs_new_inode_page(inode);
-		if (IS_ERR(page))
-			return page;
+		folio = f2fs_new_inode_folio(inode);
+		if (IS_ERR(folio))
+			return &folio->page;
 
 		if (S_ISDIR(inode->i_mode)) {
 			/* in order to handle error case */
-			get_page(page);
-			err = make_empty_dir(inode, dir, page);
+			folio_get(folio);
+			err = make_empty_dir(inode, dir, &folio->page);
 			if (err) {
-				lock_page(page);
+				folio_lock(folio);
 				goto put_error;
 			}
-			put_page(page);
+			folio_put(folio);
 		}
 
-		err = f2fs_init_acl(inode, dir, page, dpage);
+		err = f2fs_init_acl(inode, dir, &folio->page, dpage);
 		if (err)
 			goto put_error;
 
 		err = f2fs_init_security(inode, dir,
-					 fname ? fname->usr_fname : NULL, page);
+					 fname ? fname->usr_fname : NULL,
+					 &folio->page);
 		if (err)
 			goto put_error;
 
 		if (IS_ENCRYPTED(inode)) {
-			err = fscrypt_set_context(inode, page);
+			err = fscrypt_set_context(inode, folio);
 			if (err)
 				goto put_error;
 		}
 	} else {
-		page = f2fs_get_inode_page(F2FS_I_SB(dir), inode->i_ino);
-		if (IS_ERR(page))
-			return page;
+		folio = f2fs_get_inode_folio(F2FS_I_SB(dir), inode->i_ino);
+		if (IS_ERR(folio))
+			return &folio->page;
 	}
 
-	init_dent_inode(dir, inode, fname, page);
+	init_dent_inode(dir, inode, fname, &folio->page);
 
 	/*
 	 * This file should be checkpointed during fsync.
@@ -573,12 +574,12 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			f2fs_remove_orphan_inode(F2FS_I_SB(dir), inode->i_ino);
 		f2fs_i_links_write(inode, true);
 	}
-	return page;
+	return &folio->page;
 
 put_error:
 	clear_nlink(inode);
-	f2fs_update_inode(inode, page);
-	f2fs_put_page(page, 1);
+	f2fs_update_inode(inode, &folio->page);
+	f2fs_folio_put(folio, true);
 	return ERR_PTR(err);
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9fd4640f67bf..192e49208a56 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3726,7 +3726,7 @@ int f2fs_truncate_xattr_node(struct inode *inode);
 int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 					unsigned int seq_id);
 int f2fs_remove_inode_page(struct inode *inode);
-struct page *f2fs_new_inode_page(struct inode *inode);
+struct folio *f2fs_new_inode_folio(struct inode *inode);
 struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs);
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
 struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 5fb4f9c3c20f..cc4c3ba98140 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1312,15 +1312,15 @@ int f2fs_remove_inode_page(struct inode *inode)
 	return 0;
 }
 
-struct page *f2fs_new_inode_page(struct inode *inode)
+struct folio *f2fs_new_inode_folio(struct inode *inode)
 {
 	struct dnode_of_data dn;
 
 	/* allocate inode page for new inode */
 	set_new_dnode(&dn, inode, NULL, NULL, inode->i_ino);
 
-	/* caller should f2fs_put_page(page, 1); */
-	return f2fs_new_node_page(&dn, 0);
+	/* caller should f2fs_folio_put(folio, true); */
+	return f2fs_new_node_folio(&dn, 0);
 }
 
 struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs)
@@ -2369,7 +2369,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
 		 *                          - __lookup_nat_cache
 		 *  - f2fs_add_link
 		 *   - f2fs_init_inode_metadata
-		 *    - f2fs_new_inode_page
+		 *    - f2fs_new_inode_folio
 		 *     - f2fs_new_node_page
 		 *      - set_node_addr
 		 *  - f2fs_alloc_nid_done
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
