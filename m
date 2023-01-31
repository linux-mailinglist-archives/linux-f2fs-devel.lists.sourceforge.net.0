Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F4027682FA0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 15:47:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMrus-0005hC-1u;
	Tue, 31 Jan 2023 14:47:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pMruk-0005h5-8V
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 14:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+FGTf5HuvO5/puVIx6bwuBMFZQlk4rXc/PUC03GODvA=; b=cEXdu5v7OCH1aAg4ncXi2JMyTl
 +AWhPj6xO5iIOov1+NUF+g8f+mf+1t27QhuYf6dPd8P78NvqEs8mzFV/RcoGu/F72SjOE41LWaavU
 8zE4QzyvMWOE/+6/CHzkgwtzX8efiRbTKQ6wWIG8T+Iyt7a+ezaNtctJN0phEA2YyMH0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+FGTf5HuvO5/puVIx6bwuBMFZQlk4rXc/PUC03GODvA=; b=c
 RtcoNVyWj75KBL7x3jT4+O15oX8CMLGJg9MsTpoXaWVSmjUqi29Jx12H+LNENBxkF27wK+vLV2Tkz
 +ergRuUHFM1JZv1BNjwEJBYd+evhEeV6QouYz0Kz/ABXQkV36phzuyXrQ8TaR/+lEujeyESkTDtJO
 JiYq3Vr7h95AkbvI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMrui-0003QB-2z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 14:47:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 772D961551
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Jan 2023 14:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2456CC4339B;
 Tue, 31 Jan 2023 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675176426;
 bh=MmOxigM59X8JlcAHThlYTmmNijEJl7O6QUjLV9hpxdU=;
 h=From:To:Cc:Subject:Date:From;
 b=WSgUT5zF8Y2q8+duHXiW8g+tcnUn16069rvwvf8xaKL8/mDJAaqVDHG0Y3JMhplgg
 tKMSGbfB1liLsTfja/zODR7ZrbxJpocaSHAxnGZ3A1sJcQe6CsKPUS+W9rnt1JPTUn
 5cYPmTkBSjaHktth2/i8hUa1AKDA+phUWfml4Gmm9GmWL6UMBxusf8ATwiw8ULjL2L
 0nFiC06B3b9LFjZCf11QuDydPeaNNz1F6H+oXiV17rlVcxTwm2+5G09fW5FZ+ao4Gv
 4whexxOWEJZxq1DI+SxxlFluyIMrPaX8LqPZ3XJajBL5OIUgFBx+yImGM5EyB+M7LW
 mGiSLhDazvA4g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 31 Jan 2023 22:46:59 +0800
Message-Id: <20230131144701.34418-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No logic change, just avoid goto statement. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/extent_cache.c | 66 ++++++++++++++++++++
 1 file changed, 31 insertions(+), 35 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMrui-0003QB-2z
Subject: [f2fs-dev] [PATCH 1/3] f2fs: clean up __update_extent_tree_range()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No logic change, just avoid goto statement.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/extent_cache.c | 66 ++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index d70ad6a44cbf..cf65a188d112 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -782,47 +782,43 @@ static void __update_extent_tree_range(struct inode *inode,
 		en = next_en;
 	}
 
-	if (type == EX_BLOCK_AGE)
-		goto update_age_extent_cache;
-
-	/* 3. update extent in read extent cache */
-	BUG_ON(type != EX_READ);
-
-	if (tei->blk) {
-		__set_extent_info(&ei, fofs, len, tei->blk, false,
-				  0, 0, EX_READ);
-		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
-			__insert_extent_tree(sbi, et, &ei,
+	/* 3. update extent in extent cache */
+	if (type == EX_READ) {
+		if (tei->blk) {
+			__set_extent_info(&ei, fofs, len, tei->blk, false,
+					  0, 0, EX_READ);
+			if (!__try_merge_extent_node(sbi, et, &ei,
+							prev_en, next_en))
+				__insert_extent_tree(sbi, et, &ei,
 					insert_p, insert_parent, leftmost);
 
-		/* give up extent_cache, if split and small updates happen */
-		if (dei.len >= 1 &&
-				prev.len < F2FS_MIN_EXTENT_LEN &&
-				et->largest.len < F2FS_MIN_EXTENT_LEN) {
-			et->largest.len = 0;
-			et->largest_updated = true;
-			set_inode_flag(inode, FI_NO_EXTENT);
+			/* give up read extent cache, if split and small updates happen */
+			if (dei.len >= 1 &&
+					prev.len < F2FS_MIN_EXTENT_LEN &&
+					et->largest.len < F2FS_MIN_EXTENT_LEN) {
+				et->largest.len = 0;
+				et->largest_updated = true;
+				set_inode_flag(inode, FI_NO_EXTENT);
+			}
 		}
-	}
-
-	if (is_inode_flag_set(inode, FI_NO_EXTENT))
-		__free_extent_tree(sbi, et);
 
-	if (et->largest_updated) {
-		et->largest_updated = false;
-		updated = true;
-	}
-	goto out_read_extent_cache;
-update_age_extent_cache:
-	if (!tei->last_blocks)
-		goto out_read_extent_cache;
+		if (is_inode_flag_set(inode, FI_NO_EXTENT))
+			__free_extent_tree(sbi, et);
 
-	__set_extent_info(&ei, fofs, len, 0, false,
-			tei->age, tei->last_blocks, EX_BLOCK_AGE);
-	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
-		__insert_extent_tree(sbi, et, &ei,
+		if (et->largest_updated) {
+			et->largest_updated = false;
+			updated = true;
+		}
+	} else if (type == EX_BLOCK_AGE) {
+		if (tei->last_blocks) {
+			__set_extent_info(&ei, fofs, len, 0, false,
+				tei->age, tei->last_blocks, EX_BLOCK_AGE);
+			if (!__try_merge_extent_node(sbi, et, &ei,
+							prev_en, next_en))
+				__insert_extent_tree(sbi, et, &ei,
 					insert_p, insert_parent, leftmost);
-out_read_extent_cache:
+		}
+	}
 	write_unlock(&et->lock);
 
 	if (updated)
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
