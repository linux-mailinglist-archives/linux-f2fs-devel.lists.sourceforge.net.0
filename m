Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E76BACFD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2019 06:02:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCFYX-00027V-8p; Mon, 23 Sep 2019 04:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunqiuyang@huawei.com>) id 1iCFYV-00027N-Li
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 04:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iXmbH3zqbx+delXr/bu8AjA9V+wdnNTlerpo2Q3CgGw=; b=JgWhzDpUNOTNaNG8df3vu/ZYDg
 QaTYgh//6tOTY02WP+3Zyun7A6Au+moyAeNvHN6Z/Ed0FIuWlzoqeDYeYkfOkd5JgHJfJo27fLy6r
 fk513i7I/gEFdmfd7PzWr+qseOUtERuK96Bs37rtcSeoP4i+2wyrsZR+KJI9X4Jb5GFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iXmbH3zqbx+delXr/bu8AjA9V+wdnNTlerpo2Q3CgGw=; b=f
 eDLvu4xh9RBE/jnDphRHbxcJtHjhskm1U76z1YR9lDLmGRgw6dqy0j7N0K9C1gwuT2sFxbuL7gq4c
 qmEOznExk+ca8HcuKe9pv1P0SjrkwHeRCYB1xTJNDEQFRvrV3Mh6+dcgGxcwWpoJ6zwK2dczgmr/i
 YvLUl0dlWr4WLgwo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCFYU-004gNb-1P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 04:02:31 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 15F0A4B3AC57B70D4077;
 Mon, 23 Sep 2019 12:02:23 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Sep 2019
 12:02:14 +0800
From: sunqiuyang <sunqiuyang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <jaegeuk@kernel.org>,
 <yuchao0@huawei.com>
Date: Mon, 23 Sep 2019 12:22:35 +0800
Message-ID: <20190923042235.37286-1-sunqiuyang@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iCFYU-004gNb-1P
Subject: [f2fs-dev] [PATCH 1/1] f2fs: check total_segments from devices in
 raw_super
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
Cc: sunqiuyang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qiuyang Sun <sunqiuyang@huawei.com>

For multi-device F2FS, we should check if the sum of total_segments from
all devices matches segment_count.

Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
---
 fs/f2fs/super.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 04788a6..9a09d59 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2602,6 +2602,21 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
+	if (RDEV(0).path[0]) {
+		block_t dev_seg_count = le32_to_cpu(RDEV(0).total_segments);
+		int i = 1;
+
+		while (i < MAX_DEVICES && RDEV(i).path[0]) {
+			dev_seg_count += le32_to_cpu(RDEV(i).total_segments);
+			i++;
+		}
+		if (segment_count != dev_seg_count) {
+			f2fs_info(sbi, "Segment count (%u) mismatch with total segments from devices (%u)",
+					segment_count, dev_seg_count);
+			return -EFSCORRUPTED;
+		}
+	}
+
 	if (secs_per_zone > total_sections || !secs_per_zone) {
 		f2fs_info(sbi, "Wrong secs_per_zone / total_sections (%u, %u)",
 			  secs_per_zone, total_sections);
-- 
1.8.3.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
