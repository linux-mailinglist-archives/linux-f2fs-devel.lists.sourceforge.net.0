Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F772DE753
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 17:18:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kqISc-0001e6-0R; Fri, 18 Dec 2020 16:18:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kqIRz-0001ZC-Lr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 16:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=quP+czEOAJSN581ibiN+saAlyOrsdEnJ9LjaDNg9uhw=; b=eCtzEWhQKVXgVWklsdYYPSyDIN
 DfRBSHSRQr+Qf5D3Ah8vM5IGVyInxnUkuRXe5/oPYkBzDaHlIORfYrZHBTeV2MvtcIzb4Snnfc4Vx
 VgFuFV7ijsKH4Y/lTnXhtTHPAzVodfz1zA9SzVQSN5warxOBYz6ygwMmT6BSxvGDo380=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=quP+czEOAJSN581ibiN+saAlyOrsdEnJ9LjaDNg9uhw=; b=N7wV8teGSj1OK87agxUKQWiysh
 qsVawHrGuR+FMQQDSjNTiLrJRVA+keF+fyn45QirCNInXdUd9uL1alNlxCCjG+pneQ1cmyVGLiT9h
 oXz2aVctsDqDCRKHpo00tPSKvcRQ3u5y91i/kbpQ4jrLXuh/UG+7m6uqAlOk/rjm5L8c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kqIRp-001bG6-PC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Dec 2020 16:17:50 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Dec 2020 08:17:08 -0800
Message-Id: <20201218161708.927900-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201218161708.927900-1-jaegeuk@kernel.org>
References: <20201218161708.927900-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kqIRp-001bG6-PC
Subject: [f2fs-dev] [PATCH 3/3] mkfs.f2fs: allocate zones together to avoid
 random access
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

This patch allocates zones to initial logs together, if it's on zoned device.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mkfs/f2fs_format.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f60dcc029d58..b4bec92a24d9 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -510,6 +510,13 @@ static int f2fs_prepare_super_block(void)
 		c.cur_seg[CURSEG_HOT_DATA] = prev_zone(CURSEG_COLD_NODE);
 		c.cur_seg[CURSEG_COLD_DATA] = 0;
 		c.cur_seg[CURSEG_WARM_DATA] = next_zone(CURSEG_COLD_DATA);
+	} else if (c.zoned_mode) {
+		c.cur_seg[CURSEG_HOT_NODE] = 0;
+		c.cur_seg[CURSEG_WARM_NODE] = next_zone(CURSEG_HOT_NODE);
+		c.cur_seg[CURSEG_COLD_NODE] = next_zone(CURSEG_WARM_NODE);
+		c.cur_seg[CURSEG_HOT_DATA] = next_zone(CURSEG_COLD_NODE);
+		c.cur_seg[CURSEG_WARM_DATA] = next_zone(CURSEG_HOT_DATA);
+		c.cur_seg[CURSEG_COLD_DATA] = next_zone(CURSEG_WARM_DATA);
 	} else {
 		c.cur_seg[CURSEG_HOT_NODE] = 0;
 		c.cur_seg[CURSEG_WARM_NODE] = next_zone(CURSEG_HOT_NODE);
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
