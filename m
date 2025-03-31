Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB8A76E4E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVl-0000o5-P2;
	Mon, 31 Mar 2025 20:13:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVX-0000k5-51
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FCjjMbNLAipxNvWNWGjN8QEju/bcuQ4TMldMCjMajbM=; b=YnH9I4/qR20Vu6b03DfgVYlOPC
 WE3zywSBE1zr2vEIiGTJby6xodM0/rzhgKvkSlb5rRjxDBDPqUauyDpMbZS9m3IX4FJ4t4C0qbLmf
 iShWilO4UZY2Xy9siiBtl9zZzuz7Co/sbqe1Eqdy459Zr1quuDitRfCZHgLUpt/rxmP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FCjjMbNLAipxNvWNWGjN8QEju/bcuQ4TMldMCjMajbM=; b=MS8pHScIMW+d1WgeuDmPsCSZvV
 EczjOwj5IVXQ45uYqQ6FY3mIUbRE2lUplTesP1Oce/yHCj6asVtZX6MeL0OLN5qQ/Yt++j7cnVBBV
 MusXwC7pTAhi6Q1Eq5tz0Lo8V+HDG4PkrrPUVZiBEqrydiZU4o0kRmSuXdWqeM/LUnW4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVR-0003Yn-UD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FCjjMbNLAipxNvWNWGjN8QEju/bcuQ4TMldMCjMajbM=; b=Sz77p1I5eM5u0qFYkDYq8fGX/W
 QrLrNXOGIG2WYt4yht7gEQ+00ltPPI4beMScyYbdG2YfmpC0Nces8FVip8EeQkMyoeM4Epft9aUEw
 xlPXnC6EU1Guvdmje/2QYKdGXtuBZrIJPOwJdRZyWdP/6XC449vhfwKA86YJSC9hN9Ao058LFG83M
 ByAEutsuz4rVt4pBuaWVy29+sECAmCcsTUKksGhPRx8UDx+Q/NDvkt6kqVQdYuBCAaIg1W1YFIVif
 zD7qvLZrWqOuRNzwhjTKL3MiDTZhK5x7S8El8xvamvb/gIVC90zv+qu3hifK4LdtQx+Sakp7u9cL3
 +R4kT9mQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVL-00000004Rgg-29Vx;
 Mon, 31 Mar 2025 20:13:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:04 +0100
Message-ID: <20250331201256.1057782-45-willy@infradead.org>
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
 Content preview: Get a folio instead of a page and use it throughout. Removes
 a call to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 20 ++++++++++ 1 file changed, 10 insertions(+),
 10 deletions(-)
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
X-Headers-End: 1tzLVR-0003Yn-UD
Subject: [f2fs-dev] [PATCH 044/153] f2fs: Use a folio in find_in_level()
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

Get a folio instead of a page and use it throughout.  Removes a
call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 5a63ff0df03b..f2dd3c159e28 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -173,7 +173,7 @@ static unsigned long dir_block_index(unsigned int level,
 }
 
 static struct f2fs_dir_entry *find_in_block(struct inode *dir,
-				struct page *dentry_page,
+				struct folio *dentry_folio,
 				const struct f2fs_filename *fname,
 				int *max_slots,
 				bool use_hash)
@@ -181,7 +181,7 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 	struct f2fs_dentry_block *dentry_blk;
 	struct f2fs_dentry_ptr d;
 
-	dentry_blk = (struct f2fs_dentry_block *)page_address(dentry_page);
+	dentry_blk = folio_address(dentry_folio);
 
 	make_dentry_ptr_block(dir, &d, dentry_blk);
 	return f2fs_find_target_dentry(&d, fname, max_slots, use_hash);
@@ -266,7 +266,6 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
 	unsigned int nbucket, nblock;
 	unsigned int bidx, end_block, bucket_no;
-	struct page *dentry_page;
 	struct f2fs_dir_entry *de = NULL;
 	pgoff_t next_pgofs;
 	bool room = false;
@@ -284,31 +283,32 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
 
 	while (bidx < end_block) {
 		/* no need to allocate new dentry pages to all the indices */
-		dentry_page = f2fs_find_data_page(dir, bidx, &next_pgofs);
-		if (IS_ERR(dentry_page)) {
-			if (PTR_ERR(dentry_page) == -ENOENT) {
+		struct folio *dentry_folio;
+		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_pgofs);
+		if (IS_ERR(dentry_folio)) {
+			if (PTR_ERR(dentry_folio) == -ENOENT) {
 				room = true;
 				bidx = next_pgofs;
 				continue;
 			} else {
-				*res_page = dentry_page;
+				*res_page = &dentry_folio->page;
 				break;
 			}
 		}
 
-		de = find_in_block(dir, dentry_page, fname, &max_slots, use_hash);
+		de = find_in_block(dir, dentry_folio, fname, &max_slots, use_hash);
 		if (IS_ERR(de)) {
 			*res_page = ERR_CAST(de);
 			de = NULL;
 			break;
 		} else if (de) {
-			*res_page = dentry_page;
+			*res_page = &dentry_folio->page;
 			break;
 		}
 
 		if (max_slots >= s)
 			room = true;
-		f2fs_put_page(dentry_page, 0);
+		f2fs_folio_put(dentry_folio, false);
 
 		bidx++;
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
