Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D354D1FEB82
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 08:36:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jloAU-0007eB-Im; Thu, 18 Jun 2020 06:36:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jloAT-0007dr-1U
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 06:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmDTPstNtrcUgR1DXm1Ct5PUYPUA9EWPIpvQYIVdRbQ=; b=hlOctUzeadlXxDsI/0/y/nXBmd
 wylpA71i6VQ3A+D63Mop0CpYqhAcDwT72q870bGzYdlWXnoJTE9A8CzsVcijqjq3kXleXOfM8sHOo
 66Tz1yPy6c5Jsdlo4g17EjN5nUz8P1cZUVFPZGPzQrtXXaK6HEPodyFXp4z6PoszUf/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lmDTPstNtrcUgR1DXm1Ct5PUYPUA9EWPIpvQYIVdRbQ=; b=djf7Ac/JXa6GCjpI458HUC6zs2
 v/8u18ziip3CJF4eiUOCvntbtL3oRX2DOSAg29Ucf5RjHPnt0ZBmR+AUANivF71YgfC5l3xaIi5IO
 ZsBOAFK03a8a+yvle/z0fnirFPwVAZ+kXHhmK5rdgCx6+9YCcRKvBuhXhGsYoh+JY7Vc=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jloAR-007xlZ-P2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 06:36:57 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A323F17A898288F2A316;
 Thu, 18 Jun 2020 14:36:40 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 18 Jun 2020 14:36:33 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 18 Jun 2020 14:36:25 +0800
Message-ID: <20200618063625.110273-5-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200618063625.110273-1-yuchao0@huawei.com>
References: <20200618063625.110273-1-yuchao0@huawei.com>
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jloAR-007xlZ-P2
Subject: [f2fs-dev] [PATCH 5/5] f2fs: show more debug info for
 per-temperature log
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

- Add to account and show per-log dirty_seg, full_seg and valid_blocks
in debugfs.
- reformat printed info.

    TYPE            segno    secno   zoneno  dirty_seg   full_seg  valid_blk
  - COLD   data:     1523     1523     1523          1          0        399
  - WARM   data:      769      769      769         20        255     133098
  - HOT    data:      767      767      767          9          0        167
  - Dir   dnode:       22       22       22          3          0         70
  - File  dnode:      722      722      722         14         10       6505
  - Indir nodes:        2        2        2          1          0          3

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/debug.c | 67 ++++++++++++++++++++++++++++++++++++++++---------
 fs/f2fs/f2fs.h  |  3 +++
 2 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 0dbcb0f9c019..aa1fd2de11ba 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -174,6 +174,29 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	for (i = META_CP; i < META_MAX; i++)
 		si->meta_count[i] = atomic_read(&sbi->meta_count[i]);
 
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		si->dirty_seg[i] = 0;
+		si->full_seg[i] = 0;
+		si->valid_blks[i] = 0;
+	}
+
+	for (i = 0; i < MAIN_SEGS(sbi); i++) {
+		int blks = get_seg_entry(sbi, i)->valid_blocks;
+		int type = get_seg_entry(sbi, i)->type;
+
+		if (!blks)
+			continue;
+
+		if (IS_CURSEG(sbi, i))
+			continue;
+
+		if (blks == sbi->blocks_per_seg)
+			si->full_seg[type]++;
+		else
+			si->dirty_seg[type]++;
+		si->valid_blks[type] += blks;
+	}
+
 	for (i = 0; i < 2; i++) {
 		si->segment_count[i] = sbi->segment_count[i];
 		si->block_count[i] = sbi->block_count[i];
@@ -329,30 +352,50 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
 			   si->main_area_segs, si->main_area_sections,
 			   si->main_area_zones);
