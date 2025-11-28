Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2442C916F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Nov 2025 10:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zWYtUSPwIRA0s5OMaY4A/jJxMNJHXmZp6P07BZ7QPDQ=; b=IWrzA0S+EUPft8oANE7q2MOHH4
	SwGvQLyN/W1tkw6BcjHxxgyavcp7WfYoi/DnxLqEEut1CyS9AArxScU7/Aga9ZvGsvuxfxIIqWjA9
	HDMB3qKZATAIduF2cVtck3du4caskHuCyqOYuHf5z83CSoFnbZ0sqaGA0eR3h2+Rhijo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOujg-0007iS-CG;
	Fri, 28 Nov 2025 09:25:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vOuje-0007iK-OL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 09:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxI6vlLH8ro9pFAExLwLDt4jEuuPtlBNc3Ezr0FVG3Y=; b=WAYxszLrQdhBAt56nrtMhmo4Ag
 NAioylv+KA/Ltag9MhXJ5qCEAA7ptg2qXd5PYhufsQWJt2d2v31WrLrBtWB0Tf+4kMA0R9cYOAQIR
 S2kiWnSU85n42yVGw+o0m1UaHuA7eRH4p+QatOIYvdRGLQU3KiVnGEawoCtqqH/JQYJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BxI6vlLH8ro9pFAExLwLDt4jEuuPtlBNc3Ezr0FVG3Y=; b=G
 S6w37FQJrJHFEH9h9YKtr7TJczPbnTzyPxf4b6v2LnFs4yua8p42++mang1PyZBr4mtA87bx0HuTp
 x1rBoGmvgq4fCQDs3eN8HkTWY8iPkkuYvwCPlpnmQ6vRGFHCiMPS6e/o676khqFtcxjGgPu8mu/el
 zbHUvbf99AcM1yTI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOujc-0007qb-Vq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 09:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6AF2960203
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Nov 2025 09:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3316AC4CEF1;
 Fri, 28 Nov 2025 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764321938;
 bh=mgA4yrwSEg38nspzo0kjzEi/bHnlbcRuXglxuEvFoGg=;
 h=From:To:Cc:Subject:Date:From;
 b=TlNNRa6Npt/oMm3kEVKsn5JHJ0DnV8V2PuvVyPO8AoFP9m+8Iv9Q/gQcSsZYrMILw
 pPf5a7yvlMVpFrYC6hyeiDiyZPMCusNBHVKk2IaZ+1YjFEChGr1tD0b4rr4kBb4qj3
 HzF2YC/mK1fI8KT2+KVivK9FPTR11Vdw2p4chCLsF6RrqV85Jubc/ciqy2SCTUNZgw
 PVu6NVrg7QQ7QPu2helhk+KI4E0ri/HUV7JiMxrwMjZtT8bjqz2c5xpQD+Wgfz+gsH
 FM5i4jTn0VDPWL3bBcljRGgpZgSQUL29iOAf+sSE2s8ha96W8HQvXDs59dNvJ4SotB
 2m8RialC27wtA==
To: jaegeuk@kernel.org
Date: Fri, 28 Nov 2025 17:25:34 +0800
Message-ID: <20251128092534.1607427-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  cat /sys/kernel/debug/f2fs/status Main area: 17 segs, 17 secs
 17 zones TYPE blkoff segno secno zoneno dirty_seg full_seg valid_blk - COLD
 data: 0 4 4 4 0 0 0 - WARM data: 0 7 7 7 0 0 0 - HOT data: 1 5 5 5 2 0 512
 - Dir dnode: 3 0 0 0 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vOujc-0007qb-Vq
Subject: [f2fs-dev] [PATCH] f2fs: support to show curseg.next_blkoff in
 debugfs
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

cat /sys/kernel/debug/f2fs/status

Main area: 17 segs, 17 secs 17 zones
    TYPE           blkoff    segno    secno   zoneno  dirty_seg   full_seg  valid_blk
  - COLD   data:        0        4        4        4          0          0          0
  - WARM   data:        0        7        7        7          0          0          0
  - HOT    data:        1        5        5        5          2          0        512
  - Dir   dnode:        3        0        0        0          1          0          2
  - File  dnode:        0        1        1        1          0          0          0
  - Indir nodes:        0        2        2        2          0          0          0
  - Pinned file:        0       -1       -1       -1
  - ATGC   data:        0       -1       -1       -1

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/debug.c | 29 +++++++++++++++++++----------
 fs/f2fs/f2fs.h  |  1 +
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 43a83bbd3bc5..032683835569 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -251,6 +251,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	for (i = CURSEG_HOT_DATA; i < NO_CHECK_TYPE; i++) {
 		struct curseg_info *curseg = CURSEG_I(sbi, i);
 
+		si->blkoff[i] = curseg->next_blkoff;
 		si->curseg[i] = curseg->segno;
 		si->cursec[i] = GET_SEC_FROM_SEG(sbi, curseg->segno);
 		si->curzone[i] = GET_ZONE_FROM_SEC(sbi, si->cursec[i]);
@@ -508,55 +509,63 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
 			   si->main_area_segs, si->main_area_sections,
 			   si->main_area_zones);
