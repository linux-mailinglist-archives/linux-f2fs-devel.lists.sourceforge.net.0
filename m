Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE019BCBC8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 12:26:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8HhQ-0001JD-PJ;
	Tue, 05 Nov 2024 11:26:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1t8HhP-0001J5-Ch
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 11:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bgHLyih2ixrLRcnU+sKEdYfmBpAe4/WiLW0pYvZehS8=; b=JKE8XSiPjO+LjLZq/teIvuIHBr
 gnrRNYUxxwja7Mk1Xfs5Fks6Aecvs9IMyEjkn+jMmWDDCfqWbxmuZs+jym4InNt85WIrI77ThAAFv
 UIBxsAGxE0uh/c9rmSQAPzs/gXZcYFGUK0B59PlC75n/5bwraBZ9RuqGkEUeMHCLFB90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bgHLyih2ixrLRcnU+sKEdYfmBpAe4/WiLW0pYvZehS8=; b=g
 d1JssuxXIw3nt/3OKXxVFG3bxRQnmZnJXA6kWPYwxnLU7DCHC1iThO3l5oEaT9MXgfpKxYTSTuKVi
 GlJ+/hAMsF3dd0z0JgaFTMaiGQyhpwl8AwPbVXkL2ftpBjkLkH4elR+s2M1m2yTEJUdtLP3a6MheV
 dILXJjIGWSDMnr1g=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8HhO-0006CC-UB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 11:26:16 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4A5BPZF4017984;
 Tue, 5 Nov 2024 19:25:35 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4XjQwY3Vqfz2KGZ03;
 Tue,  5 Nov 2024 19:24:45 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 5 Nov 2024 19:25:32 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 5 Nov 2024 19:25:05 +0800
Message-ID: <1730805905-31895-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4A5BPZF4017984
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Should check after c.devices[1].start_blkaddr is assigned
 if c.ndevs > 1. Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> ---
 mkfs/f2fs_format.c
 | 23 ++++++++++++ 1 file changed, 12 insertions(+), 11 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1t8HhO-0006CC-UB
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: adjust zone alignment check to
 correct position
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Should check after c.devices[1].start_blkaddr is assigned
if c.ndevs > 1.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 mkfs/f2fs_format.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 52a1e18..f7cfa5e 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -339,17 +339,6 @@ static int f2fs_prepare_super_block(void)
 	MSG(0, "Info: zone aligned segment0 blkaddr: %u\n",
 					get_sb(segment0_blkaddr));
 
-	if (c.zoned_mode &&
-		((c.ndevs == 1 &&
-			(get_sb(segment0_blkaddr) + c.start_sector /
-			DEFAULT_SECTORS_PER_BLOCK) % c.zone_blocks) ||
-		(c.ndevs > 1 &&
-			c.devices[1].start_blkaddr % c.zone_blocks))) {
-		MSG(1, "\tError: Unaligned segment0 block address %u\n",
-				get_sb(segment0_blkaddr));
-		return -1;
-	}
-
 	for (i = 0; i < c.ndevs; i++) {
 		if (i == 0) {
 			c.devices[i].total_segments =
@@ -390,6 +379,18 @@ static int f2fs_prepare_super_block(void)
 
 		c.total_segments += c.devices[i].total_segments;
 	}
+
+	if (c.zoned_mode &&
+		((c.ndevs == 1 &&
+			(get_sb(segment0_blkaddr) + c.start_sector /
+			DEFAULT_SECTORS_PER_BLOCK) % c.zone_blocks) ||
+		(c.ndevs > 1 &&
+			c.devices[1].start_blkaddr % c.zone_blocks))) {
+		MSG(1, "\tError: Unaligned segment0 block address %u\n",
+				get_sb(segment0_blkaddr));
+		return -1;
+	}
+
 	set_sb(segment_count, c.total_segments);
 	set_sb(segment_count_ckpt, F2FS_NUMBER_OF_CHECKPOINT_PACK);
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
