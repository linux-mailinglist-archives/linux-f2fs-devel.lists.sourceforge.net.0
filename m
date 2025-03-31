Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43CA76E5F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVs-0005lI-Fr;
	Mon, 31 Mar 2025 20:13:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVe-0005bQ-GS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=16jMHBPofU8TWpnss4YJF9ORWAggeCzBFHCY6z5XQpI=; b=ehFMjqSIYxZDzZSrthVU0T4bXN
 P2yJ811zeRDyLkKwYUqsxh10nKNQ/aRw0V8z6aAM06gcqViZgtpwQ2/BRVwtbRiaVK9nVecsk6siw
 WrSfNyYJqo6mPcLJA6oy9KOBhzrRASzskHhXMg5g8qrGZyv/2/trhJpBuppxj0LQB7iE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=16jMHBPofU8TWpnss4YJF9ORWAggeCzBFHCY6z5XQpI=; b=IlTFUcF5qId/R2BgA/feoahKcs
 nxCIPJgT8k6jjpVPanjFJRQ+bzIBIOzXCoYmrQXQe8ZlU9WTgxHcASu1JSa9SQg0LSzdQadThhGD0
 OhEPOoaZkgipmLHqCy3LPdm3ddAwmAnceDZ/C8+v2/twzm4l1+j48Xy8/jieDXxc66Ww=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVY-0003aj-80 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=16jMHBPofU8TWpnss4YJF9ORWAggeCzBFHCY6z5XQpI=; b=X3/653+taz3Bgu4A8ym0KETHa9
 G8VImD4VsHavK2rgz6fU+ZLfrjhjM498BWFM4lhfQ8vwKS3VHZV+xOD38WbfPHVhYG2BBn9wEFYyo
 Neq70lXzHW6DaNAerVSutIC3Y27VjfLopmFrYH7Mc+gOyQLhT73w6QcATtkkWupmSzRKwIm923ati
 lJmSG1f6FIpIxW07XVjIsxEbAZES9dIxDuzXq2d/kBBjJoxwbq128eSZ0F1a0S1WJYt2YHRLseBin
 g17hMSUbNH6v5mhrvP2dk2eX0Yq1BPd7u9CaYdH+CiQOlpDWyZqKRM7qgFJTpfYX9BQOD3STfLu6q
 m8X2l+xw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVM-00000004RlP-3bPT;
 Mon, 31 Mar 2025 20:13:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:12 +0100
Message-ID: <20250331201256.1057782-53-willy@infradead.org>
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
 Content preview: Removes five hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/file.c | 28
 ++++++++++++++
 1 file changed, 14 insertions(+), 14 deletions(-) 
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
X-Headers-End: 1tzLVY-0003aj-80
Subject: [f2fs-dev] [PATCH 052/153] f2fs: Use a folio in __clone_blkaddrs()
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

Removes five hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/file.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 25f69a308dde..5529b740c37f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1410,26 +1410,26 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 
 			f2fs_put_dnode(&dn);
 		} else {
-			struct page *psrc, *pdst;
+			struct folio *fsrc, *fdst;
 
-			psrc = f2fs_get_lock_data_page(src_inode,
+			fsrc = f2fs_get_lock_data_folio(src_inode,
 							src + i, true);
-			if (IS_ERR(psrc))
-				return PTR_ERR(psrc);
-			pdst = f2fs_get_new_data_page(dst_inode, NULL, dst + i,
+			if (IS_ERR(fsrc))
+				return PTR_ERR(fsrc);
+			fdst = f2fs_get_new_data_folio(dst_inode, NULL, dst + i,
 								true);
-			if (IS_ERR(pdst)) {
-				f2fs_put_page(psrc, 1);
-				return PTR_ERR(pdst);
+			if (IS_ERR(fdst)) {
+				f2fs_folio_put(fsrc, true);
+				return PTR_ERR(fdst);
 			}
 
-			f2fs_wait_on_page_writeback(pdst, DATA, true, true);
+			f2fs_folio_wait_writeback(fdst, DATA, true, true);
 
-			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
-			set_page_dirty(pdst);
-			set_page_private_gcing(pdst);
-			f2fs_put_page(pdst, 1);
-			f2fs_put_page(psrc, 1);
+			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
+			folio_mark_dirty(fdst);
+			set_page_private_gcing(&fdst->page);
+			f2fs_folio_put(fdst, true);
+			f2fs_folio_put(fsrc, true);
 
 			ret = f2fs_truncate_hole(src_inode,
 						src + i, src + i + 1);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
