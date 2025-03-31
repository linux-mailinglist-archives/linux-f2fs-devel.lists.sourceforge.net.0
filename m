Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6901A76EA5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWD-0001Ne-Tm;
	Mon, 31 Mar 2025 20:14:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVp-00016H-Jk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/zzvq3jbvOiGEkja1N1WEQ+r2B7GJw9xac34YxWH4s=; b=bf4RotT17RkGzWA6HpGn5IWL/b
 +RI/xSP/QTVtYr+kA/9eYYXSEPbJPkXNXCf7OixQ53WHU/SCZ/iwUFAUibjxt8T2SeA+FPTHvmoDN
 DqFkW3TrfDN8LuzPjrqBt6+I+Ct1a2E5WUlWUfDo0X1YZzVExCe1DpF38Yo/dZO6a/RY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2/zzvq3jbvOiGEkja1N1WEQ+r2B7GJw9xac34YxWH4s=; b=MBF/Jc4uyX6FNkm+Tc+U1iqCcV
 w5BjrXggGBq5M1W2BktunyicDd+siFnm1r3ypFWCieAPTYnopq+matavBc1OS9GJM+mi2T/321NFl
 MTbkNlvC7eDnK2Rjpvqzt9mfDrJ1/x8wsB504E3SnZXAA82h/CInW64us7P/bmmoOZWQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVk-0003g7-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=2/zzvq3jbvOiGEkja1N1WEQ+r2B7GJw9xac34YxWH4s=; b=U0Iv9rfE0Z27Ixay8uUwpq6ChK
 aas7jfK1PheGSEi4fudCZ3DfaA/AHIkAF4I0lVxkBMkLyE/486P7o55rGVHHBe+CkGVCbThbIfHTd
 yS6e37dDP7NZi5qIBEh4auYIS+Z9aRP3aibsGTBf+OJXQaxjqZKpigX4VR3luOsqdvOlW9v8LEPxK
 0TJoQnMF7+nriDIMfi9JBY8Gb4X7wyvQFqagAo2GIc4zcPiR7ZtVN6U3+2xqyzEVO7wjJ/TjISrUv
 dGm01PbcSyT+X4cS4IOt0+s2rDc63PGu59yBb65ZE4KEVZdGDW7lrs9sQybRvKNgmlQseYet1sJB2
 05XwPGTg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVe-00000004Sdb-1geA;
 Mon, 31 Mar 2025 20:13:26 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:49 +0100
Message-ID: <20250331201256.1057782-150-willy@infradead.org>
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
 Content preview: All callers except __get_inode_rdev() and __set_inode_rdev()
 now have a folio, but the only callers of those two functions do have a folio, 
 so pass the folio to them and then into get_dnode_addr(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 2 +-
 fs/f2fs/f2fs.h
 | 10 +++++----- fs/f2fs/file.c | 2 +- fs/f2fs/inode.c | 12 ++++++------ 4
 files changed, 13 insert [...] 
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
X-Headers-End: 1tzLVk-0003g7-Mp
Subject: [f2fs-dev] [PATCH 149/153] f2fs: Pass a folio to get_dnode_addr()
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

All callers except __get_inode_rdev() and __set_inode_rdev() now have a
folio, but the only callers of those two functions do have a folio, so
pass the folio to them and then into get_dnode_addr().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c  |  2 +-
 fs/f2fs/f2fs.h  | 10 +++++-----
 fs/f2fs/file.c  |  2 +-
 fs/f2fs/inode.c | 12 ++++++------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f7f5f7bb8ed5..96afaf962fd0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1117,7 +1117,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct folio *folio,
 
 static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
-	__le32 *addr = get_dnode_addr(dn->inode, &dn->node_folio->page);
+	__le32 *addr = get_dnode_addr(dn->inode, dn->node_folio);
 
 	dn->data_blkaddr = blkaddr;
 	addr[dn->ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 466462168429..2ab1ff3dd4cb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3019,16 +3019,16 @@ static inline unsigned int get_dnode_base(struct inode *inode,
 }
 
 static inline __le32 *get_dnode_addr(struct inode *inode,
-					struct page *node_page)
+					struct folio *node_folio)
 {
-	return blkaddr_in_node(F2FS_NODE(node_page)) +
-			get_dnode_base(inode, node_page);
+	return blkaddr_in_node(F2FS_NODE(&node_folio->page)) +
+			get_dnode_base(inode, &node_folio->page);
 }
 
 static inline block_t data_blkaddr(struct inode *inode,
 			struct folio *node_folio, unsigned int offset)
 {
-	return le32_to_cpu(*(get_dnode_addr(inode, &node_folio->page) + offset));
+	return le32_to_cpu(*(get_dnode_addr(inode, node_folio) + offset));
 }
 
 static inline block_t f2fs_data_blkaddr(struct dnode_of_data *dn)
@@ -3395,7 +3395,7 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 
 static inline void *inline_data_addr(struct inode *inode, struct folio *folio)
 {
-	__le32 *addr = get_dnode_addr(inode, &folio->page);
+	__le32 *addr = get_dnode_addr(inode, folio);
 
 	return (void *)(addr + DEF_INLINE_RESERVED_SIZE);
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e4548d508527..401feb951a8b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -625,7 +625,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	block_t blkstart;
 	int blklen = 0;
 
-	addr = get_dnode_addr(dn->inode, &dn->node_folio->page) + ofs;
+	addr = get_dnode_addr(dn->inode, dn->node_folio) + ofs;
 	blkstart = le32_to_cpu(*addr);
 
 	/* Assumption: truncation starts with cluster */
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 201e3d2a9adf..b5f60373f6f6 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -66,9 +66,9 @@ void f2fs_set_inode_flags(struct inode *inode)
 			S_ENCRYPTED|S_VERITY|S_CASEFOLD);
 }
 
-static void __get_inode_rdev(struct inode *inode, struct page *node_page)
+static void __get_inode_rdev(struct inode *inode, struct folio *node_folio)
 {
-	__le32 *addr = get_dnode_addr(inode, node_page);
+	__le32 *addr = get_dnode_addr(inode, node_folio);
 
 	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode) ||
 			S_ISFIFO(inode->i_mode) || S_ISSOCK(inode->i_mode)) {
@@ -79,9 +79,9 @@ static void __get_inode_rdev(struct inode *inode, struct page *node_page)
 	}
 }
 
-static void __set_inode_rdev(struct inode *inode, struct page *node_page)
+static void __set_inode_rdev(struct inode *inode, struct folio *node_folio)
 {
-	__le32 *addr = get_dnode_addr(inode, node_page);
+	__le32 *addr = get_dnode_addr(inode, node_folio);
 
 	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode)) {
 		if (old_valid_dev(inode->i_rdev)) {
@@ -481,7 +481,7 @@ static int do_read_inode(struct inode *inode)
 	}
 
 	/* get rdev by using inline_info */
-	__get_inode_rdev(inode, &node_folio->page);
+	__get_inode_rdev(inode, node_folio);
 
 	if (!f2fs_need_inode_block_update(sbi, inode->i_ino))
 		fi->last_disk_size = inode->i_size;
@@ -737,7 +737,7 @@ void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 		}
 	}
 
-	__set_inode_rdev(inode, &node_folio->page);
+	__set_inode_rdev(inode, node_folio);
 
 	/* deleted inode */
 	if (inode->i_nlink == 0)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
