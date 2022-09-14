Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 213195B892A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 15:29:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYSRu-0001gX-Q9;
	Wed, 14 Sep 2022 13:29:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oYSRs-0001gQ-Hr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 13:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKKC/+MFaJimjYneMB5x4BCTdvz0mv6jV8GkklK3Pr4=; b=OomXkFgTyDcgZqtqU1S2O3al9K
 QNW8NLB6wm/ko6m0Iq42SG7HxbKD3xSlALfNG5HxyRUGMZmKlruEY+xM9sIXAXrzJrnvDXGAY21ri
 K7rb3M5zboRSJoCvFjlEhNp3ODP+ikS5h67ki/UO5PpKALkaw4v6nZZ/kyWZuMmpbrXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YKKC/+MFaJimjYneMB5x4BCTdvz0mv6jV8GkklK3Pr4=; b=m
 94/AgfCQLZPLVAHxmp8XmNy3TTZ6iO5BN8A8vNmE9GFPqgYiOKuh8Ww7y6h8RcpXcBl6P7Mqy+fsV
 hZj+3KlPfHHfsSbF2EX+qO32uuRnr0z352+83jK67KJrIqylRf3WbgrpoOppX21WIqjFcqhODBeBq
 nm6a7UQz3ntapuok=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYSRr-00829Z-Gb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 13:29:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6EEFAB81B4F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Sep 2022 13:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1AEC433D6;
 Wed, 14 Sep 2022 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663162131;
 bh=E4CG/uVxqLXXkaNtctKrymdDq/k2+WAbudBecN2Fbfo=;
 h=From:To:Cc:Subject:Date:From;
 b=VwnBEbuzZuQBkQc4CKSsLQqaKS0BUAz5wtDdp4fKwabqqZZJp07/5BEV9bXnz9JJ2
 mjRK5XalLA8ORgzytLsW611ZYyAPWFIhSJy7Lct7Hb5O4bqySxV84c7e6Lt6NkccVJ
 xSRi5F4TBDtMdkwEHyCtkjcXUft7TkmWYt/KFkWfd6e0M/0z8/0QAlCV3OH+QgcwCI
 O+lbNRd4QqOYOBcZTZ6zyMfZrVrF37kRbGiC6XZI7ws537bGnKdg5LWerzUvLlY0Is
 XcQcnWSPvgb8w0CYazUtudHRnY86cmjy9VkuxHVVlqDe0JO9MJJRK7FVpgUFEbkja5
 TpVTLevNzQ+Vw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 14 Sep 2022 21:28:46 +0800
Message-Id: <20220914132846.3035147-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_inode_info.cp_task was introduced for FS_CP_DATA_IO
 accounting
 since commit b0af6d491a6b ("f2fs: add app/fs io stat"). However, cp_task
 usage coverage has been increased due to below commits: commit 040d2bb318d1
 ("f2fs: fix to avoid deadloop if data_flush is on") commit 186857c5a14a
 ("f2fs: fix potential recursive cal [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oYSRr-00829Z-Gb
Subject: [f2fs-dev] [PATCH] f2fs: fix to account FS_CP_DATA_IO correctly
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

f2fs_inode_info.cp_task was introduced for FS_CP_DATA_IO accounting
since commit b0af6d491a6b ("f2fs: add app/fs io stat").

However, cp_task usage coverage has been increased due to below
commits:
commit 040d2bb318d1 ("f2fs: fix to avoid deadloop if data_flush is on")
commit 186857c5a14a ("f2fs: fix potential recursive call when enabling data_flush")

So that, if data_flush mountoption is on, when data flush was
triggered from background, the IO from data flush will be accounted
as checkpoint IO type incorrectly.

In order to fix this issue, this patch splits cp_task into two:
a) cp_task: used for IO accounting
b) wb_task: used to avoid deadlock

