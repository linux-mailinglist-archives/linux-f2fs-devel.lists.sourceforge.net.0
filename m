Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B6B9B74B6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2024 07:49:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6Ozi-0001GF-RX;
	Thu, 31 Oct 2024 06:49:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leo.lilong@huawei.com>) id 1t6Ozh-0001G9-Ce
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 06:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=17oR9Ck+M7NVQXtMg/zOU66KJrzKYqNTH7AHgeEKxXY=; b=jVsWGVQxEv4ZVfxwOjBg+7hbRX
 1gfv6j7rG9tqDToxadG/ga/RuefY6snsAS7U0mcOh4rmcZHgsa+4gt23Km8Wz/+g/QRm6B7VF67Dh
 x9Ee098FZYy/bjPqlB4p8MuM2tMQTd+DGpUO7IESnrc7+8mHSgH28W+2m1anbnXnus8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=17oR9Ck+M7NVQXtMg/zOU66KJrzKYqNTH7AHgeEKxXY=; b=d
 QnB6WHpeOE6wdq3MxQzljEYMYWSYzA/ftLbOPNCtRxKPWz5kYSsdGGvjWev/ZrticeNCk5dobcDm6
 KdquO9bsYgstRocT0iO+1/4C0tuuTly4+ppXdDBxvgqxqzFk/cJVyZHsH9bgmVa8MSkXWJFn+lM8f
 Xm2fNtEdJXW9AFSc=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6Ozf-0006Am-7B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 06:49:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XfF1f2Qvyz20rCh;
 Thu, 31 Oct 2024 14:48:06 +0800 (CST)
Received: from dggpemf500017.china.huawei.com (unknown [7.185.36.126])
 by mail.maildlp.com (Postfix) with ESMTPS id 94531140156;
 Thu, 31 Oct 2024 14:49:06 +0800 (CST)
Received: from huawei.com (10.175.104.67) by dggpemf500017.china.huawei.com
 (7.185.36.126) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 31 Oct
 2024 14:49:06 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 31 Oct 2024 14:45:52 +0800
Message-ID: <20241031064553.55283-1-leo.lilong@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500017.china.huawei.com (7.185.36.126)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In my test case, concurrent calls to f2fs shutdown report
 the following stack trace: Oops: general protection fault,
 probably for non-canonical
 address 0xc6cfff63bb5513fc: 0000 [#1] PREEMPT SMP PTI CPU: 0 UID: 0 PID:
 678 Comm: f2fs_rep_shutdo Not tainted 6.12.0-rc5-next-20241029-g6fb [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.190 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t6Ozf-0006Am-7B
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix race in concurrent
 f2fs_stop_gc_thread
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
From: Long Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Long Li <leo.lilong@huawei.com>
Cc: yi.zhang@huawei.com, lonuxli.64@gmail.com, yangerkun@huawei.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 leo.lilong@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In my test case, concurrent calls to f2fs shutdown report the following
stack trace:

 Oops: general protection fault, probably for non-canonical address 0xc6cfff63bb5513fc: 0000 [#1] PREEMPT SMP PTI
 CPU: 0 UID: 0 PID: 678 Comm: f2fs_rep_shutdo Not tainted 6.12.0-rc5-next-20241029-g6fb2fa9805c5-dirty #85
 Call Trace:
  <TASK>
  ? show_regs+0x8b/0xa0
  ? __die_body+0x26/0xa0
  ? die_addr+0x54/0x90
  ? exc_general_protection+0x24b/0x5c0
  ? asm_exc_general_protection+0x26/0x30
  ? kthread_stop+0x46/0x390
  f2fs_stop_gc_thread+0x6c/0x110
  f2fs_do_shutdown+0x309/0x3a0
  f2fs_ioc_shutdown+0x150/0x1c0
  __f2fs_ioctl+0xffd/0x2ac0
  f2fs_ioctl+0x76/0xe0
  vfs_ioctl+0x23/0x60
  __x64_sys_ioctl+0xce/0xf0
  x64_sys_call+0x2b1b/0x4540
  do_syscall_64+0xa7/0x240
  entry_SYSCALL_64_after_hwframe+0x76/0x7e

The root cause is a race condition in f2fs_stop_gc_thread() called from
different f2fs shutdown paths:

  [CPU0]                       [CPU1]
  ----------------------       -----------------------
  f2fs_stop_gc_thread          f2fs_stop_gc_thread
                                 gc_th = sbi->gc_thread
    gc_th = sbi->gc_thread
    kfree(gc_th)
    sbi->gc_thread = NULL
                                 < gc_th != NULL >
                                 kthread_stop(gc_th->f2fs_gc_task) //UAF

The commit c7f114d864ac ("f2fs: fix to avoid use-after-free in
f2fs_stop_gc_thread()") attempted to fix this issue by using a read
semaphore to prevent races between shutdown and remount threads, but
itfails to prevent all race conditions.

While upgrading to s_umount write lock in f2fs_do_shutdown() would fix
the current issue, however, using s_umount lock requires extreme caution
to avoid lock recursion. A better solution is to introduce a semaphore
to prevent races between concurrent f2fs_stop_gc_thread calls.

Fixes: 7950e9ac638e ("f2fs: stop gc/discard thread after fs shutdown")
Signed-off-by: Long Li <leo.lilong@huawei.com>
---
 fs/f2fs/f2fs.h  | 1 +
 fs/f2fs/gc.c    | 9 +++++++--
 fs/f2fs/super.c | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3c6f3cce5779..7ae1e2a4789f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1679,6 +1679,7 @@ struct f2fs_sb_info {
 						 * race between GC and GC or CP
 						 */
 	struct f2fs_gc_kthread	*gc_thread;	/* GC thread */
+	struct semaphore gc_clean_lock;		/* semaphore for clean GC thread */
 	struct atgc_management am;		/* atgc management */
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e40bdd12e36d..e1b8bf98b5fa 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -232,14 +232,19 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
 {
-	struct f2fs_gc_kthread *gc_th = sbi->gc_thread;
+	struct f2fs_gc_kthread *gc_th;
 
-	if (!gc_th)
+	down(&sbi->gc_clean_lock);
+	gc_th = sbi->gc_thread;
+	if (!gc_th) {
+		up(&sbi->gc_clean_lock);
 		return;
+	}
 	kthread_stop(gc_th->f2fs_gc_task);
 	wake_up_all(&gc_th->fggc_wq);
 	kfree(gc_th);
 	sbi->gc_thread = NULL;
+	up(&sbi->gc_clean_lock);
 }
 
 static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 80a53dbf1c38..47a15050ea9c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4419,6 +4419,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	/* initialize locks within allocated memory */
 	init_f2fs_rwsem(&sbi->gc_lock);
+	sema_init(&sbi->gc_clean_lock, 1);
 	mutex_init(&sbi->writepages);
 	init_f2fs_rwsem(&sbi->cp_global_sem);
 	init_f2fs_rwsem(&sbi->node_write);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
