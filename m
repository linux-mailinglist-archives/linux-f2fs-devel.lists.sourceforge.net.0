Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE612F662
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 10:51:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inJbm-0007xI-Vo; Fri, 03 Jan 2020 09:51:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1inJbl-0007wd-Qq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 09:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G9xXhN3jFPN5qIzTB2Ga35mv167/rXPJBIj7SZGmH4E=; b=hhKN3irSF7FNrlSAb+vJaLSTsR
 jCJ6scgLFz1NfT1SZHNcgx55s4K/6P/m8l15/McRGXaej23Kc1lTTfqJQhn8RHqUDGqN6nYMo/o1a
 g+xNQ1QnSt6IIcMhxCVOQVE2UKZzIaeOCwoCJ81i2Jttxl8dqVenVHxBSJn75DWLr+nI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=G9xXhN3jFPN5qIzTB2Ga35mv167/rXPJBIj7SZGmH4E=; b=j
 eTvxQwMNzlypzzeqxisKANuBUAZljQBFv+Sa73vL2WLeIFt+bYaQ4cIAGckCI8najPakQvqIdj+of
 xShIRd7AKwPvKFap2H8ndCCOUF+dQ8R6P8cXGSBJp+WlHxzqDKgUxuxIK6NLOtXc31RcGvbI9IpmH
 /1Zv/VVE4hoQFmfg=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inJbZ-008Gtp-KG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 09:51:05 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D9219473D041D0E29CB6;
 Fri,  3 Jan 2020 17:50:42 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Fri, 3 Jan 2020 17:50:36 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 3 Jan 2020 17:50:33 +0800
Message-ID: <20200103095033.8024-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1inJbZ-008Gtp-KG
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix NULL pointer dereference
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

 BUG: kernel NULL pointer dereference, address: 0000000000000000
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: 0000 [#1] SMP PTI
 CPU: 11 PID: 70359 Comm: kworker/u256:4 Tainted: G           OE     5.5.0-rc1 #36
 Hardware name: Xen HVM domU, BIOS 4.1.2_115-908.790. 06/05/2017
 Workqueue: writeback wb_workfn (flush-251:0)
 RIP: 0010:f2fs_write_single_data_page+0x4f/0x700 [f2fs]
 Call Trace:
  ? __next_timer_interrupt+0xc0/0xc0
  ? finish_wait+0x32/0x70
  ? congestion_wait+0xa5/0x120
  f2fs_write_multi_pages+0xc7/0x810 [f2fs]
  f2fs_write_cache_pages+0x6c0/0x790 [f2fs]
  ? select_task_rq_fair+0x584/0x800
  ? atomic_notifier_chain_unregister+0x30/0x70
  ? __set_page_dirty_nobuffers+0x101/0x150
  f2fs_write_data_pages+0x2cd/0x320 [f2fs]
  ? f2fs_update_inode+0x9c/0x4f0 [f2fs]
  ? do_writepages+0x1a/0x60
  do_writepages+0x1a/0x60
  __writeback_single_inode+0x3d/0x340
  writeback_sb_inodes+0x225/0x4a0
  wb_writeback+0xf7/0x320
  ? wb_workfn+0xa8/0x450
  ? _raw_spin_unlock_bh+0xa/0x20
  wb_workfn+0xa8/0x450
  ? finish_task_switch+0x75/0x2a0
  process_one_work+0x15e/0x3e0
  worker_thread+0x4c/0x440
  ? rescuer_thread+0x350/0x350
  kthread+0xf8/0x130
  ? kthread_unpark+0x70/0x70
  ret_from_fork+0x35/0x40

In scenario of truncate vs writeback, we need to check page's mapping
before access it during writeback.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index fa67ffd9d79d..9e8fba78db4d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -932,6 +932,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 					enum iostat_type io_type,
 					bool compressed)
 {
+	struct address_space *mapping = cc->inode->i_mapping;
 	int i, _submitted;
 	int ret, err = 0;
 
@@ -939,6 +940,11 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 		if (!cc->rpages[i])
 			continue;
 retry_write:
+		if (cc->rpages[i]->mapping != mapping) {
+			unlock_page(cc->rpages[i]);
+			continue;
+		}
+
 		BUG_ON(!PageLocked(cc->rpages[i]));
 
 		ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
