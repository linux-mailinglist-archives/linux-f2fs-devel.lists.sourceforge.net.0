Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D48508B1121
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 19:36:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzgXP-0001lR-HF;
	Wed, 24 Apr 2024 17:36:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rzgXK-0001lF-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 17:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xmKgKACp3JhtOJBqJoIq/G/7KjOl0wLk3uLpujJ12+A=; b=AyFGCijrM8S9UKry3/4HrEvhmW
 Cv3paxazUoawO0beAL8m3O26MklJHXHvq4KIwArs3lPM1XcX8DumzvH5q9u4ryO2m9d4UHs6etU74
 lCHQeOKkfUnKF8rD7jsdIYgEZDvg3q5DM3g8z/CcrptAc9VtHOsvc7eLRHFa3kCxeroM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xmKgKACp3JhtOJBqJoIq/G/7KjOl0wLk3uLpujJ12+A=; b=Q
 tVb7i8wlOQMMjb+1dcCWR2RechK1/V34hE7ybUg/ZJW4maNWAW2rmgy1ldZRcTYZPVWjklGq/4+CW
 RQ4J9V9Nmn9BGAsLU0v5IsYZggjvg4ZM18QcKFu35spklqG8zTuSxwaxvQAF9iROiFhRZ5gksrl4l
 +WDS9xaRrxciJ1HA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzgXJ-0003pQ-Q6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 17:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 92F65CE179C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 17:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D0CC113CD;
 Wed, 24 Apr 2024 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713980149;
 bh=Zx21olM6TIaTxOuCCMQe79AYeFL/GNrR4k4CavTnoaI=;
 h=From:To:Cc:Subject:Date:From;
 b=C5owhCdw5/jNzo4EXhhD4qYlKIO1w4wRmFxlqkBkF429P6nWjaizzpCPRdYDgUO/x
 SFiBdn+15eoCMyccee/urI38e+ynLSuKp/oRoN4mXM/96/svlcmanFAqODmcSDvge4
 wQUonhmhf9DHZrBZ0566qz+IvE3nLr0oa5Dbj2DFK8GjZL8pOZBVEY7gomsn1nnq3V
 zXlJjhYzKKd3GhhFaRPG/6hJ7YlaoS2bI7miAeNHl+NSRH9PC9IpnVc5GbCr+q6VZP
 vOVbdrolEmedOWq4aNmfhYeT7Rortcgcv7OsjBze8oH93rpjK5BSoWefTalpogDFvI
 49H/wulrmnuww==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Apr 2024 17:35:48 +0000
Message-ID: <20240424173548.1515606-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_ra_meta_pages can try to read ahead on invalid block
 address which is not the corruption case. Cc: <stable@kernel.org> # v6.9+
 Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218770 Fixes:
 31f85ccc84b8
 ("f2fs: unify the error handling of f2fs_is_valid_blkaddr") Signed-off-by:
 Jaegeuk Kim [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzgXJ-0003pQ-Q6
Subject: [f2fs-dev] [PATCH] f2fs: fix false alarm on invalid block address
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_ra_meta_pages can try to read ahead on invalid block address which is
not the corruption case.

Cc: <stable@kernel.org> # v6.9+
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218770
Fixes: 31f85ccc84b8 ("f2fs: unify the error handling of f2fs_is_valid_blkaddr")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5d05a413f451..55d444bec5c0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -179,22 +179,22 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 		break;
 	case META_SIT:
 		if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
-			goto err;
+			goto check_only;
 		break;
 	case META_SSA:
 		if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
 			blkaddr < SM_I(sbi)->ssa_blkaddr))
-			goto err;
+			goto check_only;
 		break;
 	case META_CP:
 		if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
 			blkaddr < __start_cp_addr(sbi)))
-			goto err;
+			goto check_only;
 		break;
 	case META_POR:
 		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
 			blkaddr < MAIN_BLKADDR(sbi)))
-			goto err;
+			goto check_only;
 		break;
 	case DATA_GENERIC:
 	case DATA_GENERIC_ENHANCE:
@@ -228,6 +228,7 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 	return true;
 err:
 	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
+check_only:
 	return false;
 }
 
-- 
2.44.0.769.g3c40516874-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
