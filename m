Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D826E9F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Sep 2020 02:29:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJ4HI-0006TG-MR; Fri, 18 Sep 2020 00:29:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1kJ4HH-0006T6-4s
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 00:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxAXhYVZmRHeL64m36kc3XxJhixkY6FhE4ZS2EZprOM=; b=iu1QDWldm6xfjah4IYomdSzaba
 ZQu7qInOrhb58gNoOpLkziNeDsvqvyPkt4yCqXODMvVoOLF9jrTmEdHLNnB6qU7FV+YDNB4Gx92GX
 VWmoxkm0WB9iF3OIhlkTSl9esXQSNcfgqixCrom+0LcQ5wZhsKLtPmLKGCMWUSutg1ek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hxAXhYVZmRHeL64m36kc3XxJhixkY6FhE4ZS2EZprOM=; b=d
 FcwSN2WMw3k2ZLHzpyc9bFAWazD7vx+1OdSBw+wD1M0gEMWgaR9rE1yBDxRkQ+opZAw4nRSlFTGPw
 N+rJqquQt8EOeJ41WiZBKGbtJ3uoh93KPt2gS4AMrSqwUQ+h63md0281g+RNCN55PDLQLOsNWT9Ws
 bZY+67zxz7AioDcc=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kJ4H8-00Df4c-IK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 00:29:27 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 01E187D5047E6B0A1609;
 Fri, 18 Sep 2020 08:29:08 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 08:29:02 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 18 Sep 2020 08:31:24 +0800
Message-ID: <20200918003124.1222353-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kJ4H8-00Df4c-IK
Subject: [f2fs-dev] [PATCH] f2fs: remove duplicated code in
 sanity_check_area_boundary
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use seg_end_blkaddr instead of "segment0_blkaddr + (segment_count <<
log_blocks_per_seg)".

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/super.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index dfa072fa8081..d9ec59d68f63 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2680,10 +2680,8 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 	}
 
 	if (main_end_blkaddr > seg_end_blkaddr) {
-		f2fs_info(sbi, "Wrong MAIN_AREA boundary, start(%u) end(%u) block(%u)",
-			  main_blkaddr,
-			  segment0_blkaddr +
-			  (segment_count << log_blocks_per_seg),
+		f2fs_info(sbi, "Wrong MAIN_AREA boundary, start(%u) end(%llu) block(%u)",
+			  main_blkaddr, seg_end_blkaddr,
 			  segment_count_main << log_blocks_per_seg);
 		return true;
 	} else if (main_end_blkaddr < seg_end_blkaddr) {
@@ -2701,10 +2699,8 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 			err = __f2fs_commit_super(bh, NULL);
 			res = err ? "failed" : "done";
 		}
-		f2fs_info(sbi, "Fix alignment : %s, start(%u) end(%u) block(%u)",
-			  res, main_blkaddr,
-			  segment0_blkaddr +
-			  (segment_count << log_blocks_per_seg),
+		f2fs_info(sbi, "Fix alignment : %s, start(%u) end(%llu) block(%u)",
+			  res, main_blkaddr, seg_end_blkaddr,
 			  segment_count_main << log_blocks_per_seg);
 		if (err)
 			return true;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
