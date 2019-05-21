Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1074925740
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 20:06:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hT99n-0000aK-Pf; Tue, 21 May 2019 18:06:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hT99m-0000aD-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 18:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6r8wQaF11zIp/EjEuoCb2mjBf+K5Y0WCwFfNH/s45cg=; b=EeOPPtPQBt7CFUEpPdPdBNjJln
 PBAt7nf8AkJdWS2+ubr8UGQZw/EIDkE6yAWDEDGG/thxYPun0tCRce7G4z7J7hIGg6gH5iD59mm9m
 /PL6qcgnQn0RJ4GLagXIDpA+k1qL8FEmOVlUgm8ixGRCJ5jc+q7pyninQZBOVAWG9YRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6r8wQaF11zIp/EjEuoCb2mjBf+K5Y0WCwFfNH/s45cg=; b=G
 UYPlS0iX8JS0vFEUOEtJcwEacwTs6Gcy11BbPPABjjKrp13pqiF8/E8UNZtM3cSmGJjKfBm8dO1Az
 sqFshh8RLFDBAFcnR7zlaMgbMSRaveIPXwfT5xJW82eqtjvEn8Nk2aAqMXx6/IORycLo+MV1CS5ln
 x8FhI86tX3qz0m98=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hT99k-00FD9s-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 18:06:34 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09A0C20851;
 Tue, 21 May 2019 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558461987;
 bh=KeXQdf7LxJFZjE2BBsFH6zgWI0BnO6HokdbTkxtyYPA=;
 h=From:To:Cc:Subject:Date:From;
 b=ddvXiv8EIA6w84VHw+0NPtO+HSyrP77FHhH8dJLALrMH5S4IoYkz+FhBmgya4giph
 h4yPCfXwy1ZU4mc3+B32EkwUz4CnRiMSzCxG9SJCXnIW31X39wIyF4Q5VbbbVHl550
 4P1Upotux1pnA15YGFSTnT8OXjV5pC8qm5X6QQ8A=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 May 2019 11:06:24 -0700
Message-Id: <20190521180625.10562-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hT99k-00FD9s-Nh
Subject: [f2fs-dev] [PATCH 1/2] Revert "f2fs: don't clear
 CP_QUOTA_NEED_FSCK_FLAG"
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

This reverts commit fb40d618b03978b7cc5820697894461f4a2af98b.

The original patch introduced # of fsck triggers.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index d0539ddad6e2..89825261d474 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1317,10 +1317,8 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
 		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
-	/*
-	 * TODO: we count on fsck.f2fs to clear this flag until we figure out
-	 * missing cases which clear it incorrectly.
-	 */
+	else
+		__clear_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
 
 	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
 		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
