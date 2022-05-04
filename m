Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F75193BD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 03:48:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nm47j-0005qB-TS; Wed, 04 May 2022 01:48:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nm47i-0005q5-L0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 01:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2PlFdOCZizCNuxQpR2MPp4WthbBAcdEbIMnq0fTzQ+M=; b=awCpSnCv1Fm+v06aAbdlhoz/Eh
 rOiYbAxT9ZhUpGHEIQ+2TCoBYuRP1ox97oKBYEJgp1P5FUbZ1DD7wXAzw2glSaKTvMGr15MBrl8yn
 TjgL1VlyxCYkL8DMqX4oFx9wTCDwGA/aL+T9+uC5opMc9D/UJ57AGMWFM8kg885LSPy4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2PlFdOCZizCNuxQpR2MPp4WthbBAcdEbIMnq0fTzQ+M=; b=V
 du6Kb8MBDgLQAdnSAUp63P0goghr8Oov59e2LP92gQbVqkPL5AmXtLahJe+bVb77jFs8zlA+epGol
 mxIO74P4TSYjn3vOdl7MPAYBTQK26C4QlZl3m0UMAHi5D58IfpZtH/YwOp2jlwOBq3CetMcOgaTQf
 yNrKdOvVTM5L3/9Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nm47i-000ce6-8m
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 01:48:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD5AC61985;
 Wed,  4 May 2022 01:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817C5C385A9;
 Wed,  4 May 2022 01:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651628888;
 bh=1sRYRjLbt8trZsAxQP405ve5/+hZRzhVT+rXdU002IU=;
 h=From:To:Cc:Subject:Date:From;
 b=ZIqODaO4EeJ3AGQlFrE98zItIkLii9TzICBsRd4HttDYp3pWa1CS91mDp0ZUG6rw7
 0CfC61X+QTB8CfkhI0IfKJTrK1XkCVKDbALRtn1/jIDPB5DgnezjcBpdxiqCgiSSQq
 RYy0Sr5k8tF72NreVxLBMxbHzhHejpdQD7l1ztACPs4V7bzwugXp19PXHC0yLQuLEw
 Zqphrb0YORYhyJR/9DFSPDwVegg6iCuFN3kzs+NeOaUfToWmH4IvpL7jbcKERBjYhU
 us+cOa1ec/2irqMEf8UQ3DkvRfQ/CKtyYEZQD26cQhblA2dk3l3Tz1Vrlsmix1UJY1
 FKD8FhW6pSJqQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  4 May 2022 09:47:55 +0800
Message-Id: <20220504014755.1727-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Yanming reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=215914
 The root cause is: in a very small sized image, it's very easy to exceed
 threshold of foreground GC, if we calculate free space and dirty data based
 on section granularity, in corner case, has_not_eno [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nm47i-000ce6-8m
Subject: [f2fs-dev] [PATCH v2] f2fs: fix deadloop in foreground GC
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Ming Yan <yanming@tju.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Yanming reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215914

The root cause is: in a very small sized image, it's very easy to
exceed threshold of foreground GC, if we calculate free space and
dirty data based on section granularity, in corner case,
has_not_enough_free_secs() will always return true, result in
deadloop in f2fs_gc().

So this patch refactors has_not_enough_free_secs() as below to fix
this issue:
1. calculate needed space based on block granularity, and separate
all blocks to two parts, section part, and block part, comparing
section part to free section, and comparing block part to free space
in openned log.
2. account F2FS_DIRTY_NODES, F2FS_DIRTY_IMETA and F2FS_DIRTY_DENTS
as node block consumer;
3. account F2FS_DIRTY_DENTS as data block consumer;

Cc: stable@vger.kernel.org
Reported-by: Ming Yan <yanming@tju.edu.cn>
Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v2:
- fix performance regression
 fs/f2fs/segment.h | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8a591455d796..c38263dbc5ca 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -575,11 +575,10 @@ static inline int reserved_sections(struct f2fs_sb_info *sbi)
 	return GET_SEC_FROM_SEG(sbi, reserved_segments(sbi));
 }
 
-static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
+static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
+			unsigned int node_blocks, unsigned int dent_blocks)
 {
-	unsigned int node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
-					get_pages(sbi, F2FS_DIRTY_DENTS);
-	unsigned int dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
+
 	unsigned int segno, left_blocks;
 	int i;
 
@@ -605,19 +604,28 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
 static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 					int freed, int needed)
 {
-	int node_secs = get_blocktype_secs(sbi, F2FS_DIRTY_NODES);
-	int dent_secs = get_blocktype_secs(sbi, F2FS_DIRTY_DENTS);
-	int imeta_secs = get_blocktype_secs(sbi, F2FS_DIRTY_IMETA);
+	unsigned int total_node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
+					get_pages(sbi, F2FS_DIRTY_DENTS) +
+					get_pages(sbi, F2FS_DIRTY_IMETA);
+	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
+	unsigned int node_secs = total_node_blocks / BLKS_PER_SEC(sbi);
+	unsigned int dent_secs = total_dent_blocks / BLKS_PER_SEC(sbi);
+	unsigned int node_blocks = total_node_blocks % BLKS_PER_SEC(sbi);
+	unsigned int dent_blocks = total_dent_blocks % BLKS_PER_SEC(sbi);
+	unsigned int free, need_lower, need_upper;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		return false;
 
-	if (free_sections(sbi) + freed == reserved_sections(sbi) + needed &&
-			has_curseg_enough_space(sbi))
+	free = free_sections(sbi) + freed;
+	need_lower = node_secs + dent_secs + reserved_sections(sbi) + needed;
+	need_upper = need_lower + node_blocks ? 1 : 0 + dent_blocks ? 1 : 0;
+
+	if (free > need_upper)
 		return false;
-	return (free_sections(sbi) + freed) <=
-		(node_secs + 2 * dent_secs + imeta_secs +
-		reserved_sections(sbi) + needed);
+	else if (free <= need_lower)
+		return true;
+	return !has_curseg_enough_space(sbi, node_blocks, dent_blocks);
 }
 
 static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
