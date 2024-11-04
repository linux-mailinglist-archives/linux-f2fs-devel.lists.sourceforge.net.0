Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBB9BAAB6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 03:09:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7mX6-00011b-Gx;
	Mon, 04 Nov 2024 02:09:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leo.lilong@huawei.com>) id 1t7mX4-00011U-9y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 02:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8C6M4Qs1e4lC9PXQb5bD3zaexPJqd5T4kiAWUIUkSO0=; b=U6UU1F6tp5Vh2YYcI4dLypntVX
 9d7zWLnQvY8XeSZ73wr8iZKQHKiLzZ7+cL6wLXFJjhCj8apYawzMhW0qiDHWkWxJ+xf7gmr87Fa/i
 JQKiBeEJWHnVfv4n9uBj4D6dk4nW6Cj6+J73iYNUPBt6FG1PtV9glm/1WulX6ONM4ebM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8C6M4Qs1e4lC9PXQb5bD3zaexPJqd5T4kiAWUIUkSO0=; b=H
 GMtd/RdCrhs41DmQQbntyPuq2eRAhVJRUWdijWnjONZ3Ng1HVimUsvSAGEcZOWpsQdLZy3UDm/o08
 A7qgNLabA9j6DrLoWQMqH9g5aN72KPPB6p/nu1bAPpQx5hFXbLZKtONbydBsCA4FkeQEEvFI035ca
 V9OesCUfzsjmliv4=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7mX1-0000yV-AY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 02:09:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XhZc806H9z1SDqG;
 Mon,  4 Nov 2024 10:07:36 +0800 (CST)
Received: from dggpemf500017.china.huawei.com (unknown [7.185.36.126])
 by mail.maildlp.com (Postfix) with ESMTPS id A2A131A0188;
 Mon,  4 Nov 2024 10:09:14 +0800 (CST)
Received: from huawei.com (10.175.104.67) by dggpemf500017.china.huawei.com
 (7.185.36.126) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 4 Nov
 2024 10:09:14 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 4 Nov 2024 10:05:42 +0800
Message-ID: <20241104020542.2603607-1-leo.lilong@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
 medium trust [45.249.212.35 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t7mX1-0000yV-AY
Subject: [f2fs-dev] [PATCH v2] f2fs: fix race in concurrent
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
it fails to prevent all race conditions.

Fix it by converting to write lock of s_umount in f2fs_do_shutdown().

Fixes: 7950e9ac638e ("f2fs: stop gc/discard thread after fs shutdown")
Signed-off-by: Long Li <leo.lilong@huawei.com>
---
 fs/f2fs/file.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 75a8b22da664..703cfccc6b7e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2365,9 +2365,12 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 	if (readonly)
 		goto out;
 
-	/* grab sb->s_umount to avoid racing w/ remount() */
+	/*
+	 * grab sb->s_umount to avoid racing w/ remount() and other shutdown
+	 * paths.
+	 */
 	if (need_lock)
-		down_read(&sbi->sb->s_umount);
+		down_write(&sbi->sb->s_umount);
 
 	f2fs_stop_gc_thread(sbi);
 	f2fs_stop_discard_thread(sbi);
@@ -2376,7 +2379,7 @@ int f2fs_do_shutdown(struct f2fs_sb_info *sbi, unsigned int flag,
 	clear_opt(sbi, DISCARD);
 
 	if (need_lock)
-		up_read(&sbi->sb->s_umount);
+		up_write(&sbi->sb->s_umount);
 
 	f2fs_update_time(sbi, REQ_TIME);
 out:
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
