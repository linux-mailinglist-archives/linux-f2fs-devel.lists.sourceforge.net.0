Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 575DE2307E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 11:37:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSejU-0003Mv-G6; Mon, 20 May 2019 09:37:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hSejT-0003Mo-9V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 09:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tJtvkMCdEaMawbRbmAnyrVfFd60pNljsrGtIesa9Nek=; b=HhfzRJAHgEOqjW57k9Ey4GLzAl
 VQ977wCL1m5ylO4stNV3zjnQ0N1WugOkPWEGvbDAAcqXorVHcKz+nOLShhV2oR8zazalNmSQ6r1fb
 axMw0Bu0ytmqt9rR0CmljQevCbdLmffsMxc0Dnzgu9dd9QZLQBj5ut3TpMBow6Gyr+5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tJtvkMCdEaMawbRbmAnyrVfFd60pNljsrGtIesa9Nek=; b=R
 grx/G5c7W49FmRgKPXbnl/iJg2F0CLU7S4cUAxxKq/3fxJmiX2PAqEirdkowR4eYDQfHfiXFM2Rfy
 hq3YsOBf8AauSoxqPH4MeXdGKyv1R6Hp9IXR1n+d1YngHhIPk/gnynU6YHz2qEpJnn5Ak7T9aBYmc
 P9EQMHYCDwwD/niQ=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSejR-00GdME-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 09:37:23 +0000
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id E4455BE35A774639F6A0;
 Mon, 20 May 2019 17:37:11 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 May 2019 17:37:11 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 20 May 2019 17:37:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 20 May 2019 17:36:59 +0800
Message-ID: <20190520093659.50755-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hSejR-00GdME-Ey
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid deadloop if data_flush is on
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

As Hagbard Celine reported:

[  615.697824] INFO: task kworker/u16:5:344 blocked for more than 120 seconds.
[  615.697825]       Not tainted 5.0.15-gentoo-f2fslog #4
[  615.697826] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  615.697827] kworker/u16:5   D    0   344      2 0x80000000
[  615.697831] Workqueue: writeback wb_workfn (flush-259:0)
[  615.697832] Call Trace:
[  615.697836]  ? __schedule+0x2c5/0x8b0
[  615.697839]  schedule+0x32/0x80
[  615.697841]  schedule_preempt_disabled+0x14/0x20
[  615.697842]  __mutex_lock.isra.8+0x2ba/0x4d0
[  615.697845]  ? log_store+0xf5/0x260
[  615.697848]  f2fs_write_data_pages+0x133/0x320
[  615.697851]  ? trace_hardirqs_on+0x2c/0xe0
[  615.697854]  do_writepages+0x41/0xd0
[  615.697857]  __filemap_fdatawrite_range+0x81/0xb0
[  615.697859]  f2fs_sync_dirty_inodes+0x1dd/0x200
[  615.697861]  f2fs_balance_fs_bg+0x2a7/0x2c0
[  615.697863]  ? up_read+0x5/0x20
[  615.697865]  ? f2fs_do_write_data_page+0x2cb/0x940
[  615.697867]  f2fs_balance_fs+0xe5/0x2c0
[  615.697869]  __write_data_page+0x1c8/0x6e0
[  615.697873]  f2fs_write_cache_pages+0x1e0/0x450
[  615.697878]  f2fs_write_data_pages+0x14b/0x320
[  615.697880]  ? trace_hardirqs_on+0x2c/0xe0
[  615.697883]  do_writepages+0x41/0xd0
[  615.697885]  __filemap_fdatawrite_range+0x81/0xb0
[  615.697887]  f2fs_sync_dirty_inodes+0x1dd/0x200
[  615.697889]  f2fs_balance_fs_bg+0x2a7/0x2c0
[  615.697891]  f2fs_write_node_pages+0x51/0x220
[  615.697894]  do_writepages+0x41/0xd0
[  615.697897]  __writeback_single_inode+0x3d/0x3d0
[  615.697899]  writeback_sb_inodes+0x1e8/0x410
[  615.697902]  __writeback_inodes_wb+0x5d/0xb0
[  615.697904]  wb_writeback+0x28f/0x340
[  615.697906]  ? cpumask_next+0x16/0x20
[  615.697908]  wb_workfn+0x33e/0x420
[  615.697911]  process_one_work+0x1a1/0x3d0
[  615.697913]  worker_thread+0x30/0x380
[  615.697915]  ? process_one_work+0x3d0/0x3d0
[  615.697916]  kthread+0x116/0x130
[  615.697918]  ? kthread_create_worker_on_cpu+0x70/0x70
[  615.697921]  ret_from_fork+0x3a/0x50

