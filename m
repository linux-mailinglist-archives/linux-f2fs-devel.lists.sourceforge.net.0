Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D916A4C6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 12:20:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Bn8-0005PX-Ui; Mon, 24 Feb 2020 11:20:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6Bn7-0005PQ-OP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3K/mnuTVphHkYIw2zgmQzN6swivge/2fFW/TDMC2xA4=; b=biS+jOUCb5eO79iKkC4Q5L8pfr
 /+JzHO3MuvL1OL7KOxLsQBg0FEhkOtFJ+ONuj8QMXyBF3sz/Urh5nThPauGr22z/8KRzvNThV/zXL
 kOJdg3RFlBNm/mG1DGxxWyn8o8OEfI875QRacFVpPL2AeJHrwIloRd2LESPpWOlQmau8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3K/mnuTVphHkYIw2zgmQzN6swivge/2fFW/TDMC2xA4=; b=J23k58g1FOwUsYrVkkHT1fmi98
 TOO+N5ggFRb0C2jBsxi6B+lpI4Zv3f8wyH7cL2D+qkhiGhOcprSFYRLbyyO25mY/gee1mYbU+ANxD
 184lWvShN/rlddqecONYN2rhm1FgmcnSIgBL3ANwdoF9qxlw5AqHchfv66PN7tINPqpc=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Bn4-008cMb-3S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:49 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A75C4EE6E982B2D97FEB;
 Mon, 24 Feb 2020 19:20:36 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 19:20:27 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 24 Feb 2020 19:20:17 +0800
Message-ID: <20200224112019.93829-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200224112019.93829-1-yuchao0@huawei.com>
References: <20200224112019.93829-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6Bn4-008cMb-3S
Subject: [f2fs-dev] [PATCH 3/5] f2fs: fix to avoid NULL pointer dereference
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Unable to handle kernel NULL pointer dereference at virtual address 00000000
PC is at f2fs_free_dic+0x60/0x2c8
LR is at f2fs_decompress_pages+0x3c4/0x3e8
f2fs_free_dic+0x60/0x2c8
f2fs_decompress_pages+0x3c4/0x3e8
__read_end_io+0x78/0x19c
f2fs_post_read_work+0x6c/0x94
process_one_work+0x210/0x48c
worker_thread+0x2e8/0x44c
kthread+0x110/0x120
ret_from_fork+0x10/0x18

In f2fs_free_dic(), we can not use f2fs_put_page(,1) to release dic->tpages[i],
as the page's mapping is NULL.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4ba65a3b0456..864035549329 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1133,7 +1133,8 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 		for (i = 0; i < dic->cluster_size; i++) {
 			if (dic->rpages[i])
 				continue;
-			f2fs_put_page(dic->tpages[i], 1);
+			unlock_page(dic->tpages[i]);
+			put_page(dic->tpages[i]);
 		}
 		kfree(dic->tpages);
 	}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
