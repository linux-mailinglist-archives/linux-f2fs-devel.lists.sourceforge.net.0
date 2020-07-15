Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E647221380
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 19:30:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvlEu-00046U-Ir; Wed, 15 Jul 2020 17:30:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jvlEt-00046L-0F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 17:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ujaKKF0OKl04T01XAO2MVGa8LdmnVerF73R0W6B7Ps=; b=jeM0mBWfZz7ptjcM1chVeRZ+/E
 p+Pv5vBiUeqnprf+KOZF6lfqc9MhC0T4zMs8q9M1GQ+0EM22D8l6w5J/l686HnLOxOgrZUthpwx7W
 FxoVbRCGChHOk2rYWDAyJhcxiJh2oUa2CXMF9qNOn+vqlC9jfPkgnGMHqRS6jJPVhvdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ujaKKF0OKl04T01XAO2MVGa8LdmnVerF73R0W6B7Ps=; b=ige8/y4e7BICsBARnXZpFr2B63
 2RM96YK9hllpat+hTJZyPv0AJE6WsnMiYv8U42Wb+vX+oq7wB7nMxJ1RKx11MHy5ZGuY2maNVkIUr
 Wb2mASdDQQ/TomaP3swfxOB8FS42732oAxwjCUYCT0B4x+VrErSFECYvp/oQwGOCPNDo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvlEq-004iwO-Nx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 17:30:38 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C7B120663;
 Wed, 15 Jul 2020 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594834219;
 bh=lCFETc0y4Tam0CNmXrTdSDCqigPpVyh0ivu/PvyT9wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nO/ICibx0Ea7UmSNY6g0kfvh5JNzp2i9rnTGNODpLi5sqDELs6uLxQsq1sSi0+oJX
 ilILWBPhjMkl9vJF3G18O7V+ffaoFvGLIf9jSzB3+i5VhEjFNdEjoMJD98ergNYeKF
 z9VsGG92xXD5B1aDuYz2brBPaTMJIP5e8hly5nxY=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Jul 2020 10:30:17 -0700
Message-Id: <20200715173017.1887640-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
In-Reply-To: <20200715173017.1887640-1-jaegeuk@kernel.org>
References: <20200715173017.1887640-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvlEq-004iwO-Nx
Subject: [f2fs-dev] [PATCH 2/2] dump.f2fs: check block address first before
 reading the block
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This should avoid to read out wrong block address.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/dump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index e472eb7..055ce09 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -482,8 +482,6 @@ void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 	node_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(node_blk);
 
-	dev_read_block(node_blk, ni.blk_addr);
-
 	DBG(1, "Node ID               [0x%x]\n", nid);
 	DBG(1, "nat_entry.block_addr  [0x%x]\n", ni.blk_addr);
 	DBG(1, "nat_entry.version     [0x%x]\n", ni.version);
@@ -494,6 +492,8 @@ void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 		goto out;
 	}
 
+	dev_read_block(node_blk, ni.blk_addr);
+
 	if (ni.blk_addr == 0x0)
 		MSG(force, "Invalid nat entry\n\n");
 	else if (!is_sit_bitmap_set(sbi, ni.blk_addr))
-- 
2.27.0.389.gc38d7665816-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
