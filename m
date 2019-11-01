Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB88EC6E3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 17:36:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQZue-0004Tx-8d; Fri, 01 Nov 2019 16:36:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iQZuc-0004Tb-9k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 16:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nid4RPwrX/tIBit9dnP7pDOTCgLlCg7ueZaZ3HHp69o=; b=JEHwa927AbmWR5PyOKRK/NbvQG
 s4Wj86Eas8H95C/s0xg4sWG7pF5Rv3VsfzRMEUIH/VZI6Z2XhitqfPPNHAtz/HNsBsCWBMvQhfpZa
 Fjf5eBjO9IgUI1gKH01+6pHYG/ZBJ6FaBetZEFxVy3bFcjy668xb2D8h2pQmRbxe3ndw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nid4RPwrX/tIBit9dnP7pDOTCgLlCg7ueZaZ3HHp69o=; b=M
 JSnwrUCK+9+bYwc/W+NLzpF6th8n85qv64JBG7zSvW5O3dttXi3m8Vf1D/1EQB8I1NbWqqa3Wln1M
 bUgQq6y0FadVTvKWl4dftJ3oIZvQcMTRJm0o81v39XI5WRbxcOitNP8M1sQ8kG9MLm1zuocCsQEvF
 PXNfAv/qVCdBB+H0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQZuZ-00E7N5-Vk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 16:36:34 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A57D21734;
 Fri,  1 Nov 2019 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572626186;
 bh=pzuTPfxW6ChiKka7CrU44DU0IlZRj3qP8BZLIY0Klv0=;
 h=From:To:Cc:Subject:Date:From;
 b=SFScjW5/mIzRRC64s6EdyqkA2S+lEgEuoDFWJs/mH+EGfAVuXtL6+JeY4t5GMlfT5
 AATXzkQNYj6vs1Oay4RTJRk7b3IT3Rc0wQb/36UueBTYR9yMzcHaiYO01WL0DOagRt
 x2r7KVMVtEb1k/p09P3fjKAKBbiX74cVyWKpxak0=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  1 Nov 2019 09:36:24 -0700
Message-Id: <20191101163624.7994-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQZuZ-00E7N5-Vk
Subject: [f2fs-dev] [PATCH] f2fs: avoid kernel panic on corruption test
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

xfstests/generic/475 complains kernel warn/panic while testing corrupted disk.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 8b66bc4c004b..06fd6d77d34b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2349,7 +2349,6 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
 
 			if (ret) {
 				up_read(&nm_i->nat_tree_lock);
-				f2fs_bug_on(sbi, !mount);
 				f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
 				return ret;
 			}
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
