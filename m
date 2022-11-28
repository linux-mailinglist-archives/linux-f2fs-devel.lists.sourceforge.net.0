Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23463A48F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFK-00015n-0e;
	Mon, 28 Nov 2022 09:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaEt-00014U-P9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QbGMdOOv9q/Fwzcd4ZiwUX+NrDp8nhul+TwqlVY4WZE=; b=Yh4qhCPpQ0mk/j7uPzwrpnJybo
 fCIde+3lXTPy7I5MU60nNL6lZ6eJ4V6GPK5iqG16/dIK7PmXnn7VWrptqu86m/GWMwqO5d71t9Txi
 IcnQDfmEPmXjGSs7i5EcitGWZMiGFOzj1qBxdAPu2LHVh/+0fILLhAUKXjWqxEdS2hSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QbGMdOOv9q/Fwzcd4ZiwUX+NrDp8nhul+TwqlVY4WZE=; b=ETrczc8ZtT+00bEOttBzYxj4vS
 sy3Tv79bvxMslet66OyuJaOg2UhVG5nQD8G+6IZFHeJ2QAUR83TaFV4+mV+1JEtV1EFjv7VAInrJ8
 3yihsg2V+xJSROBjcEaMHbYdXgpt6sWVCG9wTpPkQCy5+kzqMISHXAmFx1trSf3lNMJ8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEt-00GRQy-5i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QbGMdOOv9q/Fwzcd4ZiwUX+NrDp8nhul+TwqlVY4WZE=; b=KDqxtOnIgKFg1MZ8mvjvWmnzlz
 GGXzJHmtRQjdH85Tt6qSlh7dTo+3Pqx6yEwGEmCjKSnJsR8cVnCw5sQ+0fkyzsYTalWQ5oIOTXXW9
 RcZTKfiiup5IKTQnbTAwxjK5/7En89H1ThhYXLAhLZtkNPDrafp0042wt/WVSXlxxCXSHpLba+PnE
 YWLPPMFOYm+oK5qQfJx0+S4g8kL2q+cGMt/Q8lha0kTYxvPWFqU1Fxzo5mpbuOFCHtuSUjnA32bib
 IFxJOx2Dc4/sbYXyGTaz5HeduylP7sFVqyvV3/0t3czEq9zSZ5SepDhbDaA6ebhyF5QgZRO8jGOwQ
 NluE7nqw==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEn-000Yqk-65; Mon, 28 Nov 2022 09:15:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:13 +0100
Message-Id: <20221128091523.1242584-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No need to keep these two helpers separate. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/f2fs/extent_cache.c | 16 +++++ 1 file
 changed, 5 insertions(+), 11 deletions(-) diff --git a/fs/f2fs/extent_cache.c
 b/fs/f2fs/extent_cache.c index 932c070173b976..538e4b79f83c9b 100644 ---
 a/fs/f2fs/extent_cache.c +++ b/fs/f2fs/extent_cache.c @@ -407,14 +407,17 @@
 void f2fs_init_ [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ozaEt-00GRQy-5i
Subject: [f2fs-dev] [PATCH 05/15] f2fs: fold f2fs_lookup_extent_tree into
 f2fs_lookup_extent_cache
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No need to keep these two helpers separate.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/extent_cache.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 932c070173b976..538e4b79f83c9b 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -407,14 +407,17 @@ void f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 		set_inode_flag(inode, FI_NO_EXTENT);
 }
 
-static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
-							struct extent_info *ei)
+bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
+		struct extent_info *ei)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct extent_tree *et = F2FS_I(inode)->extent_tree;
 	struct extent_node *en;
 	bool ret = false;
 
+	if (!f2fs_may_extent_tree(inode))
+		return false;
+
 	f2fs_bug_on(sbi, !et);
 
 	trace_f2fs_lookup_extent_tree_start(inode, pgofs);
@@ -850,15 +853,6 @@ void f2fs_destroy_extent_tree(struct inode *inode)
 	trace_f2fs_destroy_extent_tree(inode, node_cnt);
 }
 
-bool f2fs_lookup_extent_cache(struct inode *inode, pgoff_t pgofs,
-					struct extent_info *ei)
-{
-	if (!f2fs_may_extent_tree(inode))
-		return false;
-
-	return f2fs_lookup_extent_tree(inode, pgofs, ei);
-}
-
 void f2fs_update_extent_cache(struct dnode_of_data *dn)
 {
 	pgoff_t fofs;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
