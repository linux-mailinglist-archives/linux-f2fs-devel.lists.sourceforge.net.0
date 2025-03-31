Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A55A76E70
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVw-0005p2-5l;
	Mon, 31 Mar 2025 20:13:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVh-0005db-R6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CjWcl2ak8ttgTije07aMvotgBR18Ib1ylsuD/JJiS9Q=; b=jHt3CxxTMV1QABJvXuq3Q76c5h
 7BshLETxDBIw40UhKA2StHXfZXUoizAHoNt3xnZEdn5gTRciqn5mpKgJtWPDGgP5Oxxu9qGfPKELV
 ztNWJpuO7V76NaVlxi5vZ6gG8Rl/Fur6RhCG9tI7TYEgySTi0Z27fTdPQ+phr13wsKWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CjWcl2ak8ttgTije07aMvotgBR18Ib1ylsuD/JJiS9Q=; b=Mu/502hQZT4FyvVlgGokhKOuxy
 5xS4nBaDQraEfBD3hobt5Z6TSHWJY0dKJCBK7KPZEUuD6K/Yryq83nQIbL3j7cpOd2+dnpx/rIuEh
 y1AtSWzN3L8eXMZzlX6p5a6OXocxQ1Dt2og234pDZflrEqjYcL9xrfB5mBW9TEqVyOjQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVW-0003a3-Fb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=CjWcl2ak8ttgTije07aMvotgBR18Ib1ylsuD/JJiS9Q=; b=sle7u5n4OXOt1pD8LjGxEjjLzx
 VO8rJUADUIWXfiCLi1BcdbAogCjjiwzSHtGkow8vwu8I7vt3b46BrBNK6JYFd5JlCiAscBellpP8m
 Hp12Rph6V/7V6FthN9nW8Bl2clT7L2jucrWPEpaeCVPfzUP6NGNzMOJ4C678+ag4SBiFoGcT1/yHo
 qS5bFvlnnJeWhBRECYLXfVp4lf6PmrOpwbZ5MjJQ4b5mrwbDReR/1d9kOAhMjqwD35QY+ltvXkrlg
 trV10F+w3otdDaLRGEgiCDLTQt5LdRUL/iRnEUrjEtPuugJ+HS1fYo8EZNQAYZJgWNpxZtpoLolqz
 1mDhEKhg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVQ-00000004Rtx-0K2Y;
 Mon, 31 Mar 2025 20:13:12 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:31 +0100
Message-ID: <20250331201256.1057782-72-willy@infradead.org>
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
 Content preview: Removes three hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/xattr.c | 22
 +++++++++++ 1 file changed, 11 insertions(+), 11 deletions(-) 
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
X-Headers-End: 1tzLVW-0003a3-Fb
Subject: [f2fs-dev] [PATCH 071/153] f2fs: Use a folio in write_all_xattrs()
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

Removes three hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/xattr.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index c691b35618ad..d58b1e44e133 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -436,7 +436,7 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 	struct page *in_page = NULL;
 	void *xattr_addr;
 	void *inline_addr = NULL;
-	struct page *xpage;
+	struct folio *xfolio;
 	nid_t new_nid = 0;
 	int err = 0;
 
@@ -475,27 +475,27 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 
 	/* write to xattr node block */
 	if (F2FS_I(inode)->i_xattr_nid) {
-		xpage = f2fs_get_xnode_page(sbi, F2FS_I(inode)->i_xattr_nid);
-		if (IS_ERR(xpage)) {
-			err = PTR_ERR(xpage);
+		xfolio = f2fs_get_xnode_folio(sbi, F2FS_I(inode)->i_xattr_nid);
+		if (IS_ERR(xfolio)) {
+			err = PTR_ERR(xfolio);
 			f2fs_alloc_nid_failed(sbi, new_nid);
 			goto in_page_out;
 		}
 		f2fs_bug_on(sbi, new_nid);
-		f2fs_wait_on_page_writeback(xpage, NODE, true, true);
+		f2fs_folio_wait_writeback(xfolio, NODE, true, true);
 	} else {
 		struct dnode_of_data dn;
 
 		set_new_dnode(&dn, inode, NULL, NULL, new_nid);
-		xpage = f2fs_new_node_page(&dn, XATTR_NODE_OFFSET);
-		if (IS_ERR(xpage)) {
-			err = PTR_ERR(xpage);
+		xfolio = f2fs_new_node_folio(&dn, XATTR_NODE_OFFSET);
+		if (IS_ERR(xfolio)) {
+			err = PTR_ERR(xfolio);
 			f2fs_alloc_nid_failed(sbi, new_nid);
 			goto in_page_out;
 		}
 		f2fs_alloc_nid_done(sbi, new_nid);
 	}
-	xattr_addr = page_address(xpage);
+	xattr_addr = folio_address(xfolio);
 
 	if (inline_size)
 		memcpy(inline_addr, txattr_addr, inline_size);
@@ -503,9 +503,9 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
 
 	if (inline_size)
 		set_page_dirty(ipage ? ipage : in_page);
-	set_page_dirty(xpage);
+	folio_mark_dirty(xfolio);
 
-	f2fs_put_page(xpage, 1);
+	f2fs_folio_put(xfolio, true);
 in_page_out:
 	f2fs_put_page(in_page, 1);
 	return err;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
