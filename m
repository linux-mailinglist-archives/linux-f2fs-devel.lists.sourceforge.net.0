Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C555F347015
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Mar 2021 04:25:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOu8m-0001Dy-Mq; Wed, 24 Mar 2021 03:25:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lOu8k-0001Dq-Nx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 03:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mseVZnwWknuUuzSbh89gdCyqfPsqkHpXRJCsS73ZxBo=; b=l8961ezJdBv2kcAwhUGipOL974
 34z+09BMW/jT3ehzY5R/pMkRqyJM6T1Ecr+lZt5XUH6Zogkn1dSG28xSLRqyoZN+cjhTrVqp5TZya
 yiXX3RLcbINOXIV4tvRQJDuaX7TmwjVoVg6scPIaVo9KmcrEFLXdzlJL/WR9SlIjmdMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mseVZnwWknuUuzSbh89gdCyqfPsqkHpXRJCsS73ZxBo=; b=R
 hxF7G3V15TxB94DTccgeb+o0HedYFtdneopQlZ9DEp0Pyw9NCPhpAXWevM9//+7YUZ4bAFB4JO2nv
 c/6R++E2nzVz82RJlDT1x3roCx+LhSpIyStkR3KUK0c3O6OkqxlN5DbV+K0W08f+RbPdlmWXY+Q+/
 k3kqOLxkbw5KIelM=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOu8f-003jzX-JS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 03:25:02 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F4tnz0bMfznVqr;
 Wed, 24 Mar 2021 11:22:15 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 11:24:37 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 24 Mar 2021 11:24:33 +0800
Message-ID: <20210324032433.68886-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lOu8f-003jzX-JS
Subject: [f2fs-dev] [PATCH] f2fs: fix to update last i_size if fallocate
 partially succeeds
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

In the case of expanding pinned file, map.m_lblk and map.m_len
will update in each round of section allocation, so in error
path, last i_size will be calculated with wrong m_lblk and m_len,
fix it.

Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index bd5a77091d23..dc79694e512c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1619,9 +1619,10 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 	struct f2fs_map_blocks map = { .m_next_pgofs = NULL,
 			.m_next_extent = NULL, .m_seg_type = NO_CHECK_TYPE,
 			.m_may_create = true };
-	pgoff_t pg_end;
+	pgoff_t pg_start, pg_end;
 	loff_t new_size = i_size_read(inode);
 	loff_t off_end;
+	block_t expanded = 0;
 	int err;
 
 	err = inode_newsize_ok(inode, (len + offset));
@@ -1634,11 +1635,12 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 
 	f2fs_balance_fs(sbi, true);
 
+	pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long)offset + len) >> PAGE_SHIFT;
 	off_end = (offset + len) & (PAGE_SIZE - 1);
 
-	map.m_lblk = ((unsigned long long)offset) >> PAGE_SHIFT;
-	map.m_len = pg_end - map.m_lblk;
+	map.m_lblk = pg_start;
+	map.m_len = pg_end - pg_start;
 	if (off_end)
 		map.m_len++;
 
@@ -1648,7 +1650,6 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 	if (f2fs_is_pinned_file(inode)) {
 		block_t sec_blks = BLKS_PER_SEC(sbi);
 		block_t sec_len = roundup(map.m_len, sec_blks);
-		block_t done = 0;
 
 		map.m_len = sec_blks;
 next_alloc:
@@ -1656,10 +1657,8 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
 			down_write(&sbi->gc_lock);
 			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
-			if (err && err != -ENODATA && err != -EAGAIN) {
-				map.m_len = done;
+			if (err && err != -ENODATA && err != -EAGAIN)
 				goto out_err;
-			}
 		}
 
 		down_write(&sbi->pin_sem);
@@ -1673,24 +1672,25 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 
 		up_write(&sbi->pin_sem);
 
-		done += map.m_len;
+		expanded += map.m_len;
 		sec_len -= map.m_len;
 		map.m_lblk += map.m_len;
 		if (!err && sec_len)
 			goto next_alloc;
 
-		map.m_len = done;
+		map.m_len = expanded;
 	} else {
 		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
+		expanded = map.m_len;
 	}
 out_err:
 	if (err) {
 		pgoff_t last_off;
 
-		if (!map.m_len)
+		if (!expanded)
 			return err;
 
-		last_off = map.m_lblk + map.m_len - 1;
+		last_off = pg_start + expanded - 1;
 
 		/* update new size to the failed position */
 		new_size = (last_off == pg_end) ? offset + len :
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
