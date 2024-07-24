Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A693B629
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 19:52:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWg9z-00036h-Ee;
	Wed, 24 Jul 2024 17:52:19 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <n.zhandarovich@fintech.ru>) id 1sWg9y-00036W-LX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 17:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Uu8BvKRCulZqNlyVPOzEJj3wm9sYyoWQFauq1DwJHw=; b=chibF1BaEaWsZk2O9uigA9qvcx
 jXAJ8IbILzrMDBp6yOgSFdGZKwzekKInlt+ttXcN+NGkX4YC02wHaFcoOoPcKTCrMFqChYPZAz4L8
 lKKLbd2V6458rNVODjVNn0XqcrkFqxmOlO8RGsCl89UCKMqyppLpgEmUf5TSVO5Z+UcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2Uu8BvKRCulZqNlyVPOzEJj3wm9sYyoWQFauq1DwJHw=; b=Z
 3a+YtXCogqAHAM63cA8AQkE4gIyirdKQV99qNDMkASSvlpAO3ye7JQXfWARA5B70gZxPgnfxLuL4D
 0aLxExuERcW7w5zZecswcwnHtCCozlAZRgz6sODuIKr0Yk5x0zFpn0VbgdU10nkZKbKLEOkvaMUHT
 pdlVW4NIzydePldI=;
Received: from exchange.fintech.ru ([195.54.195.159])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1sWg9x-0006X6-H6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 17:52:18 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 24 Jul
 2024 20:52:05 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 24 Jul
 2024 20:52:05 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Wed, 24 Jul 2024 10:51:58 -0700
Message-ID: <20240724175158.11928-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: While calculating the end addresses of main area and segment
 0, u32 may be not enough to hold the result without the danger of int overflow.
 Just in case, play it safe and cast one of the operands to a wider type (u64).
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.54.195.159 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.54.195.159 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sWg9x-0006X6-H6
Subject: [f2fs-dev] [PATCH] f2fs: avoid potential int overflow in
 sanity_check_area_boundary()
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
Cc: lvc-project@linuxtesting.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

While calculating the end addresses of main area and segment 0, u32
may be not enough to hold the result without the danger of int
overflow.

Just in case, play it safe and cast one of the operands to a
wider type (u64).
 
Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: fd694733d523 ("f2fs: cover large section in sanity check of super")
Cc: stable@vger.kernel.org
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3959fd137cc9..4d8f38ca6fcd 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3356,9 +3356,9 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 	u32 segment_count = le32_to_cpu(raw_super->segment_count);
 	u32 log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
 	u64 main_end_blkaddr = main_blkaddr +
-				(segment_count_main << log_blocks_per_seg);
+				((u64)segment_count_main << log_blocks_per_seg);
 	u64 seg_end_blkaddr = segment0_blkaddr +
-				(segment_count << log_blocks_per_seg);
+				((u64)segment_count << log_blocks_per_seg);
 
 	if (segment0_blkaddr != cp_blkaddr) {
 		f2fs_info(sbi, "Mismatch start address, segment0(%u) cp_blkaddr(%u)",


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
