Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D079B86678C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 02:32:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rePrA-0006WT-Oh;
	Mon, 26 Feb 2024 01:32:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rePr8-0006WM-MA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uIDhPLNiisO8kLje9+ppC9Q2Qs4N6ZNlTlkoeo5OPkw=; b=GQUqS4wZlP2cKwGb5lYx0Phg2W
 3IxUrDn68NYrnqvXSPX15AzNpEsJmsumS5aA/qBoMMF/+bOQTQtlqjN/3942p0PGROQ5Ftq6iv2Ju
 nOeE2cvwr667OSsjFH3KvBOvSk2bQJLenIsDSLDZ/bE3TuLkWsQHtSXzBkU1xgqNpLLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uIDhPLNiisO8kLje9+ppC9Q2Qs4N6ZNlTlkoeo5OPkw=; b=J
 feFeapFlmr4tkipoPimKri6AwEVHe0tkstYzDAs9TgMxcyzz2vWTRh72nh2HD+XSanT8pGsOgQkSc
 hZx68fSAouOqOn2/O03xvs9lsDWxekQQbGbkBiS1Jz6nPE/hnHMMxTYLy+oVeC2dQ29g4XZW2kOir
 QgMfj3/0kwOlEK4c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rePr4-0007wM-OK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 01:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54CF460DF3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 01:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E958C433C7;
 Mon, 26 Feb 2024 01:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708911140;
 bh=JC2tKZVI/N9NKXwRhcw37ItMYVdb46EEQNkTvwv2vU0=;
 h=From:To:Cc:Subject:Date:From;
 b=Sz8sjKAET+isPNL/4a4fFdhhgcMkhiNGh9nDOKbXa6M+bIqIqS/gJVLGUZt6kfd7U
 SM6tD2+qQrobZhW2CxqSvTkKSogfCArlGO5sLq10ZoNJ4ftQcU3PHCNZkcdMUjQRLT
 Rt5u70cfST75BOH4CAKDNkOdDeWq35f8VPOcUS8UMFQoi4eI+Xto7tlwLPA7XaS9qF
 qrt/yiu4dFYNzVNu1+2LcnQ7WFDzX1zUzcnE76vkZV4XPaNvyV1A9Ki0dJZqU0Bvzh
 hJKKTjm9B3Ol/u/2KtJPswTuPIFu6dGqdsdIO7zNpPTumy2iHJ7pj+zQVSZvE0tL81
 LogR/jchMm3Wg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 26 Feb 2024 09:32:05 +0800
Message-Id: <20240226013208.2389246-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_migrate_blocks(),
 when traversing blocks in last section, 
 blkofs_end should be (start_blk + blkcnt - 1) % blk_per_sec,
 fix it. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/data.c | 5 +++-- 1 file changed, 3
 insertions(+), 2 deletions(-) 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rePr4-0007wM-OK
Subject: [f2fs-dev] [PATCH 1/4] f2fs: fix blkofs_end correctly in
 f2fs_migrate_blocks()
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

In f2fs_migrate_blocks(), when traversing blocks in last section,
blkofs_end should be (start_blk + blkcnt - 1) % blk_per_sec, fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c21b92f18463..0c728e82d936 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3841,13 +3841,14 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	unsigned int blkofs;
 	unsigned int blk_per_sec = BLKS_PER_SEC(sbi);
+	unsigned int end_blk = start_blk + blkcnt - 1;
 	unsigned int secidx = start_blk / blk_per_sec;
 	unsigned int end_sec;
 	int ret = 0;
 
 	if (!blkcnt)
 		return 0;
-	end_sec = secidx + (blkcnt - 1) / blk_per_sec;
+	end_sec = end_blk / blk_per_sec;
 
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
@@ -3857,7 +3858,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 
 	for (; secidx <= end_sec; secidx++) {
 		unsigned int blkofs_end = secidx == end_sec ?
-			(blkcnt - 1) % blk_per_sec : blk_per_sec - 1;
+				end_blk % blk_per_sec : blk_per_sec - 1;
 
 		f2fs_down_write(&sbi->pin_sem);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
