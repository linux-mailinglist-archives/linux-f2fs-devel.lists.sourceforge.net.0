Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DB5BCB1E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 13:54:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaFLf-0002wW-Nd;
	Mon, 19 Sep 2022 11:54:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oaFLd-0002w0-1t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 11:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tlgmmP2eGwnuMRxbRvLewXiGk+1WaNuWUb15i206Y+k=; b=kE/MjhcZwkm9gwk/J/MU3cHWlo
 WuMdxOCXlGV7eSa6wMfqnZZs6Dy1SshS77Lkx/VliOE8YS05bfL3JripSGwJWPFrqLgP43xEokC+s
 LiqL3n5TadEj2/G5M7nYhs7qN80R1GEKn2UI3wd0+VqHDuj7rB8M6IuX2AeedqWB9BPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tlgmmP2eGwnuMRxbRvLewXiGk+1WaNuWUb15i206Y+k=; b=i
 HydbMQJt5i7w6/4kw9Qs7pwOtnOC6+/mtMwPw2A+pKElm+572O5TuR9Lt3k9EdRL116QkUV+MKY5g
 qIaKxZslWUayt5gzlqSQuquG/jUytZb25o8DyDhkeoN7TE4d/oFAm5CVfK0NXI3HcZwBFYNYwP+sn
 FGfjRgwLijch+cZ4=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaFLa-00DJUx-VS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 11:54:00 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MWNLl4YPjzHnxd;
 Mon, 19 Sep 2022 19:51:43 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 19:53:38 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 19:53:38 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 19 Sep 2022 19:57:09 +0800
Message-ID: <20220919115709.57272-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The trace_f2fs_update_extent_tree_range could not record
 compressed
 block length in the cluster of compress file and we just add it.
 Signed-off-by:
 Zhang Qilong <zhangqilong3@huawei.com> --- v2: - modify the title ---
 fs/f2fs/extent_cache.c
 | 4 ++-- include/trace/events/f2fs.h | 13 +++++++++---- 2 files changed,
 11 insertions(+), 6 [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oaFLa-00DJUx-VS
Subject: [f2fs-dev] [PATCH v2 -next] f2fs: add "c_len" into
 trace_f2fs_update_extent_tree_range for compressed file
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

The trace_f2fs_update_extent_tree_range could not record compressed
block length in the cluster of compress file and we just add it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- modify the title
---
 fs/f2fs/extent_cache.c      |  4 ++--
 include/trace/events/f2fs.h | 13 +++++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 761fd42c93f2..746abfda3b66 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -544,7 +544,7 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 	if (!et)
 		return;
 
-	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, len);
+	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, len, 0);
 
 	write_lock(&et->lock);
 
@@ -675,7 +675,7 @@ void f2fs_update_extent_tree_range_compressed(struct inode *inode,
 	struct rb_node **insert_p = NULL, *insert_parent = NULL;
 	bool leftmost = false;
 
-	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen);
+	trace_f2fs_update_extent_tree_range(inode, fofs, blkaddr, llen, c_len);
 
 	/* it is safe here to check FI_NO_EXTENT w/o et->lock in ro image */
 	if (is_inode_flag_set(inode, FI_NO_EXTENT))
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index b262985f0c3a..c6b372401c27 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1578,9 +1578,10 @@ TRACE_EVENT_CONDITION(f2fs_lookup_extent_tree_end,
 TRACE_EVENT(f2fs_update_extent_tree_range,
 
 	TP_PROTO(struct inode *inode, unsigned int pgofs, block_t blkaddr,
-						unsigned int len),
+						unsigned int len,
+						unsigned int c_len),
 
-	TP_ARGS(inode, pgofs, blkaddr, len),
+	TP_ARGS(inode, pgofs, blkaddr, len, c_len),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
@@ -1588,6 +1589,7 @@ TRACE_EVENT(f2fs_update_extent_tree_range,
 		__field(unsigned int, pgofs)
 		__field(u32, blk)
 		__field(unsigned int, len)
+		__field(unsigned int, c_len)
 	),
 
 	TP_fast_assign(
@@ -1596,14 +1598,17 @@ TRACE_EVENT(f2fs_update_extent_tree_range,
 		__entry->pgofs = pgofs;
 		__entry->blk = blkaddr;
 		__entry->len = len;
+		__entry->c_len = c_len;
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, pgofs = %u, "
-					"blkaddr = %u, len = %u",
+					"blkaddr = %u, len = %u, "
+					"c_len = %u",
 		show_dev_ino(__entry),
 		__entry->pgofs,
 		__entry->blk,
-		__entry->len)
+		__entry->len,
+		__entry->c_len)
 );
 
 TRACE_EVENT(f2fs_shrink_extent_tree,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
