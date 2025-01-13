Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F11BFA0AD30
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jan 2025 02:48:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tX9Yh-0003iE-Pq;
	Mon, 13 Jan 2025 01:48:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1tX9Yg-0003hx-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 01:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4XzzYzeoQZaAyLVuzb/V6iaoHrZAyuoMPJWqp1oXzNA=; b=OdWXhT9+cVrS7ytTwWQelnMMiA
 TkUOEGllzPJtbow6BEiPtB7Glq+8HmrIAmOMVQzbKNLys4JBNUI9uenIzTDSxIXqQuI9v5EN0HoUN
 2y6H/DWzHvBooFra7mgLz2m62v4YCEGvkxRCfhEZBsNd0k3JfJ5vGBmn8dpDNmZZOGoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4XzzYzeoQZaAyLVuzb/V6iaoHrZAyuoMPJWqp1oXzNA=; b=Q
 DuXQmx7UEKiE0ecg70ZymRnQ1KSBB8onVoH8W0xcCehzkFSFwCAvv2OqI7WEyn8QChj2lLKj8V5QH
 GihiQTEdYMzIStQNSYPL7hrVnWTAm4RcssdYElop9cxDzQG4t+puQno3hwLuFV+y/VZ9kqy9ngXjP
 OktV1RBjnrMxGtzs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tX9Ye-0002jh-NX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jan 2025 01:48:02 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 50D1l98o026645;
 Mon, 13 Jan 2025 09:47:09 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YWZmd6N0hz2NqSDq;
 Mon, 13 Jan 2025 09:44:01 +0800 (CST)
Received: from tj10379pcu1.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 13 Jan 2025 09:47:04 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <yi.sun@unisoc.com>, <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Mon, 13 Jan 2025 09:47:02 +0800
Message-ID: <20250113014702.2312729-1-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 50D1l98o026645
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Now f2fs_invalidate_blocks() supports a continuous range of
 addresses,
 so the for loop can be omitted. Signed-off-by: Yi Sun <yi.sun@unisoc.com>
 Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> --- fs/f2fs/file.c | 4
 +--- 1 file changed, 1 insertion(+), 3 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [222.66.158.135 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tX9Ye-0002jh-NX
Subject: [f2fs-dev] [PATCH] f2fs: Clean up the loop outside of
 f2fs_invalidate_blocks()
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
Cc: Ke.Wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now f2fs_invalidate_blocks() supports a continuous range of addresses,
so the for loop can be omitted.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9980d17ef9f5..4baafad7a00c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -811,10 +811,8 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	if (IS_DEVICE_ALIASING(inode)) {
 		struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
 		struct extent_info ei = et->largest;
-		unsigned int i;
 
-		for (i = 0; i < ei.len; i++)
-			f2fs_invalidate_blocks(sbi, ei.blk + i, 1);
+		f2fs_invalidate_blocks(sbi, ei.blk, ei.len);
 
 		dec_valid_block_count(sbi, inode, ei.len);
 		f2fs_update_time(sbi, REQ_TIME);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
