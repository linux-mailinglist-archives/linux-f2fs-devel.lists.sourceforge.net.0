Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28E940324
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2024 03:09:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYbMW-000449-L1;
	Tue, 30 Jul 2024 01:09:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sYbMV-00043x-Ka
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 01:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ON1v7D9jPPHD13SWlLJBlfahuekWa3rvOi5Wj4V/5as=; b=khiT/7ur6g1F0wUuqvAUlOWLvr
 BN6ba5r/NAQ/aH/c3y4ML7Fu+5rB46weTsX3Dmo1nwAPP8Brzilq25uobb0MBhLCGLg58QvxtR9yV
 VmQAEd85eUV0xSOnQzwa/ggwKjkxjMPsZmqHofiU5TKrdfcSZnMYJkw5uDX7sWR9m/fs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ON1v7D9jPPHD13SWlLJBlfahuekWa3rvOi5Wj4V/5as=; b=F
 4dI+ZXPQ46xAs77ZSZLrvDZdbti1dH9fr7AuooUQHcJB85ghzd2g8Z17eykg+EJ3yVCsL3L91hrR9
 m6OkbYVS/7qNK4qUNmunyvBvnVZ2Wiry8yw0COrZYDSzlX1qygnXgH0JpkdS1gb10ym2f2J2/JQLw
 UyxEeIlZAD5J/EcY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYbMU-0006vU-IE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 01:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CDE24CE0138;
 Tue, 30 Jul 2024 01:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7C5C32786;
 Tue, 30 Jul 2024 01:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722301743;
 bh=00h3vLXLvu9qJfB2DJPqbuEki7u3R/BDUL3XxZOien4=;
 h=From:To:Cc:Subject:Date:From;
 b=ob8XjfSqsHmR/KbOnkMZ94dCIyptHn0vixnagWEVhpi1pjUBfAdBT5EMWdA6yrs65
 I/+cVdpEKzzE37HgOpcY9zDqkWFhCTVRFZN/S3v936R/0ThQRspibuVR1sPfRWsz15
 Ejg4k8fbK32Fe8LLVNOCsrnRL/J692rHmhKXLDAF09UH9XzLqXRUqyRZnD6dX3rV8k
 VN1Wq/EpXRJyqhMYWcncykoSoJlJjmIdZlZbZG9WLT+3qpSdAzI/5eq2L2KhqiK0z4
 e1pG4/pLH4nnFoU4ZSwUIBaKQ4NzKEPvQmVXw+ExfN8x4/+mM2G441Y4H3ecsANomE
 cFo7ZJITqrWQg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 30 Jul 2024 09:08:55 +0800
Message-Id: <20240730010855.2942132-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a f2fs bug as below: __dump_stack
 lib/dump_stack.c:88
 [inline] dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_report+0xe8/0x550
 mm/kasan/report.c:491 kasan_report+0x143/0x180 mm/kasan/report.c:601
 kasan_check_rang [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYbMU-0006vU-IE
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to avoid use-after-free in
 f2fs_stop_gc_thread()
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
Cc: syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a f2fs bug as below:

 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_report+0xe8/0x550 mm/kasan/report.c:491
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:252 [inline]
 __refcount_add include/linux/refcount.h:184 [inline]
 __refcount_inc include/linux/refcount.h:241 [inline]
 refcount_inc include/linux/refcount.h:258 [inline]
 get_task_struct include/linux/sched/task.h:118 [inline]
 kthread_stop+0xca/0x630 kernel/kthread.c:704
 f2fs_stop_gc_thread+0x65/0xb0 fs/f2fs/gc.c:210
 f2fs_do_shutdown+0x192/0x540 fs/f2fs/file.c:2283
 f2fs_ioc_shutdown fs/f2fs/file.c:2325 [inline]
 __f2fs_ioctl+0x443a/0xbe60 fs/f2fs/file.c:4325
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The root cause is below race condition, it may cause use-after-free
issue in sbi->gc_th pointer.

- remount
 - f2fs_remount
  - f2fs_stop_gc_thread
   - kfree(gc_th)
				- f2fs_ioc_shutdown
				 - f2fs_do_shutdown
				  - f2fs_stop_gc_thread
				   - kthread_stop(gc_th->f2fs_gc_task)
   : sbi->gc_thread = NULL;

We will call f2fs_do_shutdown() in two paths:
- for f2fs_ioc_shutdown() path, we should grab sb->s_umount semaphore
for fixing.
- for f2fs_shutdown() path, it's safe since caller has already grabbed
sb->s_umount semaphore.

Reported-by: syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/0000000000005c7ccb061e032b9b@google.com
Fixes: 7950e9ac638e ("f2fs: stop gc/discard thread after fs shutdown")
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2:
- fix deadlock pointed out by Jaegeuk
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/file.c  | 11 +++++++++--
 fs/f2fs/super.c |  2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 51fd5063a69c..0e0189084462 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3508,7 +3508,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 int f2fs_truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end);
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count);
 int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
-							bool readonly);
+						bool readonly, bool need_lock);
 int f2fs_precache_extents(struct inode *inode);
 int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa);
 int f2fs_fileattr_set(struct mnt_idmap *idmap,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 270c32e3385f..ac61c88f7688 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2292,7 +2292,7 @@ static int f2fs_ioc_abort_atomic_write(struct file *filp)
 }
 
 int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
-							bool readonly)
+						bool readonly, bool need_lock)
 {
 	struct super_block *sb = sbi->sb;
 	int ret = 0;
@@ -2339,12 +2339,19 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 	if (readonly)
 		goto out;
 
+	/* grab sb->s_umount to avoid racing w/ remount() */
+	if (need_lock)
+		down_read(&sbi->sb->s_umount);
+
 	f2fs_stop_gc_thread(sbi);
 	f2fs_stop_discard_thread(sbi);
 
 	f2fs_drop_discard_cmd(sbi);
 	clear_opt(sbi, DISCARD);
 
+	if (need_lock)
+		up_read(&sbi->sb->s_umount);
+
 	f2fs_update_time(sbi, REQ_TIME);
 out:
 
@@ -2381,7 +2388,7 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 		}
 	}
 
-	ret = f2fs_do_shutdown(sbi, in, readonly);
+	ret = f2fs_do_shutdown(sbi, in, readonly, true);
 
 	if (need_drop)
 		mnt_drop_write_file(filp);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4d2f3bb8e418..4a09dbb9fd54 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2560,7 +2560,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 static void f2fs_shutdown(struct super_block *sb)
 {
-	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false);
+	f2fs_do_shutdown(F2FS_SB(sb), F2FS_GOING_DOWN_NOSYNC, false, false);
 }
 
 #ifdef CONFIG_QUOTA
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
