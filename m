Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC935A76E9B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW9-0001IZ-Pi;
	Mon, 31 Mar 2025 20:13:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVm-00014O-2b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AEC9uElc6k7z4PNp3bZtWK3x4DNly3Y7bEsmJVqlP84=; b=NzW9Z62UI1cMmlUjsjeIZnD/S8
 Q6cFSnmhwzyz7/78vDGsvdRuCDcKN8aqmexk5qRezxPrvwDj3BiVbJcTLrE9FkgMfcBU56jIDWmmt
 czv5/kX9mdmnT9+2dwczNeNa9nb+s/UCH0gxEU0CA0mZM3jbGuQmPMYlOu8mKERlvQQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AEC9uElc6k7z4PNp3bZtWK3x4DNly3Y7bEsmJVqlP84=; b=JpbIlvITD4halkZCay+ApL5xsw
 dBNGxgLlxB2Ct3yQFaq0wUezRkN+CnPSUIjhHjVvecXonx0OPayzQRAFVAl1vnXzFirlJhSdAGp/5
 UtjkYeHtbf4ScCJISrBjg4zXUInpPI1tK6JKXd352HG/Y334/7DW/Uw1DG1LAZlyDfk4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVg-0003eC-SC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AEC9uElc6k7z4PNp3bZtWK3x4DNly3Y7bEsmJVqlP84=; b=v2rI1XZXUxKc2Hme/AhZJPpvCg
 mlmgvV/tENzzmrq4GzcOkEqhGefJxbhkayh9aByNwiWiuzT5KIO2EmNhfI1pxZJDub/XKK3Td+/OH
 3JWs2Q6cLlQVqGhv5g7gnlYhgn3hnGEBHKTQS0D9MVaWg/GJbEcTQwNBrW7nI92bgYyCXkhpb5xlr
 pnweymvGj3DvGvRShPhut7rIEzeYZKrKu5ugRbla8E1SPubWl1P4MdBWj+wfu7f8KW+QAe4/MphdJ
 GhS3sENZTu2ds/M8NrfF2t1g8h3+gfFOLjTDvT0EJXT+uy1/Hwz6e9dUdcln90sImzvMGOckGJPuJ
 C2IuXWQA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVV-00000004S9N-2F3N;
 Mon, 31 Mar 2025 20:13:17 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:55 +0100
Message-ID: <20250331201256.1057782-96-willy@infradead.org>
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
 Content preview: Removes a lot of conversions of folios into pages.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 8 ++++----
 fs/f2fs/f2fs.h | 6 +++--- fs/f2fs/file.c | 2 +- fs/f2fs/inline.c | 4 ++--
 fs/f2fs/node.c | 4 ++-- 5 files c [...] 
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
X-Headers-End: 1tzLVg-0003eC-SC
Subject: [f2fs-dev] [PATCH 095/153] f2fs: Pass folios to set_new_dnode()
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

Removes a lot of conversions of folios into pages.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c   | 8 ++++----
 fs/f2fs/f2fs.h   | 6 +++---
 fs/f2fs/file.c   | 2 +-
 fs/f2fs/inline.c | 4 ++--
 fs/f2fs/node.c   | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3776c1f2ad42..b728c5dbf180 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1360,7 +1360,7 @@ struct folio *f2fs_get_new_data_folio(struct inode *inode,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	set_new_dnode(&dn, inode, &ifolio->page, NULL, 0);
+	set_new_dnode(&dn, inode, ifolio, NULL, 0);
 	err = f2fs_reserve_block(&dn, index);
 	if (err) {
 		f2fs_folio_put(folio, true);
@@ -3385,7 +3385,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 		goto unlock_out;
 	}
 
-	set_new_dnode(&dn, inode, &ifolio->page, &ifolio->page, 0);
+	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
@@ -3446,7 +3446,7 @@ static int __find_data_block(struct inode *inode, pgoff_t index,
 	if (IS_ERR(ifolio))
 		return PTR_ERR(ifolio);
 
-	set_new_dnode(&dn, inode, &ifolio->page, &ifolio->page, 0);
+	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
@@ -3477,7 +3477,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 		err = PTR_ERR(ifolio);
 		goto unlock_out;
 	}
-	set_new_dnode(&dn, inode, &ifolio->page, &ifolio->page, 0);
+	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (!f2fs_lookup_read_extent_cache_block(dn.inode, index,
 						&dn.data_blkaddr))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 33a6584615bc..c2d384a7aab3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1006,12 +1006,12 @@ struct dnode_of_data {
 };
 
 static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
-		struct page *ipage, struct page *npage, nid_t nid)
+		struct folio *ifolio, struct folio *nfolio, nid_t nid)
 {
 	memset(dn, 0, sizeof(*dn));
 	dn->inode = inode;
-	dn->inode_page = ipage;
-	dn->node_page = npage;
+	dn->inode_page = &ifolio->page;
+	dn->node_page = &nfolio->page;
 	dn->nid = nid;
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f6835c0d1ce8..66c743a09756 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -787,7 +787,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out;
 	}
 
-	set_new_dnode(&dn, inode, &ifolio->page, NULL, 0);
+	set_new_dnode(&dn, inode, ifolio, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
 		if (err == -ENOENT)
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 1bc6a0d61f7e..7638854bc7d9 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -243,7 +243,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 		goto out;
 	}
 
-	set_new_dnode(&dn, inode, &ifolio->page, &ifolio->page, 0);
+	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (f2fs_has_inline_data(inode))
 		err = f2fs_convert_inline_page(&dn, &folio->page);
@@ -422,7 +422,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct folio *ifolio,
 		return PTR_ERR(folio);
 	}
 
-	set_new_dnode(&dn, dir, &ifolio->page, NULL, 0);
+	set_new_dnode(&dn, dir, ifolio, NULL, 0);
 	err = f2fs_reserve_block(&dn, 0);
 	if (err)
 		goto out;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index d1fa244c9fa7..3c8c8c8a5508 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1156,7 +1156,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		return PTR_ERR(folio);
 	}
 
-	set_new_dnode(&dn, inode, &folio->page, NULL, 0);
+	set_new_dnode(&dn, inode, folio, NULL, 0);
 	folio_unlock(folio);
 
 	ri = F2FS_INODE(&folio->page);
@@ -1252,7 +1252,7 @@ int f2fs_truncate_xattr_node(struct inode *inode)
 	if (IS_ERR(nfolio))
 		return PTR_ERR(nfolio);
 
-	set_new_dnode(&dn, inode, NULL, &nfolio->page, nid);
+	set_new_dnode(&dn, inode, NULL, nfolio, nid);
 	err = truncate_node(&dn);
 	if (err) {
 		f2fs_folio_put(nfolio, true);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
