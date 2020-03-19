Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33B18B2D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 12:58:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEtog-0005qn-Hz; Thu, 19 Mar 2020 11:58:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jEtoc-0005pQ-Fa
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tUyYgqjAW04sXF4hACsPU0vX0j9FBwpd8xFeCtzXD3c=; b=kL6gz6G0O7jjgmjs0VVyfFkLrz
 K4xWZWrctAWZvHdwOgsYIl1s1DpK7itmiRbJOwkGSsAinaijQAn2yt5EtCJastjyJ0BXe2Hl5Zcme
 II9pxfI8fkm8sQZuaLcRHhra9C+PDaCelTQKHbbX65CkO2zvesrcHc01AVUJkS8YpxUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tUyYgqjAW04sXF4hACsPU0vX0j9FBwpd8xFeCtzXD3c=; b=U0mUPAi4z5DhIPUAwGFC8BnR3i
 6vuN2oX78LQV5bfCfUKTHRPv5htFYDNmX73/I3Vc7cuGarIiFpa1ZolKXjzzeJh24/QRhXN5/8h0y
 sqdYC7PJqb6uk/b+JfSrZuWFEndSr6Iw8Gy6eZY/xJqsn2G0e+VbgQ7azllxZCJZ4two=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEtoa-00E6iN-75
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:58:22 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9D11378D7C42C01D85C1;
 Thu, 19 Mar 2020 19:58:10 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Mar 2020 19:58:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 19 Mar 2020 19:58:00 +0800
Message-ID: <20200319115800.108926-4-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200319115800.108926-1-yuchao0@huawei.com>
References: <20200319115800.108926-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jEtoa-00E6iN-75
Subject: [f2fs-dev] [PATCH 4/4] f2fs: fix NULL pointer dereference in
 f2fs_write_begin()
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
RIP: 0010:f2fs_write_begin+0x823/0xb90 [f2fs]
Call Trace:
 f2fs_quota_write+0x139/0x1d0 [f2fs]
 write_blk+0x36/0x80 [quota_tree]
 get_free_dqblk+0x42/0xa0 [quota_tree]
 do_insert_tree+0x235/0x4a0 [quota_tree]
 do_insert_tree+0x26e/0x4a0 [quota_tree]
 do_insert_tree+0x26e/0x4a0 [quota_tree]
 do_insert_tree+0x26e/0x4a0 [quota_tree]
 qtree_write_dquot+0x70/0x190 [quota_tree]
 v2_write_dquot+0x43/0x90 [quota_v2]
 dquot_acquire+0x77/0x100
 f2fs_dquot_acquire+0x2f/0x60 [f2fs]
 dqget+0x310/0x450
 dquot_transfer+0x7e/0x120
 f2fs_setattr+0x11a/0x4a0 [f2fs]
 notify_change+0x349/0x480
 chown_common+0x168/0x1c0
 do_fchownat+0xbc/0xf0
 __x64_sys_fchownat+0x20/0x30
 do_syscall_64+0x5f/0x220
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Passing fsdata parameter to .write_{begin,end} in f2fs_quota_write(),
so that if quota file is compressed one, we can avoid above NULL
pointer dereference when updating quota content.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ebffe7aa08ee..b83b17b54a0a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1936,6 +1936,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 	int offset = off & (sb->s_blocksize - 1);
 	size_t towrite = len;
 	struct page *page;
+	void *fsdata = NULL;
 	char *kaddr;
 	int err = 0;
 	int tocopy;
@@ -1945,7 +1946,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 								towrite);
 retry:
 		err = a_ops->write_begin(NULL, mapping, off, tocopy, 0,
-							&page, NULL);
+							&page, &fsdata);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
 				congestion_wait(BLK_RW_ASYNC,
@@ -1962,7 +1963,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 		flush_dcache_page(page);
 
 		a_ops->write_end(NULL, mapping, off, tocopy, tocopy,
-						page, NULL);
+						page, fsdata);
 		offset = 0;
 		towrite -= tocopy;
 		off += tocopy;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
