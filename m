Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF925A5F4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Sep 2020 09:03:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDMnC-0001pU-JO; Wed, 02 Sep 2020 07:02:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kDMnA-0001p0-Ce
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Sep 2020 07:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ffse53ZhLuCFCPkTYEslm6bWikTpzGNyB5qfZ85VwSA=; b=aiG0ehfAbnoslMP7w8M90nZtw7
 3RYVhYmMYf3J3fMu+wU2TTDQh3dPft6h2zx4kG/Cdsyl0BHpiqJmm9f1VmTgtFTOA2vUA+Au48hCM
 YhAUbb5wV9p9yDnxVGn78D9pL9kcEEbDQEdgcUQd0z7nQZfopKCgU765BP/hKyXLYt2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ffse53ZhLuCFCPkTYEslm6bWikTpzGNyB5qfZ85VwSA=; b=L
 wwNcBa5qs2fMraohwDpgXrBPP+gdB7dHbnvUM8L0LpjAiDlKMZZz2Ma1WnWRYx4CJAB/oLltyX8Nz
 FWYPQOCrsfx0Ut74VWz4fA6cOVEY9e4m5PPk6vQM+r3HIyxzHhYaIknnn37FoQeq5pzHZko65Lt8P
 DKEyb6RDY3kvm1Oc=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDMmu-009oMi-CT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Sep 2020 07:02:48 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 320F5AC2FA410F4E76A5;
 Wed,  2 Sep 2020 15:02:22 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 2 Sep 2020 15:02:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 2 Sep 2020 15:01:52 +0800
Message-ID: <20200902070152.67032-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
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
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kDMmu-009oMi-CT
Subject: [f2fs-dev] [PATCH] f2fs: allocate proper size memory for zstd
 decompress
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
Cc: 5kft <5kft@5kft.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As 5kft <5kft@5kft.org> reported:

 kworker/u9:3: page allocation failure: order:9, mode:0x40c40(GFP_NOFS|__GFP_COMP), nodemask=(null),cpuset=/,mems_allowed=0
 CPU: 3 PID: 8168 Comm: kworker/u9:3 Tainted: G         C        5.8.3-sunxi #trunk
 Hardware name: Allwinner sun8i Family
 Workqueue: f2fs_post_read_wq f2fs_post_read_work
 [<c010d6d5>] (unwind_backtrace) from [<c0109a55>] (show_stack+0x11/0x14)
 [<c0109a55>] (show_stack) from [<c056d489>] (dump_stack+0x75/0x84)
 [<c056d489>] (dump_stack) from [<c0243b53>] (warn_alloc+0xa3/0x104)
 [<c0243b53>] (warn_alloc) from [<c024473b>] (__alloc_pages_nodemask+0xb87/0xc40)
 [<c024473b>] (__alloc_pages_nodemask) from [<c02267c5>] (kmalloc_order+0x19/0x38)
 [<c02267c5>] (kmalloc_order) from [<c02267fd>] (kmalloc_order_trace+0x19/0x90)
 [<c02267fd>] (kmalloc_order_trace) from [<c047c665>] (zstd_init_decompress_ctx+0x21/0x88)
 [<c047c665>] (zstd_init_decompress_ctx) from [<c047e9cf>] (f2fs_decompress_pages+0x97/0x228)
 [<c047e9cf>] (f2fs_decompress_pages) from [<c045d0ab>] (__read_end_io+0xfb/0x130)
 [<c045d0ab>] (__read_end_io) from [<c045d141>] (f2fs_post_read_work+0x61/0x84)
 [<c045d141>] (f2fs_post_read_work) from [<c0130b2f>] (process_one_work+0x15f/0x3b0)
 [<c0130b2f>] (process_one_work) from [<c0130e7b>] (worker_thread+0xfb/0x3e0)
 [<c0130e7b>] (worker_thread) from [<c0135c3b>] (kthread+0xeb/0x10c)
 [<c0135c3b>] (kthread) from [<c0100159>]

zstd may allocate large size memory for {,de}compression, it may cause
file copy failure on low-end device which has very few memory.

For decompression, let's just allocate proper size memory based on current
file's cluster size instead of max cluster size.

Reported-by: 5kft <5kft@5kft.org>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 7 ++++---
 fs/f2fs/f2fs.h     | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index df097c4a71e1..357303d8514b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -382,16 +382,17 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 	ZSTD_DStream *stream;
 	void *workspace;
 	unsigned int workspace_size;
+	unsigned int max_window_size =
+			MAX_COMPRESS_WINDOW_SIZE(dic->log_cluster_size);
 
-	workspace_size = ZSTD_DStreamWorkspaceBound(MAX_COMPRESS_WINDOW_SIZE);
+	workspace_size = ZSTD_DStreamWorkspaceBound(max_window_size);
 
 	workspace = f2fs_kvmalloc(F2FS_I_SB(dic->inode),
 					workspace_size, GFP_NOFS);
 	if (!workspace)
 		return -ENOMEM;
 
-	stream = ZSTD_initDStream(MAX_COMPRESS_WINDOW_SIZE,
-					workspace, workspace_size);
+	stream = ZSTD_initDStream(max_window_size, workspace, workspace_size);
 	if (!stream) {
 		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initDStream failed\n",
 				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 21f86001bb3a..d210809292f9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1419,7 +1419,7 @@ struct decompress_io_ctx {
 #define NULL_CLUSTER			((unsigned int)(~0))
 #define MIN_COMPRESS_LOG_SIZE		2
 #define MAX_COMPRESS_LOG_SIZE		8
-#define MAX_COMPRESS_WINDOW_SIZE	((PAGE_SIZE) << MAX_COMPRESS_LOG_SIZE)
+#define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
 
 struct f2fs_sb_info {
 	struct super_block *sb;			/* pointer to VFS super block */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
