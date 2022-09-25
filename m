Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88F5E9394
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Sep 2022 16:15:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ocSPT-00035R-A7;
	Sun, 25 Sep 2022 14:15:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ocSPS-00035L-A9
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Sep 2022 14:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YCx/8k2YViPQCh7Ya9N2ocu9HSx5st3hXk73ArtVEds=; b=O1h46/z3t+ZnLTvumqzqt28BXp
 g3afmMo3JaRRufIkhaKogRjymeCLf/8UYsLUC7skGN/Os5CbM9uYWgsZeHKG57Tqazqnb5V9q8UCC
 b64hCNFFZnm1mtELfLpMJEoAA2BWBB2S54gpyviCAlAD+6AlLmzIN2L4Z5TEijNxq19U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YCx/8k2YViPQCh7Ya9N2ocu9HSx5st3hXk73ArtVEds=; b=m
 hgQHM9E0Hh9y5ckVC6d5EfxLJw8pI2J8U+APja3NkAvUFy2O1F4VHigY+GWJg9pB6MD1vjt7EZ9aE
 WLRRwrR6ir9WxWjY3oA+LmRMn0UeiaCwT2b8QI+J9baoG/EVbQUZVIiZ2zBOj1MJSxAyg+/ClsylI
 Uz+FIsGGkenuM4pQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ocSPR-0001Dw-JI for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Sep 2022 14:15:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5331CB808D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Sep 2022 14:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D14C433D6;
 Sun, 25 Sep 2022 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664115298;
 bh=B+LaqPQ/dWcvWOAMuuJxl30guz+XnizY1zgrFUw+MD4=;
 h=From:To:Cc:Subject:Date:From;
 b=teJge2E8c/rdYBOa+MnFgb3Of8xhrTmLyGWWm7ClMqB8j7YMnK5LChC0Cd/CmPWDK
 YPUfL1npNIrD6egqRNjS6B1BcM9CKf7jcxHAYSKpsBzf3pgRkIBrGWUJcmne3kRMY5
 SJtu9agnImdM2Rn8ifMLazn0J3XwmepUPJTCphoooajL5OOVyVEwyrk2gxGdv4iBiJ
 /Oym3/U42YalMaGzefTy2OwwpIhL5hPtD5wuhXEOYpkGJz1GokoIuXN7Pj67UtJQj1
 7NDJEqcjXxenkcEL0ru/wJ4bUApgWtcEJB3t1mAGE27mDrq+f760bQoyB+BuQXBX8a
 S9kUdQKgrekoQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 25 Sep 2022 13:58:02 +0800
Message-Id: <20220925055802.11955-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -4.2 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Update allocation policy for ro feature: - hot_data:
 allocating
 blocks by LBA ascending order - hot_node: allocating blocks by LBA descending
 order Signed-off-by: Chao Yu <chao@kernel.org> --- mkfs/f2fs_format.c | 4
 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ocSPR-0001Dw-JI
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: update allocation policy for ro
 feature
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

Update allocation policy for ro feature:
- hot_data: allocating blocks by LBA ascending order
- hot_node: allocating blocks by LBA descending order

Signed-off-by: Chao Yu <chao@kernel.org>
---
 mkfs/f2fs_format.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 40ac589..8d0f410 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -544,10 +544,10 @@ static int f2fs_prepare_super_block(void)
 	}
 
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
-		c.cur_seg[CURSEG_HOT_NODE] = 0;
+		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
 		c.cur_seg[CURSEG_WARM_NODE] = 0;
 		c.cur_seg[CURSEG_COLD_NODE] = 0;
-		c.cur_seg[CURSEG_HOT_DATA] = 1;
+		c.cur_seg[CURSEG_HOT_DATA] = 0;
 		c.cur_seg[CURSEG_COLD_DATA] = 0;
 		c.cur_seg[CURSEG_WARM_DATA] = 0;
 	} else if (c.heap) {
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
