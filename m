Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF4A76EBF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWW-0006DH-Fi;
	Mon, 31 Mar 2025 20:14:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVr-0005kc-7O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVORP6AxWRIzgXStiCsFZWehSHKQ5Kv27kl0dAztshg=; b=DQUxzKbgdf9+/vjddL7Ci8gCsH
 9oJlTJNWNMJN9Cz2iD+LPfWd2v1LQ/WqHAiyiu3rIQAuUcRU4MzwpAZsjRJ5LRkzIHjN54KWNuet+
 w9mTQUvl/LLHcsqEfLiL8cDmHZVDJiHHwIAM9Fg3pl+NvuUCHax28P2rDbhYNbMmWLRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mVORP6AxWRIzgXStiCsFZWehSHKQ5Kv27kl0dAztshg=; b=Rlffw2znjJfBq/VCgalDjMM/MA
 a2Bsv4SjtVyg7s/xaB2e+UKSxIYOx8u6sHXg/K0k6AapIEwgQyPjqYSHfeIbqtaDCGLTQ7hAq4Din
 6s2gzqy8eenICzCAQKNL4LktXZipk3/rT7wxpvzDACc7YLgapF/zWMm60TVUkFyMYwZc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVf-0003db-HB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mVORP6AxWRIzgXStiCsFZWehSHKQ5Kv27kl0dAztshg=; b=UgY32SkA3zUr8ChU19KcrdBC/z
 yHahOIV5is6vUHASlZGP2XRfPNCLsAespKkD3haR921tSPh4prMk+FHT67V5dV9J10G3whlAhj5aM
 fG025oAJTRKly6C0nGJwTGfgzMycZVsOGU2Vef9SWXqyXzONzWYqkC8UO4BJIZcAxzzWdzd0VhLhe
 Hwes9zCdWg7O2sxlMapEsH5zbunkaoxQlwGoPw4NIIgJC8zp5NhR7ZfnmrP1TQpwTSM3RH5v/0PlA
 ikfwC0Ocyw5HjoTuoDSyQav8QKg18Z/ESQOwGgBswXdlBY+cuHxYbdjVxob9+eaFmyaruIfbIWKpI
 1b+s87ZQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVZ-00000004SRA-0dOo;
 Mon, 31 Mar 2025 20:13:21 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:17 +0100
Message-ID: <20250331201256.1057782-118-willy@infradead.org>
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
 Content preview: Push the page conversion into do_recover_data().
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/recovery.c | 30
 +++++++++++++++ 1 file changed, 15 insertions(+), 15 deletions(-) 
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
X-Headers-End: 1tzLVf-0003db-HB
Subject: [f2fs-dev] [PATCH 117/153] f2fs: Pass a folio to do_recover_data()
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

Push the page conversion into do_recover_data().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/recovery.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index dd69ff5b7661..8f8a6b2331a6 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -620,7 +620,7 @@ static int f2fs_reserve_new_block_retry(struct dnode_of_data *dn)
 }
 
 static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
-					struct page *page)
+					struct folio *folio)
 {
 	struct dnode_of_data dn;
 	struct node_info ni;
@@ -628,19 +628,19 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	int err = 0, recovered = 0;
 
 	/* step 1: recover xattr */
-	if (IS_INODE(page)) {
-		err = f2fs_recover_inline_xattr(inode, page);
+	if (IS_INODE(&folio->page)) {
+		err = f2fs_recover_inline_xattr(inode, &folio->page);
 		if (err)
 			goto out;
-	} else if (f2fs_has_xattr_block(ofs_of_node(page))) {
-		err = f2fs_recover_xattr_data(inode, page);
+	} else if (f2fs_has_xattr_block(ofs_of_node(&folio->page))) {
+		err = f2fs_recover_xattr_data(inode, &folio->page);
 		if (!err)
 			recovered++;
 		goto out;
 	}
 
 	/* step 2: recover inline data */
-	err = f2fs_recover_inline_data(inode, page);
+	err = f2fs_recover_inline_data(inode, &folio->page);
 	if (err) {
 		if (err == 1)
 			err = 0;
@@ -648,8 +648,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	}
 
 	/* step 3: recover data indices */
-	start = f2fs_start_bidx_of_node(ofs_of_node(page), inode);
-	end = start + ADDRS_PER_PAGE(page, inode);
+	start = f2fs_start_bidx_of_node(ofs_of_node(&folio->page), inode);
+	end = start + ADDRS_PER_PAGE(&folio->page, inode);
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
 retry_dn:
@@ -668,12 +668,12 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	if (err)
 		goto err;
 
-	f2fs_bug_on(sbi, ni.ino != ino_of_node(page));
+	f2fs_bug_on(sbi, ni.ino != ino_of_node(&folio->page));
 
-	if (ofs_of_node(dn.node_page) != ofs_of_node(page)) {
+	if (ofs_of_node(dn.node_page) != ofs_of_node(&folio->page)) {
 		f2fs_warn(sbi, "Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
 			  inode->i_ino, ofs_of_node(dn.node_page),
-			  ofs_of_node(page));
+			  ofs_of_node(&folio->page));
 		err = -EFSCORRUPTED;
 		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
 		goto err;
@@ -683,7 +683,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		block_t src, dest;
 
 		src = f2fs_data_blkaddr(&dn);
-		dest = data_blkaddr(dn.inode, page, dn.ofs_in_node);
+		dest = data_blkaddr(dn.inode, &folio->page, dn.ofs_in_node);
 
 		if (__is_valid_data_blkaddr(src) &&
 			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
@@ -758,9 +758,9 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		}
 	}
 
-	copy_node_footer(dn.node_page, page);
+	copy_node_footer(dn.node_page, &folio->page);
 	fill_node_footer(dn.node_page, dn.nid, ni.ino,
-					ofs_of_node(page), false);
+					ofs_of_node(&folio->page), false);
 	set_page_dirty(dn.node_page);
 err:
 	f2fs_put_dnode(&dn);
@@ -823,7 +823,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				break;
 			}
 		}
-		err = do_recover_data(sbi, entry->inode, &folio->page);
+		err = do_recover_data(sbi, entry->inode, folio);
 		if (err) {
 			f2fs_folio_put(folio, true);
 			break;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
