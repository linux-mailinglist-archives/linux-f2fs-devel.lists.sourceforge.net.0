Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00981705
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 12:28:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huaDV-0002qV-7i; Mon, 05 Aug 2019 10:27:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huaDT-0002qM-N1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 10:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e/OKHnn2MLByBkZ1uLB6jQtCJoqtUOK0oh0PeCsCYAo=; b=mcgwF92lMUVxxxI2YnNrVNnHvJ
 aqphcc5SjphefKUhGTvJ/8D1ZZEooNUX5Dvz1WvgGSUDsQME8EZO+t0bMSl5GEc8rtgYe2BVZY+7k
 o57BtF0SQMMVv62c4EP+rdsUxav0BUsrjNEQJFGDpDu8Avezvjo1Z+0W5/vobQp4978c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e/OKHnn2MLByBkZ1uLB6jQtCJoqtUOK0oh0PeCsCYAo=; b=Y
 We4pDYeoL9kbSKicQDyKd/PQYb4poTRcHcEJ24J2AGzXYutvH4yt3TmXo95+PWzWeaz77KQ8FcS7k
 kGY8/zD9iNhzmiVijpYcIw/FTir+fxLKWWTx5TpiyS1fK3XnaYVZFrJrQyzWlAuXX/t0B7i1xCEpU
 5uJhKeDAhUqRvYH8=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huaDP-00BWON-Qo
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 10:27:47 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E864EAC6A14037319C23;
 Mon,  5 Aug 2019 18:27:36 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Mon, 5 Aug 2019 18:27:28 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 5 Aug 2019 18:27:25 +0800
Message-ID: <20190805102725.27834-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huaDP-00BWON-Qo
Subject: [f2fs-dev] [PATCH v2] f2fs: fix wrong available node count
 calculation
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

In mkfs, we have counted quota file's node number in cp.valid_node_count,
so we have to avoid wrong substraction of quota node number in
.available_nid/.avail_node_count calculation.

f2fs_write_check_point_pack()
{
..
	set_cp(valid_node_count, 1 + c.quota_inum + c.lpf_inum);

Fixes: 292c196a3695 ("reserve nid resource for quota sysfile")
Fixes: 7b63f72f73af ("f2fs: fix to do sanity check on valid node/block count")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/node.c  | 2 +-
 fs/f2fs/super.c | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a18b2a895771..d9ba1db2d01e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2964,7 +2964,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
 
 	/* not used nids: 0, node, meta, (and root counted as valid node) */
 	nm_i->available_nids = nm_i->max_nid - sbi->total_valid_node_count -
-				sbi->nquota_files - F2FS_RESERVED_NODE_NUM;
+						F2FS_RESERVED_NODE_NUM;
 	nm_i->nid_cnt[FREE_NID] = 0;
 	nm_i->nid_cnt[PREALLOC_NID] = 0;
 	nm_i->nat_cnt = 0;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6a7f1166d068..118a31f90a37 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1297,8 +1297,7 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	else
 		buf->f_bavail = 0;
 
-	avail_node_count = sbi->total_node_count - sbi->nquota_files -
-						F2FS_RESERVED_NODE_NUM;
+	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
 
 	if (avail_node_count > user_block_count) {
 		buf->f_files = user_block_count;
@@ -2750,8 +2749,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	}
 
 	valid_node_count = le32_to_cpu(ckpt->valid_node_count);
-	avail_node_count = sbi->total_node_count - sbi->nquota_files -
-						F2FS_RESERVED_NODE_NUM;
+	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
 	if (valid_node_count > avail_node_count) {
 		f2fs_err(sbi, "Wrong valid_node_count: %u, avail_node_count: %u",
 			 valid_node_count, avail_node_count);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
