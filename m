Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6723E601E3F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 02:08:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oka9w-00052M-B4;
	Tue, 18 Oct 2022 00:08:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1oka9v-00052F-1J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KGwFVz4uJ2Qv4bP2XutM8wd6S5bI5s3HX8mAEAf4XYI=; b=QV9vCOcJjeBHgPrrMj+67flEa+
 F5uc+0vnNjZKT7RpwsfOr6YndEcq+KvG83TNzPv6gzaOE7BEqvIrop+pSSE7ePWtsfkXosrjAIUPI
 7wuyIq01ezcq619bV1MCszO3TbRMsDWJRhyZ5u5Y+DiRac7UbVoOpyakc+KwXS8I6sBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KGwFVz4uJ2Qv4bP2XutM8wd6S5bI5s3HX8mAEAf4XYI=; b=GguyuVKkTTaKUFVovLqvzIcvO9
 bUeZe6uPmGM96DzYACFyIXbwaGf8yu6kVNlTmdFqfYSoa2l1U7jJOrv80hAg40FIzJ3NyBXOuf+zn
 nzdSPRVoSDQtTUupzWJj2V9j3HcCQKxOCfGycg/gdyIPTITYMX8/1h2XyZR7tUKBudDc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oka9u-007do4-8F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 00:08:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E81A612F2;
 Tue, 18 Oct 2022 00:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F26C433C1;
 Tue, 18 Oct 2022 00:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666051705;
 bh=DwBh3k3a85YmFQnlqH+Y/yXLx9Oae3VQOD+4zL6+TCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pj74Ivc9o7L81cPy2aWCS4qNOilh9RYjFuRQ7g5x30Ttb6Hw7XU2Hzda9cr9W3qEn
 XUXnuU+Bx0R5XxkNdLqpkcDb9KgFeUv6o6ialcsZcQPXvCCUKebwKZe1/+fSMqtVJP
 FlKOV8+Z0u8vUWoKRi5QbUtqB3ZkiEpWdxG3RCuHZDRZJ1Wtgz67Yx61Lr0mHE2M7f
 8uQh6h+7VXRIULrMArdIBCYhCslNwEhzfFzAzEqAt6Ds5fbHVQ7V5akDJRLvlJRwtB
 2baZarZyiu9ZWNTmetPmN8DzBcvtGLaoM/mSoaLo3If2G8nfRnhb1oCqzNohfVT8Pu
 UTUD8iNZwap+A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 17 Oct 2022 20:07:21 -0400
