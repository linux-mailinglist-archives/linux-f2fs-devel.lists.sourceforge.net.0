Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD818B2D3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 12:58:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEtoe-0006CK-Ha; Thu, 19 Mar 2020 11:58:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jEtob-0006C6-Lh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uzkbBNhYd0y4qjx6GBrKXNqygtz8ZQ+kXVaNnp6lZRY=; b=TWm6A7TC8hskSf82HdVjI53rJQ
 cXAyW4mBNyzTyyPfdohqm5ZIqAu1vrSmScyYb0UdQIz0zW8AClcDe6g0D5f9f3tZjlphWn3/wv+1+
 cidQxIOXztH3qcQRgBwhCEb1QgClK5kBwPuBMq0XVPJXuCwfvWCZBLGIqGshI8USegFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uzkbBNhYd0y4qjx6GBrKXNqygtz8ZQ+kXVaNnp6lZRY=; b=Wyn+wRm/Te7aiw9DSfQfR4Jhwu
 xddR6J23w+SrSjbUNh1u75hehvJiIBIsb9mjQ+SZEO+Bbt6lGQPd/q298i19k0SulFlKNl5ZX4kR0
 7GAo6wMHR/gLHhPNrfF9ddDcsRsCQd4VZ3W/N/odW7K9QhnpQYoX4jHu3ARbN2boJVeo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jEtoZ-000CHf-NT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 11:58:21 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A1E2A610F59FCC8B2231;
 Thu, 19 Mar 2020 19:58:10 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Mar 2020 19:58:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 19 Mar 2020 19:57:58 +0800
Message-ID: <20200319115800.108926-2-yuchao0@huawei.com>
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
X-Headers-End: 1jEtoZ-000CHf-NT
Subject: [f2fs-dev] [PATCH 2/4] f2fs: don't trigger data flush in foreground
 operation
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

Data flush can generate heavy IO and cause long latency during
flush, so it's not appropriate to trigger it in foreground
operation.

And also, we may face below potential deadlock during data flush:
- f2fs_write_multi_pages
 - f2fs_write_raw_pages
  - f2fs_write_single_data_page
   - f2fs_balance_fs
    - f2fs_balance_fs_bg
     - f2fs_sync_dirty_inodes
      - filemap_fdatawrite   -- stuck on flush same cluster

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/gc.c      | 2 +-
 fs/f2fs/node.c    | 2 +-
 fs/f2fs/segment.c | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 422a070526e5..09db79a20f8e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3246,7 +3246,7 @@ void f2fs_drop_inmem_pages(struct inode *inode);
 void f2fs_drop_inmem_page(struct inode *inode, struct page *page);
 int f2fs_commit_inmem_pages(struct inode *inode);
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need);
-void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi);
+void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg);
 int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
 int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
 int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f122fe3dbba3..26248c8936db 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -113,7 +113,7 @@ static int gc_thread_func(void *data)
 				prefree_segments(sbi), free_segments(sbi));
 
 		/* balancing f2fs's metadata periodically */
-		f2fs_balance_fs_bg(sbi);
+		f2fs_balance_fs_bg(sbi, true);
 next:
 		sb_end_write(sbi->sb);
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 542335bdc100..ecbd6bd14a49 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1976,7 +1976,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
 		goto skip_write;
 
 	/* balancing f2fs's metadata in background */
-	f2fs_balance_fs_bg(sbi);
+	f2fs_balance_fs_bg(sbi, true);
 
 	/* collect a number of dirty node pages and write together */
 	if (wbc->sync_mode != WB_SYNC_ALL &&
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 601d67e72c50..aece09a184fa 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -496,7 +496,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 
 	/* balance_fs_bg is able to be pending */
 	if (need && excess_cached_nats(sbi))
-		f2fs_balance_fs_bg(sbi);
+		f2fs_balance_fs_bg(sbi, false);
 
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return;
@@ -511,7 +511,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	}
 }
 
-void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi)
+void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 {
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		return;
@@ -540,7 +540,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi)
 			excess_dirty_nats(sbi) ||
 			excess_dirty_nodes(sbi) ||
 			f2fs_time_over(sbi, CP_TIME)) {
-		if (test_opt(sbi, DATA_FLUSH)) {
+		if (test_opt(sbi, DATA_FLUSH) && from_bg) {
 			struct blk_plug plug;
 
 			mutex_lock(&sbi->flush_lock);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
