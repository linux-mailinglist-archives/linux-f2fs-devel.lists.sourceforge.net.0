Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5137A470
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 12:18:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgPSl-0006E2-IX; Tue, 11 May 2021 10:18:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lgPSi-0006Dg-Dg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 10:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0FAMz3gI5yibqrvj7RIjuyiqWz6I2ZCzTE1bebn+gz4=; b=R9vmU5pVGSVfns6vc3sG6Dzfj7
 CsyJs9Y2N3g7ZZloWXedm6pREnLuW4OXVMu7bWvkAo+ll5xO3aSuKTmMS0VN7YgdjKk5cDGW3/JNV
 BkAiE9pqQoRczxy7WEAIEVWV+OrBepXf+eZ1eOUSen/QybrLdHPr1rbk5iNWW6SButsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0FAMz3gI5yibqrvj7RIjuyiqWz6I2ZCzTE1bebn+gz4=; b=B
 YdDVDJ48sopgtKGDIIx6l4LaBM/M5XMckDb6bZyrwc+LTYZTltUlqKwu8IofTyOTdSeTSpVSu51KQ
 EvhGUowaQglkHG6aLF07Gpp4um05/QRkmJxUoGK+Im7J2Baut/IeCpBGDUpr3frRjK6IcNXouxYY2
 q79YdeN4kCmXg4l8=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgPSh-003gqZ-GP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 10:18:02 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfYhp4p5hzlcfM;
 Tue, 11 May 2021 18:15:38 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 18:17:42 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 11 May 2021 18:17:34 +0800
Message-ID: <20210511101735.15573-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lgPSh-003gqZ-GP
Subject: [f2fs-dev] [PATCH 1/2] f2fs: atgc: fix to set default age threshold
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

Default age threshold value is missed to set, fix it.

Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
Reported-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 1105c02d6768..40c2af91ccb1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1823,6 +1823,7 @@ static void init_atgc_management(struct f2fs_sb_info *sbi)
 	am->candidate_ratio = DEF_GC_THREAD_CANDIDATE_RATIO;
 	am->max_candidate_count = DEF_GC_THREAD_MAX_CANDIDATE_COUNT;
 	am->age_weight = DEF_GC_THREAD_AGE_WEIGHT;
+	am->age_threshold = DEF_GC_THREAD_AGE_THRESHOLD;
 }
 
 void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
