Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 467675BCAE8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 13:39:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaF75-0001db-PP;
	Mon, 19 Sep 2022 11:39:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oaF73-0001dV-Ml
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 11:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eozo7MD1aeXar3s94wSAXAQyFGR8kMnvq8sNTTIFelg=; b=DF8Afo+WlI/nFcO8F061Jq0OdL
 gtKbI0oE9Sa6aINTP+y23zqKgoxeui15nB8hJNueWcudSETJ1toB7P8JdAbRf6BDBGJ4JIM8wHTAz
 n1pJW5vAkEAG+dp7B1K8+l8wB1xigessI2RpcHxShUd+GR+EN4/mlFhsrFjR6sd7dYyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Eozo7MD1aeXar3s94wSAXAQyFGR8kMnvq8sNTTIFelg=; b=X
 4jSRs/iXSEbxYqKtltCkx79JFi5Pq0twaP4TmJW2UQgWWaIMIVKVeo6y2kvJOPc1pmEjPeAj7IoOx
 P1RQk3HMCTIDo1JF6Am+lIqy/GlasNtXpNlhBRrxIUznm8ynV6nZAjao9lo82ghq/+F0BAFQQ7N5s
 crldXMkUMTMYdq3o=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaF6z-00DIS5-Ae for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 11:38:57 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWMz4106vzlW0c;
 Mon, 19 Sep 2022 19:34:40 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 19:38:44 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 19:38:44 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 19 Sep 2022 19:42:15 +0800
Message-ID: <20220919114215.55619-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
 Zhang Qilong <zhangqilong3@huawei.com> --- fs/f2fs/extent_cache.c | 4 ++--
 include/trace/events/f2fs.h | 13 +++++++++---- 2 files changed,
 11 insertions(+), 6 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oaF6z-00DIS5-Ae
Subject: [f2fs-dev] [PATCH -next] f2fs: add "c_len" into
 f2fs_update_extent_tree_range for compress file
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
