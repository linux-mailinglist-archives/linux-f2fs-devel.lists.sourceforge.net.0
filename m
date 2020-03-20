Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9918CB4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 11:15:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFEg6-0007px-3L; Fri, 20 Mar 2020 10:14:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jFEg4-0007pL-IN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 10:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rCV8csAYwN0U0scJPLI8jCDkHjqQGwdLNX3Vga49m9M=; b=cwOb2aVYnoAeur26zVRRMhoheO
 +QoYRxjcSiWBkDIY4RcTPPlkgoPXuGFCCfHPVrjud9DfIMqwwKYlZlD0IWIu7TAi/OPFOdL4wxajx
 53Tb+YoXtkYPyzh+GlJaH0Cnhu73SaQwp7KQxu/Gr1oLQtumHn2wHThS/qmkdc6ZB3WQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rCV8csAYwN0U0scJPLI8jCDkHjqQGwdLNX3Vga49m9M=; b=H
 3mHD5sj7vxcFc1sA0lLdGUmYZVi80CWe+XM9eWA361lTn6Fp209zeBGDiROn4uGtyg3BddOdjbDVq
 o6HfegrHHwL2VQQtBezYe4feTUxF2askiD9QsvBGlYBpq6KmBtCKkDHDtRjUziYdpU/NkOtr1hFB9
 nS70Hmkhc+vntuvg=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFEfz-00188Q-1r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 10:14:56 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 86A4C4F888A47972BEF3;
 Fri, 20 Mar 2020 18:14:41 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Mar 2020 18:14:34 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 20 Mar 2020 18:14:31 +0800
Message-ID: <20200320101431.26718-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jFEfz-00188Q-1r
Subject: [f2fs-dev] [PATCH] f2fs: fix potential deadlock on compressed quota
 file
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

generic/232 reports below deadlock:

fsstress        D    0 96980  96969 0x00084000
Call Trace:
 schedule+0x4a/0xb0
 io_schedule+0x12/0x40
 __lock_page+0x127/0x1d0
 pagecache_get_page+0x1d8/0x250
 prepare_compress_overwrite+0xe0/0x490 [f2fs]
 f2fs_prepare_compress_overwrite+0x5d/0x80 [f2fs]
 f2fs_write_begin+0x833/0xb90 [f2fs]
 f2fs_quota_write+0x145/0x1e0 [f2fs]
 write_blk+0x36/0x80 [quota_tree]
 do_insert_tree+0x2ac/0x4a0 [quota_tree]
 do_insert_tree+0x26e/0x4a0 [quota_tree]
 qtree_write_dquot+0x70/0x190 [quota_tree]
 v2_write_dquot+0x43/0x90 [quota_v2]
 dquot_acquire+0x77/0x100
 f2fs_dquot_acquire+0x2f/0x60 [f2fs]
 dqget+0x310/0x450
 dquot_transfer+0xb2/0x120
 f2fs_setattr+0x11a/0x4a0 [f2fs]
 notify_change+0x349/0x480
 chown_common+0x168/0x1c0
 do_fchownat+0xbc/0xf0
 __x64_sys_lchown+0x21/0x30
 do_syscall_64+0x5f/0x220
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

  task                        PC stack   pid father
kworker/u256:0  D    0 103444      2 0x80084000
Workqueue: writeback wb_workfn (flush-251:1)
Call Trace:
 schedule+0x4a/0xb0
 schedule_timeout+0x15e/0x2f0
 io_schedule_timeout+0x19/0x40
 congestion_wait+0x7e/0x120
 f2fs_write_multi_pages+0x12a/0x840 [f2fs]
 f2fs_write_cache_pages+0x48f/0x790 [f2fs]
 f2fs_write_data_pages+0x2db/0x330 [f2fs]
 do_writepages+0x1a/0x60
 __writeback_single_inode+0x3d/0x340
 writeback_sb_inodes+0x225/0x4a0
 wb_writeback+0xf7/0x320
 wb_workfn+0xba/0x470
 process_one_work+0x16c/0x3f0
 worker_thread+0x4c/0x440
 kthread+0xf8/0x130
 ret_from_fork+0x35/0x40

fsstress        D    0  5277   5266 0x00084000
Call Trace:
 schedule+0x4a/0xb0
 rwsem_down_write_slowpath+0x29d/0x540
 block_operations+0x105/0x360 [f2fs]
 f2fs_write_checkpoint+0x101/0x1010 [f2fs]
 f2fs_sync_fs+0xa8/0x130 [f2fs]
 f2fs_do_sync_file+0x1ad/0x890 [f2fs]
 do_fsync+0x38/0x60
 __x64_sys_fdatasync+0x13/0x20
 do_syscall_64+0x5f/0x220
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The root cause is there is potential deadlock between quota data
update and writeback.

Kworker					Thread B			Thread C
- f2fs_write_cache_pages
 - lock whole cluster	--- A
 - f2fs_write_multi_pages
  - f2fs_write_raw_pages
   - f2fs_write_single_data_page
    - f2fs_do_write_data_page
					- f2fs_setattr
					 - f2fs_lock_op	--- B
									- f2fs_write_checkpoint
									 - block_operations
									  - f2fs_lock_all --- B
					 - dquot_transfer
					  - f2fs_quota_write
					   - f2fs_prepare_compress_overwrite
					    - pagecache_get_page --- A
     - f2fs_trylock_op failed	--- B
  - congestion_wait
  - goto rewrite

To fix this issue, during quota file writeback, just redirty all pages
left in cluster rather holding pages' lock in cluster and looping retrying
lock cp_rwsem.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 758ef8183e59..df3e6ad5b6d7 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1235,6 +1235,15 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				unlock_page(cc->rpages[i]);
 				ret = 0;
 			} else if (ret == -EAGAIN) {
+				/*
+				 * for quota file, just redirty left pages to
+				 * avoid deadlock caused by cluster update race
+				 * from foreground operation.
+				 */
+				if (IS_NOQUOTA(cc->inode)) {
+					err = 0;
+					goto out_err;
+				}
 				ret = 0;
 				cond_resched();
 				congestion_wait(BLK_RW_ASYNC,
@@ -1244,16 +1253,12 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				goto retry_write;
 			}
 			err = ret;
-			goto out_fail;
+			goto out_err;
 		}
 
 		*submitted += _submitted;
 	}
 	return 0;
-
-out_fail:
-	/* TODO: revoke partially updated block addresses */
-	BUG_ON(compr_blocks);
 out_err:
 	for (++i; i < cc->cluster_size; i++) {
 		if (!cc->rpages[i])
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
