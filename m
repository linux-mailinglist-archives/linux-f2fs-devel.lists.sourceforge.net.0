Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C5539B226
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 07:50:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lp2jP-0006Kc-3q; Fri, 04 Jun 2021 05:50:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lp2jO-0006KQ-BU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 05:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o8CNOzEnNASS+tZ697pb0uaJyjUmW/Iy7XK4hy+4Kc0=; b=EuXpyJ36M7B2gOPN8gxkKXUPUh
 F4H9y18KJNAKK5I4mZKWMqWLNCwAQ/FBcFnWpfzxJhPw+7DwAES1X2KCF380gSrbW+Sqwb9lotfNE
 1v4CK0ODdhITMtBlVQqPobVuqdzTsJKjSHEGfYVIgbSs/AgLDgKIzeZETt9W/wMiQ8AQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o8CNOzEnNASS+tZ697pb0uaJyjUmW/Iy7XK4hy+4Kc0=; b=D
 HHZ4jN3ZY7Oa57gsCrrt6Utpj16scipZ5B9BIawX45swH6YcnqSl1kEE0S7YZt+5mjtjHAPXWImCJ
 ObMC56ABirFiL1MgmyKmrTIrjXfwCNkQyGHn+SpWGbbAd1y0L5xUO/DD2lpP8Wpcxymm5cNqvtCTM
 +2ymUrvGyMFAHzdg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lp2jB-009qj5-2y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 05:50:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA7D261413;
 Fri,  4 Jun 2021 05:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622785830;
 bh=nvNiQiEeAOrNdwTJPiUo/5yXO8Aoan+R2K1B6RWArRc=;
 h=From:To:Cc:Subject:Date:From;
 b=WUQyaw1nGhDZGPANPzpznarwuftVm5HhoN7n9p9Seupfa6bEOhOwLDUKbCx+soCpS
 cSNHL6voHfkkbsKohOlFp9NHgmNp6pPUb9HQFAGmIAIF3ZepAnnXr3JSA0u1lZgAbj
 c1ha1IUsUqdzMD8lvomYgUS+KXuMvqKVVcZIftF5ilzHmt1YDymgZWD/Ic/P9CRHor
 uBACxiiHsPVcYudIw/HiUJJfhbBMFS6Yw4lz79rLxybV3ir2KqkUrM2dNnHivjAVAJ
 Vhee53K/4xHZ1EOZP9Ut5cSLAw4ZPbJjI9ecysIB2Uf1AvKLauDvVbATtL6ymyR10K
 GD8x2+ADlYoAg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Jun 2021 22:50:26 -0700
Message-Id: <20210604055026.2482208-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lp2jB-009qj5-2y
Subject: [f2fs-dev] [PATCH] f2fs: add pin_file in feature list
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

This patch adds missing pin_file feature supported by kernel.

Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2a76c959a7b4..a1d3ba75c753 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -743,6 +743,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
 #endif
+F2FS_FEATURE_RO_ATTR(pin_file);
 
 /* For ATGC */
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
@@ -856,6 +857,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compression),
 #endif
+	ATTR_LIST(pin_file),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