Fixes: commit 040d2bb318d1 ("f2fs: fix to avoid deadloop if data_flush is on")
Fixes: commit 186857c5a14a ("f2fs: fix potential recursive call when enabling data_flush")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 13 +++++++++----
 fs/f2fs/data.c       |  4 ++--
 fs/f2fs/f2fs.h       |  4 +++-
 fs/f2fs/segment.c    |  2 +-
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 0b0e0cc7801e..f9e53ece0442 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1066,7 +1066,8 @@ void f2fs_remove_dirty_inode(struct inode *inode)
 	spin_unlock(&sbi->inode_lock[type]);
 }
 
-int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
+int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type,
+						bool from_cp)
 {
 	struct list_head *head;
 	struct inode *inode;
@@ -1101,11 +1102,15 @@ int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
 	if (inode) {
 		unsigned long cur_ino = inode->i_ino;
 
-		F2FS_I(inode)->cp_task = current;
+		if (from_cp)
+			F2FS_I(inode)->cp_task = current;
+		F2FS_I(inode)->wb_task = current;
 
 		filemap_fdatawrite(inode->i_mapping);
 
-		F2FS_I(inode)->cp_task = NULL;
+		F2FS_I(inode)->wb_task = NULL;
+		if (from_cp)
+			F2FS_I(inode)->cp_task = NULL;
 
 		iput(inode);
 		/* We need to give cpu to another writers. */
@@ -1234,7 +1239,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	/* write all the dirty dentry pages */
 	if (get_pages(sbi, F2FS_DIRTY_DENTS)) {
 		f2fs_unlock_all(sbi);
-		err = f2fs_sync_dirty_inodes(sbi, DIR_INODE);
+		err = f2fs_sync_dirty_inodes(sbi, DIR_INODE, true);
 		if (err)
 			return err;
 		cond_resched();
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6cd29a575105..c2ad0c375710 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2856,7 +2856,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	}
 	unlock_page(page);
 	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
-			!F2FS_I(inode)->cp_task && allow_balance)
+			!F2FS_I(inode)->wb_task && allow_balance)
 		f2fs_balance_fs(sbi, need_balance_fs);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
@@ -3156,7 +3156,7 @@ static inline bool __should_serialize_io(struct inode *inode,
 					struct writeback_control *wbc)
 {
 	/* to avoid deadlock in path of data flush */
-	if (F2FS_I(inode)->cp_task)
+	if (F2FS_I(inode)->wb_task)
 		return false;
 
 	if (!S_ISREG(inode->i_mode))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1960a98c7555..4e5fadcdccaf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -786,6 +786,7 @@ struct f2fs_inode_info {
 	unsigned int clevel;		/* maximum level of given file name */
 	struct task_struct *task;	/* lookup and create consistency */
 	struct task_struct *cp_task;	/* separate cp/wb IO stats*/
+	struct task_struct *wb_task;	/* indicate inode is in context of writeback */
 	nid_t i_xattr_nid;		/* node id that contains xattrs */
 	loff_t	last_disk_size;		/* lastly written file size */
 	spinlock_t i_size_lock;		/* protect last_disk_size */
@@ -3747,7 +3748,8 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi);
 int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi);
 void f2fs_update_dirty_folio(struct inode *inode, struct folio *folio);
 void f2fs_remove_dirty_inode(struct inode *inode);
-int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type);
+int f2fs_sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type,
+								bool from_cp);
 void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type);
 u64 f2fs_get_sectors_written(struct f2fs_sb_info *sbi);
 int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7a5ddfd71223..5b59be62b97d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -476,7 +476,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 		mutex_lock(&sbi->flush_lock);
 
 		blk_start_plug(&plug);
-		f2fs_sync_dirty_inodes(sbi, FILE_INODE);
+		f2fs_sync_dirty_inodes(sbi, FILE_INODE, false);
 		blk_finish_plug(&plug);
 
 		mutex_unlock(&sbi->flush_lock);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
