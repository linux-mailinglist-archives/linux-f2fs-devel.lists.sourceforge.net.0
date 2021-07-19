Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E03CCF70
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 10:47:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5Ovw-0005fr-Sq; Mon, 19 Jul 2021 08:47:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m5Ovh-0005fO-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n52Xd09uF7fVdydjYwLQFSvpBzzcRbr2FEtcULwVcrA=; b=VR1DEOr3+Y31PlPqYE7EhIjdkr
 MBTFHPAM8QRCEuB12YezfIg/LBxL/4qr1fzqqCQo6YUBrychfJ+qFFIedLF0NdCNVJc/w/axGjMYU
 M2IZn7vVt7Rr736XC1nlThdsbD9V8k86hvC2/gLX1GazC8VIgqBEplT/XKk5CSgOlk1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n52Xd09uF7fVdydjYwLQFSvpBzzcRbr2FEtcULwVcrA=; b=e
 oNrSvVp7Lq/7RNsbFPr9nL59zXMaTmmqozHClFbBvnzoIhWDq45+5IR6rC4DqXrClnoIEaROQXMBG
 b7cRikayEUrPKUwruWDWxWxMF98TF3+x1UzL6yklELanyWqharEZjuYcFJkYrkaUV0jSLeeLAO+5V
 wvn3mM9gGA2B4SHc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5OvX-0004Es-6s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:47:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC18161205;
 Mon, 19 Jul 2021 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626684417;
 bh=daX8Yahq0WHsytcdNmcklqy9cMfNwPouHchyxbatIqk=;
 h=From:To:Cc:Subject:Date:From;
 b=fbhXbIYe3RLIcA2Fjxut4c4qG/Dr90fmT936dW2yYUqK5V0J9ZtwOUO9JYPbo+4CC
 9LcQVrrQiurES9hzqdkdzpZ9gC9PsZTH8H8RgvNyeCJxOr9Xjb5NiTIvw+ELwpYbEX
 ziEpEAkuu86WjUiA/UcMWHVWiRyBI9ZYXybcZJ9UIHv1NQ9jeZGmvdyQlo7EeKYN+G
 K6BXrCaxfX826tcppzNyEur+huMlTmtEEGrkjApgRDBmN24BtQ5SHsC4v1v/9scWUV
 2sJxHPkuTl897f6pMD0STky0zClnPRzpQUa36FT7/Zyh8aMQEodgeqyhPrlBYZs+ii
 HX/sGUOfa8Cyg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 19 Jul 2021 16:46:47 +0800
Message-Id: <20210719084647.26027-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5OvX-0004Es-6s
Subject: [f2fs-dev] [PATCH] f2fs: quota: fix potential deadlock
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

xfstest generic/587 reports a deadlock issue as below:

