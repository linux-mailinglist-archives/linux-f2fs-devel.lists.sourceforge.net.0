Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6266DA9D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoK7K-0002hr-AH; Fri, 19 Jul 2019 04:03:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hoK7I-0002hd-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Hd7vCxqfMaMQQ48WIByfW9k+TG2V5Q1KV+6ZAiCq6c=; b=Try4xZXScYDnBClNYmMX8XzCec
 jFrBQ0zscq8ZwaRlOcUiTLxNly4I9s6WkkrEfG3wap8f7IxgcMNbwkfunAmg93/HFVeO9EwmB852d
 j6n+5kWhtjXGjZGgsWJxaehZNpvNxI0ZxM6aFR0QpIWhGyFNP95erSVCe3nWgfW4zsDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Hd7vCxqfMaMQQ48WIByfW9k+TG2V5Q1KV+6ZAiCq6c=; b=SI+9Vd4vEUN87zZfsmRPU+4IqK
 k/xmwLdD7GiPySpIj7G2ebB3ka5Tj8bSwAEv9TrsLCZzI3cOQWFwhPkxQddJU1Tt/btLfFZHl7BCr
 kHTgQP0daOfSiniSDNWTcF/hcR5x0oUX+VF+AdMll9LtT4dBfYPoX4x5iF54PgiKZYIU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hoK7H-006zfO-24
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:03:32 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB130218A3;
 Fri, 19 Jul 2019 04:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509005;
 bh=NhPm+XpWWaahlLxLka7YEtk+Yx7vk5tMpCiY8uqdBm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eyZ0xvf5k28xKiAjIQtb2x6AIhWzR2Vv6Cq2gb2/vCR4zGPsWpM3Xc0sPKiPDBZ9C
 M+1wcAe28Pa1hDZVJa/35h8E4jYGlQLj0UcTUyc6nRB9gODgK8aXH5XUm1D7nzA5/T
 1K6uymffJC44bWzwtd0zVFI0mItM1zBhT8YZIqKU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 19 Jul 2019 00:00:41 -0400
Message-Id: <20190719040246.15945-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hoK7H-006zfO-24
Subject: [f2fs-dev] [PATCH AUTOSEL 5.1 016/141] f2fs: fix to avoid deadloop
 if data_flush is on
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 040d2bb318d1aea4f28cc22504b44e446666c86e ]

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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c    | 3 +++
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/segment.c | 4 ++++
 fs/f2fs/super.c   | 1 +
 4 files changed, 9 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9d3c11e09a03..59262327b5ec 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2231,6 +2231,9 @@ static inline bool __should_serialize_io(struct inode *inode,
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
index e2cf567dcbd7..2ba2478d0663 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1200,6 +1200,7 @@ struct f2fs_sb_info {
 	/* for inode management */
 	struct list_head inode_list[NR_INODE_TYPE];	/* dirty inode list */
 	spinlock_t inode_lock[NR_INODE_TYPE];	/* for dirty inode list lock */
+	struct mutex flush_lock;		/* for flush exclusion */
 
 	/* for extent tree cache */
 	struct radix_tree_root extent_tree_root;/* cache extent cache entries */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 3d6efbfe180f..e9778f06ac0b 100644
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
index f2aaa2cc6b3e..6bc1a15b52ad 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3261,6 +3261,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		INIT_LIST_HEAD(&sbi->inode_list[i]);
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
+	mutex_init(&sbi->flush_lock);
 
 	f2fs_init_extent_cache_info(sbi);
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
