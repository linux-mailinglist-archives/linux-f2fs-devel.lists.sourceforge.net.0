Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 776225B9C24
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Sep 2022 15:41:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYp6j-0006Wk-0X;
	Thu, 15 Sep 2022 13:40:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oYp6f-0006WV-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Sep 2022 13:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KzaMO/Y9jszw/rR0P/6aKEJQ4QGNffpdi+/FlI5BYIA=; b=TjdXcMz8+UZfh178CLTr3nSIq3
 g/n2fsLYxH5qaiPU5Ryl3dVqbSe3/yl535J1mKDl2NHxx01Gs/FjzZ2CtJ7om+p8ptTyiWdIQM753
 u6YizjdFZY5v3U2mRB8WkvZbg7+vIHa+s1ozySi8TM9R1OM+S4+zPj5+ev4nYyRUvnV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KzaMO/Y9jszw/rR0P/6aKEJQ4QGNffpdi+/FlI5BYIA=; b=K
 j8iHytGve8YOpil+FmZFMiA2gedQcfjNtaOUuMFUvtkV4pBSPLs8Q6D/xj7Tqvufm8vdqeXaOOZUz
 LYfdJT+P+pfqW7jw2iHEbZfeCirHe6i2nA7HEebzrk4kxmlAWXz9SfiOq0zyMBcYbREdj1MxmGU10
 lRP02vx97FOyu374=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYp6p-0006VL-DN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Sep 2022 13:40:54 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSyrw3Q1kzNmD8;
 Thu, 15 Sep 2022 21:36:00 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 21:40:37 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 21:40:36 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 15 Sep 2022 21:44:08 +0800
Message-ID: <20220915134408.69886-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For f2fs_update_extent_tree_range_compressed, keeping the
 trace and function name consistent to distinguish from trace of
 f2fs_update_extent_tree_range.
 And we add "c_len" into the trace, result like: 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oYp6p-0006VL-DN
Subject: [f2fs-dev] [PATCH -next] f2fs: add a trace interface for
 f2fs_update_extent_tree_range_compressed
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For f2fs_update_extent_tree_range_compressed, keeping
the trace and function name consistent to distinguish
from trace of f2fs_update_extent_tree_range. And we add
"c_len" into the trace, result like:

  [003] .....   228.568157: f2fs_update_extent_tree_range_compressed:
                dev = (8,0), ino = 5, pgofs = 96, blkaddr = 2548760,
                len = 4, c_len = 1

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/extent_cache.c      |  2 +-
 include/trace/events/f2fs.h | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 761fd42c93f2..df41eca6386a 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -675,7 +675,7 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
 	bool leftmost = false;
 
-	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen);
+	trace_f2fs_update_extent_tree_range_compressed(inode, fofs, blkaddr, llen, c_len);
 
 	/* it is safe here to check FI_NO_EXTENT w/o et->lock in ro image */
 	if (is_inode_flag_set(inode, FI_NO_EXTENT))
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index b262985f0c3a..54a9f6feca1b 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1606,6 +1606,42 @@ TRACE_EVENT(f2fs_update_extent_tree_range,
 		__entry->len)
 );
 
+TRACE_EVENT(f2fs_update_extent_tree_range_compressed,
+
+	TP_PROTO(struct inode *inode, unsigned int pgofs, block_t blkaddr,
+						unsigned int len,
+						unsigned int c_len),
+
+	TP_ARGS(inode, pgofs, blkaddr, len, c_len),
+
+	TP_STRUCT__entry(
+		__field(dev_t,	dev)
+		__field(ino_t,	ino)
+		__field(unsigned int, pgofs)
+		__field(u32, blk)
+		__field(unsigned int, len)
+		__field(unsigned int, c_len)
+	),
+
+	TP_fast_assign(
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->ino = inode->i_ino;
+		__entry->pgofs = pgofs;
+		__entry->blk = blkaddr;
+		__entry->len = len;
+		__entry->c_len = c_len;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
+					"blkaddr = %u, len = %u, "
+					"c_len = %u",
+		show_dev_ino(__entry),
+		__entry->pgofs,
+		__entry->blk,
+		__entry->len,
+		__entry->c_len)
+);
+
 TRACE_EVENT(f2fs_shrink_extent_tree,
 
 	TP_PROTO(struct f2fs_sb_info *sbi, unsigned int node_cnt,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