======================================================
WARNING: possible circular locking dependency detected
5.14.0-rc1 #69 Not tainted
------------------------------------------------------
repquota/8606 is trying to acquire lock:
ffff888022ac9320 (&sb->s_type->i_mutex_key#18){+.+.}-{3:3}, at: f2fs_quota_sync+0x207/0x300 [f2fs]

but task is already holding lock:
ffff8880084bcde8 (&sbi->quota_sem){.+.+}-{3:3}, at: f2fs_quota_sync+0x59/0x300 [f2fs]

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (&sbi->quota_sem){.+.+}-{3:3}:
       __lock_acquire+0x648/0x10b0
       lock_acquire+0x128/0x470
       down_read+0x3b/0x2a0
       f2fs_quota_sync+0x59/0x300 [f2fs]
       f2fs_quota_on+0x48/0x100 [f2fs]
       do_quotactl+0x5e3/0xb30
       __x64_sys_quotactl+0x23a/0x4e0
       do_syscall_64+0x3b/0x90
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #1 (&sbi->cp_rwsem){++++}-{3:3}:
       __lock_acquire+0x648/0x10b0
       lock_acquire+0x128/0x470
       down_read+0x3b/0x2a0
       f2fs_unlink+0x353/0x670 [f2fs]
       vfs_unlink+0x1c7/0x380
       do_unlinkat+0x413/0x4b0
       __x64_sys_unlinkat+0x50/0xb0
       do_syscall_64+0x3b/0x90
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #0 (&sb->s_type->i_mutex_key#18){+.+.}-{3:3}:
       check_prev_add+0xdc/0xb30
       validate_chain+0xa67/0xb20
       __lock_acquire+0x648/0x10b0
       lock_acquire+0x128/0x470
       down_write+0x39/0xc0
       f2fs_quota_sync+0x207/0x300 [f2fs]
       do_quotactl+0xaff/0xb30
       __x64_sys_quotactl+0x23a/0x4e0
       do_syscall_64+0x3b/0x90
       entry_SYSCALL_64_after_hwframe+0x44/0xae

other info that might help us debug this:

Chain exists of:
  &sb->s_type->i_mutex_key#18 --> &sbi->cp_rwsem --> &sbi->quota_sem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sbi->quota_sem);
                               lock(&sbi->cp_rwsem);
                               lock(&sbi->quota_sem);
  lock(&sb->s_type->i_mutex_key#18);

 *** DEADLOCK ***

3 locks held by repquota/8606:
 #0: ffff88801efac0e0 (&type->s_umount_key#53){++++}-{3:3}, at: user_get_super+0xd9/0x190
 #1: ffff8880084bc380 (&sbi->cp_rwsem){++++}-{3:3}, at: f2fs_quota_sync+0x3e/0x300 [f2fs]
 #2: ffff8880084bcde8 (&sbi->quota_sem){.+.+}-{3:3}, at: f2fs_quota_sync+0x59/0x300 [f2fs]

stack backtrace:
CPU: 6 PID: 8606 Comm: repquota Not tainted 5.14.0-rc1 #69
Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
Call Trace:
 dump_stack_lvl+0xce/0x134
 dump_stack+0x17/0x20
 print_circular_bug.isra.0.cold+0x239/0x253
 check_noncircular+0x1be/0x1f0
 check_prev_add+0xdc/0xb30
 validate_chain+0xa67/0xb20
 __lock_acquire+0x648/0x10b0
 lock_acquire+0x128/0x470
 down_write+0x39/0xc0
 f2fs_quota_sync+0x207/0x300 [f2fs]
 do_quotactl+0xaff/0xb30
 __x64_sys_quotactl+0x23a/0x4e0
 do_syscall_64+0x3b/0x90
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f883b0b4efe

The root cause is ABBA deadlock of inode lock and cp_rwsem,
reorder locks in f2fs_quota_sync() as below to fix this issue:
- lock inode
- lock cp_rwsem
- lock quota_sem

Fixes: db6ec53b7e03 ("f2fs: add a rw_sem to cover quota flag changes")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 84 ++++++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8fecd3050ccd..72eb9d70969f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2518,6 +2518,33 @@ static int f2fs_enable_quotas(struct super_block *sb)
 	return 0;
 }
 
+static int f2fs_quota_sync_file(struct f2fs_sb_info *sbi, int type)
+{
+	struct quota_info *dqopt = sb_dqopt(sbi->sb);
+	struct address_space *mapping = dqopt->files[type]->i_mapping;
+	int ret = 0;
+
+	ret = dquot_writeback_dquots(sbi->sb, type);
+	if (ret)
+		goto out;
+
+	ret = filemap_fdatawrite(mapping);
+	if (ret)
+		goto out;
+
+	/* if we are using journalled quota */
+	if (is_journalled_quota(sbi))
+		goto out;
+
+	ret = filemap_fdatawait(mapping);
+
+	truncate_inode_pages(&dqopt->files[type]->i_data, 0);
+out:
+	if (ret)
+		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+	return ret;
+}
+
 int f2fs_quota_sync(struct super_block *sb, int type)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
@@ -2525,57 +2552,42 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	int cnt;
 	int ret;
 
-	/*
-	 * do_quotactl
-	 *  f2fs_quota_sync
-	 *  down_read(quota_sem)
-	 *  dquot_writeback_dquots()
-	 *  f2fs_dquot_commit
-	 *                            block_operation
-	 *                            down_read(quota_sem)
-	 */
-	f2fs_lock_op(sbi);
-
-	down_read(&sbi->quota_sem);
-	ret = dquot_writeback_dquots(sb, type);
-	if (ret)
-		goto out;
-
 	/*
 	 * Now when everything is written we can discard the pagecache so
 	 * that userspace sees the changes.
 	 */
 	for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
-		struct address_space *mapping;
 
 		if (type != -1 && cnt != type)
 			continue;
-		if (!sb_has_quota_active(sb, cnt))
-			continue;
 
-		mapping = dqopt->files[cnt]->i_mapping;
+		if (!sb_has_quota_active(sb, type))
+			return 0;
 
-		ret = filemap_fdatawrite(mapping);
-		if (ret)
-			goto out;
+		inode_lock(dqopt->files[cnt]);
 
-		/* if we are using journalled quota */
-		if (is_journalled_quota(sbi))
-			continue;
+		/*
+		 * do_quotactl
+		 *  f2fs_quota_sync
+		 *  down_read(quota_sem)
+		 *  dquot_writeback_dquots()
+		 *  f2fs_dquot_commit
+		 *			      block_operation
+		 *			      down_read(quota_sem)
+		 */
+		f2fs_lock_op(sbi);
+		down_read(&sbi->quota_sem);
 
-		ret = filemap_fdatawait(mapping);
-		if (ret)
-			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
+		ret = f2fs_quota_sync_file(sbi, cnt);
+
+		up_read(&sbi->quota_sem);
+		f2fs_unlock_op(sbi);
 
-		inode_lock(dqopt->files[cnt]);
-		truncate_inode_pages(&dqopt->files[cnt]->i_data, 0);
 		inode_unlock(dqopt->files[cnt]);
+
+		if (ret)
+			break;
 	}
-out:
-	if (ret)
-		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
-	up_read(&sbi->quota_sem);
-	f2fs_unlock_op(sbi);
 	return ret;
 }
 
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
