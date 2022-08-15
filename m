Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D87592A79
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Aug 2022 09:58:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNUz0-0003e5-LA;
	Mon, 15 Aug 2022 07:57:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangshuqi3@huawei.com>) id 1oNUyz-0003dz-MO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 07:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eHBRL5C7v3NqPq/j6hOQPLB0ygSRULYYhD6f5JCxMGw=; b=kWCURhmAu3/Juiq4MGZCz9m7D8
 1nwQwGlkYZWJHV9CXYgCFO1pmAhg1iBnNljDp3DMwABowBO41ehPy6vKRWqkC6spNOxSJRZGoItHK
 Q1YNKcBXSqTg4Nv0XJyIYecg7JvWMjjsM1137RFDTRI2HlhsAcEKlM5qNDcFHuL4wfX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eHBRL5C7v3NqPq/j6hOQPLB0ygSRULYYhD6f5JCxMGw=; b=m
 6NKi2PP03PwiTAle/v6cGphvWPPk0pR4fPiUhsAODPB8BtmgCrzoSQ3fuvTsEnb+Uc5DHasnd/imU
 /7Czw3fRiAUir5EGqPP33XG52HKpIyBYlblIy7QejbIwbdB3jHF+urUMG6tz/+rV+H+yClL0C0WLJ
 f7lSqRxc9MN5qAS8=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNUyy-002sr9-4x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 07:57:57 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M5mnB2Hz4zGpXl;
 Mon, 15 Aug 2022 15:56:14 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 15 Aug 2022 15:57:44 +0800
Received: from huawei.com (10.175.124.27) by kwepemm600016.china.huawei.com
 (7.193.23.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 15 Aug
 2022 15:57:43 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 15 Aug 2022 16:15:55 +0800
Message-ID: <20220815081555.2961943-1-zhangshuqi3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600016.china.huawei.com (7.193.23.20)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oNUyy-002sr9-4x
Subject: [f2fs-dev] [PATCH -next] f2fs: fix wrong dirty page count when race
 between mmap and fallocate.
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
                                            down_read(i_mmap_sem)
                                            lock_page
                                            if (PageMappedToDisk(page))
                                              goto out;
                                            // set_page_dirty  --NOT RUN
                                            out: up_read(i_mmap_sem)
                                          lock_page
                                        finish_mkwrite_fault // unlock_pte
f2fs_collapse_range
  down_write(i_mmap_sem)
  truncate_pagecache
    unmap_mapping_pages
      i_mmap_lock_write // down_write(i_mmap_rwsem)
        ......
        zap_pte_range
          pte_offset_map_lock // ---lock_pte
          f2fs_set_data_page_dirty
            if (!PageDirty(page)) {
                                        fault_dirty_shared_page
                                          f2fs_set_data_page_dirty
                                            if (!PageDirty(page)) {
                                              __set_page_dirty_nobuffer
                                              f2fs_update_dirty_page // ++
                                            }
                                          unlock_page
              __set_page_dirty_nobuffers
              f2fs_update_dirty_page // page count++
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
in f2fs_set_data_page_dirty function. Page is set to dirty only ONCE,
but the count is added TWICE by calling f2fs_update_dirty_page.
Thus the count of dirty page cannot accord with the real dirty pages.

Following is the solution to in case of race happens without any lock.
If making sure f2fs_vm_page_mkwrite calls set_page_dirty within immap
lock area, page will already be dirtied when running into
fault_dirty_shared_page-f2fs_set_data_page_dirty.
The count of dirty page will not be increased wrong times.

Signed-off-by: Shuqi Zhang <zhangshuqi3@huawei.com>
---
 fs/f2fs/file.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ce4905a073b3..d837359a9c00 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -140,7 +140,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	 * check to see if the page is mapped already (no holes)
 	 */
 	if (PageMappedToDisk(page))
-		goto out_sem;
+		goto set_dirty;
 
 	/* page is wholly or partially inside EOF */
 	if (((loff_t)(page->index + 1) << PAGE_SHIFT) >
@@ -150,14 +150,15 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		offset = i_size_read(inode) & ~PAGE_MASK;
 		zero_user_segment(page, offset, PAGE_SIZE);
 	}
-	set_page_dirty(page);
-	if (!PageUptodate(page))
-		SetPageUptodate(page);
 
 	f2fs_update_iostat(sbi, APP_MAPPED_IO, F2FS_BLKSIZE);
-	f2fs_update_time(sbi, REQ_TIME);
 
+set_dirty:
 	trace_f2fs_vm_page_mkwrite(page, DATA);
+	set_page_dirty(page);
+	if (!PageUptodate(page))
+		SetPageUptodate(page);
+	f2fs_update_time(sbi, REQ_TIME);
 out_sem:
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
