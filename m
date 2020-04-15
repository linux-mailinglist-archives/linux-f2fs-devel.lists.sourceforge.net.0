Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9E1A9C9E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:37:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgLn-0000Iz-6z; Wed, 15 Apr 2020 11:37:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgLb-0000Ha-SP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TcyFdLH5OkT7p6pFTwILXQzvz8rqIEuEDWRUFNJRYOs=; b=azPvbQa/qAgRk9ShdA/qmSVxLJ
 25agRg5lNyhB+vVuwWvVvSy849lAclVE0cplN5UKHzx4nfQKmVAyB348X/9H4MFmmirzMg9q1YeLS
 4lwh6bV7XuhpKQXdMiCGWO+pGC80IOG6/vcsrXw11ZQRD00aPH8+noK2HnG+UtyivrGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TcyFdLH5OkT7p6pFTwILXQzvz8rqIEuEDWRUFNJRYOs=; b=RZmTp55Thg5HPtoQSWfia469tt
 sWIp/axQaTsYF7QzrX+INbBE8g5UU9M8TuZHOYAOIzqdl9KnV6tdMKLAvKqOc+6WJv5eJZ+O39N6s
 Wxw8jx9dDjVcIDHnSzYMs2dd80GwXIdzKzkELM3Ei5vv67dukSgqY1uej/nZu/ELIgvM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgLa-00GSk2-M6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:51 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 714F52078A;
 Wed, 15 Apr 2020 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950605;
 bh=FQLCavUo/9H+bwWjXvVXMibQQ4dnU0g9B7kxhkUSxHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pX6ZNXzzvyC4n9oAajk4C0ugYl+aI73vo42dOJYA1229NSq61DGJrPZqcP3cYxPiM
 YnnHW/tF8xuMNv/L9z8RwBABOBAHanheLhuaKjiNq+jTvpeZT+8qT82luj/K0ze0hA
 ZTBQKbjIqsAhwD+atTMfWeK4bhqI7/6p0f2Qbveo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:34:15 -0400
Message-Id: <20200415113445.11881-100-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgLa-00GSk2-M6
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 100/129] f2fs: fix potential deadlock
 on compressed quota file
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

[ Upstream commit 466357dc9b5ff555d16b7f9a0ff264eb9d5d908b ]

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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/compress.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index eb84c13c1182c..ad8e25a1fbc26 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -988,6 +988,15 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
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
 				congestion_wait(BLK_RW_ASYNC, HZ/50);
@@ -996,16 +1005,12 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
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
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
