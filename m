Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C46A76ECE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWZ-0001Lw-4l;
	Mon, 31 Mar 2025 20:14:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVy-0000xO-06
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9Ywoi66NKRGsjALdt5s+FPpyk6IgZN79WPWPbJZFDQ=; b=gjBsre27/w2dIxzwBcBqNIgF78
 K8t3jFOzrweEuNydIeMfsfAzJdBH/g6LmeXUN66q3d3C2qqm5SO8yfJ6VeBVb203k+CGGqGSVnOyL
 xRcSrHhcDMoDxAuXudoiE0CUuCe0IkbvgyIJj8+AJf2Lc0432BrmYqmFNDAt9Z+9Pxhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N9Ywoi66NKRGsjALdt5s+FPpyk6IgZN79WPWPbJZFDQ=; b=YYJ6AVukU5N2FUKOSidYxFVRrh
 2KNUi6uZFsfTkCihmkuvnuUehyRkTqq0CgE2o9pCwXmSYWQSQgnkSPp6/WdTYm/S1OOicWgoBHevF
 ipdDyYbnr6zgYjtYZmFa2xp5xT7235q4PM0oSM0nph+MzeTjyH0Xikk1gQB4HdwwguG0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVn-0003hi-Rd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=N9Ywoi66NKRGsjALdt5s+FPpyk6IgZN79WPWPbJZFDQ=; b=aiM4QJCpPvB8pelq1+nORdk6NK
 8DxbiHAHP0j5IG708ta6IIIJWtugiXv9wkBcVx4WuLF2uZ5iP4nemKdUn960ez7B/rXkBucwpM4aQ
 u3YWIV/edWMBay+7x2oRyiqyF3EkoXvTe9Hy4abMFrFTDrR2Mtoz/Zo07Z7nKmh1Fnmg5ASHOpVdt
 1Moop9Zo+st1wwme71TRFYHZD/cXMUgLv1Qu7IGkvzh96wW1uscEuq06WS5+srzK5AsWv93kxCYqY
 EM05vHzF5Qge2fUrV1M+SHrfI2F8z5BEtiEO8lWjLSwxov+v2RcxDOzCCQcNPELzrC+40wwwCQfPh
 woJwh6Wg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVc-00000004Sa1-0zCK;
 Mon, 31 Mar 2025 20:13:24 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:36 +0100
Message-ID: <20250331201256.1057782-137-willy@infradead.org>
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
 Content preview: Fetch a folio from the pagecache instead of a page. Removes
 two calls to compound_head() Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/file.c | 7 ++++--- 1 file changed, 4 insertions(+), 3 deletions(-)
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
X-Headers-End: 1tzLVn-0003hi-Rd
Subject: [f2fs-dev] [PATCH 136/153] f2fs: Use a folio in
 need_inode_page_update()
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

Fetch a folio from the pagecache instead of a page.  Removes two
calls to compound_head()

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/file.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8f1adaa9f90a..382ab04a75c3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -226,12 +226,13 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
 
 static bool need_inode_page_update(struct f2fs_sb_info *sbi, nid_t ino)
 {
-	struct page *i = find_get_page(NODE_MAPPING(sbi), ino);
+	struct folio *i = filemap_get_folio(NODE_MAPPING(sbi), ino);
 	bool ret = false;
 	/* But we need to avoid that there are some inode updates */
-	if ((i && PageDirty(i)) || f2fs_need_inode_block_update(sbi, ino))
+	if ((!IS_ERR(i) && folio_test_dirty(i)) ||
+	    f2fs_need_inode_block_update(sbi, ino))
 		ret = true;
-	f2fs_put_page(i, 0);
+	f2fs_folio_put(i, false);
 	return ret;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
