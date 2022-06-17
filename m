Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E61854FFF9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Jun 2022 00:31:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2KV7-0004Rj-RZ; Fri, 17 Jun 2022 22:31:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o2KV6-0004Rd-PS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 22:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zb0fYAUKte88xBvCeE6u5dytZf8Gsx6ysBFnHEISTZc=; b=DVxj9ic1bfTUZtucVsHkwX2D8x
 qDJRtLtRa5yM/zqs8O1Pe65yfwfhI84uDuadiJLsI6m1Oenb0FQYOOIovXsfZiMehmNSlhFNpUXpb
 s4aoHmUD3kEyxL9bttxD8+v+4G5MB/uruhJgQ42hiVmQz8u2iGOU3TN9Gt3lyiDHtEmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zb0fYAUKte88xBvCeE6u5dytZf8Gsx6ysBFnHEISTZc=; b=SVXXj3+4wVxaLj3Jub9Qkpm785
 J+hZKGKkjzMYwMFYbTpPEn+8nQbJxda3WASM/+UaJKWXW3nRXObl8n2YKUaqM+2KMdGV7itS9xXSZ
 U0uw8zMCsNkh67iAOhXG+B5CAo+UruLA5zTt1gsRkAPndgpaSA95niD04Vct8YMU9jU8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2KV3-0005Vd-EL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 22:31:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DD10B82B1F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jun 2022 22:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A54C3411B;
 Fri, 17 Jun 2022 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655505087;
 bh=lPh3hZRcFpvlW3S4ihSANExlRpTo4MEmTcXEXEF5gwg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P9SQK8kXbd1PD4oOEk/AkRKMAfUWzR9HGV3sD3jPI1GK4omVa/RgZ3pEsHAD1g0T+
 c3157Dyg/rcK7+WYL4gqwsRTD3wRUVfkyBCclstkE6OjElKS6Y9y2au9auZ0F7kWyU
 RXUWvazndA/MhcXPFIZYZPbKXt1DRpPw9nQOLCkqzmlLfZFjjNxFv7Q1RA2AKz/jCa
 CllrJeFWYF29JdvU4HU/Wt4WF+cr6hg6OX+0OXdtDPQj/S7NyaleO/AKg7D2MO1fpF
 QsBTxgmh2r3JsPd5ZKE/bPnU2EGC/bme3m+/6XqnOrrPdYW2P8tQaFYP0mW6twoKT2
 pyy9xT4okgeNg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 17 Jun 2022 15:31:05 -0700
Message-Id: <20220617223106.3517374-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617223106.3517374-1-jaegeuk@kernel.org>
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When users set GC_URGENT or GC_MID, they expected to do GCs
 right away. But, there's a condition to bypass it. Let's indicate we need
 to do now in the thread. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- fs/f2fs/gc.c | 8 ++++++-- 1 file changed, 6 insertions(+), 2 deletions(-)
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2KV3-0005Vd-EL
Subject: [f2fs-dev] [PATCH 2/3] f2fs: run GCs synchronously given user
 requests
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

When users set GC_URGENT or GC_MID, they expected to do GCs right away.
But, there's a condition to bypass it. Let's indicate we need to do now
in the thread.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d5fb426e0747..f4aa3c88118b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -37,7 +37,6 @@ static int gc_thread_func(void *data)
 	unsigned int wait_ms;
 	struct f2fs_gc_control gc_control = {
 		.victim_segno = NULL_SEGNO,
-		.should_migrate_blocks = false,
 		.err_gc_skipped = false };
 
 	wait_ms = gc_th->min_sleep_time;
@@ -113,7 +112,10 @@ static int gc_thread_func(void *data)
 				sbi->gc_mode == GC_URGENT_MID) {
 			wait_ms = gc_th->urgent_sleep_time;
 			f2fs_down_write(&sbi->gc_lock);
+			gc_control.should_migrate_blocks = true;
 			goto do_gc;
+		} else {
+			gc_control.should_migrate_blocks = false;
 		}
 
 		if (foreground) {
@@ -139,7 +141,9 @@ static int gc_thread_func(void *data)
 		if (!foreground)
 			stat_inc_bggc_count(sbi->stat_info);
 
-		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
+		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC ||
+				sbi->gc_mode == GC_URGENT_HIGH ||
+				sbi->gc_mode == GC_URGENT_MID;
 
 		/* foreground GC was been triggered via f2fs_balance_fs() */
 		if (foreground)
-- 
2.36.1.476.g0c4daa206d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