There is still deadloop in below condition:

d A
- do_writepages
 - f2fs_write_node_pages
  - f2fs_balance_fs_bg
   - f2fs_sync_dirty_inodes
    - f2fs_write_cache_pages
     - mutex_lock(&sbi->writepages)	-- lock once
     - __write_data_page
      - f2fs_balance_fs_bg
       - f2fs_sync_dirty_inodes
        - f2fs_write_data_pages
         - mutex_lock(&sbi->writepages)	-- lock again

Thread A			Thread B
- do_writepages
 - f2fs_write_node_pages
  - f2fs_balance_fs_bg
   - f2fs_sync_dirty_inodes
    - .cp_task = current
				- f2fs_sync_dirty_inodes
				 - .cp_task = current
				 - filemap_fdatawrite
				 - .cp_task = NULL
    - filemap_fdatawrite
     - f2fs_write_cache_pages
      - enter f2fs_balance_fs_bg since .cp_task is NULL
    - .cp_task = NULL

Change as below to avoid this:
- add condition to avoid holding .writepages mutex lock in path
of data flush
- introduce mutex lock sbi.flush_lock to exclude concurrent data
flush in background.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c    | 3 +++
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/segment.c | 4 ++++
 fs/f2fs/super.c   | 1 +
 4 files changed, 9 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eda4181d2092..923923603a7d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2262,6 +2262,9 @@ static inline bool __should_serialize_io(struct inode *inode,
 		return false;
 	if (IS_NOQUOTA(inode))
 		return false;
+	/* to avoid deadlock in path of data flush */
+	if (F2FS_I(inode)->cp_task)
+		return false;
 	if (wbc->sync_mode != WB_SYNC_ALL)
 		return true;
 	if (get_dirty_pages(inode) >= SM_I(F2FS_I_SB(inode))->min_seq_blocks)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 71710e8336f4..832ce03768c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1220,6 +1220,7 @@ struct f2fs_sb_info {
 	/* for inode management */
 	struct list_head inode_list[NR_INODE_TYPE];	/* dirty inode list */
 	spinlock_t inode_lock[NR_INODE_TYPE];	/* for dirty inode list lock */
+	struct mutex flush_lock;		/* for flush exclusion */
 
 	/* for extent tree cache */
 	struct radix_tree_root extent_tree_root;/* cache extent cache entries */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b5f21909356f..23cbca6d6ab6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -546,9 +546,13 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi)
 		if (test_opt(sbi, DATA_FLUSH)) {
 			struct blk_plug plug;
 
+			mutex_lock(&sbi->flush_lock);
+
 			blk_start_plug(&plug);
 			f2fs_sync_dirty_inodes(sbi, FILE_INODE);
 			blk_finish_plug(&plug);
+
+			mutex_unlock(&sbi->flush_lock);
 		}
 		f2fs_sync_fs(sbi->sb, true);
 		stat_inc_bg_cp_count(sbi->stat_info);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3c71b9a71932..0d2307809bac 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3305,6 +3305,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		INIT_LIST_HEAD(&sbi->inode_list[i]);
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
+	mutex_init(&sbi->flush_lock);
 
 	f2fs_init_extent_cache_info(sbi);
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