Message-Id: <20221018000729.2730519-24-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000729.2730519-1-sashal@kernel.org>
References: <20221018000729.2730519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Shuqi Zhang <zhangshuqi3@huawei.com> [ Upstream commit
 9b7eadd9bd3a0cc24533a23d83c46430a0ea60ff ] This is a BUG_ON issue as follows
 when running xfstest-generic-503: WARNING: CPU: 21 PID: 1385 at
 fs/f2fs/inode.c:762
 f2fs_evict_inode+0x847/0xaa0 Modules linked in: CPU: 21 PID: 1385 Comm: umount
 Not [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oka9u-007do4-8F
Subject: [f2fs-dev] [PATCH AUTOSEL 6.0 24/32] f2fs: fix wrong dirty page
 count when race between mmap and fallocate.
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
 linux-f2fs-devel@lists.sourceforge.net, Shuqi Zhang <zhangshuqi3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Shuqi Zhang <zhangshuqi3@huawei.com>

[ Upstream commit 9b7eadd9bd3a0cc24533a23d83c46430a0ea60ff ]

This is a BUG_ON issue as follows when running xfstest-generic-503:
WARNING: CPU: 21 PID: 1385 at fs/f2fs/inode.c:762 f2fs_evict_inode+0x847/0xaa0
Modules linked in:
CPU: 21 PID: 1385 Comm: umount Not tainted 5.19.0-rc5+ #73
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-4.fc34 04/01/2014

Call Trace:
evict+0x129/0x2d0
dispose_list+0x4f/0xb0
evict_inodes+0x204/0x230
generic_shutdown_super+0x5b/0x1e0
kill_block_super+0x29/0x80
kill_f2fs_super+0xe6/0x140
deactivate_locked_super+0x44/0xc0
deactivate_super+0x79/0x90
cleanup_mnt+0x114/0x1a0
__cleanup_mnt+0x16/0x20
task_work_run+0x98/0x100
exit_to_user_mode_prepare+0x3d0/0x3e0
syscall_exit_to_user_mode+0x12/0x30
do_syscall_64+0x42/0x80
entry_SYSCALL_64_after_hwframe+0x46/0xb0

Function flow analysis when BUG occurs:
f2fs_fallocate                    mmap
                                  do_page_fault
                                    pte_spinlock  // ---lock_pte
                                    do_wp_page
                                      wp_page_shared
                                        pte_unmap_unlock   // unlock_pte
                                          do_page_mkwrite
                                          f2fs_vm_page_mkwrite
                                            down_read(invalidate_lock)
                                            lock_page
                                            if (PageMappedToDisk(page))
                                              goto out;
                                            // set_page_dirty  --NOT RUN
                                            out: up_read(invalidate_lock);
                                        finish_mkwrite_fault // unlock_pte
f2fs_collapse_range
  down_write(i_mmap_sem)
  truncate_pagecache
    unmap_mapping_pages
      i_mmap_lock_write // down_write(i_mmap_rwsem)
        ......
        zap_pte_range
          pte_offset_map_lock // ---lock_pte
           set_page_dirty
            f2fs_dirty_data_folio
              if (!folio_test_dirty(folio)) {
                                        fault_dirty_shared_page
                                          set_page_dirty
                                            f2fs_dirty_data_folio
                                              if (!folio_test_dirty(folio)) {
                                                filemap_dirty_folio
                                                f2fs_update_dirty_folio // ++
                                              }
                                            unlock_page
                filemap_dirty_folio
                f2fs_update_dirty_folio // page count++
              }
          pte_unmap_unlock  // --unlock_pte
      i_mmap_unlock_write  // up_write(i_mmap_rwsem)
  truncate_inode_pages
  up_write(i_mmap_sem)

When race happens between mmap-do_page_fault-wp_page_shared and
fallocate-truncate_pagecache-zap_pte_range, the zap_pte_range calls
function set_page_dirty without page lock. Besides, though
truncate_pagecache has immap and pte lock, wp_page_shared calls
fault_dirty_shared_page without any. In this case, two threads race
in f2fs_dirty_data_folio function. Page is set to dirty only ONCE,
but the count is added TWICE by calling filemap_dirty_folio.
Thus the count of dirty page cannot accord with the real dirty pages.

Following is the solution to in case of race happens without any lock.
Since folio_test_set_dirty in filemap_dirty_folio is atomic, judge return
value will not be at risk of race.

Signed-off-by: Shuqi Zhang <zhangshuqi3@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c | 3 +--
 fs/f2fs/data.c       | 3 +--
 fs/f2fs/node.c       | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 8259e0fa97e1..3a3329bf1033 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -448,8 +448,7 @@ static bool f2fs_dirty_meta_folio(struct address_space *mapping,
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
-	if (!folio_test_dirty(folio)) {
-		filemap_dirty_folio(mapping, folio);
+	if (filemap_dirty_folio(mapping, folio)) {
 		inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_META);
 		set_page_private_reference(&folio->page);
 		return true;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index aa3ccddfa037..16c39bd948a0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3697,8 +3697,7 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
 		folio_mark_uptodate(folio);
 	BUG_ON(folio_test_swapcache(folio));
 
-	if (!folio_test_dirty(folio)) {
-		filemap_dirty_folio(mapping, folio);
+	if (filemap_dirty_folio(mapping, folio)) {
 		f2fs_update_dirty_folio(inode, folio);
 		return true;
 	}
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e06a0c478b39..3506ffcb31f8 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2147,8 +2147,7 @@ static bool f2fs_dirty_node_folio(struct address_space *mapping,
 	if (IS_INODE(&folio->page))
 		f2fs_inode_chksum_set(F2FS_M_SB(mapping), &folio->page);
 #endif
-	if (!folio_test_dirty(folio)) {
-		filemap_dirty_folio(mapping, folio);
+	if (filemap_dirty_folio(mapping, folio)) {
 		inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_NODES);
 		set_page_private_reference(&folio->page);
 		return true;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
