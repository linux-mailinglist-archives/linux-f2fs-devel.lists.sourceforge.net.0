Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C46F689E479
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 22:34:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruIAo-0007Q1-OJ;
	Tue, 09 Apr 2024 20:34:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ruIAn-0007Pk-CR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chP/1/6goYaphGUjfEv2QXzQENrepAGweOTmsWv0VR8=; b=VOFBqlpoouHQIR4r3Ut8KDE9jD
 Mp9aURkbRFYMnFCri6WIM7F4J3Z7mCubbIzwLrqHOHXb0GYKa5dmuUFf65BhIPeAca1nEha7SSnBB
 QoIy6KTrbtdQNDzR6COa9vI6zN8KvVGlXbeXz2gxCsw44REgzIhoKkMJpZKXTyUJZFGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=chP/1/6goYaphGUjfEv2QXzQENrepAGweOTmsWv0VR8=; b=ahBwR+7+0EQlBviRMfnrjaQ7qN
 u2J5pKCx4/k1nYT5ktrEx20NDQ0Na0i2Pj84nOPfL07bvO/724CY/u4DRk6Yh+cEGjBySc5IPTn+f
 fH9TUAysnMnSdJW3j/J76tehorGyxsL/1ejwhmokxGQohxf4LX4yWzh0JViSaB6IfWS4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruIAm-0001Qg-A3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 016E561A22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Apr 2024 20:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B26AC433C7;
 Tue,  9 Apr 2024 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712694857;
 bh=+4w6Yn40335a0GsU306fLSUnzxXEUP2Ol6OJgXDYeI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FOjfp/7g2+iX4WP7BmUILh7tqFC85L1DLkTG24ckMIrxOZGocygA/5bs19BDuOc3M
 BDtYlBc+gY0lkLP8sezyoUt/3Qx8AV0wO1ptAMIQJNjHKglQcweQmZXRaW6aMeyWdZ
 jz3fF0yGMNUcvDFc4GqmvwlU3eXu+JGxnYClbmc5OJc9MamBMmApbAvftFWvUCaDCi
 ZLLFjUw1H5Fdf9Wv0Pjd3Sbx5dlmGQlRqc3cyQEH5jJwZi2NU1cnXJsJJX8bEOlhEB
 bKt1XiCNEK2kCv6R0y1q5n9pAS7EogAtl1Ed1ndGkIbZl30272kQWaGuYQGUoDfNfy
 zjtcH1ozj0BCw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  9 Apr 2024 20:34:11 +0000
Message-ID: <20240409203411.1885121-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240409203411.1885121-1-jaegeuk@kernel.org>
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_ra_meta_pages can try to read ahead on invalid block
 address which is not the corruption case. Fixes: 31f85ccc84b8 ("f2fs: unify
 the error handling of f2fs_is_valid_blkaddr") Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org> --- fs/f2fs/checkpoint.c | 9 +++++---- 1 file changed,
 5 insertions(+), [...] 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruIAm-0001Qg-A3
Subject: [f2fs-dev] [PATCH 3/3] f2fs: fix false alarm on invalid block
 address
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

f2fs_ra_meta_pages can try to read ahead on invalid block address which is
not the corruption case.

Fixes: 31f85ccc84b8 ("f2fs: unify the error handling of f2fs_is_valid_blkaddr")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index eac698b8dd38..b01320502624 100644
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
2.44.0.478.gd926399ef9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
