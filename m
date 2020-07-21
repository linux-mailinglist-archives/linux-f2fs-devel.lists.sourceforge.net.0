Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA836227720
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 05:42:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxjAp-0006tr-Vd; Tue, 21 Jul 2020 03:42:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jiayang5@huawei.com>) id 1jxjAp-0006tk-7G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 03:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7fdLNZwkuY7lsRYc+zm4FzVGAKPoCdZVPFbcXrTw2Ms=; b=IASwu4E0+UuurPyoIVHv9kBG64
 /oM6TLMm4YT1vshzJDhIWSMFhCKHVBO6KRs6Ukl+o50wi3Cezg3CgEjScF6VSOCORpuMtzN4OiUb9
 QCKK40g+HWf/CHhor4ej5GT7rDCZoawzVIiFQvh+eoeJfEGD48yRMuFLeoZXi+Zvh5sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7fdLNZwkuY7lsRYc+zm4FzVGAKPoCdZVPFbcXrTw2Ms=; b=f
 CUPMNoGxq1SsUuw7y3iiZwNmDQzzdo+baMdKrA5ZBx4i2ajp/ARkYx0wSt7NsUxNA3/E6mADB03vg
 g07LagSCLKnsMCbMNbvS+rC6V/AZb3HOHu34KfolSSVP+1L2p3LFVZTRTPW178s3P9ElSJMPmGW18
 Zj2wcvjQ+9/B7CPo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxjAm-00EZAs-T3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 03:42:35 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B9424DAC461A2DC26D15;
 Tue, 21 Jul 2020 11:42:22 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Jul 2020 11:42:13 +0800
From: Jia Yang <jiayang5@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Tue, 21 Jul 2020 11:49:14 +0800
Message-ID: <20200721034914.51210-1-jiayang5@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jxjAm-00EZAs-T3
Subject: [f2fs-dev] [PATCH] f2fs: Change the type of
 f2fs_flush_inline_data() to void
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The return value of f2fs_flush_inline_data() is not used,
so delete it.

Signed-off-by: Jia Yang <jiayang5@huawei.com>
---
 fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/node.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..cf808aa749bc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3275,7 +3275,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
 struct page *f2fs_get_node_page_ra(struct page *parent, int start);
 int f2fs_move_node_page(struct page *node_page, int gc_type);
-int f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
+void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
 int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			struct writeback_control *wbc, bool atomic,
 			unsigned int *seq_id);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 03e24df1c84f..6a95bbcb8313 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1814,12 +1814,11 @@ static bool flush_dirty_inode(struct page *page)
 	return true;
 }
 
-int f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
+void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 {
 	pgoff_t index = 0;
 	struct pagevec pvec;
 	int nr_pages;
-	int ret = 0;
 
 	pagevec_init(&pvec);
 
@@ -1858,7 +1857,6 @@ int f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 		pagevec_release(&pvec);
 		cond_resched();
 	}
-	return ret;
 }
 
 int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
