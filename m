Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486935F3DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Apr 2021 14:35:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWejQ-0003NY-3c; Wed, 14 Apr 2021 12:34:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lWeiK-0003If-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Apr 2021 12:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2QmKkFDkMrsl3vmd6OKKb9OkAvg/mS0tYjhYNS8L3w4=; b=SzwrXhoAVQMtLsQxZ0FECxgqtV
 BK5HF74/GE8CC0TvA4z1iSPiOwxvZHhKMYjEFh7xgKjLE4S530e+R0bbGYwpTy3UiH/GZy3lII3kc
 h4MOiU67lb9XqgILEZyBYGA+9qFnsa55pO6YVpa0vvD5lBiosd+vXd6JGYn0diYDBt34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2QmKkFDkMrsl3vmd6OKKb9OkAvg/mS0tYjhYNS8L3w4=; b=L
 uzhyaGhX23h6C7sITUuZPuXDPMuPayyjUnxPpdohksvwi45YeFIEeMEEdJYzks/fjweI3nzwM02dF
 f/mf6zHYANZ6R+sHqcG0OggPA7DnX5GIyyshlPkCUM9gfQi48L8LghxqUYNGnVgV0kxcf+/6pmH+j
 ZXs/McDDZxn5HKgo=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lWeiD-003FfA-2X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Apr 2021 12:33:49 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKl5631RNzlY6m;
 Wed, 14 Apr 2021 09:19:54 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 14 Apr 2021 09:21:37 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 14 Apr 2021 09:21:34 +0800
Message-ID: <20210414012134.128066-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lWeiD-003FfA-2X
Subject: [f2fs-dev] [PATCH] f2fs: fix to cover allocate_segment() with lock
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

As we did for other cases, in fix_curseg_write_pointer(), let's
change as below:
- use callback function s_ops->allocate_segment() instead of
raw function allocate_segment_by_default();
- cover allocate_segment() with curseg_lock and sentry_lock.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b2ee6b7791b0..daf9531ec58f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4848,7 +4848,12 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 
 	f2fs_notice(sbi, "Assign new section to curseg[%d]: "
 		    "curseg[0x%x,0x%x]", type, cs->segno, cs->next_blkoff);
-	allocate_segment_by_default(sbi, type, true);
+
+	down_read(&SM_I(sbi)->curseg_lock);
+	down_write(&SIT_I(sbi)->sentry_lock);
+	SIT_I(sbi)->s_ops->allocate_segment(sbi, type, true);
+	up_write(&SIT_I(sbi)->sentry_lock);
+	up_read(&SM_I(sbi)->curseg_lock);
 
 	/* check consistency of the zone curseg pointed to */
 	if (check_zone_write_pointer(sbi, zbd, &zone))
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