-		seq_printf(s, "  - COLD  data: %d, %d, %d\n",
+		seq_printf(s, "    TYPE         %8s %8s %8s %10s %10s %10s\n",
+			   "segno", "secno", "zoneno", "dirty_seg", "full_seg", "valid_blk");
+		seq_printf(s, "  - COLD   data: %8d %8d %8d %10u %10u %10u\n",
 			   si->curseg[CURSEG_COLD_DATA],
 			   si->cursec[CURSEG_COLD_DATA],
-			   si->curzone[CURSEG_COLD_DATA]);
-		seq_printf(s, "  - WARM  data: %d, %d, %d\n",
+			   si->curzone[CURSEG_COLD_DATA],
+			   si->dirty_seg[CURSEG_COLD_DATA],
+			   si->full_seg[CURSEG_COLD_DATA],
+			   si->valid_blks[CURSEG_COLD_DATA]);
+		seq_printf(s, "  - WARM   data: %8d %8d %8d %10u %10u %10u\n",
 			   si->curseg[CURSEG_WARM_DATA],
 			   si->cursec[CURSEG_WARM_DATA],
-			   si->curzone[CURSEG_WARM_DATA]);
-		seq_printf(s, "  - HOT   data: %d, %d, %d\n",
+			   si->curzone[CURSEG_WARM_DATA],
+			   si->dirty_seg[CURSEG_WARM_DATA],
+			   si->full_seg[CURSEG_WARM_DATA],
+			   si->valid_blks[CURSEG_WARM_DATA]);
+		seq_printf(s, "  - HOT    data: %8d %8d %8d %10u %10u %10u\n",
 			   si->curseg[CURSEG_HOT_DATA],
 			   si->cursec[CURSEG_HOT_DATA],
-			   si->curzone[CURSEG_HOT_DATA]);
-		seq_printf(s, "  - Dir   dnode: %d, %d, %d\n",
+			   si->curzone[CURSEG_HOT_DATA],
+			   si->dirty_seg[CURSEG_HOT_DATA],
+			   si->full_seg[CURSEG_HOT_DATA],
+			   si->valid_blks[CURSEG_HOT_DATA]);
+		seq_printf(s, "  - Dir   dnode: %8d %8d %8d %10u %10u %10u\n",
 			   si->curseg[CURSEG_HOT_NODE],
 			   si->cursec[CURSEG_HOT_NODE],
-			   si->curzone[CURSEG_HOT_NODE]);
-		seq_printf(s, "  - File   dnode: %d, %d, %d\n",
+			   si->curzone[CURSEG_HOT_NODE],
+			   si->dirty_seg[CURSEG_HOT_NODE],
+			   si->full_seg[CURSEG_HOT_NODE],
+			   si->valid_blks[CURSEG_HOT_NODE]);
+		seq_printf(s, "  - File  dnode: %8d %8d %8d %10u %10u %10u\n",
 			   si->curseg[CURSEG_WARM_NODE],
 			   si->cursec[CURSEG_WARM_NODE],
-			   si->curzone[CURSEG_WARM_NODE]);
-		seq_printf(s, "  - Indir nodes: %d, %d, %d\n",
+			   si->curzone[CURSEG_WARM_NODE],
+			   si->dirty_seg[CURSEG_WARM_NODE],
+			   si->full_seg[CURSEG_WARM_NODE],
+			   si->valid_blks[CURSEG_WARM_NODE]);
+		seq_printf(s, "  - Indir nodes: %8d %8d %8d %10u %10u %10u\n",
 			   si->curseg[CURSEG_COLD_NODE],
 			   si->cursec[CURSEG_COLD_NODE],
-			   si->curzone[CURSEG_COLD_NODE]);
+			   si->curzone[CURSEG_COLD_NODE],
+			   si->dirty_seg[CURSEG_COLD_NODE],
+			   si->full_seg[CURSEG_COLD_NODE],
+			   si->valid_blks[CURSEG_COLD_NODE]);
 		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
 			   si->main_area_segs - si->dirty_count -
 			   si->prefree_count - si->free_segs,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 72a667f1d678..70565d81320b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3536,6 +3536,9 @@ struct f2fs_stat_info {
 	int curseg[NR_CURSEG_TYPE];
 	int cursec[NR_CURSEG_TYPE];
 	int curzone[NR_CURSEG_TYPE];
+	unsigned int dirty_seg[NR_CURSEG_TYPE];
+	unsigned int full_seg[NR_CURSEG_TYPE];
+	unsigned int valid_blks[NR_CURSEG_TYPE];
 
 	unsigned int meta_count[META_MAX];
 	unsigned int segment_count[2];
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