-		seq_printf(s, "    TYPE         %8s %8s %8s %10s %10s %10s\n",
-			   "segno", "secno", "zoneno", "dirty_seg", "full_seg", "valid_blk");
-		seq_printf(s, "  - COLD   data: %8d %8d %8d %10u %10u %10u\n",
+		seq_printf(s, "    TYPE         %8s %8s %8s %8s %10s %10s %10s\n",
+			   "blkoff", "segno", "secno", "zoneno", "dirty_seg", "full_seg", "valid_blk");
+		seq_printf(s, "  - COLD   data: %8d %8d %8d %8d %10u %10u %10u\n",
+			   si->blkoff[CURSEG_COLD_DATA],
 			   si->curseg[CURSEG_COLD_DATA],
 			   si->cursec[CURSEG_COLD_DATA],
 			   si->curzone[CURSEG_COLD_DATA],
 			   si->dirty_seg[CURSEG_COLD_DATA],
 			   si->full_seg[CURSEG_COLD_DATA],
 			   si->valid_blks[CURSEG_COLD_DATA]);
-		seq_printf(s, "  - WARM   data: %8d %8d %8d %10u %10u %10u\n",
+		seq_printf(s, "  - WARM   data: %8d %8d %8d %8d %10u %10u %10u\n",
+			   si->blkoff[CURSEG_WARM_DATA],
 			   si->curseg[CURSEG_WARM_DATA],
 			   si->cursec[CURSEG_WARM_DATA],
 			   si->curzone[CURSEG_WARM_DATA],
 			   si->dirty_seg[CURSEG_WARM_DATA],
 			   si->full_seg[CURSEG_WARM_DATA],
 			   si->valid_blks[CURSEG_WARM_DATA]);
-		seq_printf(s, "  - HOT    data: %8d %8d %8d %10u %10u %10u\n",
+		seq_printf(s, "  - HOT    data: %8d %8d %8d %8d %10u %10u %10u\n",
+			   si->blkoff[CURSEG_HOT_DATA],
 			   si->curseg[CURSEG_HOT_DATA],
 			   si->cursec[CURSEG_HOT_DATA],
 			   si->curzone[CURSEG_HOT_DATA],
 			   si->dirty_seg[CURSEG_HOT_DATA],
 			   si->full_seg[CURSEG_HOT_DATA],
 			   si->valid_blks[CURSEG_HOT_DATA]);
-		seq_printf(s, "  - Dir   dnode: %8d %8d %8d %10u %10u %10u\n",
+		seq_printf(s, "  - Dir   dnode: %8d %8d %8d %8d %10u %10u %10u\n",
+			   si->blkoff[CURSEG_HOT_NODE],
 			   si->curseg[CURSEG_HOT_NODE],
 			   si->cursec[CURSEG_HOT_NODE],
 			   si->curzone[CURSEG_HOT_NODE],
 			   si->dirty_seg[CURSEG_HOT_NODE],
 			   si->full_seg[CURSEG_HOT_NODE],
 			   si->valid_blks[CURSEG_HOT_NODE]);
-		seq_printf(s, "  - File  dnode: %8d %8d %8d %10u %10u %10u\n",
+		seq_printf(s, "  - File  dnode: %8d %8d %8d %8d %10u %10u %10u\n",
+			   si->blkoff[CURSEG_WARM_NODE],
 			   si->curseg[CURSEG_WARM_NODE],
 			   si->cursec[CURSEG_WARM_NODE],
 			   si->curzone[CURSEG_WARM_NODE],
 			   si->dirty_seg[CURSEG_WARM_NODE],
 			   si->full_seg[CURSEG_WARM_NODE],
 			   si->valid_blks[CURSEG_WARM_NODE]);
-		seq_printf(s, "  - Indir nodes: %8d %8d %8d %10u %10u %10u\n",
+		seq_printf(s, "  - Indir nodes: %8d %8d %8d %8d %10u %10u %10u\n",
+			   si->blkoff[CURSEG_COLD_NODE],
 			   si->curseg[CURSEG_COLD_NODE],
 			   si->cursec[CURSEG_COLD_NODE],
 			   si->curzone[CURSEG_COLD_NODE],
 			   si->dirty_seg[CURSEG_COLD_NODE],
 			   si->full_seg[CURSEG_COLD_NODE],
 			   si->valid_blks[CURSEG_COLD_NODE]);
-		seq_printf(s, "  - Pinned file: %8d %8d %8d\n",
+		seq_printf(s, "  - Pinned file: %8d %8d %8d %8d\n",
+			   si->blkoff[CURSEG_COLD_DATA_PINNED],
 			   si->curseg[CURSEG_COLD_DATA_PINNED],
 			   si->cursec[CURSEG_COLD_DATA_PINNED],
 			   si->curzone[CURSEG_COLD_DATA_PINNED]);
-		seq_printf(s, "  - ATGC   data: %8d %8d %8d\n",
+		seq_printf(s, "  - ATGC   data: %8d %8d %8d %8d\n",
+			   si->blkoff[CURSEG_ALL_DATA_ATGC],
 			   si->curseg[CURSEG_ALL_DATA_ATGC],
 			   si->cursec[CURSEG_ALL_DATA_ATGC],
 			   si->curzone[CURSEG_ALL_DATA_ATGC]);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 71adfacaca45..b828cf653a72 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4199,6 +4199,7 @@ struct f2fs_stat_info {
 	int gc_secs[2][2];
 	int tot_blks, data_blks, node_blks;
 	int bg_data_blks, bg_node_blks;
+	int blkoff[NR_CURSEG_TYPE];
 	int curseg[NR_CURSEG_TYPE];
 	int cursec[NR_CURSEG_TYPE];
 	int curzone[NR_CURSEG_TYPE];
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
