Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F35464F67B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 01:47:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6LME-0006xT-5x;
	Sat, 17 Dec 2022 00:47:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p6LMD-0006xM-EU
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hKYvtkFrQ5Gu/XGBw1Du7t9DP65ZOOocIcAU545xFeM=; b=LG078gzCtCTSWosXZMebD+Ax/Y
 ZwXDV/Re2IZaJ1R7kQ5ZTR0GNjCgTJdkGKJAmLH47DSjXdE0dH7oYEYO1fEN92b8IPRHcNy1ASEyZ
 uH6HGzIsQLqKGMxTC+y6oBeOeCMTLtISzUnyPUb+SCtaUkLfrEci/eX17EAkrPx8P5q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hKYvtkFrQ5Gu/XGBw1Du7t9DP65ZOOocIcAU545xFeM=; b=PmG1NMYkEkC2ZQmNHek/nCibCV
 rRPDK3mLgC2TBMRUzov7ZEegMLfDKvOU0p7+eoo5lslr9F6o0NSu4iGVGfO3ty5X2fcBmv/TLWqd0
 0ish0LXZA9FAlldXOogPZ4jFKsvype6g4agG36QyKycGMDd9nMuDD/ad6Tu9ud6ovpfg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6LMC-001vH0-SY for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 00:47:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46C82622FF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 17 Dec 2022 00:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF15C433D2;
 Sat, 17 Dec 2022 00:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671238027;
 bh=AzwJwO831ToMtkyVqdqwG2XUb0eIPd36DW9P8p2Lef0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItJS5nPxoXXc64tEoC8hOfl3x6pXx4brhOBseH0Pyxksxzz8in1nqVZnqERljNmqU
 brEIUU6hQEmXiUDL3EO7RmSQSIZ39aeG+LvjL+ndsRthYCklXmUKHKbg1ZU1/4euEv
 DdJjdXqHwWWcNokSfdY0S0YFxiPnuVTTkXUeC9dmmtwPepkh7gwmibrfwTU3/6nCZU
 hr9DCu5h1Ocig/o8lj4ISjo1vRRGvUhvMbraTdE8qMuigvKPWF1tNvzanI+Qb2U3O4
 nsjUThYrohqD37nig5b+Z6mGHivajLd5heX/wzOmPxVyim35RY649jXB+2LRCXELTn
 3g0kXPxMvVdyw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Dec 2022 16:46:59 -0800
Message-Id: <20221217004659.2092427-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20221217004659.2092427-1-jaegeuk@kernel.org>
References: <20221217004659.2092427-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise, __lookup_extent_tree() will override the given
 extent_info which will be used by caller. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/extent_cache.c | 13 +++++++------ 1 file changed, 7 insertions(+), 
 6 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p6LMC-001vH0-SY
Subject: [f2fs-dev] [PATCH 3/3] f2fs: should use a temp extent_info for
 lookup
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

Otherwise, __lookup_extent_tree() will override the given extent_info which will
be used by caller.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/extent_cache.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 7bd1e1832412..a510fa57a823 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -888,6 +888,7 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 	loff_t f_size = i_size_read(inode);
 	unsigned long long cur_blocks =
 				atomic64_read(&sbi->allocated_data_blocks);
+	struct extent_info tei = *ei;	/* only fofs and len are valid */
 
 	/*
 	 * When I/O is not aligned to a PAGE_SIZE, update will happen to the last
@@ -898,17 +899,17 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
 			blkaddr == NEW_ADDR)
 		return -EINVAL;
 
-	if (__lookup_extent_tree(inode, ei->fofs, ei, EX_BLOCK_AGE)) {
+	if (__lookup_extent_tree(inode, ei->fofs, &tei, EX_BLOCK_AGE)) {
 		unsigned long long cur_age;
 
-		if (cur_blocks >= ei->last_blocks)
-			cur_age = cur_blocks - ei->last_blocks;
+		if (cur_blocks >= tei.last_blocks)
+			cur_age = cur_blocks - tei.last_blocks;
 		else
 			/* allocated_data_blocks overflow */
-			cur_age = ULLONG_MAX - ei->last_blocks + cur_blocks;
+			cur_age = ULLONG_MAX - tei.last_blocks + cur_blocks;
 
-		if (ei->age)
-			ei->age = __calculate_block_age(cur_age, ei->age);
+		if (tei.age)
+			ei->age = __calculate_block_age(cur_age, tei.age);
 		else
 			ei->age = cur_age;
 		ei->last_blocks = cur_blocks;
-- 
2.39.0.314.g84b9a713c41-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
