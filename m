Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D36535A73CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Aug 2022 04:07:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTD8O-00065J-RK;
	Wed, 31 Aug 2022 02:07:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangshuqi3@huawei.com>) id 1oTD8N-00065C-0F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 02:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0r2EPubHrYSjZ/iqgxEW5HeJQfNv9lx3obDxlGJw2+w=; b=Il1RlyDvg1DCS0u3cFhMBN+oCt
 Ze40F2I6R0bwFDZcEVzFTbruqtk774Mx8J9c9hIuMUtUBU2wKckNieSGEV5uQqSAvM2z8zosf/H0l
 eZdZ6JLEn8ZLfiIgdMoBdkcQymRmTtSSS4o4VYYqZRhXVMK7eTmrlRjSifY0fk3FSwxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0r2EPubHrYSjZ/iqgxEW5HeJQfNv9lx3obDxlGJw2+w=; b=V
 9esNKiakxiIRsGe2khoukrObnWUmJEmu1qMNItTP3bT0wL+gbkXh3DtV24ux4UKQVqiuSD+DF+OuE
 cJmi7zQLxX9HAAkQoPwit6a3Yjk+9q/+dXQ1c5bLINiYGp93TczqMj2WqYDxeOORD+F4bGBJRjJLP
 Y5PMPbFPK1uySl5E=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oTD8K-008FF2-LJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Aug 2022 02:07:14 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHSBT0xwVzlWdH;
 Wed, 31 Aug 2022 10:03:13 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 10:06:32 +0800
Received: from huawei.com (10.175.124.27) by kwepemm600016.china.huawei.com
 (7.193.23.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 10:06:31 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 31 Aug 2022 10:24:40 +0800
Message-ID: <20220831022440.2985736-1-zhangshuqi3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600016.china.huawei.com (7.193.23.20)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a BUG_ON issue as follows when running
 xfstest-generic-503:
 WARNING: CPU: 21 PID: 1385 at fs/f2fs/inode.c:762 f2fs_evict_inode+0x847/0xaa0
 Modules linked in: CPU: 21 PID: 1385 Comm: umount Not [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oTD8K-008FF2-LJ
Subject: [f2fs-dev] [PATCH v2 -next] f2fs: fix wrong dirty page count when
 race between mmap and fallocate.
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
From: Shuqi Zhang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shuqi Zhang <zhangshuqi3@huawei.com>
Cc: zhangshuqi3@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
