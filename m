Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA135BBE8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Apr 2021 10:16:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lVrjx-0004w0-B6; Mon, 12 Apr 2021 08:16:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lVrjw-0004vs-Bc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Apr 2021 08:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOdckrqkvkG5f5MaVOsXnPdl6FJkuhspmSEks65DUD8=; b=f1uiSC/gmWORIZOLhfBRAxTIGZ
 EAsb8/OzHy9DXayDoIV2h01Dd5O/Hy7cvULu85Ax9aEzXFtnkz5w9C9bPJJ6A1vGCLdJ+uuLWwDoh
 CaazoY45XST5KZ4MD6v7Q6j1r75QqrhaF0lrZfBfLGUcDwKW7pxMiLthN2sqcFFL5MzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NOdckrqkvkG5f5MaVOsXnPdl6FJkuhspmSEks65DUD8=; b=d
 Qtq1f683WDoESsKk2Lmg6tiRdxjDiC3v3rak0pskPUQFunkCvtnKPrXDdTl9SowJcbsNJ8Bk42UUK
 O2BYJSVh/ljfq/K24cWoilaT+7GgnK7Hc4a9cuKjqBDfno4fmqiXMLmAs9zKXSsjsoWwYkwMebN9S
 JuXpfdrOux+HHM8g=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lVrjq-008nhh-TI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Apr 2021 08:16:12 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FJhMw1t9czkhbB;
 Mon, 12 Apr 2021 16:14:04 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 16:15:44 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 12 Apr 2021 16:15:12 +0800
Message-ID: <20210412081512.103592-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lVrjq-008nhh-TI
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to keep isolation of atomic write
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

As Yi Chen reported, there is a potential race case described as below:

Thread A			Thread B
- f2fs_ioc_start_atomic_write
				- mkwrite
				 - set_page_dirty
				  - f2fs_set_page_private(page, 0)
 - set_inode_flag(FI_ATOMIC_FILE)
				- mkwrite same page
				 - set_page_dirty
				  - f2fs_register_inmem_page
				   - f2fs_set_page_private(ATOMIC_WRITTEN_PAGE)
				     failed due to PagePrivate flag has been set
				   - list_add_tail
				- truncate_inode_pages
				 - f2fs_invalidate_page
				  - clear page private but w/o remove it from
				    inmem_list
				 - set page->mapping to NULL
- f2fs_ioc_commit_atomic_write
 - __f2fs_commit_inmem_pages
   - __revoke_inmem_pages
    - f2fs_put_page panic as page->mapping is NULL

The root cause is we missed to keep isolation of atomic write in the case
of start_atomic_write vs mkwrite, let start_atomic_write helds i_mmap_sem
lock to avoid this issue.

Reported-by: Yi Chen <chenyi77@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v3:
- rebase to last dev branch
- update commit message because this patch fixes a different racing issue
of atomic write
 fs/f2fs/file.c    | 3 +++
 fs/f2fs/segment.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d697c8900fa7..6284b2f4a60b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2054,6 +2054,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 		goto out;
 
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	down_write(&F2FS_I(inode)->i_mmap_sem);
 
 	/*
 	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
@@ -2064,6 +2065,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 			  inode->i_ino, get_dirty_pages(inode));
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret) {
+		up_write(&F2FS_I(inode)->i_mmap_sem);
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		goto out;
 	}
@@ -2077,6 +2079,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	/* add inode in inmem_list first and set atomic_file */
 	set_inode_flag(inode, FI_ATOMIC_FILE);
 	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
+	up_write(&F2FS_I(inode)->i_mmap_sem);
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0cb1ca88d4aa..78c8342f52fd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -325,6 +325,7 @@ void f2fs_drop_inmem_pages(struct inode *inode)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
 	do {
+		down_write(&F2FS_I(inode)->i_mmap_sem);
 		mutex_lock(&fi->inmem_lock);
 		if (list_empty(&fi->inmem_pages)) {
 			fi->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
@@ -339,11 +340,13 @@ void f2fs_drop_inmem_pages(struct inode *inode)
 			spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 
 			mutex_unlock(&fi->inmem_lock);
+			up_write(&F2FS_I(inode)->i_mmap_sem);
 			break;
 		}
 		__revoke_inmem_pages(inode, &fi->inmem_pages,
 						true, false, true);
 		mutex_unlock(&fi->inmem_lock);
+		up_write(&F2FS_I(inode)->i_mmap_sem);
 	} while (1);
 }
 
@@ -468,6 +471,7 @@ int f2fs_commit_inmem_pages(struct inode *inode)
 	f2fs_balance_fs(sbi, true);
 
 	down_write(&fi->i_gc_rwsem[WRITE]);
+	down_write(&F2FS_I(inode)->i_mmap_sem);
 
 	f2fs_lock_op(sbi);
 	set_inode_flag(inode, FI_ATOMIC_COMMIT);
@@ -479,6 +483,8 @@ int f2fs_commit_inmem_pages(struct inode *inode)
 	clear_inode_flag(inode, FI_ATOMIC_COMMIT);
 
 	f2fs_unlock_op(sbi);
+
+	up_write(&F2FS_I(inode)->i_mmap_sem);
 	up_write(&fi->i_gc_rwsem[WRITE]);
 
 	return err;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
